port module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (id, class, value)
import Html.Events exposing (..)
import Array exposing (Array)
import Task
import Browser.Dom as Dom


type InfoForOutside
    = EditLine Int String
    | DeleteLine Int


type InfoForElm
    = LineEval Result String (Bool, String) 


main : Program() (Model) Msg
main =
    Browser.element
        { init = \_ -> (init, Cmd.none)
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


type alias Line = 
    { prop : String
    , validity : (Bool, String) 
    }


type alias Model = Array Line


emptyLine : Line
emptyLine = Line "" (True, "")


init : Model
init =
    Array.fromList [ Line "Enter your proof here" (True, "") ]


type Msg 
    = Submit Int
    | Eval Int
    | FocusResult (Result Dom.Error ()) 


inputId : Int -> String
inputId linenum =
    "lineinput" ++ String.fromInt linenum


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Submit linenum ->
            if linenum == Array.length model then
                (Array.push emptyLine model
                , Dom.focus (inputId (linenum + 1)) |> Task.attempt FocusResult)
            else
                (model
                , Dom.focus (inputId (linenum + 1)) |> Task.attempt FocusResult)

        FocusResult result ->
            case result of
                Ok () ->
                    (model, Cmd.none)
                Err (Dom.NotFound id) ->
                    (model, 
                    Cmd.none 
                        |> Debug.log ("Error loading: " ++ id))

        Eval linenum ->
            case Array.get linenum model of
                Just line ->
                    (Array.set linenum line model, Cmd.none)

                Nothing ->
                    -- Should be impossible
                    (model, Cmd.none 
                        |> Debug.log 
                        ("Failed to retreive line: " ++ String.fromInt linenum))


lineToHtml : (Int, Line) -> Html Msg
lineToHtml (index, line) =
    let linenum = index + 1 in
    li [ class "line" ]
        [ form [ onSubmit (Submit linenum) ] 
            [ input 
                [ id (inputId linenum)
                , value line.prop
                , onBlur (Eval linenum)
                ] 
                []
            ]
        , output [value <| Tuple.second line.validity] []
    ]


view : Model -> Html Msg
view model =
    div 
    [class "container"]
    [ ol [] (List.map lineToHtml (Array.toIndexedList model)) ]
