module View.NewPost exposing (..)

import Html exposing (..)
import Material.Button as Button
import Material.Options as Options
import Material.Textfield as Textfield
import Models exposing (Model)
import Msgs exposing (Msg)
import Types

view : Model -> Html Msg
view model =
    div []
        [ inputText model
        --, postButton model
        ]

--inputText : Model -> Html Msg
inputText model =
    Textfield.render Msgs.Mdl [1] model.mdl
        [ Textfield.label model.post.content.text
        , Textfield.floatingLabel
        , Textfield.textarea
        , Textfield.rows 6
        , Options.onInput (Msgs.InputPost Types.PText)
        ]
        []
