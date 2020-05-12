module Main exposing (..)

import Browser
import Html exposing (Html, li, text, div, h1, span)
import Html.Attributes exposing (style)

-- 


main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Item = { title : String }

type alias Model = List Item


init : Model
init =
  [ { title = "Teste" }
  , { title = "Teste2" } 
  ]


-- UPDATE


type Msg
  = Increment
  | Decrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model

    Decrement ->
      model


-- VIEW

view : Model -> Html msg
view model =
  div [
    style "background-image" 
      "linear-gradient(to right bottom, rgba(126, 213, 111, 0.7), rgba(40, 180, 131, 0.7)), url(/assets/wallandsoldiers.jpg)"
    , style "background-size" "cover"
    , style "background-position" "top"
    , style "height" "100vh"
    , style "position" "relative"
    ]
    [
      div [
        style "position" "absolute"
        , style "top" "30%"
        , style "left" "50%"
        , style "transform" "translate(-50%, -50%)"  
      ]
        [
          h1 [
            style "color" "#fff"
            , style "text-transform" "uppercase"
            , style "width" "max-content"
          ]
          [
            span [
              style "display" "block"
              , style "font-size" "60px"
              , style "font-weight" "400"
              , style "letter-spacing" "35px"
            ]
            [text "Berlin places"]
            , span [
              style "display" "block"
              , style "font-size" "20px"
              , style "font-weight" "700"
              , style "letter-spacing" "14px"
            ]
            [text "Discover the best spots in the city"]
          ]
        ]
    ]

viewItem : Item -> Html msg
viewItem item = li [] [text item.title]