exception SyntaxError of string

exception ParserError

exception SelfRef of string

val interp : string -> string
(** Interpret a logical proof into a string indicating its validity.
    @raise Lexer.SyntaxError
    @raise Parser.Error 
    @raise SelfRef 
    @raise Invalid_argument *)
