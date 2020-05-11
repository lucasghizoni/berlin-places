module Main exposing (..)

import Browser
import Html exposing (Html, ul, li, text)



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

view : Model -> Html Msg
view model =
  ul [] 
    (List.map viewItem model)

viewItem : Item -> Html msg
viewItem item = li [] [text item.title]