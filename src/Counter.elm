module Counter exposing (main)

-- Press buttons to increment and decrement a counter.

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = Increment Int
    | Decrement Int
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment x ->
            model + x

        Decrement x ->
            model - x

        Reset ->
            0



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "counter grid gap-1" ]
        [ button [ class "bg-blue-9", onClick (Increment 10) ] [ text "+10" ]
        , div [ class "grid place-items-center gap-1", style "grid-template-columns" "auto 4ch auto" ]
            [ button [ class "bg-blue-9", onClick (Decrement 1) ] [ text "-1" ]
            , button [ class "bg-transparent pointer", onClick Reset ] [ text (String.fromInt model) ]
            , button [ class "bg-blue-9", onClick (Increment 1) ] [ text "+1" ]
            ]
        , button [ class "bg-blue-9", onClick (Decrement 10) ] [ text "-10" ]
        ]
