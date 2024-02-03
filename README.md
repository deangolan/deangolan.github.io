Simple webpage for verifying propositional logic proofs: https://deangolan.github.io/

## Rules:
p Premise

p<->q <=> (p->q) /\ (q->p) LE

p->q <=> ~p \\/ q LE

T /\ F <=> F LE

p /\ q <=> q Idempotence, Idem, ID

p /\ q <=> q /\ p Commutative, Commu, COM 

p /\ (q /\ r) <=> (p /\ q) /\ r Associative, Asso, ASO

p /\ (q \\/ r) <=> (p /\ q) \\/ (p /\ r) Distributive, Dist, DIS

p <=> ~(~p) Double Negation, DoubleNeg, DN

~(p /\ q) <=> ~p /\ ~q DeMorgan, DeMorg, DM

p /\ T <=> p, p \\/ F <=> p Identity, ID

p /\ F <=> F, p \\/ T <=> T Dominance, DO

p /\ ~p <=> F Contradiction, CON

p \\/ ~p <=> T Tautology, TA 

p->q, p => q Modus Ponens, MP

p->q, ~q => ~p Modus Tollens, MT

## Examples:
(a->p) \\/ ~a Premise <br>
~p Premise <br>
~a \\/ ~a Modus Tollens 1,2 <br>
~a Idempotence 3

a \\/ (T<->F) Premise <br>
a \\/ F LE 1
