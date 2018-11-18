module Models.PostContent exposing (..)

type alias PostContent =
    { text : String }

defaultPostContent : PostContent
defaultPostContent =
    { text = "I'm here!"
    }

samplePost1 = PostContent "札幌駅にいます！"
