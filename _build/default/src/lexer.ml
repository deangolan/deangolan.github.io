# 1 "src/lexer.mll"
 
open Parser

# 6 "src/lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\242\255\001\000\000\000\245\255\001\000\246\255\003\000\
    \247\255\248\255\249\255\250\255\251\255\252\255\000\000\254\255\
    \026\000\011\000\002\000\010\000\027\000\021\000\015\000\030\000\
    \253\255\244\255\001\000\243\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \001\000\001\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255";
  Lexing.lex_default =
   "\255\255\000\000\255\255\255\255\000\000\255\255\000\000\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\000\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\255\255\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\018\000\018\000\018\000\018\000\018\000\000\000\018\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \018\000\000\000\018\000\000\000\000\000\000\000\006\000\000\000\
    \012\000\011\000\000\000\000\000\000\000\003\000\026\000\005\000\
    \009\000\010\000\008\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\013\000\000\000\002\000\000\000\025\000\027\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\009\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \014\000\000\000\024\000\000\000\010\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\007\000\006\000\000\000\000\000\
    \000\000\015\000\015\000\015\000\015\000\015\000\016\000\015\000\
    \015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
    \015\000\015\000\015\000\015\000\017\000\015\000\015\000\015\000\
    \015\000\015\000\015\000\021\000\008\000\019\000\004\000\020\000\
    \010\000\022\000\023\000\009\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\018\000\018\000\000\000\255\255\018\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\018\000\255\255\255\255\255\255\000\000\255\255\
    \000\000\000\000\255\255\255\255\255\255\000\000\002\000\000\000\
    \000\000\000\000\007\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\000\000\255\255\000\000\255\255\003\000\026\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\000\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\014\000\255\255\000\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\000\000\005\000\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\016\000\000\000\017\000\000\000\019\000\
    \020\000\021\000\022\000\023\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec read lexbuf =
   __ocaml_lex_read_rec lexbuf 0
and __ocaml_lex_read_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 18 "src/lexer.mll"
                 ( read lexbuf )
# 118 "src/lexer.ml"

  | 1 ->
# 19 "src/lexer.mll"
           ( PROP (Lexing.lexeme lexbuf) )
# 123 "src/lexer.ml"

  | 2 ->
# 20 "src/lexer.mll"
           ( RULE Ast.Premise )
# 128 "src/lexer.ml"

  | 3 ->
# 21 "src/lexer.mll"
          ( COLON )
# 133 "src/lexer.ml"

  | 4 ->
# 22 "src/lexer.mll"
          ( LPAREN )
# 138 "src/lexer.ml"

  | 5 ->
# 23 "src/lexer.mll"
          ( RPAREN )
# 143 "src/lexer.ml"

  | 6 ->
# 24 "src/lexer.mll"
            ( BOOL true )
# 148 "src/lexer.ml"

  | 7 ->
# 25 "src/lexer.mll"
             ( BOOL false )
# 153 "src/lexer.ml"

  | 8 ->
# 26 "src/lexer.mll"
          ( OR )
# 158 "src/lexer.ml"

  | 9 ->
# 27 "src/lexer.mll"
           ( AND )
# 163 "src/lexer.ml"

  | 10 ->
# 28 "src/lexer.mll"
          ( NOT )
# 168 "src/lexer.ml"

  | 11 ->
# 29 "src/lexer.mll"
          ( IMP )
# 173 "src/lexer.ml"

  | 12 ->
# 30 "src/lexer.mll"
          ( IFF )
# 178 "src/lexer.ml"

  | 13 ->
# 31 "src/lexer.mll"
          ( EOF )
# 183 "src/lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_read_rec lexbuf __ocaml_lex_state

;;

