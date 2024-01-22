# 1 "src/lexer.mll"
 
open Parser

# 6 "src/lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\230\255\043\000\052\000\013\000\053\000\065\000\000\000\
    \052\000\242\255\087\000\001\000\000\000\246\255\001\000\247\255\
    \012\000\248\255\249\255\250\255\251\255\252\255\253\255\254\255\
    \034\000\031\000\002\000\029\000\046\000\040\000\034\000\049\000\
    \245\255\001\000\244\255\050\000\241\255\043\000\048\000\040\000\
    \055\000\240\255\057\000\001\000\239\255\050\000\045\000\057\000\
    \051\000\047\000\233\255\060\000\002\000\238\255\061\000\054\000\
    \057\000\002\000\237\255\062\000\234\255\065\000\235\255\060\000\
    \000\000\236\255\060\000\072\000\080\000\071\000\079\000\004\000\
    \080\000\080\000\074\000\088\000\076\000\088\000\087\000\231\255\
    \089\000\232\255\073\000\076\000\001\000\005\000\081\000\082\000\
    \084\000\094\000\086\000\082\000\090\000\098\000\090\000\086\000\
    ";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\012\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \001\000\001\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\022\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    ";
  Lexing.lex_default =
   "\255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\255\255\255\255\255\255\000\000\255\255\000\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\000\000\255\255\000\000\255\255\255\255\255\255\
    \255\255\000\000\255\255\255\255\000\000\255\255\255\255\255\255\
    \255\255\255\255\000\000\255\255\255\255\000\000\255\255\255\255\
    \255\255\255\255\000\000\255\255\000\000\255\255\000\000\255\255\
    \255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\000\000\
    \255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    ";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\026\000\026\000\026\000\026\000\026\000\000\000\026\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \026\000\085\000\026\000\000\000\000\000\000\000\015\000\000\000\
    \021\000\020\000\000\000\000\000\009\000\012\000\033\000\014\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\022\000\017\000\011\000\000\000\032\000\034\000\
    \000\000\004\000\000\000\005\000\003\000\041\000\018\000\000\000\
    \000\000\006\000\000\000\000\000\007\000\002\000\044\000\053\000\
    \008\000\058\000\072\000\065\000\019\000\087\000\000\000\000\000\
    \000\000\086\000\000\000\000\000\016\000\015\000\000\000\000\000\
    \057\000\023\000\023\000\023\000\023\000\023\000\024\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\025\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\081\000\017\000\064\000\013\000\079\000\
    \056\000\060\000\062\000\029\000\052\000\043\000\036\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\027\000\028\000\019\000\030\000\031\000\018\000\037\000\
    \038\000\039\000\080\000\040\000\036\000\063\000\045\000\044\000\
    \046\000\047\000\048\000\061\000\051\000\042\000\035\000\049\000\
    \050\000\054\000\055\000\053\000\059\000\058\000\067\000\066\000\
    \065\000\074\000\069\000\070\000\071\000\073\000\068\000\062\000\
    \075\000\076\000\077\000\078\000\060\000\082\000\083\000\084\000\
    \092\000\088\000\089\000\090\000\091\000\081\000\093\000\094\000\
    \095\000\079\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
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
    \000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\026\000\026\000\000\000\255\255\026\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\084\000\026\000\255\255\255\255\255\255\000\000\255\255\
    \000\000\000\000\255\255\255\255\000\000\000\000\011\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\016\000\000\000\255\255\012\000\033\000\
    \255\255\000\000\255\255\000\000\000\000\007\000\000\000\255\255\
    \255\255\000\000\255\255\255\255\000\000\000\000\043\000\052\000\
    \000\000\057\000\071\000\064\000\000\000\085\000\255\255\255\255\
    \255\255\085\000\255\255\255\255\000\000\014\000\255\255\255\255\
    \004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\002\000\000\000\003\000\000\000\002\000\
    \004\000\003\000\003\000\024\000\005\000\006\000\008\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\025\000\027\000\028\000\029\000\030\000\031\000\035\000\
    \037\000\038\000\002\000\039\000\040\000\003\000\042\000\045\000\
    \045\000\046\000\047\000\003\000\005\000\006\000\008\000\048\000\
    \049\000\051\000\054\000\055\000\056\000\059\000\061\000\063\000\
    \066\000\067\000\068\000\069\000\070\000\072\000\061\000\073\000\
    \074\000\075\000\076\000\077\000\078\000\080\000\082\000\083\000\
    \086\000\087\000\088\000\089\000\090\000\091\000\092\000\093\000\
    \094\000\095\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
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
    \255\255\255\255\255\255";
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
# 19 "src/lexer.mll"
                 ( read lexbuf )
# 163 "src/lexer.ml"

  | 1 ->
# 20 "src/lexer.mll"
           ( ATOM (Lexing.lexeme lexbuf) )
# 168 "src/lexer.ml"

  | 2 ->
# 21 "src/lexer.mll"
          ( COLON )
# 173 "src/lexer.ml"

  | 3 ->
# 22 "src/lexer.mll"
          ( LPAREN )
# 178 "src/lexer.ml"

  | 4 ->
# 23 "src/lexer.mll"
          ( RPAREN )
# 183 "src/lexer.ml"

  | 5 ->
# 24 "src/lexer.mll"
            ( BOOL true )
# 188 "src/lexer.ml"

  | 6 ->
# 25 "src/lexer.mll"
             ( BOOL false )
# 193 "src/lexer.ml"

  | 7 ->
# 26 "src/lexer.mll"
          ( OR )
# 198 "src/lexer.ml"

  | 8 ->
# 27 "src/lexer.mll"
           ( AND )
# 203 "src/lexer.ml"

  | 9 ->
# 28 "src/lexer.mll"
          ( NOT )
# 208 "src/lexer.ml"

  | 10 ->
# 29 "src/lexer.mll"
          ( IMP )
# 213 "src/lexer.ml"

  | 11 ->
# 30 "src/lexer.mll"
          ( IFF )
# 218 "src/lexer.ml"

  | 12 ->
# 31 "src/lexer.mll"
                 ( INT (int_of_string (Lexing.lexeme lexbuf)) )
# 223 "src/lexer.ml"

  | 13 ->
# 32 "src/lexer.mll"
          ( COMMA )
# 228 "src/lexer.ml"

  | 14 ->
# 33 "src/lexer.mll"
                       ( PR )
# 233 "src/lexer.ml"

  | 15 ->
# 34 "src/lexer.mll"
           ( LE )
# 238 "src/lexer.ml"

  | 16 ->
# 35 "src/lexer.mll"
                     ( IDM )
# 243 "src/lexer.ml"

  | 17 ->
# 36 "src/lexer.mll"
                      ( COM )
# 248 "src/lexer.ml"

  | 18 ->
# 37 "src/lexer.mll"
                     ( ASO )
# 253 "src/lexer.ml"

  | 19 ->
# 38 "src/lexer.mll"
                     ( DIS )
# 258 "src/lexer.ml"

  | 20 ->
# 39 "src/lexer.mll"
                         ( DN )
# 263 "src/lexer.ml"

  | 21 ->
# 40 "src/lexer.mll"
                         ( DM )
# 268 "src/lexer.ml"

  | 22 ->
# 41 "src/lexer.mll"
                        ( ID )
# 273 "src/lexer.ml"

  | 23 ->
# 42 "src/lexer.mll"
                            ( MP )
# 278 "src/lexer.ml"

  | 24 ->
# 43 "src/lexer.mll"
                            ( MT )
# 283 "src/lexer.ml"

  | 25 ->
# 44 "src/lexer.mll"
          ( EOF )
# 288 "src/lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_read_rec lexbuf __ocaml_lex_state

;;

