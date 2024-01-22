open Line

let lines : (int, line) Hashtbl.t = Hashtbl.create 40

let addline linenum line =
  Hashtbl.add lines linenum (Line.interp line) ;
  Rules.is_valid (Hashtbl.find lines) linenum

let editline linenum line =
  Hashtbl.replace lines linenum (Line.interp line) ;
  Rules.is_valid (Hashtbl.find lines) linenum

let deleteline linenum =
  Hashtbl.remove lines linenum ;
  Rules.all_valid lines
