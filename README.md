Simple webpage for verifying propositional logic proofs. https://deangolan.github.io/

## Rules:
p Premise

p<->q <=> (p->q) /\ (q->p) LE <br>
p->q <=> ~p \\/ q LE <br>
T /\ F <=> F LE

p /\ q <=> q Idempotence, Idem, ID <br>
p /\ q <=> q /\ p Commutative, Commu, COM <br>
p /\ (q /\ r) <=> (p /\ q) /\ r Associative, Asso, ASO <br>
p /\ (q \\/ r) <=> (p /\ q) \\/ (p /\ r) Distributive, Dist, DIS <br>
p <=> ~(~p) Double Negation, DoubleNeg, DN <br>
~(p /\ q) <=> ~p /\ ~q DeMorgan, DeMorg, DM <br>
p /\ T <=> p, p \\/ F <=> p Identity, ID <br>
p /\ F <=> F, p \\/ T <=> T Dominance, DO <br>
p /\ ~p <=> F Contradiction, CON <br>
p \\/ ~p <=> T Tautology, TA <br>
p->q, p => q Modus Ponens, MP <br>
p->q, ~q => ~p Modus Tollens, MT

## Examples:
(a->p) \/ ~a Premise <br>
~p Premise <br>
~a \/ ~a Modus Tollens 1,2 <br>
~a Idempotence 3

a \/ (T<->F) Premise <br>
a \/ F LE 1
