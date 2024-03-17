{ 
open Parser

exception SyntaxError of string
}


let whitespace = [' ' '\t' '\n' '\r']+

rule read =
    parse
    | whitespace { read lexbuf }
    | "*" [^ '*']* "*" { read lexbuf }
    | ['a'-'z'] { ATOM (Lexing.lexeme lexbuf) }
    | "(" { LPAREN }
    | ")" { RPAREN }
    | "T" { BOOL true }
    | "F" { BOOL false }
    | "~" { NOT }
    | "\\/" { OR }
    | "/\\" { AND }
    | "->" { IMP }
    | "<->" { IFF }
    | ['1'-'9']['0'-'9']* { INT (int_of_string (Lexing.lexeme lexbuf)) }
    | "," { COMMA }
    | "PR" | "Premise" { PR }
    | "LE" | "Logical Equivalence" { LE }
    | "CM" | "Commutative" { CM }
    | "AS" | "Associative" { AS }
    | "DI" | "Distributive" { DI }
    | "DN" | "Double Negation" { DN }
    | "DM" | "DeMorgan" ['s']? { DM }
    | "MP" | "Modus Ponens" { MP }
    | "MT" | "Modus Tollens" { MT }
    | "DS" | "Disjunctive Syllogism" { DS }
    | "HS" | "Hypothetical Syllogism" { HS }
    | _ { raise ( SyntaxError ("Unexpected character: " ^ Lexing.lexeme lexbuf)) }
    | eof { EOF }
