module Stories.Controls exposing (..)

import Html exposing (Html, div, ul, text)
import Html.Attributes exposing (class)
import StoryBook.View exposing (renderStory)
import View exposing (controlsView)
import Model exposing (Model)
import Storybook.Msg exposing (..)


album =
    { cover = "test"
    , title = "test"
    , playlist = []
    }


defaultState =
    { album = album
    , isPlaying = True
    , selectedTrack = Nothing
    }


stories : List ( String, Model )
stories =
    [ ( "Playing", defaultState )
    , ( "Stopped", { defaultState | isPlaying = False } )
    ]


wrapper children =
    div [] [ children ]


story selectedStateId =
    renderStory selectedStateId controlsView stories (\_ -> Noop) wrapper
