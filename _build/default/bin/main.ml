open Interp.Ast


let proof : (int, line) Hashtbl.t = Hashtbl.create 20

let show_proof proof = 
    Hashtbl.iter (fun linenum line -> print_endline ((string_of_int linenum) ^ show_line line)) proof 

let rec is_valid proof linenum =
    let findprop : int -> prop = (fun a -> (proof a).prop) in
    match (proof linenum) with
    | { prop = _ ; derivedby = `Premise} -> true
    | { prop ; derivedby = `LE a} -> check_le (findprop a) prop
    | { prop ; derivedby = `AndIntro (a,b)} -> check_andintro (findprop a) (findprop b) prop
    | { prop ; derivedby = `AndElim a} -> check_andelim (findprop a) prop
    | { prop ; derivedby = `OrIntro a} -> check_orintro (findprop a) prop
    | { prop ; derivedby = `OrElim (a,b)} -> check_orelim (findprop a) (findprop b) prop
    | { prop ; derivedby = `ImpIntro (a,b)} -> check_impintro (findprop a) (findprop b) prop
    | { prop ; derivedby = `ImpElim (a,b)} -> check_impelim (findprop a) (findprop b) prop
    | { prop ; derivedby = `IffIntro (a,b)} -> check_iffintro (findprop a) (findprop b) prop
    | { prop ; derivedby = `IffElim (a,b)} -> check_iffelim (findprop a) (findprop b) prop
    | { prop ; derivedby = `Idempotence a} -> check_idempotence (findprop a) prop
    | { prop ; derivedby = `Commutative a} -> check_commutative (findprop a) prop
    | { prop ; derivedby = `Associative a} -> check_associative (findprop a) prop
    | { prop ; derivedby = `Distributive a} -> check_distributive (findprop a) prop
    | { prop ; derivedby = `DoubleNegation a} -> check_doublenegation (findprop a) prop
    | { prop ; derivedby = `DeMorgan a} -> check_demorgan (findprop a) prop
    | { prop ; derivedby = `Identity a} -> check_identity (findprop a) prop
    | { prop ; derivedby = `Dominance a} -> check_dominance (findprop a) prop
    | { prop ; derivedby = `ModusPonens (a, b)} -> check_impelim (findprop a) (findprop b) prop
    | { prop ; derivedby = `ModusTollens (a, b)} -> check_modustollens (findprop a) (findprop b) prop

and check_andintro pr1 pr2 con = `Conn (`And, pr1, pr2) = con

and check_andelim pr con = match pr with
    | `Conn (`And, p1, p2) ->  p1 = con || p2 = con 
    | _ -> false

and check_orelim pr1 pr2 con = match pr1, pr2 with
    | `Conn (`Or, p, q), `Not r -> if p = r then q = con else q = r && p = con 
    | _ -> false

and check_orintro pr con = match con with
    | `Conn (`Or, p1, p2) -> p1 = pr || p2 = pr
    | _ -> false

and check_impintro pr1 pr2 con = `Conn (`Imp, pr1, pr2) = con

and check_impelim pr1 pr2 con = match pr1, pr2 with
    | `Conn (`Imp, p1, q1), p2 -> p1 = p2 && q1 = con 
    | _ -> false

and check_iffintro pr1 pr2 con = match pr1, pr2 with
    | `Conn (`Imp, p1, q1), `Conn (`Imp, q2, p2) when p1 = p2 && q1 = q2
    -> `Conn (`Imp, p1, q1) = con 
    | _ -> false

and check_iffelim pr1 pr2 con = match pr1 with
    | `Conn (`Iff, p, q) when pr2 = p -> q = con
    | `Conn (`Iff, p, q) when pr2 = q -> p = con
    | _ -> false

and check_idempotence pr con = match pr with 
    | `Conn (`And, exp1, exp2) | `Conn (`Or, exp1, exp2) -> exp1 = exp2 && exp1 = con
    | _ -> false

and check_commutative pr con = match pr, con with 
    | `Conn (`And, exp1, exp2), `Conn (`And, exp3, exp4) -> exp1 = exp4 && exp2 = exp3
    | `Conn (`Or, exp1, exp2), `Conn (`Or, exp3, exp4) -> exp1 = exp4 && exp2 = exp3
    | _ -> false
    
and check_associative pr con = match pr, con with
    | `Conn (`And, `Conn (`And, q1, p1), r1), `Conn (`And, p2, `Conn (`And, q2, r2))
    | `Conn (`Or, `Conn (`Or, q1, p1), r1), `Conn (`Or, p2, `Conn (`Or, q2, r2))
        -> (p1 = p2 && q1 = q2) && r1 = r2
    | _ -> false

and check_distributive pr con = match pr, con with
    | `Conn (`Or, p1, `Conn (`And, q1, r1)), 
    `Conn (`And, `Conn (`Or, p2, q2), `Conn (`Or, p3, r2))
    | `Conn (`And, p1, `Conn (`Or, q1, r1)), 
    `Conn (`Or, `Conn (`And, p2, q2), `Conn (`And, p3, r2)) when p2 = p3
    -> (p1 = p2 && q1 = q2) && r1 = r2
    | _ -> false

and check_doublenegation pr con = match pr with
    | `Not (`Not p) -> p = con
    | _ -> false

and check_demorgan pr con = match pr, con with
    | `Not (`Conn (`Or, p1, q1)), `Conn (`And, `Not q2, `Not p2)
    | `Not (`Conn (`And, p1, q1)), `Conn (`Or, `Not q2, `Not p2)
    -> p1 = p2 && q1 = q2
    | _ -> false

and check_identity pr con = match pr with 
    | `Conn (`Or, exp, `Bool true) | `Conn (`And, `Bool true, exp) -> exp = con 
    | _ -> false

and check_dominance pr con = match pr with
    | `Conn (`And, p, `Bool true) | `Conn (`Or, p, `Bool false) -> p = con
    | _ -> false

and check_le pr con = match pr, con with
    | `Conn (`Imp, p1, q1), 
    `Conn (`Or, `Not p2, q2) -> p1 = p2 && q1 = q2
    | `Conn (`Iff, p1, q1), 
    `Conn (`And, (`Conn (`Imp, p2, q2)), `Conn (`Imp, q3, p3)) 
    when p2 = p3 && q2 = q3 -> p1 = p2 && q1 = q2
    | _ -> false

and check_modustollens pr1 pr2 con = match pr1, pr2 with
    | `Conn (`Imp, exp1, exp2), `Not exp3 -> exp2 = exp3 && `Not exp1 = con
    | _ -> false


let modify lines linenum line : bool =
    Hashtbl.replace lines linenum line;
    is_valid (Hashtbl.find lines) linenum 


let add lines linenum line : bool =
    Hashtbl.add lines linenum line;
    is_valid (Hashtbl.find lines) linenum 


let interp lines linenum s = add lines linenum (Interp.Main.interp s)
