type binary_op =
    | Or 
    | And
    | Implies
    | Iff
    [@@deriving show]

type expr =
    | Prop of string
    | Bool of bool
    | Binop of binary_op * expr * expr
    | Not of expr
    [@@deriving show]
