exception SyntaxError = Lexer.SyntaxError

exception ParserError = Parser.Error

exception SelfRef of string

let show = Ast.show

open Ast

let parse s = Lexing.from_string s |> Parser.prog Lexer.read |> List.rev

let simplify = Simplify.simplify

let ast_from_lines lines =
  let rec aux length lines = function
    | Premise p ->
        Premise p
    | EquivalenceRule (rule, Lineref i, prop) ->
        if i = 0 then
          raise
            (SelfRef ("Line " ^ Int.to_string length ^ "cannot refrence itself"))
        else
          EquivalenceRule
            (rule, List.nth lines (length - i) |> aux length lines, prop)
    | ImplicationRule (rule, Lineref i1, Lineref i2, prop) ->
        if i1 = 0 || i2 = 0 then
          raise
            (SelfRef ("Line " ^ Int.to_string length ^ "cannot refrence itself"))
        else
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
  try
    let lines = parse s in
    let _ = lines |> ast_from_lines |> Validate.validate in
    List.hd lines |> Ast.show_conc
  with
  | Rules.Invalid msg ->
      msg
  | Failure _ ->
      ""