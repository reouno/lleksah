module Models exposing (..)

import Material
import Models.Timeline exposing (Timeline, sampleTimeline)
import Models.Token exposing (Token, emptyToken)
import Models.User exposing (User, emptyUser)

type alias Model =
    { mdl : Material.Model
    , user : User
    , token : Token
    , timeline : Timeline
    }

initialModel : Model
initialModel =
    { mdl = Material.model
    , user = emptyUser
    , token = emptyToken
    , timeline = sampleTimeline
    }
