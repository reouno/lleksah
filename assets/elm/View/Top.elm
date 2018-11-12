module View.Top exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Material.Card as Card
import Material.Color as Color
import Models exposing (Model)
import Models.Timeline exposing (Timeline, Post)
import Msgs exposing (Msg)
import Styles

view : Model -> Html Msg
view model =
    div []
        [ timelineView model.timeline ]

timelineView : Timeline -> Html Msg
timelineView timeline =
    div [] (List.map postView timeline)

postView : Post -> Html Msg
postView post =
    Card.view
        [ Color.background Styles.bgWhite
        --, Option.onClick (ClickPost post.id)
        ]
        [ Card.title [] [ Card.head [] [ text post.address ] ]
        , Card.text [] [ text post.content.text ] ]
