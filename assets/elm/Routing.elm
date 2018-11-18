module Routing exposing (..)

import Navigation exposing (Location)
import Models.Route exposing (Route(..))
import UrlParser as Parser

parseLocation : Location -> Route
parseLocation location =
    location
        |> Parser.parsePath matchers
        |> Maybe.withDefault NotFoundRoute

matchers : Parser.Parser (Route -> a) a
matchers =
    Parser.oneOf
        [ Parser.map TopRoute Parser.top
        , Parser.map NewPostRoute (Parser.s "new")
        ]

-- Routes
apiRoot : String
apiRoot = "/api/v1"

authUrl : String
authUrl = apiRoot ++ "/" ++ "sign_in"

root : String
root = "/"

newPostPath : String
newPostPath = root ++ "new"
