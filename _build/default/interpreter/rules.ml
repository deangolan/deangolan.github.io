open Ast

exception Invalid of string

(* Patterns for equivalence rules *)

let not_equivalent p q = Invalid (show_prop p ^ " <!=> " ^ show_prop q)

let rec is_equivalent pattern p q =
  if check pattern p q then q else raise (not_equivalent p q)

and check pattern p q =
  pattern p q
  ||
  match (p, q) with
  | `Conn (conn1, p1, q1), `Conn (conn2, p2, q2) when conn1 = conn2 ->
      (check pattern p1 p2 || check pattern q1 q2) && (p1 = p2 || q1 = q2)
  | `Not p, `Not q ->
      check pattern p q
  | _ ->
      false

(* Symmetric equivalence rules *)

and le p q =
  match (p, q) with
  | `Conn (`Impl, p1, q1), `Conn (`Or, `Not p2, q2)
  | `Conn (`Or, `Not p2, q2), `Conn (`Impl, p1, q1) ->
      p1 = p2 && q1 = q2
  | ( `Conn (`Iff, p1, q1)
    , `Conn (`And, `Conn (`Impl, p2, q2), `Conn (`Impl, q3, p3)) )
  | ( `Conn (`And, `Conn (`Impl, p2, q2), `Conn (`Impl, q3, p3))
    , `Conn (`Iff, p1, q1) ) ->
      p1 = p2 && p2 = p3 && q1 = q2 && q2 = q3
  | _ ->
      false

and idempotence p q =
  match (p, q) with
  | `Conn ((`And | `Or), p1, p2), p when p1 = p2 ->
      p1 = p
  | p, `Conn ((`And | `Or), p1, p2) when p1 = p2 ->
      p1 = p
  | _ ->
      false

and commutative p q =
  match (p, q) with
  | ( `Conn (((`And | `Or | `Iff) as conn1), p1, q1)
    , `Conn (((`And | `Or | `Iff) as conn2), q2, p2) ) ->
      conn1 = conn2 && p1 = p2 && q1 = q2
  | _ ->
      false

and associative p q =
  match (p, q) with
  | ( `Conn (`And, `Conn (`And, p1, q1), r1)
    , `Conn (`And, p2, `Conn (`And, q2, r2)) ) ->
      p1 = p2 && q1 = q2 && r1 = r2
  | `Conn (`Or, `Conn (`Or, p1, q1), r1), `Conn (`Or, p2, `Conn (`Or, q2, r2))
    ->
      p1 = p2 && q1 = q2 && r1 = r2
  | _ ->
      false

and distributive p q =
  match (p, q) with
  | ( `Conn (`Or, p1, `Conn (`And, q1, r1))
    , `Conn (`And, `Conn (`Or, p2, q2), `Conn (`Or, p3, r2)) )
  | ( `Conn (`And, `Conn (`Or, p2, q2), `Conn (`Or, p3, r2))
    , `Conn (`Or, p1, `Conn (`And, q1, r1)) ) ->
      p1 = p2 && p2 = p3 && q1 = q2 && r1 = r2
  | ( `Conn (`And, p1, `Conn (`Or, q1, r1))
    , `Conn (`Or, `Conn (`And, p2, q2), `Conn (`And, p3, r2)) )
  | ( `Conn (`Or, `Conn (`And, p2, q2), `Conn (`And, p3, r2))
    , `Conn (`And, p1, `Conn (`Or, q1, r1)) ) ->
      p1 = p2 && p2 = p3 && q1 = q2 && r1 = r2
  | _ ->
      false

and doublenegation p q =
  match (p, q) with
  | `Not (`Not p1), p2 ->
      p1 = p2
  | p1, `Not (`Not p2) ->
      p1 = p2
  | _ ->
      false

and demorgans p q =
  match (p, q) with
  | ( `Not (`Conn (((`And | `Or) as conn1), p1, q1))
    , `Conn (((`And | `Or) as conn2), `Not p2, `Not q2) )
  | ( `Conn (((`And | `Or) as conn1), `Not p1, `Not q1)
    , `Not (`Conn (((`And | `Or) as conn2), p2, q2)) ) ->
      conn1 <> conn2 && p1 = p2 && q1 = q2
  | _ ->
      false

and identity p q =
  match (p, q) with
  | (`Conn (`And, `Bool true, p1) | `Conn (`And, p1, `Bool true)), p2
  | (`Conn (`Or, `Bool false, p1) | `Conn (`Or, p1, `Bool false)), p2
  | p1, (`Conn (`And, `Bool true, p2) | `Conn (`And, p2, `Bool true))
  | p1, (`Conn (`Or, `Bool false, p2) | `Conn (`Or, p2, `Bool false)) ->
      p1 = p2
  | _ ->
      false

and dominance p q =
  match (p, q) with
  | (`Conn (`And, `Bool false, _) | `Conn (`And, _, `Bool false)), `Bool false
  | `Bool false, (`Conn (`And, `Bool false, _) | `Conn (`And, _, `Bool false))
  | (`Conn (`Or, `Bool true, _) | `Conn (`Or, _, `Bool true)), `Bool true
  | `Bool true, (`Conn (`Or, `Bool true, _) | `Conn (`Or, _, `Bool true)) ->
      true
  | _ ->
      false

(* Non-symmetric equivalence rules *)

and contradiction p q =
  match (p, q) with
  | `Conn (`And, `Not p1, p2), `Bool false when p1 = p2 ->
      true
  | `Conn (`And, p1, `Not p2), `Bool false when p1 = p2 ->
      true
  | _ ->
      false

and tautology p q =
  match (p, q) with
  | `Conn (`Or, `Not p1, p2), `Bool true when p1 = p2 ->
      true
  | `Conn (`Or, p1, `Not p2), `Bool true when p1 = p2 ->
      true
  | _ ->
      false

(* Patterns for implication rules *)

let not_implied p1 p2 q =
  Invalid (show_prop p1 ^ show_prop p2 ^ " !=> " ^ show_prop q)

let is_implied pattern p1 p2 q =
  if pattern p1 p2 q then q else raise (not_implied p1 p2 q)

and modusponens p1 p2 q =
  match (p1, p2) with
  | `Conn (`Impl, p1, q1), p2 ->
      p1 = p2 && q1 = q
  | _ ->
      false

and modustollens p1 p2 q =
  match (p1, p2) with
  | `Conn (`Impl, q1, p1), `Not p2 ->
      p1 = p2 && q1 = `Not q
  | _ ->
      false
