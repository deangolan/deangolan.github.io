
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | INT of (
# 3 "src/parser.mly"
       (int)
# 24 "src/parser.ml"
  )
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
    | BOOL of (
# 2 "src/parser.mly"
       (bool)
# 41 "src/parser.ml"
  )
    | ATOM of (
# 1 "src/parser.mly"
       (string)
# 46 "src/parser.ml"
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

  | MenhirState50 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 50.
        Stack shape : expr.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.t)

and ('s, 'r) _menhir_cell1_prop = 
  | MenhirCell1_prop of 's * ('s, 'r) _menhir_state * (Ast.prop)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.t list) [@@unboxed]

let _menhir_action_01 =
  fun p ->
    (
# 46 "src/parser.mly"
                   ( Premise p )
# 117 "src/parser.ml"
     : (Ast.t))

let _menhir_action_02 =
  fun i q ->
    (
# 47 "src/parser.mly"
                            ( EquivalenceRule (Rules.le, Lineref i, q) )
# 125 "src/parser.ml"
     : (Ast.t))

let _menhir_action_03 =
  fun i q ->
    (
# 48 "src/parser.mly"
                             ( EquivalenceRule (Rules.idempotence, Lineref i, q) )
# 133 "src/parser.ml"
     : (Ast.t))

let _menhir_action_04 =
  fun i q ->
    (
# 49 "src/parser.mly"
                             ( EquivalenceRule (Rules.commutative, Lineref i, q) )
# 141 "src/parser.ml"
     : (Ast.t))

let _menhir_action_05 =
  fun i q ->
    (
# 50 "src/parser.mly"
                             ( EquivalenceRule (Rules.associative, Lineref i, q) )
# 149 "src/parser.ml"
     : (Ast.t))

let _menhir_action_06 =
  fun i q ->
    (
# 51 "src/parser.mly"
                             ( EquivalenceRule (Rules.distributive, Lineref i, q) )
# 157 "src/parser.ml"
     : (Ast.t))

let _menhir_action_07 =
  fun i q ->
    (
# 52 "src/parser.mly"
                             ( EquivalenceRule (Rules.doublenegation, Lineref i, q) )
# 165 "src/parser.ml"
     : (Ast.t))

let _menhir_action_08 =
  fun i q ->
    (
# 53 "src/parser.mly"
                            ( EquivalenceRule (Rules.demorgan, Lineref i, q) )
# 173 "src/parser.ml"
     : (Ast.t))

let _menhir_action_09 =
  fun i q ->
    (
# 54 "src/parser.mly"
                            ( EquivalenceRule (Rules.identity, Lineref i, q) )
# 181 "src/parser.ml"
     : (Ast.t))

let _menhir_action_10 =
  fun i q ->
    (
# 55 "src/parser.mly"
                            ( EquivalenceRule (Rules.dominance, Lineref i, q) )
# 189 "src/parser.ml"
     : (Ast.t))

let _menhir_action_11 =
  fun i q ->
    (
# 56 "src/parser.mly"
                             ( EquivalenceRule (Rules.contradiction, Lineref i, q) )
# 197 "src/parser.ml"
     : (Ast.t))

let _menhir_action_12 =
  fun i q ->
    (
# 57 "src/parser.mly"
                            ( EquivalenceRule (Rules.tautology, Lineref i, q) )
# 205 "src/parser.ml"
     : (Ast.t))

let _menhir_action_13 =
  fun i1 i2 q ->
    (
# 58 "src/parser.mly"
                                              ( ImplicationRule (Rules.modusponens, Lineref i1, Lineref i2, q) )
# 213 "src/parser.ml"
     : (Ast.t))

let _menhir_action_14 =
  fun i1 i2 q ->
    (
# 59 "src/parser.mly"
                                              ( ImplicationRule (Rules.modustollens, Lineref i1, Lineref i2, q) )
# 221 "src/parser.ml"
     : (Ast.t))

let _menhir_action_15 =
  fun h t ->
    (
# 41 "src/parser.mly"
                         ( h :: t )
# 229 "src/parser.ml"
     : (Ast.t list))

let _menhir_action_16 =
  fun () ->
    (
# 42 "src/parser.mly"
          ( [] )
# 237 "src/parser.ml"
     : (Ast.t list))

let _menhir_action_17 =
  fun a ->
    (
# 63 "src/parser.mly"
               ( Atom a )
# 245 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_18 =
  fun b ->
    (
# 64 "src/parser.mly"
               ( Bool b )
# 253 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_19 =
  fun p1 p2 ->
    (
# 65 "src/parser.mly"
                               ( Conn (Or, p1, p2) )
# 261 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_20 =
  fun p1 p2 ->
    (
# 66 "src/parser.mly"
                                ( Conn (And, p1, p2) )
# 269 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_21 =
  fun p1 p2 ->
    (
# 67 "src/parser.mly"
                                ( Conn (Impl, p1, p2) )
# 277 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_22 =
  fun p1 p2 ->
    (
# 68 "src/parser.mly"
                                ( Conn (Iff, p1, p2) )
# 285 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_23 =
  fun p ->
    (
# 69 "src/parser.mly"
                    ( Not (p) )
# 293 "src/parser.ml"
     : (Ast.prop))

let _menhir_action_24 =
  fun p ->
    (
# 70 "src/parser.mly"
                               ( p )
# 301 "src/parser.ml"
     : (Ast.prop))

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
    | COM ->
        "COM"
    | COMMA ->
        "COMMA"
    | CON ->
        "CON"
    | DIS ->
        "DIS"
    | DM ->
        "DM"
    | DN ->
        "DN"
    | DO ->
        "DO"
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
    | TA ->
        "TA"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_49 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      MenhirBox_prog _v
  
  let rec _menhir_goto_prog : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState50 ->
          _menhir_run_51 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_49 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_51 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, h) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_15 h t in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
  let _menhir_run_16 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_16 () in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
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
      let _v = _menhir_action_18 b in
      _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_prop : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState50 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
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
      match (_tok : MenhirBasics.token) with
      | TA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (i, q) = (_v_0, _v) in
              let _v = _menhir_action_12 i q in
              _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | PR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let p = _v in
          let _v = _menhir_action_01 p in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
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
                      let (q, i2, i1) = (_v, _v_2, _v_1) in
                      let _v = _menhir_action_14 i1 i2 q in
                      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | MP ->
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
                      let (q, i2, i1) = (_v, _v_4, _v_3) in
                      let _v = _menhir_action_13 i1 i2 q in
                      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | LE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (i, q) = (_v_5, _v) in
              let _v = _menhir_action_02 i q in
              _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | IMP ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IDM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (i, q) = (_v_6, _v) in
              let _v = _menhir_action_03 i q in
              _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | ID ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_7 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (i, q) = (_v_7, _v) in
              let _v = _menhir_action_09 i q in
              _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | DO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_8 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (i, q) = (_v_8, _v) in
              let _v = _menhir_action_10 i q in
              _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | DN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_9 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (i, q) = (_v_9, _v) in
              let _v = _menhir_action_07 i q in
              _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | DM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_10 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (i, q) = (_v_10, _v) in
              let _v = _menhir_action_08 i q in
              _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | DIS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_11 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (i, q) = (_v_11, _v) in
              let _v = _menhir_action_06 i q in
              _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | CON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_12 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (i, q) = (_v_12, _v) in
              let _v = _menhir_action_11 i q in
              _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | COM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_13 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (i, q) = (_v_13, _v) in
              let _v = _menhir_action_04 i q in
              _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | ASO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_14 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (i, q) = (_v_14, _v) in
              let _v = _menhir_action_05 i q in
              _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
      | EOF ->
          _menhir_run_16 _menhir_stack MenhirState50
      | BOOL _v_0 ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState50
      | ATOM _v_1 ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState50
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let a = _v in
      let _v = _menhir_action_17 a in
      _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
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
      let p = _v in
      let _v = _menhir_action_23 p in
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
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASO | COM | CON | DIS | DM | DN | DO | ID | IDM | IFF | LE | MP | MT | PR | RPAREN | TA ->
          let MenhirCell1_prop (_menhir_stack, _menhir_s, p1) = _menhir_stack in
          let p2 = _v in
          let _v = _menhir_action_22 p1 p2 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_prop as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ASO | COM | CON | DIS | DM | DN | DO | ID | IDM | IFF | IMP | LE | MP | MT | PR | RPAREN | TA ->
          let MenhirCell1_prop (_menhir_stack, _menhir_s, p1) = _menhir_stack in
          let p2 = _v in
          let _v = _menhir_action_20 p1 p2 in
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
      | ASO | COM | CON | DIS | DM | DN | DO | ID | IDM | IFF | LE | MP | MT | PR | RPAREN | TA ->
          let MenhirCell1_prop (_menhir_stack, _menhir_s, p1) = _menhir_stack in
          let p2 = _v in
          let _v = _menhir_action_21 p1 p2 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_prop -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_prop (_menhir_stack, _menhir_s, p1) = _menhir_stack in
      let p2 = _v in
      let _v = _menhir_action_19 p1 p2 in
      _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_05 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let p = _v in
          let _v = _menhir_action_24 p in
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
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EOF ->
          _menhir_run_16 _menhir_stack _menhir_s
      | BOOL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ATOM _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
