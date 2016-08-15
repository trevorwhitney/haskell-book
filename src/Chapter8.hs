module Chapter8 where

import Data.Maybe (maybe)
import Data.List (intersperse)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

f :: Bool -> Maybe Int
f False = Just 0
f _ = Nothing

g = maybe 42 (+ 2) (f False)

digitToWord :: Int -> String
digitToWord n = undefined

digits :: Int -> [Int]
digits n = undefined

wordNumber :: Int -> String
wordNumber n = undefined
