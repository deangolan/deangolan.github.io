Simple webpage for verifying propositional logic proofs: https://deangolan.github.io/

## Examples:
Try copy and pasting these into the editor.

```
*This is a comment*
(a -> p) \/ ~a Premise
~p Premise
~a \/ ~a Modus Tollens 1,2
~a LE 3
*Try deleting one of the ~ symbols*
```
```
*The LE rule can simplify expressions*
(a /\ ~a) <-> (a \/ ~a) Premise
F <-> T LE 1
F LE 2

*Or in one step*
F LE 1 
```
```
(p->q)->r Premise
~(p->q) \/ r LE 1
~(~p \/ q) \/ r LE 2
~(~p \/ ~~q) \/ r Double Negation 3
~~(p /\ ~q) \/ r DeMorgan 4
(p /\ ~q) \/ r Double Negation 5
(p \/ r) /\ (~q \/ r) Distributive 6
(~~p \/ r) /\ (~q \/ r) Double Negation 7
(~p->r) /\ (~q \/ r) LE 8
(~p->r) /\ (q->r) LE 9
```
## Rules:
Premise, PR

$p$ 

LE \
*(Powerful general rule for various logical equivalences)*

$p \leftrightarrow q \iff (p \rightarrow q) \land (q \rightarrow p)$ 

$p \rightarrow q \iff \neg p \lor q$

$T \land F \iff F$

$p \land p \iff p$

$p \land \neg p \iff F$

Commutative, CM

$p \land q \iff q \land p$

Associative, AS

$p \land (q \land r) \iff (p \land q) \land r$ 

Distributive, DI

$p \land (q \lor r) \iff (p \land q) \lor (p \land r)$ 

Double Negation, DN

$p \iff \neg (\neg p)$ 

DeMorgan, DM

$\neg (p \land q) \iff \neg p \lor \neg q$ 

Modus Ponens, MP

$p \rightarrow q$, $p \implies q$

Modus Tollens, MT

$p \rightarrow q, \neg q \implies \neg p$

Disjunctive Syllogism, DS

$p \lor q, \neg ~p \implies q$

Hypothetical Syllogism, HS

$p \rightarrow q, q \rightarrow r \implies p \rightarrow r$
