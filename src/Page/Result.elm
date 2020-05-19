module Page.Result exposing (viewResult)

import Html exposing (Html, div, iframe, img, text)
import Html.Attributes exposing (class, height, src, width)


type alias Item =
    { title : String
    , description : String
    }


type alias ModelResult =
    List Item


viewResult : ModelResult -> Html msg
viewResult model =
    div [ class "Results-container" ]
        [ div [ class "Table" ] (List.map viewResultItem model)
        ]


viewResultItem : Item -> Html msg
viewResultItem item =
    div
        [ class "Row" ]
        [ div [ class "RowContainer" ]
            [ div [ class "RowContainer-title" ]
                [ text item.title ]
            , div [ class "RowContainer-content" ]
                [ div [ class "RowContainer-desc" ] [ text item.description ]
                , div [ class "RowContainer-img" ] []
                , iframe [ width 300, height 225, src "https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9284.329088458098!2d13.364870575786897!3d52.51444677606197!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x26bbfb4e84674c63!2sPort%C3%A3o%20de%20Brandemburgo!5e0!3m2!1spt-BR!2sde!4v1589905183485!5m2!1spt-BR!2sde" ] []
                ]
            ]
        ]
