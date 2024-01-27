type tree =
    | Item of Line.t 
    | Section of tree list

type path =
    | Top
    | Node of tree list * path * tree list

type location = tree * path



