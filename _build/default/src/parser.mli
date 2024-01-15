
(* The type of tokens. *)

type token = 
  | RPAREN
  | PR
  | OR
  | NOT
  | MT
  | LPAREN
  | INT of (int)
  | IMP
  | IFF
  | ID
  | EOF
  | COMMA
  | COLON
  | BOOL of (bool)
  | ATOM of (string)
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.line option)
