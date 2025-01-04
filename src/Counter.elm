module Counter exposing (main)

-- Press buttons to increment and decrement a counter.

import Browser
import Html exposing (Html, a, button, div, text)
import Html.Attributes exposing (class, href, style, target)
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
    div [ class "counter grid gap-1 text-center" ]
        [ button [ class "bg-blue-9", onClick (Increment 10) ] [ text "+10" ]
        , div [ class "grid place-items-center gap-1", style "grid-template-columns" "1fr 4ch 1fr" ]
            [ button [ class "bg-blue-9", onClick (Decrement 1) ] [ text "-1" ]
            , button [ class "bg-transparent pointer", onClick Reset ] [ text (String.fromInt model) ]
            , button [ class "bg-blue-9", onClick (Increment 1) ] [ text "+1" ]
            ]
        , button [ class "bg-blue-9", onClick (Decrement 10) ] [ text "-10" ]
        , a [ href "https://github.com/bmehder/elm-counter/blob/main/src/Counter.elm", target "_blank" ] [ text "/src/Counter.elm" ]
        , a [ href "https://svelte.dev/playground/9a487f214b514968a556997f456e8b00?version=5.16.1", target "_blank" ] [ text "$lib/Counter.svelte" ]
        ]
