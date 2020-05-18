module Page.Result exposing (viewResult)

import Html exposing (Html, div, img, text)
import Html.Attributes exposing (class, src)


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
                ]
            ]
        ]
