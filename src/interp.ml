open Ast

exception SyntaxError = Lexer.SyntaxError
exception ParserError = Parser.Error
exception InvalidRef of string
exception Invalid = Rules.Invalid

let parse s = Lexing.from_string s |> Parser.prog Lexer.read

let invalid_ref linenum ref =
  raise
    (InvalidRef
       ("Line "
        ^ Int.to_string linenum
        ^ " cannot refrence line "
        ^ Int.to_string ref))

(** validate (len, lines) transforms every linerefrence into its corrosponding
    proposition and applies the given rule to validate it. Returns the
    conclusion of the proof if it is valid or None lines is empty.
    @raise InvalidRef
      if a line contains a refrence to itself or a line after it.
    @raise Invalid if the proof is invalid. *)
let validate ((len, lines) : int * t list) : prop option =
  let rec aux len lines =
    match List.hd lines with
    | Premise p -> p
    | EquivalenceRule (rule, i, q) ->
      if i >= len
      then invalid_ref len i
      else rule (drop lines (len - i) |> aux i) q
    | ImplicationRule (rule, i1, i2, q) ->
      if i1 >= len
      then invalid_ref len i1
      else if i2 >= len
      then invalid_ref len i2
      else
        rule
          (drop lines (len - i1) |> aux i1)
          (drop lines (len - i2) |> aux i2)
          q
  and drop lines n = if n = 0 then lines else drop (List.tl lines) (n - 1) in
  match lines with
  | [] -> None
  | lines -> Some (aux len (List.rev lines))

let interp s = parse s |> validate |> Option.map format_prop
