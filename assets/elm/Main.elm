module Main exposing (..)

import Html exposing (Html)
import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import Update exposing (update)
import View exposing (view)

init : ( Model, Cmd Msg )
init = ( initialModel, Cmd.none )

subscriptions: Model -> Sub Msg
subscriptions model = Sub.none

main : Program Never Model Msg
main = Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
