type conn =
  | And
  | Or
  | Impl
  | Iff
[@@deriving show]

type prop =
  | Atom of string
  | Bool of bool
  | Conn of conn * prop * prop
  | Not of prop
[@@deriving show]

type t =
  | Premise of prop
  | EquivalenceRule of (prop -> prop -> prop) * int * prop
  | ImplicationRule of (prop -> prop -> prop -> prop) * int * int * prop
[@@deriving show]

let format_prop p =
  let rec aux is_root p =
    let branches = aux false in
    match p with
    | Atom a -> a
    | Bool b -> if b then "T" else "F"
    | Conn (conn, p, q) ->
      (match conn with
       | And -> branches p ^ " /\\ " ^ branches q
       | Or -> branches p ^ " \\/ " ^ branches q
       | Impl -> branches p ^ " -> " ^ branches q
       | Iff -> branches p ^ " <-> " ^ branches q)
      |> fun p -> if is_root then p else "(" ^ p ^ ")"
    | Not (Not _ as p) -> "~(" ^ branches p ^ ")"
    | Not p -> "~" ^ branches p
  in
  aux true p
