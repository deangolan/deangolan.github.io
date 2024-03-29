open Ast

exception Invalid of string

let not_equivalent p q =
  raise (Invalid (format_prop p ^ " <!=> " ^ format_prop q))

let not_implied p1 p2 q =
  raise
    (Invalid (format_prop p1 ^ ", " ^ format_prop p2 ^ " !=> " ^ format_prop q))

let rec validate_equivalence pattern p q =
  if is_equivalent pattern p q then q else not_equivalent p q

and is_equivalent pattern p q =
  pattern p q
  || pattern q p
  ||
  match p, q with
  | Conn (conn1, p1, q1), Conn (conn2, p2, q2) when conn1 = conn2 ->
    (is_equivalent pattern p1 p2 || is_equivalent pattern q1 q2)
    && (p1 = p2 || q1 = q2)
  | Not p, Not q -> is_equivalent pattern p q
  | _ -> false

let rec validate_implication pattern p1 p2 q =
  if is_implied pattern p1 p2 q then q else not_implied p1 p2 q

and is_implied pattern p1 p2 q =
  pattern p1 p2 q
  ||
  match p1, q with
  | Conn (conn1, r1, s1), Conn (conn2, r2, s2) when conn1 = conn2 ->
    (is_implied pattern r1 p2 r2 || is_implied pattern s1 p2 s2)
    && (r1 = r2 || s1 = s2)
  | Not r, Not s -> is_implied pattern r p2 s
  | _ -> false

(* --------------------------- Equivalence Rules --------------------------- *)

let le p q =
  let pattern p q =
    match p, q with
    | Conn (Impl, p1, q1), Conn (Or, Not p2, q2) -> p1 = p2 && q1 = q2
    | Conn (Iff, p1, q1), Conn (And, Conn (Impl, p2, q2), Conn (Impl, q3, p3))
      -> p1 = p2 && p2 = p3 && q1 = q2 && q2 = q3
    | _ -> false
  in
  if Eval.simplify p = Eval.simplify q
  then q
  else validate_equivalence pattern p q

let commutative p q =
  let pattern p q =
    match p, q with
    | ( Conn (((And | Or | Iff) as conn1), p1, q1)
      , Conn (((And | Or | Iff) as conn2), q2, p2) ) ->
      conn1 = conn2 && p1 = p2 && q1 = q2
    | _ -> false
  in
  validate_equivalence pattern p q

let associative p q =
  let pattern p q =
    match p, q with
    | Conn (And, Conn (And, p1, q1), r1), Conn (And, p2, Conn (And, q2, r2)) ->
      p1 = p2 && q1 = q2 && r1 = r2
    | Conn (Or, Conn (Or, p1, q1), r1), Conn (Or, p2, Conn (Or, q2, r2)) ->
      p1 = p2 && q1 = q2 && r1 = r2
    | _ -> false
  in
  validate_equivalence pattern p q

let distributive p q =
  let pattern p q =
    match p, q with
    | ( Conn (Or, p1, Conn (And, q1, r1))
      , Conn (And, Conn (Or, p2, q2), Conn (Or, p3, r2)) )
    | ( Conn (Or, Conn (And, q1, r1), p1)
      , Conn (And, Conn (Or, q2, p2), Conn (Or, r2, p3)) ) ->
      p1 = p2 && p2 = p3 && q1 = q2 && r1 = r2
    (* And swapped with Or *)
    | ( Conn (And, p1, Conn (Or, q1, r1))
      , Conn (Or, Conn (And, p2, q2), Conn (And, p3, r2)) )
    | ( Conn (And, Conn (Or, q1, r1), p1)
      , Conn (Or, Conn (And, q2, p2), Conn (And, r2, p3)) ) ->
      p1 = p2 && p2 = p3 && q1 = q2 && r1 = r2
    | _ -> false
  in
  validate_equivalence pattern p q

let doublenegation p q =
  let pattern p q =
    match p, q with
    | Not (Not p1), p2 -> p1 = p2
    | _ -> false
  in
  validate_equivalence pattern p q

let demorgan p q =
  let pattern p q =
    match p, q with
    | ( Not (Conn (((And | Or) as conn1), p1, q1))
      , Conn (((And | Or) as conn2), Not p2, Not q2) ) ->
      conn1 <> conn2 && p1 = p2 && q1 = q2
    | _ -> false
  in
  validate_equivalence pattern p q

(* --------------------------- Implication Rules --------------------------- *)

let modus_ponens p1 p2 q =
  let pattern p1 p2 q =
    match p1, p2 with
    | Conn (Impl, p1, q1), p2 -> p1 = p2 && q1 = q
    | _ -> false
  in
  validate_implication pattern p1 p2 q

let modus_tollens p1 p2 q =
  let pattern p1 p2 q =
    match p1, p2 with
    | Conn (Impl, q1, p1), Not p2 -> p1 = p2 && Not q1 = q
    | _ -> false
  in
  validate_implication pattern p1 p2 q

let disjunctive_syllogism p1 p2 q =
  let pattern p1 p2 q =
    match p1, p2 with
    | Conn (Or, p1, p2), Not p3 -> (p1 = p3 && p2 = q) || (p2 = p3 && p1 = q)
    | _ -> false
  in
  validate_implication pattern p1 p2 q

let hypothetical_syllogism p1 p2 q =
  let pattern p1 p2 q =
    match p1, p2, q with
    | Conn (Impl, p1, q1), Conn (Impl, p2, q2), Conn (Impl, p3, q3) ->
      p1 = p3 && q2 = q3 && q1 = p2
    | _ -> false
  in
  validate_implication pattern p1 p2 q
