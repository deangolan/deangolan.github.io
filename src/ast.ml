type rule =
    | Premise
    [@@deriving show]


type binary_op =
    | Or 
    | And
    | Imp
    | Iff
    [@@deriving show]


type stmt =
    | Prop of string
    | Bool of bool
    | Binop of binary_op * stmt * stmt 
    | Not of stmt 
    [@@deriving show]


type expr =
    | Statement of stmt * rule option
    [@@deriving show]
