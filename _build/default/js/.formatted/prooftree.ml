let lines : (int, Line.t) Hashtbl.t = Hashtbl.create 40

let replace_line (linenum : int) (s : string) : bool =
  let line = Line.interp s in
  Hashtbl.replace lines linenum line ;
  Rules.is_valid lines line

let delete_line (linenum : int) : bool =
  Hashtbl.remove lines linenum ;
  Rules.all_valid lines
