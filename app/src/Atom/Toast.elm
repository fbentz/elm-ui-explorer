module Atom.Toast exposing (..)

import Html exposing (Html, text, div, span)
import Storybook.Message exposing (Msg)
import Elegant exposing (..)
import Elegant.Elements exposing (..)
import Color exposing (..)


type Severity
    = Success
    | Warning
    | Error


type alias ToastModel =
    { label : String, isShown : Bool, severity : Severity }


type alias ToastViewModel =
    { label : String
    , isShown : Bool
    , toastStyle : Html.Attribute Msg
    }


selectorToast : ToastModel -> ToastViewModel
selectorToast model =
    let
        toastColor =
            case model.severity of
                Success ->
                    green

                Error ->
                    red

                _ ->
                    yellow

        toastStyle =
            style
                [ backgroundColor toastColor
                , border black
                , textColor white
                , padding medium
                , margin medium
                ]
    in
        { label = model.label
        , isShown = model.isShown
        , toastStyle = toastStyle
        }


viewToast : ToastViewModel -> Html Msg
viewToast model =
    case model.isShown of
        True ->
            div [ model.toastStyle ] [ span [] [ text model.label ] ]

        False ->
            div [ model.toastStyle ] []


toast : ToastModel -> Html Msg
toast =
    viewToast << selectorToast


story selectedStateId =
    toast { label = "Toast", isShown = True, severity = Success }