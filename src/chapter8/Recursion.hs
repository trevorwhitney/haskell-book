module Recursion where
import Debug.Trace

-- Write a function that recursively sums all numbers from 1 to n,
-- nbeingtheargument. Sothatifnwas5,you’dadd1+2+3+4
-- +5toget15. Thetypeshouldbe(Eq a, Num a) => a -> a.
--
-- Playing around with trace

sumToN :: (Eq a, Num a, Show a) => a -> a
sumToN 0 = 
    trace "n is 0, base case hit"
    0
sumToN n = 
    trace ("n is " ++ show n)
    abs n + sumToN (abs n - 1)

sumToN' :: (Ord a, Num a, Show a) => a -> a
sumToN' n
  | n > 0 = 
    trace ("n is " ++ show n ++ ", recursing") $ n + sumToN' (n-1)
  | otherwise = 
    trace "n is 0, base case hit" 0

-- Write a function that multiplies two integral numbers using recursive
-- summation. The type should be (Integral a) => a -> a -> a.

multThroughSum :: (Integral a) => a -> a -> a
multThroughSum a 0 = 0
multThroughSum a b = a + multThroughSum a (b-1)

-- Fix the divided by function
originalDividedBy :: Integral a => a -> a -> (a, a)
originalDividedBy num denom = go num denom 0 where 
  go n d count
    | n < d = (count, n)
    | otherwise = go (n - d) d (count + 1)

-- New Functions
--

data Polarity a = Polar a a
              | BiPolar a a

comparePolarity :: Integral a => a -> a -> Polarity a
comparePolarity a b
  | (a >= 0 && b >=0) || (a < 0 && b < 0) = Polar a b
  | otherwise = BiPolar a b

data DividedResult a =
    Result (a, a)
    | DividedByZero

instance (Show a) => Show (DividedResult a) where
    show (Result (x, y)) = show (x, y)
    show DividedByZero = "DividedByZero"

dividedBy :: Integral a => a -> a -> DividedResult a
dividedBy num denom = go num denom 0 where 
  go n d count
    | d == 0 && count == 0 = DividedByZero
    | abs n < abs d = Result (count, n)
    | otherwise = case comparePolarity n d of
        Polar n d -> go (n - d) d (count + 1)
        BiPolar n d -> go (n + d) d (count - 1)
