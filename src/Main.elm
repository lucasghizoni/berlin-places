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


type alias Route =
    { key : Nav.Key
    , url : Url.Url
    }


type alias HomeModel =
    { teste : String }


type Page
    = Home HomeModel
    | ResultPage Result.Model


type alias Model =
    { route : Route
    , page : Page
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { route = { key = key, url = url }
      , page = Home { teste = "TESTE" }
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | GotMsgResult Result.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model.page ) of
        ( LinkClicked urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( { model
                        | page =
                            ResultPage
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
                      }
                    , Nav.pushUrl model.route.key (Url.toString url)
                    )

                Browser.External href ->
                    ( model, Nav.load href )

        ( UrlChanged url, _ ) ->
            ( { model | route = { key = model.route.key, url = url } }
            , Cmd.none
            )

        ( GotMsgResult msgResult, ResultPage result ) ->
            ( { model | page = ResultPage (Result.update msgResult result) }, Cmd.none )

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
        [ case ( model.route.url.query, model.page ) of
            ( Nothing, _ ) ->
                Home.view

            ( Just query, ResultPage result ) ->
                Html.map GotMsgResult
                    (Result.view result)

            ( _, _ ) ->
                Home.view
        ]
    }
