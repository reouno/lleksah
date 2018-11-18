module Requests exposing (..)

import Http
import Json exposing (credentialEncoder, tokenStringDecoder)
import Models.User exposing (User)
import Routing exposing (authUrl)

submitCredentialsRequest : User -> Http.Request String
submitCredentialsRequest user =
    Http.request
    { method = "POST"
    , headers = []
    , url = authUrl
    , body = credentialEncoder user |> Http.jsonBody
    , expect = Http.expectJson tokenStringDecoder
    , timeout = Nothing
    , withCredentials = False
    }
