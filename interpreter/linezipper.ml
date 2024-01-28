type t = Ast.t list * Ast.t list

let from_list lst = (lst, [])

let forward = function h :: t, tail -> (t, h :: tail) | zipper -> zipper

let backward = function head, h :: t -> (h :: head, t) | zipper -> zipper

let fold f acc = function
    | ([], _) -> 

let rec getline zipper i =
  match (zipper, i) with
  | ([], _), _ ->
      None
  | (h :: _, _), 0 ->
      Some h
  | zipper, n ->
      getline (forward zipper) (n - 1)
