module View.Top exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events.Extra exposing (onClickPreventDefault)
import Material.Button as Button
import Material.Card as Card
import Material.Color as Color
import Material.Options as Options
import Models exposing (Model)
import Models.Route as Route
import Models.Timeline exposing (Timeline, Post)
import Msgs exposing (Msg)
import Routing exposing (newPostPath)
import Styles

view : Model -> Html Msg
view model =
    div []
        [ timelineView model.timeline
        , newPostView model
        ]

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

newPostView : Model -> Html Msg
newPostView model =
    div [ class "m1 absolute right-0 bottom-0" ]
        [ newPostButton model ]

newPostButton : Model -> Html Msg
newPostButton model =
    a
        [ href newPostPath
        , onClickPreventDefault (Msgs.NavigateTo Route.NewPostRoute) ]
        [ Button.render Msgs.Mdl [9,0,0,1] model.mdl
            [ Button.fab
            , Button.plain
            , Button.raised
            ]
            [ text "+" ]
        ]
