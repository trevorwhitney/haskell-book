module GrabBag where

-- Rewrite the f n function to be anonymous
-- addOneIfOdd n = case odd n of
--                   True -> f n
--                   False -> n
--                   where f n = n + 1
addOneIfOdd n = case odd n of
                  True -> f n
                  False -> n
                  where f = \n -> n + 1

-- Rewrite to use anonymous
-- addFive x y = (if x > 7 then y else x) + 5
addFive = \x y -> (if x > 7 then y else x) + 5

-- Undo the anonymous
-- mflip f = \x -> \y -> f y x
mflip f x y = f y x
