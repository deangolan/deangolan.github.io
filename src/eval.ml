open Ast

let rec simplify = function
  | Conn (conn, p, q) ->
      collapse conn (simplify p) (simplify q)
  | Not (Bool a) ->
      Bool (not a)
  | Not p ->
      negate p
  | Atom _ as atom ->
      atom
  | Bool _ as bool ->
      bool

and collapse conn p q =
  match (conn, p, q) with
  | conn, Bool a, Bool b -> (
    match conn with
    | And ->
        Bool (a && b)
    | Or ->
        Bool (a || b)
    | Impl ->
        Bool ((not a) || b)
    | Iff ->
        Bool (a = b) )
  | _ ->
      Conn (conn, p, q)

and negate p = match simplify p with Bool p -> Bool (not p) | p -> Not p
