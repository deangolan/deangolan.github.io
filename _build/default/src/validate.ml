open Ast

let le = Rules.is_equivalent Rules.le

let idempotence = Rules.is_equivalent Rules.idempotence

let commutative = Rules.is_equivalent Rules.commutative

let associative = Rules.is_equivalent Rules.associative

let distributive = Rules.is_equivalent Rules.distributive

let doublenegation = Rules.is_equivalent Rules.doublenegation

let demorgan = Rules.is_equivalent Rules.demorgans

let identity = Rules.is_equivalent Rules.identity

let dominance = Rules.is_equivalent Rules.dominance

let contradiction = Rules.is_equivalent Rules.contradiction

let tautology = Rules.is_equivalent Rules.tautology

let modusponens = Rules.is_implied Rules.modusponens

let modustollens = Rules.is_implied Rules.modustollens

let rec validate = function
  | Premise p ->
      p
  | EquivalenceRule (rule, p, q) ->
      rule (validate p) q
  | ImplicationRule (rule, p1, p2, q) ->
      rule (validate p1) (validate p2) q
  | Lineref _ ->
      failwith "Precondition violated"
