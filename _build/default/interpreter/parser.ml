
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | RPAREN
    | PR
    | OR
    | NOT
    | MT
    | MP
    | LPAREN
    | LE
    | INT of (
# 3 "interpreter/parser.mly"
       (int)
# 23 "interpreter/parser.ml"
  )
    | IMP
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
# 2 "interpreter/parser.mly"
       (bool)
# 39 "interpreter/parser.ml"
  )
    | ATOM of (
# 1 "interpreter/parser.mly"
       (string)
# 44 "interpreter/parser.ml"
  )
    | ASO
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
  | MenhirBox_prog of (Ast.t option) [@@unboxed]

let _menhir_action_01 =
  fun p r ->
    (
# 44 "interpreter/parser.mly"
                                ( {prop = p; derivedby = r } )
# 107 "interpreter/parser.ml"
     : (Ast.t))

let _menhir_action_02 =
  fun () ->
    (
# 38 "interpreter/parser.mly"
          ( None )
# 115 "interpreter/parser.ml"
     : (Ast.t option))

let _menhir_action_03 =
  fun e ->
    (
# 39 "interpreter/parser.mly"
                    ( Some e )
# 123 "interpreter/parser.ml"
     : (Ast.t option))

let _menhir_action_04 =
  fun a ->
    (
# 49 "interpreter/parser.mly"
               ( `Atom a )
# 131 "interpreter/parser.ml"
     : (Ast.prop))

let _menhir_action_05 =
  fun b ->
    (
# 50 "interpreter/parser.mly"
               ( `Bool b )
# 139 "interpreter/parser.ml"
     : (Ast.prop))

let _menhir_action_06 =
  fun p1 p2 ->
    (
# 51 "interpreter/parser.mly"
                               ( `Conn (`Or, p1, p2) )
# 147 "interpreter/parser.ml"
     : (Ast.prop))

let _menhir_action_07 =
  fun p1 p2 ->
    (
# 52 "interpreter/parser.mly"
                                ( `Conn (`And, p1, p2) )
# 155 "interpreter/parser.ml"
     : (Ast.prop))

let _menhir_action_08 =
  fun p1 p2 ->
    (
# 53 "interpreter/parser.mly"
                                ( `Conn (`Impl, p1, p2) )
# 163 "interpreter/parser.ml"
     : (Ast.prop))

let _menhir_action_09 =
  fun p1 p2 ->
    (
# 54 "interpreter/parser.mly"
                                ( `Conn (`Iff, p1, p2) )
# 171 "interpreter/parser.ml"
     : (Ast.prop))

let _menhir_action_10 =
  fun e ->
    (
# 55 "interpreter/parser.mly"
                    ( `Not (e) )
# 179 "interpreter/parser.ml"
     : (Ast.prop))

let _menhir_action_11 =
  fun e ->
    (
# 56 "interpreter/parser.mly"
                               ( e )
# 187 "interpreter/parser.ml"
     : (Ast.prop))

let _menhir_action_12 =
  fun () ->
    (
# 61 "interpreter/parser.mly"
         ( `Premise )
# 195 "interpreter/parser.ml"
     : (Ast.rule))

let _menhir_action_13 =
  fun i ->
    (
# 62 "interpreter/parser.mly"
                  ( `LE i )
# 203 "interpreter/parser.ml"
     : (Ast.rule))

let _menhir_action_14 =
  fun i ->
    (
# 63 "interpreter/parser.mly"
                   ( `Idempotence i )
# 211 "interpreter/parser.ml"
     : (Ast.rule))

let _menhir_action_15 =
  fun i ->
    (
# 64 "interpreter/parser.mly"
                   ( `Commutative i )
# 219 "interpreter/parser.ml"
     : (Ast.rule))

let _menhir_action_16 =
  fun i ->
    (
# 65 "interpreter/parser.mly"
                   ( `Associative i )
# 227 "interpreter/parser.ml"
     : (Ast.rule))

let _menhir_action_17 =
  fun i ->
    (
# 66 "interpreter/parser.mly"
                   ( `Distributive i )
# 235 "interpreter/parser.ml"
     : (Ast.rule))

let _menhir_action_18 =
  fun i ->
    (
# 67 "interpreter/parser.mly"
                  ( `DoubleNegation i )
# 243 "interpreter/parser.ml"
     : (Ast.rule))

let _menhir_action_19 =
  fun i ->
    (
# 68 "interpreter/parser.mly"
                  ( `DeMorgan i )
# 251 "interpreter/parser.ml"
     : (Ast.rule))

let _menhir_action_20 =
  fun i ->
    (
# 69 "interpreter/parser.mly"
                  ( `Identity i )
# 259 "interpreter/parser.ml"
     : (Ast.rule))

let _menhir_action_21 =
  fun i1 i2 ->
    (
# 70 "interpreter/parser.mly"
                                    ( `ModusPonens (i1, i2) )
# 267 "interpreter/parser.ml"
     : (Ast.rule))

let _menhir_action_22 =
  fun i1 i2 ->
    (
# 71 "interpreter/parser.mly"
                                    ( `ModusTollens (i1, i2) )
# 275 "interpreter/parser.ml"
     : (Ast.rule))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
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
    | IMP ->
        "IMP"
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
          | MT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | COMMA ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | INT _v_2 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (i2, i1) = (_v_2, _v_1) in
                          let _v = _menhir_action_22 i1 i2 in
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
              | INT _v_4 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | COMMA ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | INT _v_5 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let (i2, i1) = (_v_5, _v_4) in
                          let _v = _menhir_action_21 i1 i2 in
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
              | INT _v_7 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_7 in
                  let _v = _menhir_action_13 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | IDM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_9 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_9 in
                  let _v = _menhir_action_14 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | ID ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_11 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_11 in
                  let _v = _menhir_action_20 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | DN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_13 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_13 in
                  let _v = _menhir_action_18 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | DM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_15 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_15 in
                  let _v = _menhir_action_19 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | DIS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_17 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_17 in
                  let _v = _menhir_action_17 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | COM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_19 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_19 in
                  let _v = _menhir_action_15 i in
                  _menhir_goto_rule _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | ASO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_21 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_21 in
                  let _v = _menhir_action_16 i in
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
