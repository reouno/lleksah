module Update exposing (..)

import Commands exposing (submitCredentialsCmd)
import Dom
import Http
import Material
import Models exposing (Model)
import Models.Route as Route
import Msgs exposing (Msg)
import Navigation exposing (load)
import Routing exposing (newPostPath, parseLocation)
import Task exposing (Task)
import Types

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.Mdl msg ->
            Material.update Msgs.Mdl msg model
        Msgs.OnLocationChange location ->
            let
                newRoute = parseLocation location
                _ = Debug.log "Msgs.OnLocationChange:" newRoute
            in
                ( { model | route = newRoute }, Cmd.none )
        Msgs.FocusResult result ->
            let _ = Debug.log "Msgs.FocusResult:" result in
            case result of
                Err (Dom.NotFound id) ->
                    ( model, Cmd.none )
                Ok () ->
                    ( model, Cmd.none )
        Msgs.NavigateTo route ->
            ( model, Navigation.newUrl newPostPath )
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
        Msgs.ClickNewPostButton ->
            let _ = Debug.log "Msgs.ClickNewPostButton:" "clicked" in
            ( model, Cmd.none )
        Msgs.InputPost field value ->
            let
                post = model.post
                content = post.content
                updatedContent =
                    case field of
                        Types.PText -> { content | text = value }
                updatedPost = { post | content = updatedContent }
                _ = Debug.log "Msgs.InputPost:" updatedPost
            in
                ( { model | post = updatedPost }, Cmd.none )
