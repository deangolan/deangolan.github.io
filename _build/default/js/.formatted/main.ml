open Js_of_ocaml

let _ =
  Js.export "Prooftree"
    (object%js
       method interp s = Line.interp s |> Line.show

       method editLine linenum s = Prooftree.replace_line linenum s

       method deleteLine linenum = Prooftree.delete_line linenum

       val lines = Prooftree.lines
    end )
