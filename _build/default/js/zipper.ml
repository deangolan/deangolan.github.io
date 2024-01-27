open Line

type tree =
    | Item of item
    | Section of tree list
