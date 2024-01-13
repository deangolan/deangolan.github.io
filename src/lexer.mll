{
open Parser
}


let whitespace = [' ' '\t' '\n' '\r']+
let prop = ['a'-'z']
let _true = "T" | "1" | "true" 
let _false = "F" | "0" | "false"
let _and = "&" | "/\\"
let _or = "|" | "\\/"
let not = "~"
let imp = "->"
let iff = "<->"
let rule = ['A'-'Z'] ['A'-'Z' 'a'-'z']+

rule read =
    parse
    | whitespace { read lexbuf }
    | prop { PROP (Lexing.lexeme lexbuf) }
    | rule { RULE (Lexing.lexeme lexbuf) }
    | ":" { COLON }
    | "(" { LPAREN }
    | ")" { RPAREN }
    | _true { BOOL true }
    | _false { BOOL false }
    | _or { OR }
    | _and { AND }
    | not { NOT }
    | imp { IMP }
    | iff { IFF }
    | eof { EOF }
