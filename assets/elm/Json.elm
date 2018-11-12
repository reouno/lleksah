module Json exposing (..)

import Json.Decode as Decode
import Json.Encode as Encode
import Models.User exposing (User)

{- Encoders -}

credentialEncoder : User -> Encode.Value
credentialEncoder user =
    Encode.object
        [ ("session", credentialContentEncoder user) ]

credentialContentEncoder : User -> Encode.Value
credentialContentEncoder user =
    Encode.object
        [ ("email", Encode.string user.email)
        , ("password", Encode.string user.password)
        ]



{- Decoders -}

-- get single value, not as record
tokenStringDecoder : Decode.Decoder String
tokenStringDecoder =
    Decode.field "token" Decode.string
