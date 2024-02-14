type conn =
  | And
  | Or
  | Impl
  | Iff

type prop =
  | Atom of string
  | Bool of bool
  | Conn of conn * prop * prop
  | Not of prop

type t =
  | Premise of prop
  | EquivalenceRule of (prop -> prop -> prop) * int * prop
  | ImplicationRule of (prop -> prop -> prop -> prop) * int * int * prop
[@@deriving show]

(** [format_prop p] formats [p] into a string representing a regular logical
    expression. *)
val format_prop : prop -> string
