open Ast

let rec simplify = function
  | Conn (binop, exp1, exp2) ->
      collapse binop (simplify exp1) (simplify exp2)
  | Not (Bool a) ->
      Bool (not a)
  | Not exp ->
      negate exp
  | Atom _ as atom ->
      atom
  | Bool _ as bool ->
      bool

and collapse binop exp1 exp2 =
  match (binop, exp1, exp2) with
  | binop, Bool a, Bool b -> (
    match binop with
    | And ->
        Bool (a && b)
    | Or ->
        Bool (a || b)
    | Impl ->
        Bool ((not a) || b)
    | Iff ->
        Bool (a = b) )
  | _ ->
      Conn (binop, exp1, exp2)

and negate exp =
  match simplify exp with Bool a -> Bool (not a) | exp -> Not exp
