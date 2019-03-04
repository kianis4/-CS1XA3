import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (value, placeholder)
import Html.Events exposing (onInput)

main =
 Browser.sandbox { init = init, update = update, view = view }

type alias Model =
    { str1 : String,str2 : String }

init : Model

init = { string1 = "", string2 = ""}

view : Model -> Html Msg
view model = div []

    [ input [ placeholder "String 1", value model.str1, onInput (Update 1) ] []
    , input [ placeholder "String 2", value model.str2, onInput (Update 2) ] []
    , div [] [ text (model.str1 ++ " : " ++ model.str2 ) ]
    ]

update : Msg -> Model -> Model
update msg model = case msg of
                    Change1 newContent -> {model | str1 = newContent}
                    Change2 newContent -> {model | str2 = newContent}

type Msg = ChangeFirst String
            | ChangeSecond String

