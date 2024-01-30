open Ast

exception Invalid of string

let not_equivalent p q = Invalid (format_prop p ^ " <!=> " ^ format_prop q)

let not_implied p1 p2 q =
  Invalid (format_prop p1 ^ ", " ^ format_prop p2 ^ " !=> " ^ format_prop q)

let rec is_equivalent pattern p q =
  if check_equivelence pattern p q then q else raise (not_equivalent p q)

and check_equivelence pattern p q =
  pattern p q || pattern q p
  ||
  match (p, q) with
  | Conn (conn1, p1, q1), Conn (conn2, p2, q2) when conn1 = conn2 ->
      (check_equivelence pattern p1 p2 || check_equivelence pattern q1 q2)
      && (p1 = p2 || q1 = q2)
  | Not p, Not q ->
      check_equivelence pattern p q
  | _ ->
      false

let rec is_implication pattern p1 p2 q =
  if check_implication pattern p1 p2 q then q else raise (not_implied p1 p2 q)

and check_implication pattern p1 p2 q =
  pattern p1 p2 q
  ||
  match (p1, q) with
  | Conn (conn1, r1, s1), Conn (conn2, r2, s2) when conn1 = conn2 ->
      (check_implication pattern r1 p2 r2 || check_implication pattern s1 p2 s2)
      && (r1 = r2 || s1 = s2)
  | Not r, Not s ->
      check_implication pattern r p2 s
  | _ ->
      false

(* Patterns for equivalence rules *)

let le p q =
  let pattern p q =
    Eval.simplify p = q
    || Eval.simplify q = p
    ||
    match (p, q) with
    | Conn (Impl, p1, q1), Conn (Or, Not p2, q2) ->
        p1 = p2 && q1 = q2
    | Conn (Iff, p1, q1), Conn (And, Conn (Impl, p2, q2), Conn (Impl, q3, p3))
      ->
        p1 = p2 && p2 = p3 && q1 = q2 && q2 = q3
    | _ ->
        false
  in
  is_equivalent pattern p q

let idempotence p q =
  let pattern p q =
    match (p, q) with
    | Conn ((And | Or), p1, p2), p when p1 = p2 ->
        p1 = p
    | _ ->
        false
  in
  is_equivalent pattern p q

let commutative p q =
  let pattern p q =
    match (p, q) with
    | ( Conn (((And | Or | Iff) as conn1), p1, q1)
      , Conn (((And | Or | Iff) as conn2), q2, p2) ) ->
        conn1 = conn2 && p1 = p2 && q1 = q2
    | _ ->
        false
  in
  is_equivalent pattern p q

and associative p q =
  let pattern p q =
    match (p, q) with
    | Conn (And, Conn (And, p1, q1), r1), Conn (And, p2, Conn (And, q2, r2)) ->
        p1 = p2 && q1 = q2 && r1 = r2
    | Conn (Or, Conn (Or, p1, q1), r1), Conn (Or, p2, Conn (Or, q2, r2)) ->
        p1 = p2 && q1 = q2 && r1 = r2
    | _ ->
        false
  in
  is_equivalent pattern p q

and distributive p q =
  let pattern p q =
    match (p, q) with
    | ( Conn (Or, p1, Conn (And, q1, r1))
      , Conn (And, Conn (Or, p2, q2), Conn (Or, p3, r2)) )
    | ( Conn (Or, Conn (And, q1, r1), p1)
      , Conn (And, Conn (Or, p2, q2), Conn (Or, p3, r2)) ) ->
        p1 = p2 && p2 = p3 && q1 = q2 && r1 = r2
    | ( Conn (And, p1, Conn (Or, q1, r1))
      , Conn (Or, Conn (And, p2, q2), Conn (And, p3, r2)) )
    | ( Conn (And, Conn (Or, q1, r1), p1)
      , Conn (Or, Conn (And, p2, q2), Conn (And, p3, r2)) ) ->
        p1 = p2 && p2 = p3 && q1 = q2 && r1 = r2
    | _ ->
        false
  in
  is_equivalent pattern p q

and doublenegation p q =
  let pattern p q =
    match (p, q) with Not (Not p1), p2 -> p1 = p2 | _ -> false
  in
  is_equivalent pattern p q

and demorgan p q =
  let pattern p q =
    match (p, q) with
    | ( Not (Conn (((And | Or) as conn1), p1, q1))
      , Conn (((And | Or) as conn2), Not p2, Not q2) ) ->
        conn1 <> conn2 && p1 = p2 && q1 = q2
    | _ ->
        false
  in
  is_equivalent pattern p q

and identity p q =
  let pattern p q =
    match (p, q) with
    | (Conn (And, Bool true, p1) | Conn (And, p1, Bool true)), p2
    | (Conn (Or, Bool false, p1) | Conn (Or, p1, Bool false)), p2 ->
        p1 = p2
    | _ ->
        false
  in
  is_equivalent pattern p q

and dominance p q =
  let pattern p q =
    match (p, q) with
    | (Conn (And, Bool false, _) | Conn (And, _, Bool false)), Bool false
    | (Conn (Or, Bool true, _) | Conn (Or, _, Bool true)), Bool true ->
        true
    | _ ->
        false
  in
  is_equivalent pattern p q

and contradiction p q =
  let pattern p q =
    match (p, q) with
    | Conn (And, Not p1, p2), Bool false when p1 = p2 ->
        true
    | Conn (And, p1, Not p2), Bool false when p1 = p2 ->
        true
    | _ ->
        false
  in
  is_equivalent pattern p q

and tautology p q =
  let pattern p q =
    match (p, q) with
    | Conn (Or, Not p1, p2), Bool true when p1 = p2 ->
        true
    | Conn (Or, p1, Not p2), Bool true when p1 = p2 ->
        true
    | _ ->
        false
  in
  is_equivalent pattern p q

(* Patterns for implication rules *)

let modusponens p1 p2 q =
  let pattern p1 p2 q =
    match (p1, p2) with
    | Conn (Impl, p1, q1), p2 ->
        p1 = p2 && q1 = q
    | _ ->
        false
  in
  is_implication pattern p1 p2 q

let modustollens p1 p2 q =
  let pattern p1 p2 q =
    match (p1, p2) with
    | Conn (Impl, q1, p1), Not p2 ->
        p1 = p2 && q1 = Not q
    | _ ->
        false
  in
  is_implication pattern p1 p2 q

(** Take a proof ast and return the conclusion if it is valid.
    @raise Invalid otherwise *)
let rec validate = function
  | Premise p ->
      p
  | EquivalenceRule (rule, p, q) ->
      rule (validate p) q
  | ImplicationRule (rule, p1, p2, q) ->
      rule (validate p1) (validate p2) q
  | Lineref _ ->
      failwith "Precondition violated"
