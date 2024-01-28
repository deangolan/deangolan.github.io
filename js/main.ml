open Js_of_ocaml

let _ =
  Js.export "Interpreter"
    (object%js
       method parse s = Interp.Main.parse s

       method interp s = Interp.Main.interp s
    end )
