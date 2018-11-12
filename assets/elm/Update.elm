module Update exposing (..)

import Commands exposing (submitCredentialsCmd)
import Http
import Models exposing (Model)
import Msgs exposing (Msg)
import Types

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.UpdateSignInForm field value ->
            let
                user = model.user
                updatedUser =
                    case field of
                        Types.Femail -> { user | email = value }
                        Types.Fpass -> { user | password = value }
                _ = Debug.log "Msgs.UpdateSignInForm:" updatedUser
            in
                ( { model | user = updatedUser }, Cmd.none )
        Msgs.SignIn ->
            ( model, submitCredentialsCmd model )
        Msgs.SignInResult result ->
            case result of
                Ok token ->
                    let _ = Debug.log "Success SignInResult:" token in
                    ( { model | token = Just token }, Cmd.none )
                Err err ->
                    let _ = Debug.log "Failed SignInResult:" err in
                    (model, Cmd.none)
        _ ->
            let _ = Debug.log "Otherwise case:" "some msgs may not be defined yet." in
            (model, Cmd.none)
