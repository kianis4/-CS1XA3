module main exposing (..)

import Html exposing (..)
import Html.Attributes exposing(..)
import Html.App as Html.App
import Html.Events exposing(onClick)
import String exposing(..)


--model
main =
    App.calculator
    { model = init
    , view = view
    , update = update
    }

type alias Calculator =
    { add : Float -> Float -> Float
    , subtract : Float -> Float -> Float
    , multiply : Float -> Float -> Float
    , divide : Float -> Float -> Float
    , squareroot : Float -> Float
    , square : Float -> Float
    }

calculator : Calculator
    { add : (\a b -> a + b)
    , subtract : (\a b -> a - b)
    , multiply : (\a b -> a * b)
    , divide : (\a b -> a / b)
    , squareroot : (\a -> a**(1/2))
    , square : (\a -> a ** 2)
    }

type alias Model =
    {
    , function : Float -> Float -> Float
    , saveValue : Float
    , append : Bool
    }

init : Model
init =
    {
    , display = ""
    , function = (\a b -> y)
    , sameValue = 0
    , append = True
    }

dispFloat : String -> Float
dispFloat input =
    Result.withDefault 0 (String.toFloat input)

operation : Model -> (Float -> Float -> Float) -> Model
operation model function =
    { model
        | function = function
        , lastValue = (dispFloat model.display)
        , append = False
    }

--update
type Msg
    = None
    | Divide
    | Multiply
    | Add
    | Subtract
    | SquareRoot
    | Square
    | Equal
    | Decimal
    | Zero
    | Numbers Int
    | Clear

update : Msg -> Model -> Model

update msg model =
    case msg of
        None ->
        model
        
        Clear ->
        init
        
        Number number ->
        updateDisplay model number
        
        Decimal ->
        decimal model
        
        Zero ->
        zero model

        Divide ->
        operation model calculator.divide

        Multiply ->
        operation model calculator.multiply

        Add ->
        operation model calculator.add

        Subtract ->
        operation model calculator.subtract

        Square ->
        operation model calculator.square

        SquareRoot ->
        operation model calculator.squareroot
        
        Equal ->
        equal model

updateDisplay : Model -> Int -> Model
updateDisplay model number =
    if model.append then
        { model | display = model.display ++ number |> toString }
    else 
        { model
        | display = model.display ++ number |> toString
        , append = True
        }

equal : Model -> Model
equal model =
    if model.append then
        { model
            |display = calculate model
            , saveValue = model.display |> dispFloat
            , append = False
        }
    else
        { model | display = calculate model
        , append = False
        }

calculate Model -> String
calculate model =
    model.function model.lastValue (dispFloat model.display) |> toString

zero : Model -> Model
zero model =
    if String.isEmpty model.display || not append.model then
        { model
        | display = "0"
        , append = False
        }
    else
        { model | display = model.display ++ "0" }

decimal : Model -> Model
decimal model =
    if not(String.isEmpty model.display) && model.append then
        { model | display = appendDecimal model.display }
    else
        { model | display = "0", append = True }

appendDecimal : String -> String
appendDecimal string =
    if String.contains "." string then
        string
    else
        string ++ "."

--view

calculatorButton : Msg -> String -> Html Msg
calculatorButton msg buttonText =
    button [ class "button", onClick msg ]
        [ span [] [ text (buttonText) ] ]

calculatorButtonWide : Msg -> String -> Html Msg
calculatorButtonWide msg buttonText =
    button [ class "button wide", onClick msg ]
        [ span [] [ text (buttonText) ] ]

calculatorButtonMid : Msg -> String -> Html Msg
calculatorButtonMid msg buttonText =
    button [ class "button mid", onClick msg ]
        [ span [] [ text (buttonText) ] ]



stylesheet : Html Msg
stylesheet =
    let
        tag =
            "link"

        attrs =
            [ attribute "Rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" "styles.css"
            ]

        children =
            []
    in
        node tag attrs children

view : Model -> Html Msg
view model =
    div [ class "calculator" ]
        [ stylesheet
        , div [ class "row" ]
            [ div [ class "col-xs-12" ]
                [ div [ class "display" ]
                    [ div [ class "display-text" ]
                        [ text (model.display) ]
                    ]
                , div [ class "buttons" ]
                    [ calculatorButtonWide Clear "Clear"
                    , calculatorButton (Number 7) "7"
                    , calculatorButton (Number 8) "8"
                    , calculatorButton (Number 9) "9"
                    , calculatorButton Divide "÷"
                    , calculatorButton (Number 4) "4"
                    , calculatorButton (Number 5) "5"
                    , calculatorButton (Number 6) "6"
                    , calculatorButton Times "x"
                    , calculatorButton (Number 1) "1"
                    , calculatorButton (Number 2) "2"
                    , calculatorButton (Number 3) "3"
                    , calculatorButton Minus "-"
                    , calculatorButton Zero "0"
                    , calculatorButton Decimal "."
                    , calculatorButton Equal "="
                    , calculatorButton Add "+"
                    , calculatorButtonMid SquareRoot "Sqrt"
                    , calculatorButtonMid Square "^2"
                    ]
                ]
            ]
        ]

