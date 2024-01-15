open Interp.Ast


let proof : (int, prop) Hashtbl.t = Hashtbl.create 20


let rec is_valid proof line = function
    | `Premise -> true
    | `Idempotence a -> check_idempotence line (Hashtbl.find proof a)
    | `Identity a -> check_identity (Hashtbl.find proof a) line
    | `ModusTollens (a, b) -> check_modustollens line (Hashtbl.find proof a) (Hashtbl.find proof b)

and check_idempotence con = function
    | `Conn (`And, exp1, exp2) | `Conn (`Or, exp1, exp2) -> exp1 = exp2 = con

and check_identity pr con = match pr with 
    | `Conn (`And, exp, `Bool true) | `Conn (`And, `Bool true, exp) -> exp = con 
    | `Conn (`Or, exp, `Bool false) | `Conn (`Or, `Bool false, exp) -> exp = con 
    | _ -> false

and check_commutative pr con = match pr con with 
    | `Conn (`And, exp1, exp2), `Conn (`And, exp3, exp4) 
        -> exp1 = exp4 && exp2 = exp3 

and check_modustollens con pr1 pr2 = match pr1, pr2 with
    | `Conn (`Imp, exp1, exp2), exp3 -> exp1 = exp3 && exp2 = con
    | _ -> false


let modify proof idx line =
    Hashtbl.replace proof idx line;
    is_valid proof idx


let add proof idx line =
    Hashtbl.add proof idx line;
    is_valid proof idx
