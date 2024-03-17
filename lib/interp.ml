open Ast

exception InvalidRef of string

let invalid_ref linenum ref =
  raise
    (InvalidRef
       ("Line "
        ^ Int.to_string linenum
        ^ " cannot refrence line "
        ^ Int.to_string ref))

let validate ((len, lines) : int * t list) : prop =
  let rec apply_rule len lines =
    match List.hd lines with
    | Premise p -> p
    | EquivalenceRule (rule, i, q) -> apply_equivalence_rule len lines rule i q
    | ImplicationRule (rule, i1, i2, q) ->
      apply_implication_rule len lines rule i1 i2 q
  and apply_equivalence_rule len lines rule i q =
    if i >= len
    then invalid_ref len i
    else rule (drop lines (len - i) |> apply_rule i) q
  and apply_implication_rule len lines rule i1 i2 q =
    if i1 >= len
    then invalid_ref len i1
    else if i2 >= len
    then invalid_ref len i2
    else
      rule
        (drop lines (len - i1) |> apply_rule i1)
        (drop lines (len - i2) |> apply_rule i2)
        q
  and drop lines n = if n = 0 then lines else drop (List.tl lines) (n - 1) in
  apply_rule len lines

let parse (s : string) : int * t list =
  s |> Lexing.from_string |> Parser.main Lexer.read

let interp s =
  try
    match parse s with
    | 0, [] -> "" (* Empty proof *)
    | proof -> proof |> validate |> format_prop |> ( ^ ) "|- "
  with
  | Lexer.SyntaxError err -> err
  | Parser.Error -> "Syntax Error"
  | InvalidRef err -> err
  | Rules.Invalid err -> err
