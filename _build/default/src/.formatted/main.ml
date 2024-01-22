open Ast

let parse s =
  let lexbuf = Lexing.from_string s in
  match Parser.prog Lexer.read lexbuf with
  | None ->
      failwith "Empty input"
  | Some e ->
      e

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

let interp s =
  let line = parse s in
  {prop= eval line.prop; derivedby= line.derivedby}
