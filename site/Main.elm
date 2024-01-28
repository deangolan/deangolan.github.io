port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Browser


-- PORTS

port sendProof : String -> Cmd msg
port receiveEval : ( String -> msg ) -> Sub msg


-- MODEL

type alias Model = 
    { proof : String
    , valid : String 
    }

init : ( Model, Cmd Msg )
init =
    ( { proof = "", valid = "" }
    , Cmd.none
    )


-- UPDATE

type Msg
    = Change String
    | Send
    | Receive String 

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Change text ->
            ( {model | proof = text} 
            , Cmd.none
            )

        Send ->
            ( model  
            , sendProof model.proof 
            )

        Receive message ->
            ( Debug.log message { model | valid = message }
            , Cmd.none
            )

subscriptions : Model -> Sub Msg
subscriptions _ =
    receiveEval Receive


-- VIEW

view : Model -> Html Msg
view model = 
    div [] 
    [ textarea
        [ class "proofcontainer"
        , placeholder "Enter your proof here"
        , rows 1
        , on "keydown" (isEnterOrBackspace Send) 
        , value model.proof
        , onInput Change
        ] 
        []
    , output [class "output"] [text model.valid]
    ]

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
