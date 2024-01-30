type conn = And | Or | Impl | Iff [@@deriving show]

type prop =
  | Atom of string
  | Bool of bool
  | Conn of conn * prop * prop
  | Not of prop
[@@deriving show]

type t =
  | Premise of prop
  | EquivalenceRule of (prop -> prop -> prop) * t * prop
  | ImplicationRule of (prop -> prop -> prop -> prop) * t * t * prop
  | Lineref of int
[@@deriving show]

let rec format_prop = function
  | Atom a ->
      a
  | Bool b ->
      if b then "T" else "F"
  | Conn (conn, p, q) ->
      ( match conn with
      | And ->
          format_prop p ^ " /\\ " ^ format_prop q
      | Or ->
          format_prop p ^ " \\/ " ^ format_prop q
      | Impl ->
          format_prop p ^ " -> " ^ format_prop q
      | Iff ->
          format_prop p ^ " <-> " ^ format_prop q )
      |> fun s -> "(" ^ s ^ ")"
  | Not (Not _ as p)->
      "~(" ^ format_prop p ^ ")"
  | Not p ->
      "~" ^ format_prop p
