module Main exposing (..)

import Dom
import Html exposing (Html)
import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import Navigation exposing (Location)
import Routing exposing (parseLocation)
import Task exposing (Task)
import Update exposing (update)
import View exposing (view)

init : Location -> (Model, Cmd Msg)
init location =
    let
        initialRoute = parseLocation location
    in
        ( initialModel initialRoute
        , Dom.focus "signin-email-field" |> Task.attempt Msgs.FocusResult
        )

subscriptions: Model -> Sub Msg
subscriptions model = Sub.none

main : Program Never Model Msg
main = Navigation.program Msgs.OnLocationChange
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
