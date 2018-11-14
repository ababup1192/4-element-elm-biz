module Main exposing
    ( Element(..)
    , ElementViewModel
    , element2ElementViewModel
    )

import Browser
import Html exposing (Html, a, div, h1, text)
import Html.Attributes exposing (class, src)



---- MODEL ----


type alias Model =
    { firstElement : Element, secondElement : Element }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { firstElement = Ground, secondElement = Water }, Cmd.none )



---- UPDATE ----


type Element
    = Fire
    | Water
    | Wind
    | Ground


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view { firstElement, secondElement } =
    div [ class "container" ]
        [ div [ class "elements-container" ]
            [ firstElement |> element2ElementViewModel |> elementView
            , secondElement |> element2ElementViewModel |> elementView
            ]
        , h1 [] [ text "活性" ]
        ]


type alias ElementViewModel =
    { fire : String, water : String, wind : String, ground : String }


element2ElementViewModel : Element -> ElementViewModel
element2ElementViewModel element =
    case element of
        Fire ->
            { fire = " selected", water = "", wind = "", ground = "" }

        Water ->
            { fire = "", water = " selected", wind = "", ground = "" }

        Wind ->
            { fire = "", water = "", wind = " selected", ground = "" }

        Ground ->
            { fire = "", water = "", wind = "", ground = " selected" }


elementView : ElementViewModel -> Html Msg
elementView { fire, water, wind, ground } =
    div [ class "elements" ]
        [ a [ class <| "element fire" ++ fire ] [ text "火" ]
        , a [ class <| "element water" ++ water ] [ text "水" ]
        , a [ class <| "element wind" ++ wind ] [ text "風" ]
        , a [ class <| "element ground" ++ ground ] [ text "地" ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
