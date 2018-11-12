module Msgs exposing (..)

import Http
import Material
import Models.Timeline exposing (PostId)
import Types exposing (Field)


type Msg
    = Mdl (Material.Msg Msg)
    | UpdateSignInForm Field String
    | SignIn
    | SignInResult (Result Http.Error String)
    --| ClickPost PostId
