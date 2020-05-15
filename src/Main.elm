module Main exposing (Model, Msg(..), init, main, subscriptions, update, view, viewLinkBtn)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key url, Cmd.none )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Berlin Places"
    , body =
        [ case model.url.query of
            Nothing ->
                viewHome

            Just query ->
                viewResult query
        ]
    }


viewResult : String -> Html Msg
viewResult query =
    text query


viewHome : Html Msg
viewHome =
    div
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


viewLinkBtn : String -> String -> Html Msg
viewLinkBtn path label =
    a [ href ("?" ++ path), class "btn btn-white" ] [ text label ]
