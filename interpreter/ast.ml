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
  | `ModusTollens of int * int ]
[@@deriving show]

type conn = [`And | `Or | `Impl | `Iff] [@@deriving show]

type prop =
  [`Atom of string | `Bool of bool | `Conn of conn * prop * prop | `Not of prop]
[@@deriving show]

type t = {prop: prop; derivedby: rule} [@@deriving show]
