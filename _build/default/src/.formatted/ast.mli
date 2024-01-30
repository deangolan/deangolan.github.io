type conn = And | Or | Impl | Iff

type prop =
  | Atom of string
  | Bool of bool
  | Conn of conn * prop * prop
  | Not of prop

type t =
  | Premise of prop
  | EquivalenceRule of (prop -> prop -> prop) * t * prop
  | ImplicationRule of (prop -> prop -> prop -> prop) * t * t * prop
  | Lineref of int
[@@deriving show]

val format_prop : prop -> string
