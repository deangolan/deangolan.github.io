open Js_of_ocaml

let handle_errors f x =
  try f x with
  | Interp.SyntaxError msg ->
      msg
  | Interp.InvalidRef msg ->
      msg
  | Interp.ParserError ->
      "Syntax Error"
  | Invalid_argument _ ->
      "A line can only refrence lines that came before"

let _ =
  Js.export "Interpreter"
    (object%js
       method interp s = handle_errors Interp.interp s
    end )
