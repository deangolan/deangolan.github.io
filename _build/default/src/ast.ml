type rule =
    [ `Premise
    | `Idempotence of int 
    | `Commutative of int
    | `Identity of int 
    | `ModusTollens of int * int
    ]
    [@@deriving show]


type conn =
    [ `Or 
    | `And
    | `Imp
    | `Iff
    ]
    [@@deriving show]


type prop =
    [ `Atom of string
    | `Bool of bool
    | `Conn of conn * prop * prop
    | `Not of prop
    ]
    [@@deriving show]


type line = {prop: prop; derivedby: rule} [@@deriving show]
