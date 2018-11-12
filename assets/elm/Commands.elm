module Commands exposing (..)

import Http
import Models exposing (Model)
import Models.User exposing (User)
import Msgs exposing (Msg)
import Requests exposing (submitCredentialsRequest)

noCmd : Model -> Cmd Msg
noCmd model = Cmd.none

submitCredentialsCmd : Model -> Cmd Msg
submitCredentialsCmd model =
    submitCredentialsRequest model.user
        |> Http.send Msgs.SignInResult
