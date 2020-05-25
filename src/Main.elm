module Main exposing (Model, Msg(..), init, main, subscriptions, update, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Page.Home as Home
import Page.Result as Result
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


type alias RedirectModel =
    { key : Nav.Key
    , url : Url.Url
    }


type Model
    = Redirect RedirectModel
    | Result Result.Model


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Redirect { key = key, url = url }, Cmd.none )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | GotMsgResult Result.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( LinkClicked urlRequest, Redirect redirect ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl redirect.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        ( UrlChanged url, Redirect redirect ) ->
            ( Redirect { key = redirect.key, url = url }
            , Cmd.none
            )

        ( GotMsgResult msgResult, _ ) ->
            ( model, Cmd.none )

        ( _, _ ) ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Berlin Places"
    , body =
        [ Html.map GotMsgResult
            (Result.view
                [ { id = 1
                  , title = "Brandenburg Gate"
                  , description = "The Brandenburg Gate in Berlin is an early neoclassical triumphal arch , which on the west edge of the square Pariser Platz in Berlin district of Mitte is. It was built as the end of the central boulevard of the Dorotheenstadt , the boulevard Unter den Linden , in the years from 1789 [1] to 1793 [2] according to the instructions of the Prussian king Friedrich Wilhelm II after designs by Carl Gotthard Langhans . The sculpture of the Quadriga crowning the gateis a work designed by the sculptor Johann Gottfried Schadow . To the west of the Brandenburg Gate are the extensive green areas of the Großer Tiergarten , which are crossed by the Straße des 17. Juni in a straight extension of the street Unter den Linden . The square immediately to the west of the gate is called Platz des 18. März ."
                  , collapsed = False
                  }
                , { id = 2
                  , title = "teste2"
                  , description = "dsadasdasd sdasd"
                  , collapsed = False
                  }
                ]
            )

        -- [ case model of
        --     Redirect redirect ->
        --         case redirect.url.query of
        --             Nothing ->
        --                 div [] []
        --             -- Home.view
        --             Just _ ->
        --                 div [] []
        -- Result.view
        --     [ { id = 1
        --       , title = "Brandenburg Gate"
        --       , description = "The Brandenburg Gate in Berlin is an early neoclassical triumphal arch , which on the west edge of the square Pariser Platz in Berlin district of Mitte is. It was built as the end of the central boulevard of the Dorotheenstadt , the boulevard Unter den Linden , in the years from 1789 [1] to 1793 [2] according to the instructions of the Prussian king Friedrich Wilhelm II after designs by Carl Gotthard Langhans . The sculpture of the Quadriga crowning the gateis a work designed by the sculptor Johann Gottfried Schadow . To the west of the Brandenburg Gate are the extensive green areas of the Großer Tiergarten , which are crossed by the Straße des 17. Juni in a straight extension of the street Unter den Linden . The square immediately to the west of the gate is called Platz des 18. März ."
        --       , collapsed = False
        --       }
        --     , { id = 2
        --       , title = "teste2"
        --       , description = "dsadasdasd sdasd"
        --       , collapsed = False
        --       }
        --     ]
        -- Result result ->
        -- List.map (Html.map GotMsgResult)
        -- Result.view result
        ]
    }
