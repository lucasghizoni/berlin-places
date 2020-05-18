module Page.Result exposing (viewResult)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


type alias Item =
    { title : String
    , description : String
    }


type alias ModelResult =
    List Item


viewResult : ModelResult -> Html msg
viewResult model =
    div [ class "Results-container" ]
        [ div [ class "Items-container" ] (List.map viewResultItem model)
        ]


viewResultItem : Item -> Html msg
viewResultItem item =
    div
        [ class "Item" ]
        [ div [ class "ItemContent-container" ]
            [ div [ class "ItemContent-title" ]
                [ text item.title ]
            , div [ class "ItemContent-desc" ]
                [ text item.description ]
            ]
        , div [ class "Item-ImgContainer" ] []
        ]
