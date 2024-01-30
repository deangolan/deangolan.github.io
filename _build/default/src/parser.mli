
(* The type of tokens. *)

type token = 
  | TA
  | RPAREN
  | PR
  | OR
  | NOT
  | MT
  | MP
  | LPAREN
  | LE
  | INT of (int)
  | IMP
  | IFF
  | IDM
  | ID
  | EOF
  | DO
  | DN
  | DM
  | DIS
  | CON
  | COMMA
  | COM
  | BOOL of (bool)
  | ATOM of (string)
  | ASO
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.t list)
