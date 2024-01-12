open Ast




let parse (s : string) : expr =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast


let string_of_val = function
    | Prop p -> p 
    | Bool b -> string_of_bool b 
    | Binop (binop, a, b) -> Binop (binop, a, b) |> show_expr 
    | Not e -> Not e |> show_expr 
 

let rec eval = function
    | Binop (_, Prop _, Prop _) as exp -> exp
    | Binop (_, Prop _, Bool _) as exp -> exp
    | Binop (_, Bool _, Prop _) as exp -> exp
    | Binop (binop, Bool a, Bool b) -> collapse binop a b
    | Binop (binop, Bool a, exp) -> eval (Binop (binop, Bool a, eval exp))
    | Binop (binop, exp1, exp2 ) -> eval (Binop (binop, eval exp1, exp2))
    | Not (Bool a) -> Bool (not a)
    | Not exp -> eval exp
    | Prop _ -> failwith "Precondition violated"
    | Bool _ -> failwith "Precondition violated"

and collapse binop e1 e2 = match binop, e1, e2 with
    | And, a, b -> Bool (a && b)
    | Or, a, b -> Bool (a || b)
    | Implies, a, b -> Bool (not a || b)
    | Iff, a, b -> Bool (a = b)
    
and negate = function
    | Bool a -> Bool (not a)
    | Prop _ -> failwith "Precondition violated" 
    | Binop _ | Not _ -> failwith "Precondition violated" 


let interp (s: string) : string =
    s |> parse |> eval |> string_of_val
