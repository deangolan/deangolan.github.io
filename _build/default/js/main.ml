open Js_of_ocaml

let _ =
  Js.export "Interpreter"
    (object%js
       method parse s =
         try
           Interp.Main.parse s |> List.map Interp.Ast.show
           |> List.fold_left (fun acc s -> acc ^ s) ""
         with
         | Interp.Lexer.SyntaxError err ->
             err
         | Interp.Parser.Error ->
             "Syntax Error"

       method interp s =
         try Interp.Main.interp s with
         | Interp.Lexer.SyntaxError err ->
             err
         | Interp.Parser.Error ->
             "Syntax Error"
    end )
