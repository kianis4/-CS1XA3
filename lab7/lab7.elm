import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Browser
import Http
import String

-- MAIN


main =
  Browser.element
  { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
  }



-- MODEL


type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  , response : String
  }


init : () -> ( Model, Cmd Msg )
init  _ =
  ({ name = "", password = "", passwordAgain = "", response = "" }, Cmd.none)



-- UPDATE


type Msg
  = Name String
  | Password String
  | PasswordAgain String
  | TextServer String String
  | GotText (Result Http.Error String)


testPost : String -> String -> Cmd Msg
testPost tName tPassword =
  Http.post
    { url = "https://mac1xa3.ca/e/kianis4/lab7/"
    , body = Http.stringBody "application/x-www-form-urlencoded" ("name=" ++ tName ++ "&password=" ++ tPassword)
    , expect = Http.expectString GotText
    }

update : Msg -> Model -> (Model,Cmd Msg)
update msg model =
  case msg of
    Name name ->
      ({ model | name = name }, Cmd.none)

    Password password ->
      ({ model | password = password }, Cmd.none)

    PasswordAgain password ->
      ({ model | passwordAgain = password }, Cmd.none)

    TextServer name password ->
      (model, testPost name password)

    GotText text ->
      case text of
        Ok fullText ->
          ({ model | response = fullText }, Cmd.none)

        Err fullText ->
          case fullText of
            Http.BadUrl errr ->
                ({ model | response = ("BadUrl " ++ errr)}, Cmd.none)
            Http.Timeout ->
                ({ model | response = "Timeout" }, Cmd.none)
            Http.NetworkError ->
                ({ model | response = "NetworkError"}, Cmd.none)
            Http.BadStatus errr ->
                ({ model | response = ("BadStatus " ++ String.fromInt (errr))}, Cmd.none)
            Http.BadBody errr ->
                ({ model | response = ("BadBody " ++ errr)}, Cmd.none)


-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ viewInput "text" "Name" model.name Name
    , viewInput "password" "Password" model.password Password
    , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
    , viewValidation model
    , button [ onClick (TextServer model.name model.password) ] [ text "Submit" ]
    , div [ style "colour" "green" ] [ text model.response ]
    ]


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
  
viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []


viewValidation : Model -> Html msg
viewValidation model =
  if model.password == model.passwordAgain then
    div [ style "color" "green" ] [ text "OK" ]
  else
    div [ style "color" "red" ] [ text "Passwords do not match!" ]
