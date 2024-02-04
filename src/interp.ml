open Ast

exception SyntaxError = Lexer.SyntaxError

exception ParserError = Parser.Error

exception InvalidRef of string

let parse s = Lexing.from_string s |> Parser.prog Lexer.read |> List.rev

let invalid_ref linenum ref =
  raise
    (InvalidRef
       ( "Line " ^ Int.to_string linenum ^ " cannot refrence line "
       ^ Int.to_string ref ) )

let validate lines =
  let rec aux len lines =
    match List.hd lines with
    | Premise p ->
        p
    | EquivalenceRule (rule, Lineref i, q) ->
        if i >= len then invalid_ref len i
        else rule (drop lines (len - i) |> aux i) q
    | ImplicationRule (rule, Lineref i1, Lineref i2, q) ->
        if i1 >= len then invalid_ref len i1
        else if i2 >= len then invalid_ref len i2
        else
          rule
            (drop lines (len - i1) |> aux i1)
            (drop lines (len - i2) |> aux i2)
            q
    | _ ->
        failwith "Precondition violated"
  and drop lines n = if n = 0 then lines else drop (List.tl lines) (n - 1) in
  aux (List.length lines) lines

let interp s =
  try parse s |> validate |> format_prop |> ( ^ ) "|- " with
  | Rules.Invalid msg ->
      msg
  | Failure _ ->
      (* Should only occur when the input proof is empty so List.hd produces
         Failure *)
      ""
