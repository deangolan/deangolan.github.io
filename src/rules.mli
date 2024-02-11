open Ast

exception Invalid of string

val le : prop -> prop -> prop
(** Apply a general Logical Equivalence *)

val idempotence : prop -> prop -> prop
(** Apply the Law of Idempotence *)

val commutative : prop -> prop -> prop
(** Apply the Law of Commutativity *)

val associative : prop -> prop -> prop
(** Apply the Law of Associativity *)

val distributive : prop -> prop -> prop
(** Apply the Law of Distributivity *)

val doublenegation : prop -> prop -> prop
(** Apply the Law of Double Negation *)

val demorgan : prop -> prop -> prop
(** Apply the DeMorgan's Law *)

val identity : prop -> prop -> prop
(** Apply the Law of Identity *)

val dominance : prop -> prop -> prop
(** Apply the Law of Dominance *)

val contradiction : prop -> prop -> prop
(** Apply the Law of Contradiction *)

val tautology : prop -> prop -> prop
(** Apply the Law of Tautology *)

val modusponens : prop -> prop -> prop -> prop
(** Apply Modus Ponens *)

val modustollens : prop -> prop -> prop -> prop
(** Apply Modus Tollens *)
