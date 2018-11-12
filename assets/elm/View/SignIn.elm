module View.SignIn exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Material.Button as Button
import Material.Options as Options
import Material.Textfield as Textfield
import Models exposing (Model)
import Msgs exposing (Msg)
import Types

signInForm : Model -> Html Msg
signInForm model =
    div [ class "center" ]
        [ h4 [] [ text "Sign in" ]
        , p [] [ emailForm model ]
        , p [] [ passwordForm model ]
        , p [] [ signInButton model ]
        ]

emailForm : Model -> Html Msg
emailForm model =
    Textfield.render Msgs.Mdl [1] model.mdl
        [ Textfield.label "Enter email"
        , Textfield.floatingLabel
        , Textfield.email
        , Options.onInput (Msgs.UpdateSignInForm Types.Femail)
        ]
        []

passwordForm : Model -> Html Msg
passwordForm model =
    Textfield.render Msgs.Mdl [2] model.mdl
        [ Textfield.label "Enter password"
        , Textfield.floatingLabel
        , Textfield.password
        , Options.onInput (Msgs.UpdateSignInForm Types.Fpass)
        ]
        []

signInButton : Model -> Html Msg
signInButton model =
    Button.render Msgs.Mdl [9,0,0,1] model.mdl
        [ Button.ripple
        , Button.colored
        , Button.raised
        , Options.onClick Msgs.SignIn
        ]
        [ text "Sign in" ]
