module CasePractice where

-- 1. return x when x is greater than y
-- functionC x y = if (x > y) then x else y
functionC x y = 
    case x > y of
      True -> x
      False -> y

-- 2. add 2 to even numbers otherwise return input
-- ifEvenAdd2 n = if even n then (n + 2) else n
ifEvenAdd2 n = case even n of
                 True -> n + 2
                 False -> n

-- Figure out missing cases, indicate if x is positive or negative
nums x =
    case compare x 0 of
      LT -> -1
      GT -> 1

