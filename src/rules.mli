(** Propositional logic rules module.

    Each rule takes propositions as input and returns a proposition if the
    input satisfies the rule, otherwise it raises Invalid. *)

open Ast

exception Invalid of string

(* --------------------------- Equivalence Rules ---------------------------

   Equivalence rule patterns are symmetric. This means that if a rule p q
   returns q then rule q p is guranteed to return p. @raise Invalid "p <!=> q"

   ------------------------------------------------------------------------- *)

val le : prop -> prop -> prop
val idempotence : prop -> prop -> prop
val commutative : prop -> prop -> prop
val associative : prop -> prop -> prop
val distributive : prop -> prop -> prop
val doublenegation : prop -> prop -> prop
val demorgan : prop -> prop -> prop
val identity : prop -> prop -> prop
val dominance : prop -> prop -> prop
val contradiction : prop -> prop -> prop
val tautology : prop -> prop -> prop

(* --------------------------- Implication Rules ---------------------------

   For rule p1 p2 q @raise Invalid "p1, p2 !=> q"

   ------------------------------------------------------------------------- *)

val modusponens : prop -> prop -> prop -> prop
val modustollens : prop -> prop -> prop -> prop
