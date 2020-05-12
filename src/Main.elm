module Main exposing (..)

import Browser
import Html exposing (Html, a, div, h1, li, span, text)
import Html.Attributes exposing (class, href, style)



--


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Item =
    { title : String }


type alias Model =
    List Item


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
    div
        [ class "main-container" ]
        [ div [ class "textbox" ]
            [ h1
                [ class "textbox-container" ]
                [ span
                    [ class "textbox-title" ]
                    [ text "Berlin places" ]
                , span
                    [ class "textbox-subtitle" ]
                    [ text "Discover the best spots in the city" ]
                ]
            , a [ href "#", class "btn btn-white" ] [ text "Great War" ]
            , a [ href "#", class "btn btn-white" ] [ text "Cold War" ]
            ]
        ]


viewItem : Item -> Html msg
viewItem item =
    li [] [ text item.title ]
