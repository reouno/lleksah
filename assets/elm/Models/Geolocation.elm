module Models.Geolocation exposing (..)

type alias Geolocation =
    { latitude: Float
    , longitude: Float
    , error: String
    }

defaultGeolocation = Geolocation 0 0 ""
sampleGeo1 = Geolocation 43.068661 141.350755 "" -- Sapporo station
sampleGeo2 = Geolocation 35.658581 139.745433 "" -- Tokyo Tower
sampleGeo3 = Geolocation 48.85837 2.294481 "" -- Tour Eiffel
