open Interp.Ast


let proof : (int, prop) Hashtbl.t = Hashtbl.create 20


let rec is_valid proof linenum =
    let findprop : int -> prop = (fun a -> (proof a).prop) in
    match (proof linenum) with
    | { prop = _ ; derivedby = `Premise} -> true
    | { prop ; derivedby = `Idempotence a} -> check_idempotence (findprop a) prop
    | { prop ; derivedby = `Identity a} -> check_identity (findprop a) prop
    | { prop ; derivedby = `Commutative a} -> check_commutative (findprop a) prop
    | { prop ; derivedby = `ModusTollens (a, b)} -> check_modustollens (findprop a) (findprop b) prop

and check_idempotence pr con = match pr with 
    | `Conn (`And, exp1, exp2) | `Conn (`Or, exp1, exp2) -> exp1 = exp2 && exp1 = con
    | _ -> false

and check_identity pr con = match pr with 
    | `Conn (`And, exp, `Bool true) | `Conn (`And, `Bool true, exp) -> exp = con 
    | `Conn (`Or, exp, `Bool false) | `Conn (`Or, `Bool false, exp) -> exp = con 
    | _ -> false

and check_commutative pr con = match pr, con with 
    | `Conn (`And, exp1, exp2), `Conn (`And, exp3, exp4) -> exp1 = exp4 && exp2 = exp3
    | `Conn (`Or, exp1, exp2), `Conn (`Or, exp3, exp4) -> exp1 = exp4 && exp2 = exp3
    | _ -> false

and check_modustollens pr1 pr2 con = match pr1, pr2 with
    | `Not exp1, `Conn (`Imp, exp2, exp3) -> exp1 = exp3 && `Not exp2 = con
    | _ -> false


let modify lines linenum line : bool =
    Hashtbl.replace lines linenum line;
    is_valid (Hashtbl.find lines) linenum 


let add lines linenum line : bool =
    Hashtbl.add lines linenum line;
    is_valid (Hashtbl.find lines) linenum 


let interp lines linenum s = add lines linenum (Interp.Main.interp s)
