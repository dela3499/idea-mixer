module View exposing (..)

import Html exposing (Html, text, div, span, a, img, p, i, input)
import Html.App as Html
import Html.Events exposing (onClick, onInput, onBlur, onFocus)
import Html.Attributes exposing (..)
import Maybe exposing (withDefault)
import Set exposing (Set)
import Dict exposing (Dict)
import String

import Types exposing (..)
import Util


app: Model -> Html Msg
app model =
  div
    [ id "app" ]
    [ page model ]


page: Model -> Html Msg
page model = 
  div
    [ id "splash"
    , class "page"
    ]
    [ div 
        [ id "idea" ]
        [ text "idea" ]
    , div 
        [ id "mixer" ]
        [ text "mixer" ]
    , div 
        [ id "tagline" ]
        [ text "Two clicks. A thousand ideas." ]
    , img [ src "assets/img/logo.svg" ] []
    , div
        [ id "start"
        , class "button"
        ]
        [ div
            [ class "inner" ]
            [ div
                [ class "inner-2" ]
                [ text "Start mixing" 
                --, i
                --    [ class "fa fa-random" ]
                --    []
                ]
            ]

        ]
    ]    
