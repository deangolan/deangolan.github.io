open Ast

let parse s = Lexing.from_string s |> Parser.prog Lexer.read |> List.rev

let rec simplify = function
  | `Conn (binop, exp1, exp2) ->
      collapse binop (simplify exp1) (simplify exp2)
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
  match simplify exp with `Bool a -> `Bool (not a) | exp -> `Not exp

let ast_from_lines lines =
  let rec aux length lines = function
    | Premise p ->
        Premise p
    | EquivalenceRule (rule, Lineref i, prop) ->
        EquivalenceRule
          (rule, List.nth lines (length - i) |> aux length lines, prop)
    | ImplicationRule (rule, Lineref i1, Lineref i2, prop) ->
        ImplicationRule
          ( rule
          , List.nth lines (length - i1) |> aux length lines
          , List.nth lines (length - i2) |> aux length lines
          , prop )
    | _ ->
        failwith "Precondition violated"
  in
  List.hd lines |> aux (List.length lines) lines

let interp s =
  try parse s |> ast_from_lines |> validate |> show_prop |> (^) "|- " with
  | Rules.Invalid msg ->
      msg
  | Failure _ ->
      ""
