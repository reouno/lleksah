module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Model)
import Models.Route as Route
import Msgs exposing (Msg)
import View.NewPost as NewPost
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

-- authorized or not
page : Model -> Html Msg
page model =
    case model.token of
        Nothing ->
            signInForm model
        Just token ->
            inPage model

inPage : Model -> Html Msg
inPage model =
    case model.route of
        Route.TopRoute ->
            Top.view model
        Route.NewPostRoute ->
            NewPost.view model
        Route.NotFoundRoute ->
            div [] [ text "page not found" ]
