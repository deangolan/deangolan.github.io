port module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- PORTS


port sendProof : String -> Cmd msg


port receiveEval : (String -> msg) -> Sub msg



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
    | Receive String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Change text ->
            ( { model | proof = text }
            , sendProof model.proof
            )

        Receive message ->
            ( { model | valid = message }
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
            , spellcheck False
            , value model.proof
            , onInput Change
            ]
            []
        , output [ class "output" ] [ text model.valid ]
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
