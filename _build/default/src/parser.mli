
(* The type of tokens. *)

type token = 
  | RPAREN
  | PR
  | ORINTRO
  | ORELIM
  | OR
  | NOT
  | MT
  | MP
  | LPAREN
  | LE
  | INT of (int)
  | IMPINTRO
  | IMPELIM
  | IMP
  | IFFINTRO
  | IFFELIM
  | IFF
  | IDM
  | ID
  | EOF
  | DN
  | DM
  | DIS
  | COMMA
  | COM
  | COLON
  | BOOL of (bool)
  | ATOM of (string)
  | ASO
  | ANDINTRO
  | ANDELIM
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.line option)
