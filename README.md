Simple webpage for verifying propositional logic proofs: https://deangolan.github.io/

## Examples:
Try copy and pasting these into the editor.

```
(a -> p) \/ ~a Premise
~p Premise
~a \/ ~a Modus Tollens 1,2
~a Idempotence 3
```
```
a \/ (T<->F) Premise
a \/ F LE 1
```
```
(p->q)->r Premise
~(p->q)\/r LE 1
~(~p\/q)\/r LE 2
~(~p\/~~q)\/r Double Negation 3
~~(p/\~q)\/r DeMorgan 4
(p/\~q)\/r Double Negation 5
(p\/r)/\(~q\/r) Distributive 6
(~~p\/r)/\(~q\/r) Double Negation 7
(~p->r)/\(~q\/r) LE 8
(~p->r)/\(q->r) LE 9
```
## Rules:
Premise

$p$ 

LE

$p \leftrightarrow q \iff (p \rightarrow q) \land (q \rightarrow p)$ 

$p \rightarrow q \iff \neg p \lor q$

$T \land F \iff F$

Idempotence, Idem, ID

$p \land p \iff p$

Commutative, Commu, COM 

$p \land q \iff q \land p$

Associative, Asso, ASO

$p \land (q \land r) \iff (p \land q) \land r$ 

Distributive, Dist, DIS

$p \land (q \lor r) \iff (p \land q) \lor (p \land r)$ 

Double Negation, DoubleNeg, DN

$p \iff ~(~p)$ 

DeMorgan, DeMorg, DM

$~(p \land q) \iff ~p \lor ~q$ 

Identity, ID

$p \land T \iff p, \ \ p \lor F \iff p$ 

Dominance, DO

$p \land F \iff F, \ \ p \lor T \iff T$ 

Contradiction, CON

$p \land ~p \iff F$

Tautology, TA 

$p \lor ~p \iff T$ 

Modus Ponens, MP

$p \rightarrow q, \ \ p \implies q$

Modus Tollens, MT

$p \rightarrow q, \ \ ~q \implies ~p$

