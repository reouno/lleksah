module Models.User exposing (..)

type alias User =
    { name : String
    , email : String
    , password : String
    , is_premium : Bool
    }

emptyUser : User
emptyUser =
    { name = ""
    , email = ""
    , password = ""
    , is_premium = False
    }
