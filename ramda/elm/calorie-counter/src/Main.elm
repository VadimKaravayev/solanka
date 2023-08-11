module Main exposing (main)

import Browser exposing (sandbox)
import Html exposing (Html, button, div, h3, input, span, text)
import Html.Attributes exposing (type_, value)
import Html.Events exposing (onClick, onInput)
import String exposing (fromInt, toInt)


type alias Model =
    { calories : Int
    , input : Int
    , error : Maybe String
    }


initModel : Model
initModel =
    Model 0 0 Nothing


type Msg
    = AddCalorie
    | Input String
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            { model | calories = model.calories + model.input, input = 0 }

        Input val ->
            case toInt val of
                Just input ->
                    { model
                        | input = input
                        , error = Nothing
                    }

                Nothing ->
                    { model
                        | input = 0
                        , error = Just "Provide a valid number"
                    }

        Clear ->
            initModel


view : Model -> Html Msg
view model =
    div []
        [ h3 [] [ text ("Total calories " ++ fromInt model.calories) ]
        , input
            [ type_ "text"
            , onInput Input
            , value
                (if model.input == 0 then
                    ""

                 else
                    fromInt model.input
                )
            ]
            []
        , span [] [ text (Maybe.withDefault "" model.error) ]
        , button [ type_ "button", onClick AddCalorie ] [ text "Add" ]
        , button [ type_ "button", onClick Clear ] [ text "Clear" ]
        ]


main : Program () Model Msg
main =
    sandbox { init = initModel, update = update, view = view }
