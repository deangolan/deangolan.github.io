
(* The type of tokens. *)

type token = 
  | RULE of (Ast.rule)
  | RPAREN
  | PROP of (string)
  | OR
  | NOT
  | LPAREN
  | IMP
  | IFF
  | EOF
  | COLON
  | BOOL of (bool)
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr option)
