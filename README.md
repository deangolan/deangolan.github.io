Simple webpage for verifying propositional logic proofs. https://deangolan.github.io/

## Rules:
p Premise

p<->q <=> (p->q) /\ (q->p) LE <br>
p->q <=> ~p \\/ q LE <br>
T /\ F <=> F LE <br>

p /\ q <=> q Idempotence, Idem, ID
p /\ q <=> q /\ p Commutative, Commu, COM
p /\ (q /\ r) <=> (p /\ q) /\ r Associative, Asso, ASO
p /\ (q \/ r) <=> (p /\ q) \/ (p /\ r) Distributive, Dist, DIS
p <=> ~(~p) Double Negation, DoubleNeg, DN
~(p /\ q) <=> ~p /\ ~q DeMorgan, DeMorg, DM
p /\ T <=> p, p \/ F <=> p Identity, ID
p /\ F <=> F, p \/ T <=> T Dominance, DO
p /\ ~p <=> F Contradiction, CON
p \/ ~p <=> T Tautology, TA
p->q, p => q Modus Ponens, MP
p->q, ~q => ~p Modus Tollens, MT

## Examples:
(a->p) \/ ~a Premise
~p Premise
~a \/ ~a Modus Tollens 1,2
~a Idempotence 3

a \/ (T<->F) Premise
a \/ F LE 1
