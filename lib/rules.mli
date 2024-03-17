(** Propositional logic rules module.

    Each rule takes propositions as input and returns a proposition if the
    input satisfies the rule, otherwise it raises Invalid. *)

open Ast

exception Invalid of string

(* --------------------------- Equivalence Rules ---------------------------

   Equivalence rule patterns are symmetric. This means that if a [rule p q]
   returns [q] then [rule q p] is guranteed to return [p]. @raise Invalid "p
   <!=> q"

   ------------------------------------------------------------------------- *)

val le : prop -> prop -> prop
val commutative : prop -> prop -> prop
val associative : prop -> prop -> prop
val distributive : prop -> prop -> prop
val doublenegation : prop -> prop -> prop
val demorgan : prop -> prop -> prop

(* --------------------------- Implication Rules ---------------------------

   For [rule p1 p2 q] @raise Invalid "p1, p2 !=> q"

   ------------------------------------------------------------------------- *)

val modus_ponens : prop -> prop -> prop -> prop
val modus_tollens : prop -> prop -> prop -> prop
val disjunctive_syllogism : prop -> prop -> prop -> prop
val hypothetical_syllogism : prop -> prop -> prop -> prop
