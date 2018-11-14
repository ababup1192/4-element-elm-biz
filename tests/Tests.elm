module Tests exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Main exposing (..)
import Test exposing (..)


element2ElementViewModelTest : String -> Element -> ElementViewModel -> Test
element2ElementViewModelTest testCase element viewModel =
    test testCase <|
        \_ ->
            let
                actual =
                    element |> element2ElementViewModel

                expected =
                    viewModel
            in
            Expect.equal actual expected


suite : Test
suite =
    describe "The Main module"
        [ describe "element2ElementViewModel"
            -- Nest as many descriptions as you like.
            [ element2ElementViewModelTest
                "火が選ばている！"
                Fire
                { fire = " selected", water = "", wind = "", ground = "" }
            , element2ElementViewModelTest
                "水が選ばている！"
                Water
                { fire = "", water = " selected", wind = "", ground = "" }
            , element2ElementViewModelTest
                "風が選ばている！"
                Wind
                { fire = "", water = "", wind = " selected", ground = "" }
            , element2ElementViewModelTest
                "地が選ばている！"
                Ground
                { fire = "", water = "", wind = "", ground = " selected" }
            ]
        ]
