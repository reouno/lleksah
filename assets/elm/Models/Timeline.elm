module Models.Timeline exposing (..)

import Models.Geolocation exposing (Geolocation)
import Models.PostContent exposing (PostContent)

type alias PostId = String

type alias Post =
    { id : PostId
    , user_id : Int
    , username : String
    , location : Geolocation
    , address : String
    , content : PostContent
}

type alias Timeline = List Post

emptyPost : Post
emptyPost =
    { id = "newEmptyPostIdshouldbeUUID."
    , user_id = 0
    , username = ""
    , location = Models.Geolocation.defaultGeolocation
    , address = ""
    , content = Models.PostContent.defaultPostContent
    }

post1 : Post
post1 =
    { id = "sadfhds235436sdfas"
    , user_id = 0
    , username = "Chappy"
    , location = Models.Geolocation.sampleGeo1
    , address = "札幌駅"
    , content = Models.PostContent.samplePost1
    }

sampleTimeline : Timeline
sampleTimeline = [ post1 ]
