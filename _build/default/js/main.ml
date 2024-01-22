open Js_of_ocaml
open Prooftree

let _ =
  Js.export "Prooftree"
    (object%js
       method interp line = Line.interp line |> Line.show_line

       method addline linenum line = addline linenum line

       method editline linenum line = editline linenum line

       method deletline linenum = deleteline linenum

       val lines = lines
    end )
