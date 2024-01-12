type binary_op =
    | Or 
    | And
    | Implies
    | Iff

type expr =
    | Bool of bool
    | Binop of binary_op * expr * expr
    | Not of expr
