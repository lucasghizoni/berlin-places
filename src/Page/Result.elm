module Page.Result exposing (Model, Msg, update, view)

import Html exposing (Html, button, div, iframe, text)
import Html.Attributes exposing (class, height, src, width)
import Html.Events exposing (onClick)


type alias Item =
    { id : Int
    , title : String
    , description : String
    , collapsed : Bool
    }


type alias Model =
    List Item


updateItem : List Item -> Int -> Model
updateItem list id =
    let
        collapse item =
            if id == item.id then
                { item | collapsed = not item.collapsed }

            else
                item
    in
    List.map collapse list


update : Msg -> Model -> Model
update msg model =
    case msg of
        Collapse item ->
            updateItem model item.id


type Msg
    = Collapse Item


view : Model -> Html Msg
view model =
    div [ class "result-container" ]
        [ div [ class "list" ] (List.map viewResultItem model)
        ]


viewResultItem : Item -> Html Msg
viewResultItem item =
    div
        [ class "listItem" ]
        [ div [ class "listItem-title" ]
            [ text item.title ]
        , div [ class "fl-row listItem-content" ]
            [ div [ class "fl-col2-of-3" ] [ text item.description ]
            , div [ class "fl-col1-of-3 container-img" ] []

            -- , iframe [ width 300, height 225, src "https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9284.329088458098!2d13.364870575786897!3d52.51444677606197!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x26bbfb4e84674c63!2sPort%C3%A3o%20de%20Brandemburgo!5e0!3m2!1spt-BR!2sde!4v1589905183485!5m2!1spt-BR!2sde" ] []
            ]
        ]
