module Lib (someFunc) where

someFunc :: IO ()
someFunc = putStrLn "This is SOME function"

-- This seems to still get exported
someOtherFunc :: IO ()
someOtherFunc = putStrLn "This is an OTHER function"
