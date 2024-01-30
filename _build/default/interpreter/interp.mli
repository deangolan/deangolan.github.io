exception SyntaxError of string

exception ParserError

exception SelfRef of string

val show : Ast.t -> string

val simplify : Ast.prop -> Ast.prop
(** Simply a logical proposition by applying all possible operations to 
    booleans in the given abtract syntax tree. *)

val parse : string -> Ast.t list
(** Parse a string representing a logical proof into a list of
    abstract syntax trees.
    @raise SyntaxError
    @raise Error 
    @raise SelfRef 
    @raise Invalid_argument *)

val interp : string -> string
(** Interpret a logical proof into a string indicating its validity.
    @raise SyntaxError 
    @raise Error
    @raise SelfRef 
    @raise Invalid_argument *)
