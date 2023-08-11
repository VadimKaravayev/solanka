module Main exposing (main)

import Browser
import Debug exposing (log, toString)
import Html exposing (Html, button, div, footer, form, h1, header, i, input, li, text, ul)
import Html.Attributes exposing (class, placeholder, type_, value)
import Html.Events exposing (onClick, onInput, onSubmit)
import List exposing (filter, length, map, sortBy, sum)
import String exposing (fromInt, isEmpty)


type alias Player =
    { id : Int
    , name : String
    , points : Int
    }


type alias Play =
    { id : Int
    , playerId : Int
    , name : String
    , points : Int
    }


type alias Model =
    { players : List Player
    , name : String
    , playerId : Maybe Int
    , plays : List Play
    }


initialModel : Model
initialModel =
    { players = []
    , name = ""
    , playerId = Nothing
    , plays = []
    }


type Msg
    = Edit Player
    | Score Player Int
    | Input String
    | Save
    | Cancel
    | DeletePlay Play


add : Model -> Model
add model =
    let
        player =
            Player (length model.players) model.name 0

        newPlayers =
            player :: model.players
    in
    { model | players = newPlayers, name = "" }


edit : Model -> Int -> Model
edit model id =
    let
        newPlayers =
            map
                (\player ->
                    if player.id == id then
                        { player | name = model.name }

                    else
                        player
                )
                model.players

        newPlays =
            map
                (\play ->
                    if play.playerId == id then
                        { play | name = model.name }

                    else
                        play
                )
                model.plays
    in
    { model
        | players = newPlayers
        , plays = newPlays
        , name = ""
        , playerId = Nothing
    }


save : Model -> Model
save model =
    case model.playerId of
        Just id ->
            edit model id

        Nothing ->
            add model


score : Model -> Player -> Int -> Model
score model scorer points =
    let
        newPlayers =
            map
                (\player ->
                    if player.id == scorer.id then
                        { player | points = player.points + points }

                    else
                        player
                )
                model.players

        play =
            Play (length model.plays) scorer.id scorer.name points
    in
    { model | players = newPlayers, plays = play :: model.plays }


deletePlay : Play -> Model -> Model
deletePlay play model =
    let
        newPlays =
            filter (\p -> p.id /= play.id)
                model.plays

        newPlayers =
            map
                (\player ->
                    if player.id == play.playerId then
                        { player | points = player.points - play.points }

                    else
                        player
                )
                model.players
    in
    { model | players = newPlayers, plays = newPlays }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input name ->
            log "On input"
                { model | name = name }

        Cancel ->
            log "Model"
                { model | name = "", playerId = Nothing }

        Save ->
            if isEmpty model.name then
                model

            else
                save model

        Score player points ->
            score model player points

        Edit player ->
            { model | name = player.name, playerId = Just player.id }

        DeletePlay play ->
            deletePlay play model


playerListHeader : Html Msg
playerListHeader =
    header []
        [ div [] [ text "Name" ]
        , div [] [ text "Point" ]
        ]


playerList : Model -> Html Msg
playerList model =
    --ul [] (map renderPlayer model.players)
    model.players
        |> sortBy .name
        |> map renderPlayer
        |> ul []


renderPlayer : Player -> Html Msg
renderPlayer player =
    li []
        [ i
            [ class "edit"
            , onClick (Edit player)
            ]
            []
        , div [] [ text player.name ]
        , button [ type_ "button", onClick (Score player 2) ] [ text "2pt" ]
        , button [ type_ "button", onClick (Score player 3) ] [ text "3pt" ]
        , div [] [ text <| toString player.points ]
        ]


pointTotal : Model -> Html Msg
pointTotal model =
    let
        total =
            map .points model.plays
                |> sum
    in
    footer []
        [ div [] [ text "Total: " ]
        , div [] [ text (fromInt total) ]
        ]


playerSection : Model -> Html Msg
playerSection model =
    div []
        [ playerListHeader
        , playerList model
        , pointTotal model
        ]


playerForm : Model -> Html Msg
playerForm model =
    form [ onSubmit Save ]
        [ input
            [ type_ "text"
            , placeholder "Add/Edit player"
            , onInput Input
            , value model.name
            ]
            []
        , button [ type_ "submit" ] [ text "Save" ]
        , button [ type_ "button", onClick Cancel ] [ text "Cancel" ]
        ]


playListHeader : Html Msg
playListHeader =
    header []
        [ div [] [ text "Plays" ]
        , div [] [ text "Points" ]
        ]


renderPlay : Play -> Html Msg
renderPlay play =
    li []
        [ i [ class "remove", onClick (DeletePlay play) ] []
        , div [] [ text play.name ]
        , div [] [ text (fromInt play.points) ]
        ]


playList : Model -> Html Msg
playList model =
    model.plays
        |> map renderPlay
        |> ul []


playSection : Model -> Html Msg
playSection model =
    div []
        [ playListHeader
        , playList model
        ]


view : Model -> Html Msg
view model =
    div [ class "scoreboard" ]
        [ h1 [] [ text "Score Keeper" ]
        , playerSection model
        , playerForm model
        , playSection model
        ]


main : Program () Model Msg
main =
    Browser.sandbox { init = initialModel, view = view, update = update }
