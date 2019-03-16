import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (value, placeholder)
import Html.Events exposing (onInput)

main =
 Browser.sandbox { init = init, update = update, view = view }

type alias Model =
    { str1 : String,str2 : String }

init : Model

init = { str1 = "", str2 = ""}

view : Model -> Html Msg
view model = div [] [
      input [ placeholder "String 1", value model.str1, onInput ChangeFirst  ] []
    , input [ placeholder "String 2", value model.str2, onInput ChangeSecond ] []
    , div [] [text (model.str1 ++ " : " ++ model.str2)] ]

update : Msg -> Model -> Model
update msg model = case msg of
                    ChangeFirst newContent -> {model | str1 = newContent}
                    ChangeSecond newContent -> {model | str2 = newContent}

type Msg = ChangeFirst String
            | ChangeSecond String

