
(* The type of tokens. *)

type token = 
  | RPAREN
  | PROP of (string)
  | PR
  | OR
  | NOT
  | LPAREN
  | IMP
  | IFF
  | EOF
  | BOOL of (bool)
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)
