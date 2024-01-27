port module Port exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Browser


-- PORTS

port sendProof : String -> Cmd msg
port receiveEval : (List String -> msg) -> Sub msg


-- MODEL

type alias Model = 
    { proof : String
    , linesEval : List String 
    }

init : ( Model, Cmd Msg )
init =
    ( { proof = "", linesEval = [] }
    , Cmd.none
    )


-- UPDATE

type Msg
    = Send
    | Receive ( List String )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Send ->
            ( model  
            , sendProof model.proof 
            )

        Receive linesEval ->
            ( { model | linesEval = linesEval }
            , Cmd.none
            )

subscriptions : Model -> Sub Msg
subscriptions _ =
    receiveEval Receive


-- VIEW

view : Model -> Html Msg
view model = 
    textarea
        [ class "proofcontainer"
        , placeholder "Enter your proof here"
        , rows 1
        , on "keydown" (isEnterOrBackspace Send) 
        , value model.proof
        ] 
        []

isEnterOrBackspace : msg -> Json.Decoder msg
isEnterOrBackspace msg =
    Json.field "key" Json.string
        |> Json.andThen (\key -> if key == "Enter" || key == "Backspace" then 
                Json.succeed msg
            else 
                Json.fail "Some other key")


-- MAIN

main : Program () Model Msg
main = 
    Browser.element 
        { init = ( \_ -> init )
        , update = update
        , view = view
        , subscriptions = subscriptions 
        }
