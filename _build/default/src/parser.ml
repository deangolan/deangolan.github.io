
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | INT of (
# 3 "src/parser.mly"
       (int)
# 25 "src/parser.ml"
  )
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
    | BOOL of (
# 2 "src/parser.mly"
       (bool)
# 45 "src/parser.ml"
  )
    | ATOM of (
# 1 "src/parser.mly"
       (string)
# 50 "src/parser.ml"
  )
    | ASO
    | ANDINTRO
    | ANDELIM
    | AND
  
end

include MenhirBasics

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState01 : (('s, _menhir_box_prog) _menhir_cell1_NOT, _menhir_box_prog) _menhir_state
    (** State 01.
        Stack shape : NOT.
        Start symbol: prog. *)

  | MenhirState02 : (('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_state
    (** State 02.
        Stack shape : LPAREN.
        Start symbol: prog. *)

  | MenhirState07 : (('s, _menhir_box_prog) _menhir_cell1_prop, _menhir_box_prog) _menhir_state
    (** State 07.
        Stack shape : prop.
        Start symbol: prog. *)

  | MenhirState09 : (('s, _menhir_box_prog) _menhir_cell1_prop, _menhir_box_prog) _menhir_state
    (** State 09.
        Stack shape : prop.
        Start symbol: prog. *)

  | MenhirState11 : (('s, _menhir_box_prog) _menhir_cell1_prop, _menhir_box_prog) _menhir_state
    (** State 11.
        Stack shape : prop.
        Start symbol: prog. *)

  | MenhirState13 : (('s, _menhir_box_prog) _menhir_cell1_prop, _menhir_box_prog) _menhir_state
    (** State 13.
        Stack shape : prop.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_prop = 
  | MenhirCell1_prop of 's * ('s, 'r) _menhir_state * (Ast.prop)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.line option) [@@unboxed]

let _menhir_action_01 =
  fun p r ->
    (
# 52 "src/parser.mly"
                                ( {prop = p; derivedby = r } )
# 115 "src/parser.ml"
     : (Ast.line))

let _menhir_action_02 =
  fun () ->
    (
# 46 "src/parser.mly"
          ( None )
# 123 "src/parser.ml"
     : (Ast.line option))

let _menhir_action_03 =
  fun e ->
    (
# 47 "src/parser.mly"
                    ( Some e )
# 131 "src/parser.ml"
     : (Ast.line option))

let _menhir_action_04 =
  fun a ->
    (
# 57 "src/parser.mly"
               ( `Atom a )
# 139 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_05 =
  fun b ->
    (
# 58 "src/parser.mly"
               ( `Bool b )
# 147 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_06 =
  fun p1 p2 ->
    (
# 59 "src/parser.mly"
                               ( `Conn (`Or, p1, p2) )
# 155 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_07 =
  fun p1 p2 ->
    (
# 60 "src/parser.mly"
                                ( `Conn (`And, p1, p2) )
# 163 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_08 =
  fun p1 p2 ->
    (
# 61 "src/parser.mly"
                                ( `Conn (`Imp, p1, p2) )
# 171 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_09 =
  fun p1 p2 ->
    (
# 62 "src/parser.mly"
                                ( `Conn (`Iff, p1, p2) )
# 179 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_10 =
  fun e ->
    (
# 63 "src/parser.mly"
                    ( `Not (e) )
# 187 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_11 =
  fun e ->
    (
# 64 "src/parser.mly"
                               ( e )
# 195 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_12 =
  fun () ->
    (
# 69 "src/parser.mly"
         ( `Premise )
# 203 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_13 =
  fun i1 i2 ->
    (
# 70 "src/parser.mly"
                                          ( `AndIntro (i1, i2) )
# 211 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_14 =
  fun i ->
    (
# 71 "src/parser.mly"
                       ( `AndElim i )
# 219 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_15 =
  fun i ->
    (
# 72 "src/parser.mly"
                      ( `OrIntro i )
# 227 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_16 =
  fun i1 i2 ->
    (
# 73 "src/parser.mly"
                                        ( `OrElim (i1, i2) )
# 235 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_17 =
  fun i1 i2 ->
    (
# 74 "src/parser.mly"
                                          ( `ImpIntro (i1, i2) )
# 243 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_18 =
  fun i1 i2 ->
    (
# 75 "src/parser.mly"
                                         ( `ImpElim (i1, i2) )
# 251 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_19 =
  fun i1 i2 ->
    (
# 76 "src/parser.mly"
                                          ( `IffIntro (i1, i2) )
# 259 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_20 =
  fun i1 i2 ->
    (
# 77 "src/parser.mly"
                                         ( `IffElim (i1, i2) )
# 267 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_21 =
  fun i ->
    (
# 78 "src/parser.mly"
                  ( `LE i )
# 275 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_22 =
  fun i ->
    (
# 79 "src/parser.mly"
                   ( `Idempotence i )
# 283 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_23 =
  fun i ->
    (
# 80 "src/parser.mly"
                   ( `Commutative i )
# 291 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_24 =
  fun i ->
    (
# 81 "src/parser.mly"
                   ( `Associative i )
# 299 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_25 =
  fun i ->
    (
# 82 "src/parser.mly"
                   ( `Distributive i )
# 307 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_26 =
  fun i ->
    (
# 83 "src/parser.mly"
                  ( `DoubleNegation i )
# 315 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_27 =
  fun i ->
    (
# 84 "src/parser.mly"
                  ( `DeMorgan i )
# 323 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_28 =
  fun i ->
    (
# 85 "src/parser.mly"
                  ( `Identity i )
# 331 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_29 =
  fun i1 i2 ->
    (
# 86 "src/parser.mly"
                                    ( `ModusPonens (i1, i2) )
# 339 "src/parser.ml"
     : (Ast.rule))

let _menhir_action_30 =
  fun i1 i2 ->
    (
# 87 "src/parser.mly"
                                    ( `ModusTollens (i1, i2) )
# 347 "src/parser.ml"
     : (Ast.rule))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | ANDELIM ->
        "ANDELIM"
    | ANDINTRO ->
        "ANDINTRO"
    | ASO ->
        "ASO"
    | ATOM _ ->
        "ATOM"
    | BOOL _ ->
        "BOOL"
    | COLON ->
        "COLON"
    | COM ->
        "COM"
    | COMMA ->
        "COMMA"
    | DIS ->
        "DIS"
    | DM ->
        "DM"
    | DN ->
        "DN"
    | EOF ->
        "EOF"
    | ID ->
        "ID"
    | IDM ->
        "IDM"
    | IFF ->
        "IFF"
    | IFFELIM ->
        "IFFELIM"
    | IFFINTRO ->
        "IFFINTRO"
    | IMP ->
        "IMP"
    | IMPELIM ->
        "IMPELIM"
    | IMPINTRO ->
        "IMPINTRO"
    | INT _ ->
        "INT"
    | LE ->
        "LE"
    | LPAREN ->
        "LPAREN"
    | MP ->
        "MP"
    | MT ->
        "MT"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | ORELIM ->
        "ORELIM"
    | ORINTRO ->
        "ORINTRO"
    | PR ->
        "PR"
    | RPAREN ->
        "RPAREN"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_goto_prog : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      MenhirBox_prog _v
  
  let _menhir_goto_rule : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_prop -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _v _tok ->
      let MenhirCell1_prop (_menhir_stack, _, p) = _menhir_stack in
      let r = _v in
      let _v = _menhir_action_01 p r in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let e = _v in
          let _v = _menhir_action_03 e in
          _menhir_goto_prog _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState01 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ATOM _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState02 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ATOM _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let b = _v in
      let _v = _menhir_action_05 b in
      _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_prop : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState11 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState02 ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | OR ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PR ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_12 () in
              _menhir_goto_rule _menhir_stack _v _tok
          | ORINTRO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_1 in
                  let _v = _menhir_action_15 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | ORELIM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | COMMA ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | INT _v_4 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (i2, i1) = (_v_4, _v_3) in
                          let _v = _menhir_action_16 i1 i2 in
                          _menhir_goto_rule _menhir_stack _v _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | MT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_6 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | COMMA ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | INT _v_7 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (i2, i1) = (_v_7, _v_6) in
                          let _v = _menhir_action_30 i1 i2 in
                          _menhir_goto_rule _menhir_stack _v _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | MP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_9 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | COMMA ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | INT _v_10 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (i2, i1) = (_v_10, _v_9) in
                          let _v = _menhir_action_29 i1 i2 in
                          _menhir_goto_rule _menhir_stack _v _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | LE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_12 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_12 in
                  let _v = _menhir_action_21 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | IMPINTRO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_14 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | COMMA ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | INT _v_15 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (i2, i1) = (_v_15, _v_14) in
                          let _v = _menhir_action_17 i1 i2 in
                          _menhir_goto_rule _menhir_stack _v _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | IMPELIM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_17 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | COMMA ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | INT _v_18 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (i2, i1) = (_v_18, _v_17) in
                          let _v = _menhir_action_18 i1 i2 in
                          _menhir_goto_rule _menhir_stack _v _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | IFFINTRO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_20 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | COMMA ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | INT _v_21 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (i2, i1) = (_v_21, _v_20) in
                          let _v = _menhir_action_19 i1 i2 in
                          _menhir_goto_rule _menhir_stack _v _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | IFFELIM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_23 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | COMMA ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | INT _v_24 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (i2, i1) = (_v_24, _v_23) in
                          let _v = _menhir_action_20 i1 i2 in
                          _menhir_goto_rule _menhir_stack _v _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | IDM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_26 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_26 in
                  let _v = _menhir_action_22 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | ID ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_28 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_28 in
                  let _v = _menhir_action_28 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | DN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_30 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_30 in
                  let _v = _menhir_action_26 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | DM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_32 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_32 in
                  let _v = _menhir_action_27 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | DIS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_34 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_34 in
                  let _v = _menhir_action_25 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | COM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_36 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_36 in
                  let _v = _menhir_action_23 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | ASO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_38 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_38 in
                  let _v = _menhir_action_24 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | ANDINTRO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_40 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | COMMA ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | INT _v_41 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (i2, i1) = (_v_41, _v_40) in
                          let _v = _menhir_action_13 i1 i2 in
                          _menhir_goto_rule _menhir_stack _v _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | ANDELIM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_43 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_43 in
                  let _v = _menhir_action_14 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_prop -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState07 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ATOM _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let a = _v in
      let _v = _menhir_action_04 a in
      _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_09 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_prop -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState09 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ATOM _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_prop -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState13 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ATOM _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_prop -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState11 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ATOM _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_14 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_prop as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON | RPAREN ->
          let MenhirCell1_prop (_menhir_stack, _menhir_s, p1) = _menhir_stack in
          let p2 = _v in
          let _v = _menhir_action_09 p1 p2 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_prop as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COLON | IFF | IMP | RPAREN ->
          let MenhirCell1_prop (_menhir_stack, _menhir_s, p1) = _menhir_stack in
          let p2 = _v in
          let _v = _menhir_action_07 p1 p2 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_prop as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON | IFF | RPAREN ->
          let MenhirCell1_prop (_menhir_stack, _menhir_s, p1) = _menhir_stack in
          let p2 = _v in
          let _v = _menhir_action_08 p1 p2 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_prop -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_prop (_menhir_stack, _menhir_s, p1) = _menhir_stack in
      let p2 = _v in
      let _v = _menhir_action_06 p1 p2 in
      _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_05 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_11 e in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | EOF ->
          let _v = _menhir_action_02 () in
          _menhir_goto_prog _menhir_stack _v
      | BOOL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | ATOM _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
