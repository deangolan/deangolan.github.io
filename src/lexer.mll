{
open Lexing
open Parser

exception SyntaxError of string
}


let whitespace = [' ' '\t' '\n' '\r']+
let atom = ['a'-'z']
let _true = "T" 
let _false = "F"
let _and = "/\\"
let _or = "\\/"
let not = "~"
let imp = "->"
let iff = "<->"


rule read =
    parse
    | whitespace { new_line lexbuf; read lexbuf }
    | atom { ATOM (Lexing.lexeme lexbuf) }
    | "(" { LPAREN }
    | ")" { RPAREN }
    | _true { BOOL true }
    | _false { BOOL false }
    | _or { OR }
    | _and { AND }
    | not { NOT }
    | imp { IMP }
    | iff { IFF }
    | ['1'-'9']['0'-'9']* { INT (int_of_string (Lexing.lexeme lexbuf)) }
    | "," { COMMA }
    | "PR" | "Premise" { PR }
    | "LE" { LE }
    | "IDM" | "Idem" | "Idempotence" { IDM }
    | "COM" | "Commu" | "Commutative" { COM }
    | "ASO" | "Asso" | "Associative" { ASO }
    | "DIS" | "Dist" | "Distributive" { DIS }
    | "DN" | "DoubleNeg" | "Double Negation" { DN }
    | "DM" | "DeMorg" | "DeMorgan" ['s']? { DM }
    | "ID" | "Identity" { ID }
    | "DO" | "Dominance" | "Dom" { DO }
    | "CON" | "Con" | "Contradiction" { CON }
    | "TA" | "Taut" | "Tautology" { TA }
    | "MP" | "Modus Ponens" { MP }
    | "MT" | "Modus Tollens" { MT }
    | _ { raise ( SyntaxError ("Unexpected character: " ^ Lexing.lexeme lexbuf)) }
    | eof { EOF }
