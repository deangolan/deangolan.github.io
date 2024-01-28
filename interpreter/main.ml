open Ast

let parse s =
  Lexing.from_string s |> Parser.prog Lexer.read |> Linezipper.from_list

let rec eval = function
  | `Conn (binop, exp1, exp2) ->
      collapse binop (eval exp1) (eval exp2)
  | `Not (`Bool a) ->
      `Bool (not a)
  | `Not exp ->
      negate exp
  | `Atom _ as atom ->
      atom
  | `Bool _ as bool ->
      bool

and collapse binop exp1 exp2 =
  match (binop, exp1, exp2) with
  | binop, `Bool a, `Bool b -> (
    match binop with
    | `And ->
        `Bool (a && b)
    | `Or ->
        `Bool (a || b)
    | `Impl ->
        `Bool ((not a) || b)
    | `Iff ->
        `Bool (a = b) )
  | _ ->
      `Conn (binop, exp1, exp2)

and negate exp =
  match eval exp with `Bool a -> `Bool (not a) | exp -> `Not exp

let getast (zipper : Linezipper.t) =
  match zipper with
  | ([], _) -> []
  | (hd :: _, _) -> match hd with
    | Premise _ as premise ->
      premise
    | EquivalenceRule (rule, Lineref i, q) ->
      EquivalenceRule (rule, getline zipper i, q)
    | ImplicationRule (rule, Lineref i1, Lineref i2, q) ->
      ImplicationRule (rule, getline zipper i1, getline zipper i2, q)
