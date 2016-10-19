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
  let _ = Debug.log "model" model 
  in
  div
    [ id "app" ]
    [ case model.page of 
        Splash -> 
          splash
        Browse -> 
          browse model 
        Select1 -> 
          select model "Select list #1"
        Select2 -> 
          select model "Select list #2"
    ]


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
    --, img [ src "assets/img/logo.svg" ] []
    , div
        [ id "start"
        , class "button"
        , onClick (SetPage Browse)
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


nav left center right = 
  div
    [ class "nav" ]
    [ div [ class "left" ] [ left ]
    , div [ class "center" ] [ center ]
    , div [ class "right" ] [ right ]
    ]


browse: Model -> Html Msg
browse model = 
  div
    [ id "browse"
    , class "page"
    ]
    [ nav
        ( i
            [ class "fa fa-angle-left button" 
            , onClick (SetPage Splash)
            ]
            []
        )
        ( div
            [ class "title" ]
            [ text "Browse ideas" ]
        )
        ( div [] []
        ) 
    , div
        [ class "buttons" ]
        [ div
            [ id "list1" 
            , class "button"
            , onClick (SetPage Select1)
            ]
            [ text model.list1.name
            , randomIcon
            ]
        , div
            [ id "list2" 
            , class "button"
            , onClick (SetPage Select2)
            ]
            [ text model.list2.name
            , randomIcon
            ]
        ]
    , div
        [ id "combinations" ]
        (List.map 
          combination 
          (Util.pairs model.list1.items model.list2.items |> Util.shuffle)
        )
    ]


select: Model -> String -> Html Msg
select model title = 
    div
      [ id "select"
      , class "page"
      ]
      [ nav
          ( i
              [ class "fa fa-angle-left button" 
              , onClick (SetPage Browse)
              ]
              []
          )
          ( div
              [ class "title" ]
              [ text title ]
          )
          ( div
              [ id "edit" 
              , class "button"
              ]
              [ text "Edit" ]
          )
      --, div 
      --    [ id "groups" ]   
      --    (List.map group groups)
      , div
        [ id "lists" ]
        (List.map list (Dict.values model.lists))
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


list { name, id, items } = 
  div
    [ class "list" 
    , onClick (SetList id)
    ]
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



lists = 
  [ { name = "Tim Ferriss"
    , id = "1"
    , items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment", "thought experiment", "thought experiment", "thought experiment", "thought experiment", "thought experiment"] 
    }
  , { name = "Golf"
    , id = "2"
    , items = ["golf course", "golf club", "par"] 
    }
  , { name = "Business"
    , id = "3"
    , items = ["investment", "returns", "debt"] 
    }
  ]


groups = 
  [ { name = "My lists"
    , lists = 
        [ { name = "Tim Ferriss"
          , id = "1"
          , items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment", "thought experiment", "thought experiment", "thought experiment", "thought experiment", "thought experiment"] 
          }
        , { name = "Tim Ferriss"
          , id = "2"
          , items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] 
          }
        , { name = "Tim Ferriss"
          , id = "3"
          , items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] 
          }
        ]
    }
  , { name = "Business"
    , lists = 
        [ { name = "Tim Ferriss"
          , id = "1"
          , items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment", "thought experiment", "thought experiment", "thought experiment", "thought experiment", "thought experiment"] 
          }
        , { name = "Tim Ferriss"
          , id = "2"
          , items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] 
          }
        , { name = "Tim Ferriss"
          , id = "3"
          , items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] 
          }
        ]
    }
  , { name = "Engineering"
    , lists = 
        [ { name = "Tim Ferriss"
          , id = "1"
          , items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment", "thought experiment", "thought experiment", "thought experiment", "thought experiment", "thought experiment"] 
          }
        , { name = "Tim Ferriss"
          , id = "2"
          , items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] 
          }
        , { name = "Tim Ferriss"
          , id = "3"
          , items = ["80/20 rule", "DiSSS", "CaFE", "thought experiment"] 
          }
        ]
    }
  ]