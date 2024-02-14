(** Proof checking interpreter for propositional logic.

    This module provides functionality for interpreting logical proofs in
    propositional logic. A logical proof consists of a sequence of logical
    statements and rules of inference that derive new statements from existing
    ones. The module parses the input string representing the logical proof,
    validates the proof using predefined logical rules, and returns the
    conclusion if the proof is valid. *)

(** [interp s] interprets the proof string [s] into a string indicating its
    validity. If the proof is valid it returns the formatted conclusion.
    Otherwise, it returns an appropriate error string, or if [s] is empty, it
    returns an empty string. *)
val interp : string -> string
