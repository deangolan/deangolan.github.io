open Js_of_ocaml

let _ =
  Js.export
    "Interpreter"
    (object%js
       method interp = Interp.interp
    end)
