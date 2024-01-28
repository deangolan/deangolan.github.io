type conn = [`And | `Or | `Impl | `Iff] [@@deriving show]

type prop =
  [`Atom of string | `Bool of bool | `Conn of conn * prop * prop | `Not of prop]
[@@deriving show]

type t =
  | Premise of prop
  | EquivalenceRule of (prop -> prop -> prop) * t * prop
  | ImplicationRule of (prop -> prop -> prop -> prop) * t * t * prop
  | Lineref of int
[@@deriving show]

module Rules = struct
  exception Invalid of string

  let not_equivalent p q = Invalid (show_prop p ^ "⊬" ^ show_prop q)

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
    match (p, q) with
    | (`Conn (`And, `Bool false, _) | `Conn (`And, _, `Bool false)), q
    | q, (`Conn (`And, `Bool false, _) | `Conn (`And, _, `Bool false)) ->
        `Bool false = q
    | (`Conn (`Or, `Bool true, _) | `Conn (`Or, _, `Bool true)), q
    | q, (`Conn (`Or, `Bool true, _) | `Conn (`Or, _, `Bool true)) ->
        `Bool true = q
    | _ ->
        false

  (* Patterns for implication rules. *)

  let not_implied p1 p2 q =
    Invalid (show_prop p1 ^ show_prop p2 ^ "⊬" ^ show_prop q)

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
end

let le = Rules.is_equivalent Rules.le

let idempotence = Rules.is_equivalent Rules.idempotence

let commutative = Rules.is_equivalent Rules.commutative

let associative = Rules.is_equivalent Rules.associative

let distributive = Rules.is_equivalent Rules.distributive

let doublenegation = Rules.is_equivalent Rules.doublenegation

let demorgan = Rules.is_equivalent Rules.demorgans

let identity = Rules.is_equivalent Rules.identity

let dominance = Rules.is_equivalent Rules.dominance

let modusponens = Rules.is_implied Rules.modusponens

let modustollens = Rules.is_implied Rules.modustollens

let rec validate = function
  | Premise p ->
      p
  | EquivalenceRule (rule, p, q) ->
      rule (validate p) q
  | ImplicationRule (rule, p1, p2, q) ->
      rule (validate p1) (validate p2) q
  | Lineref _ ->
      failwith "Precondition violated"
