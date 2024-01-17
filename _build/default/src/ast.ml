type rule =
    [ `Premise
    | `Idempotence of int 
    | `Commutative of int
    | `Associative of int
    | `Distributive of int
    | `DoubleNegation of int
    | `DeMorgan of int
    | `Identity of int 
    | `Dominance of int
    | `LE of int
    | `ModusPonens of int * int
    | `ModusTollens of int * int
    | `AndIntro of int * int
    | `AndElim of int
    | `OrIntro of int 
    | `OrElim of int * int 
    | `ImpIntro of int * int 
    | `ImpElim of int * int 
    | `IffIntro of int * int 
    | `IffElim of int * int 
    ]
    [@@deriving show]


type conn =
    [ `And 
    | `Or
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
