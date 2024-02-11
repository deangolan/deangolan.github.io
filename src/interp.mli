(** Proof checking interpreter for propositional logic.

    This module provides functionality for interpreting logical proofs in
    propositional logic. A logical proof consists of a sequence of logical
    statements and rules of inference that derive new statements from existing
    ones. The module parses the input string representing the logical proof,
    validates the proof using predefined logical rules, and returns the
    conclusion if the proof is valid.

    The proof checking process involves the following steps:
    - Parsing: The input string representing the logical proof is parsed into a
      structured format using a lexer and parser.
    - Validation: The parsed logical proof is validated using predefined
      logical rules. These rules define how new logical statements can be
      derived from existing ones.
    - Conclusion: If the logical proof is valid, the module returns the
      conclusion, which is the final logical statement derived from the
      premises using the defined rules. *)

exception SyntaxError of string
exception ParserError
exception InvalidRef of string
exception Invalid of string

(** interp s returns Some conclusion of the logical proof string in a readable
    format or None if s is empty. Otherwise:
    @raise SyntaxError if s contains an invalid lexeme.
    @raise ParserError if s contains invalid grammer.
    @raise InvalidRef
      if a line contains a refrence to itself or a line after it.
    @raise Invalid if the proof is invalid. *)
val interp : string -> string option
