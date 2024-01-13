open Ast


let parse (s : string) : expr =
  let lexbuf = Lexing.from_string s in
  match Parser.prog Lexer.read lexbuf with
    | None -> failwith "Empty input"
    | Some e -> e


let string_of_val = function
    | Prop p -> p 
    | Bool b -> string_of_bool b 
    | exp -> show_expr exp


let rec eval = function
    | Stmnt (exp, rule) -> Stmnt (eval exp, rule)
    | Binop (binop, exp1, exp2) -> collapse binop (eval exp1) (eval exp2)
    | Not (Bool a) -> Bool (not a)
    | Not exp -> negate exp
    | Prop _ as prop -> prop
    | Bool _ as bool -> bool

and collapse binop exp1 exp2 = match binop, exp1, exp2 with
    | binop, Bool a, Bool b -> begin 
        match binop with
        | And -> Bool (a && b)
        | Or -> Bool (a || b)
        | Imp -> Bool ((not a) || b)
        | Iff -> Bool (a = b)
    end
    | _ -> Binop (binop, exp1, exp2) 

and negate exp = match eval exp with
    | Bool a -> Bool (not a)
    | exp -> Not exp


let interp (s: string) : string =
    s |> parse |> eval |> string_of_val
