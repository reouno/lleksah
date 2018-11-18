module Models exposing (..)

import Material
import Models.Route exposing (Route)
import Models.Timeline exposing (Post, Timeline, emptyPost, sampleTimeline)
import Models.Token exposing (Token, emptyToken)
import Models.User exposing (User, emptyUser)

type alias Model =
    { mdl : Material.Model
    , route : Route
    , user : User
    , token : Token
    , timeline : Timeline
    , post : Post
    }

initialModel : Route -> Model
initialModel route =
    { mdl = Material.model
    , route = route
    , user = emptyUser
    , token = emptyToken
    , timeline = sampleTimeline
    , post = emptyPost
    }
