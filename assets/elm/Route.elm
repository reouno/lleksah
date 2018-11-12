module Route exposing (..)

apiRoot : String
apiRoot = "/api/v1"

authUrl : String
authUrl = apiRoot ++ "/" ++ "sign_in"
