module Msgs exposing (..)

import Dom
import Http
import Material
import Models.Route exposing (Route)
import Models.Timeline exposing (PostId)
import Navigation exposing (Location)
import Types exposing (Field, PostField)


type Msg
    = Mdl (Material.Msg Msg)
    | OnLocationChange Location
    | NavigateTo Route
    | UpdateSignInForm Field String
    | SignIn
    | SignInResult (Result Http.Error String)
    --| ClickPost PostId
    | ClickNewPostButton
    | InputPost PostField String
    | FocusResult (Result Dom.Error ())
