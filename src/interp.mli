exception SyntaxError of string

exception ParserError

exception InvalidRef of string

val interp : string -> string
(** Interpret a logical proof into a string indicating its validity.
    @raise SyntaxError
    @raise ParserError
    @raise InvalidRef
    @raise Invalid_argument *)
