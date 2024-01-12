open Ast


let parse (s : string) : expr =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast


let string_of_val = function
    | Bool b -> string_of_bool b 
    | Binop _ | Not _ -> failwith "Precondition violated"
    

let is_value = function
    | Bool _ -> true
    | Binop _ -> false
    | Not _ -> false


let rec step = function
    | Bool _ -> failwith "Does not step"
    | Binop (binop, e1, e2) when is_value e1 && is_value e2 ->
            step_binop binop e1 e2
    | Binop (binop, e1, e2) when is_value e1 -> Binop (binop, e1, step e2)
    | Binop (binop, e1, e2) -> Binop (binop, step e1, e2)
    | Not e when is_value e -> step_negate e
    | Not e -> Not (step e) 

and step_binop binop e1 e2 = match binop, e1, e2 with
    | Or, Bool a, Bool b -> Bool (a || b)
    | And, Bool a, Bool b -> Bool (a && b)
    | Implies, Bool a, Bool b -> Bool ((not a)|| b)
    | Iff, Bool a, Bool b -> Bool (a = b)
    | Or, _, _ -> failwith "Precondition violated"
    | And, _, _ -> failwith "Precondition violated"
    | Implies, _, _ -> failwith "Precondition violated"
    | Iff, _, _ -> failwith "Precondition violated"

and step_negate = function
    | Bool a -> Bool (not a)
    | Binop _ -> failwith "Precondition violated"
    | Not _ -> failwith "Precondtion violated"


let rec eval e = 
    if is_value e then e else
        e |> step |> eval


let interp (s: string) : string =
    s
    |> parse
    |> eval
    |> string_of_val
