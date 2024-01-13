type rule =
    | Premise
    [@@deriving show]


type binary_op =
    | Or 
    | And
    | Implies
    | Iff
    [@@deriving show]


type expr =
    | Statement of expr * rule 
    | Prop of string
    | Bool of bool
    | Binop of binary_op * expr * expr
    | Not of expr
    [@@deriving show]
