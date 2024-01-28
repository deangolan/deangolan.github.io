type conn = [`And | `Or | `Impl | `Iff] [@@deriving show]

type prop =
  [`Atom of string | `Bool of bool | `Conn of conn * prop * prop | `Not of prop]
[@@deriving show]

type eq_rule =
  | Idempotence
  | Commutative
  | Associative
  | Distributive
  | DoubleNegation
  | DeMorgan
  | Identity
  | Dominance
  | LE
[@@deriving show]

type impl_rule = ModusPonens | ModusTollens [@@deriving show]

type t =
  | Premise of prop
  | EquivalenceRule of eq_rule * t * prop
  | ImplicationRule of impl_rule * t * t * prop
  | Lineref of int
[@@deriving show]
