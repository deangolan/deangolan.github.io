open Js_of_ocaml

let _ =
  Js.export "Prooftree"
    (object%js
       method interp line = Line.interp line |> Line.show

       method replace linenum line = Prooftree.replace_line linenum line

       method delete linenum = Prooftree.delete_line linenum

       val lines = Prooftree.lines
    end )
