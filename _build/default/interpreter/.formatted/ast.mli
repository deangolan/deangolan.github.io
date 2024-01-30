type conn = [`And | `Or | `Impl | `Iff] [@@deriving show]

type prop =
  [`Atom of string | `Bool of bool | `Conn of conn * prop * prop | `Not of prop]
[@@deriving show]

type t =
  | Premise of prop
  | EquivalenceRule of (prop -> prop -> prop) * t * prop
  | ImplicationRule of (prop -> prop -> prop -> prop) * t * t * prop
  | Lineref of int
[@@deriving show]
