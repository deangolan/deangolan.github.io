{
open Parser
}


let whitespace = [' ' '\t' '\n' '\r']+
let atom = ['a'-'z']
let _true = "T" | "true" 
let _false = "F" | "false"
let _and = "&" | "/\\"
let _or = "|" | "\\/"
let not = "~"
let imp = "->"
let iff = "<->"


rule read =
    parse
    | whitespace { read lexbuf }
    | atom { ATOM (Lexing.lexeme lexbuf) }
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
    | ['0'-'9']+ { INT (int_of_string (Lexing.lexeme lexbuf)) }
    | "," { COMMA }
    | "PR" { PR }
    | "&I" { ANDINTRO }
    | "&E" { ANDELIM }
    | "|I" { ORINTRO }
    | "|E" { ORELIM }
    | "->I" { IMPINTRO }
    | "->E" { IMPELIM }
    | "<->I" { IFFINTRO }
    | "<->E" { IFFELIM }
    | "LE" { LE }
    | "IDM" { IDM }
    | "COM" { COM }
    | "ASO" { ASO }
    | "DIS" { DIS }
    | "DN" { DN }
    | "DM" { DM }
    | "ID" { ID }
    | "MP" { MP }
    | "MT" { MT }
    | eof { EOF }
