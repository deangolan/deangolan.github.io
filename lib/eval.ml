open Ast

(** [simplfy p] returns an equivalent proposition which is simplified as much as
    possible. *)
let rec simplify : prop -> prop = function
  | Conn (conn, p, q) -> collapse conn (simplify p) (simplify q)
  | Not (Bool a) -> Bool (not a)
  | Not p -> negate (simplify p)
  | Atom _ as atom -> atom
  | Bool _ as bool -> bool

and collapse conn p q =
  match conn with
  | And ->
    (match p, q with
     | Bool a, Bool b -> Bool (a && b)
     | Bool true, p | p, Bool true -> p (* Identity *)
     | Bool false, _ | _, Bool false -> Bool false (* Dominance *)
     (* Contradiciton *)
     | Not p, q when p = q -> Bool false
     | p, Not q when p = q -> Bool false
     | _ when p = q -> p (* Idempotence *)
     | _ -> Conn (conn, p, q))
  | Or ->
    (match p, q with
     | Bool a, Bool b -> Bool (a || b)
     | Bool false, p | p, Bool false -> p (* Identity *)
     | Bool true, _ | _, Bool true -> Bool true (* Dominance *)
     (* Tautology *)
     | Not p, q when p = q -> Bool true
     | p, Not q when p = q -> Bool true
     | _ when p = q -> p (* Idempotence *)
     | _ -> Conn (conn, p, q))
  | Impl ->
    (match p, q with
     | Bool a, Bool b -> Bool ((not a) || b)
     | Bool true, p -> p
     | Bool false, _ -> Bool true
     | _, Bool true -> Bool true
     | _ -> if p = q then Bool true else Conn (conn, p, q))
  | Iff ->
    (match p, q with
     | Bool a, Bool b -> Bool (a = b)
     | _ -> if p = q then Bool true else Conn (conn, p, q))

and negate p =
  match p with
  | Bool p -> Bool (not p)
  | p -> Not p
