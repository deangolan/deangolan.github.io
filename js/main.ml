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
       method parse s =
         handle_errors
           (fun s ->
             Interp.parse s
             |> List.fold_left (fun acc s -> acc ^ Interp.show s) "" )
           s

       method interp s = handle_errors Interp.interp s
    end )
