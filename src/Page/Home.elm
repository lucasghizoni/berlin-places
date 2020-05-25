module Page.Home exposing (view)

import Html exposing (Html, a, div, h1, span, text)
import Html.Attributes exposing (class, href)


view : Html msg
view =
    div []
        [ div
            [ class "main-container" ]
            [ div
                [ class "textbox" ]
                [ h1
                    [ class "textbox-container" ]
                    [ span
                        [ class "textbox-title" ]
                        [ text "Berlin places" ]
                    , span
                        [ class "textbox-subtitle" ]
                        [ text "Discover the best spots in the city" ]
                    ]
                , div
                    [ class "btn-container" ]
                    [ viewLinkBtn "greatwar" "Great war"
                    , viewLinkBtn "coldwar" "Cold war"
                    ]
                ]
            ]
        ]


viewLinkBtn : String -> String -> Html msg
viewLinkBtn path label =
    a [ href ("?" ++ path), class "btn btn-white" ] [ text label ]
