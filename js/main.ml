open Js_of_ocaml

let _ =
  Js.export_all
    (object%js
       method interp = Interp.interp
    end)
