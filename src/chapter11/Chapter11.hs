module Chapter11 where
import Data.List
import Data.Maybe
import Data.Char

data DaPhone = DaPhone [Button]

convo :: [String]
convo = [
        "Wanna play 20 questions",
        "Ya",
        "U 1st haha", 
        "Lol ok. Have u ever tasted alcohol lol",
        "Lol ya",
        "Wow ur cool haha. Ur turn",
        "Ok. Do u think I am pretty Lol",
        "Lol ya",
        "Haha thanks just make sure rofl ur turn"
        ]

-- "1234567890*#"
type Digit = Char
type Presses = Int
type PossibleCharacters = String

data Button = Button Digit PossibleCharacters deriving (Show)

buttonContainsChar :: Char -> Button -> Bool
buttonContainsChar char (Button digit possibleChars) = toLower char `elem` possibleChars

-- 'a' -> [('2', 1)]
-- 'A' -> [('*', 1), ('2', 1)]
reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps = undefined

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead = undefined

findButtonForChar :: DaPhone -> Char -> Button
findButtonForChar (DaPhone buttons) char = head $ filter (buttonContainsChar char) buttons

calculatePresses :: Button -> Char -> (Char, Digit, Presses)
calculatePresses (Button digit possibleChars) char = (char, digit, y) where
  x = fromJust $ elemIndex (toLower char) possibleChars
  y = x + 1

one = Button '1' "1"
two = Button '2' "abc2"
three = Button '3' "def3"
four = Button '4' "ghi4"
five = Button '5' "jkl5"
six = Button '6' "mno6"
seven = Button '7' "pqrs7"
eight = Button '8' "tuv8"
nine = Button '9' "wxyz9"
zero = Button '0' "+ 0"
hash = Button '#' ".,#"
star = Button '*' "^*"

phone = DaPhone [one, two, three, four, five, six, seven, eight, nine, zero, star, hash]

parseMessage :: DaPhone -> String -> [(Char, Digit, Presses)]
parseMessage phone message = 
    map (\x -> calculatePresses (button x) x) message where 
      button = (\x -> findButtonForChar phone x)

convertConvoToPresses :: DaPhone -> [String] -> [[(Char, Digit, Presses)]]
convertConvoToPresses aPhone conversation = map (\x -> parseMessage aPhone x) conversation
