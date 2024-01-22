open Line

let rec is_valid getline linenum =
  let getprop linenum = (getline linenum).prop in
  match getline linenum with
  | {prop= _; derivedby= `Premise} ->
      true
  | {prop; derivedby= `LE a} ->
      check le (getprop a) prop
  | {prop; derivedby= `Idempotence a} ->
      check idempotence (getprop a) prop
  | {prop; derivedby= `Commutative a} ->
      check commutative (getprop a) prop
  | {prop; derivedby= `Associative a} ->
      check associative (getprop a) prop
  | {prop; derivedby= `Distributive a} ->
      check distributive (getprop a) prop
  | {prop; derivedby= `DoubleNegation a} ->
      check doublenegation (getprop a) prop
  | {prop; derivedby= `DeMorgan a} ->
      check demorgans (getprop a) prop
  | {prop; derivedby= `Identity a} ->
      check identity (getprop a) prop
  | {prop; derivedby= `Dominance a} ->
      check dominance (getprop a) prop
  | {prop; derivedby= `ModusPonens (a, b)} ->
      modusponens (getprop a) (getprop b) prop
  | {prop; derivedby= `ModusTollens (a, b)} ->
      modustollens (getprop a) (getprop b) prop

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

(* Patterns for equivalence rules. Must be symmetric. *)

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
  match p, q with
  | (`Conn (`And, `Bool false, _) | `Conn (`And, _, `Bool false)), q
  | q, (`Conn (`And, `Bool false, _) | `Conn (`And, _, `Bool false)) ->
      `Bool false = q
  | (`Conn (`Or, `Bool true, _) | `Conn (`Or, _, `Bool true)), q
  | q, (`Conn (`Or, `Bool true, _) | `Conn (`Or, _, `Bool true)) ->
      `Bool true = q
  | _ ->
      false

(* Patterns for implication rules. *)

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

let all_valid lines =
  let getline = Hashtbl.find lines in
  let aux linenum _line acc = acc && is_valid getline linenum in
  Hashtbl.fold aux lines true
