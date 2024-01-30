open Js_of_ocaml

let handle_errors f x =
  try f x with
  | Interp.SyntaxError err ->
      err
  | Interp.ParserError ->
      "Syntax Error"
  | Interp.SelfRef err ->
      err
  | Invalid_argument _ ->
      "A line can only refrence lines that came before"
  | _ ->
      "Something went wrong"

let _ =
  Js.export "Interpreter"
    (object%js
       method interp s = handle_errors Interp.interp s
    end )
