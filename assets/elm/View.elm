module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Model)
import Msgs exposing (Msg)
import View.SignIn exposing (signInForm)
import View.Top as Top

view : Model -> Html Msg
view model =
    div []
        [ nav
        , page model
        ]

nav : Html Msg
nav =
    div []
        [ h5 [] [ text "lleksah"]]

page : Model -> Html Msg
page model =
    case model.token of
        Nothing ->
            signInForm model
        Just token ->
            Top.view model
