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
    [ select model ]


splash: Html Msg
splash = 
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
                --, randomIcon
                ]
            ]

        ]
    ]    


browse: Model -> Html Msg
browse model = 
  div
    [ id "browse"
    , class "page"
    ]
    [ div
        [ class "nav" ]
        [ i
            [ class "fa fa-angle-left" ]
            []
        , div
            [ class "title" ]
            [ text "Browse ideas" ]
        ]
    , div
        [ class "buttons" ]
        [ div
            [ id "list1" 
            , class "button"
            ]
            [ text "golf"
            , randomIcon
            ]
        , div
            [ id "list2" 
            , class "button"
            ]
            [ text "Tim Ferriss"
            , randomIcon
            ]
        ]
    , div
        [ id "combinations" ]
        (List.map combination combinations)
    ]


select: Model -> Html Msg
select model = 
  div
    [ id "select"
    , class "page"
    ]
    [ div
        [ class "nav" ]
        [ i
            [ class "fa fa-angle-left" ]
            []
        , div
            [ class "title" ]
            [ text "Select list" ]
        , div
            [ id "edit" 
            , class "button"
            ]
            [ text "Edit" ]        
        ]
    , div 
        [ id "groups" ]   
        (List.map group groups)
    ]


group { name, lists } =
  div
    [ class "group" ]
    [ div
        [ class "groupName" ]
        [ text name ]
    , div
        [ class "lists" ]
        (List.map list lists)
    ]


list { name, items } = 
  div
    [ class "list" ]
    [ div
        [ class "listName" ]
        [ text name ]
    , div
        [ class "items" ]
        [ text (String.join ", " items) ]
    ]


combination: (String, String) -> Html Msg
combination (item1, item2) = 
  div
    [ class "combination" ]
    [ div
        [ class "item1" ]
        [ text item1 ]
    , div
        [ class "item2" ]
        [ text item2 ]
    ]


randomIcon = 
  i
    [ class "fa fa-random" ]
    []    


combinations = 
  [ ("5-iron", "80/20 rule")
  , ("pull cart", "minimum effective dose")
  , ("golf ball", "DiSSS")
  , ("long drive", "CaFE")
  , ("tournament", "thought experiments")
  , ("5-iron", "80/20 rule")
  , ("pull cart", "minimum effective dose")
  , ("golf ball", "DiSSS")
  , ("long drive", "CaFE")
  , ("tournament", "thought experiments")
  ]    

groups = 
  [ { name = "My lists"
    , lists = 
        [ { name = "Tim Ferriss", items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment", "thought experiment", "thought experiment", "thought experiment", "thought experiment", "thought experiment"] }
        , { name = "Tim Ferriss", items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] }
        , { name = "Tim Ferriss", items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] }
        ]
    }
  , { name = "Business"
    , lists = 
        [ { name = "Tim Ferriss", items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] }
        , { name = "Tim Ferriss", items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] }
        , { name = "Tim Ferriss", items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] }
        ]
    }
  , { name = "Engineering"
    , lists = 
        [ { name = "Tim Ferriss", items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] }
        , { name = "Tim Ferriss", items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] }
        , { name = "Tim Ferriss", items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] }
        ]
    }  
  ]