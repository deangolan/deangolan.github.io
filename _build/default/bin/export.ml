open Js_of_ocaml 
open Prooftree

let _ =
    Js.export_all
    (object%js
        method addline = addline
        method editline = editline
        method deletline = deleteline
        val lines = lines
    end)
