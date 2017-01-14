module ChapterExcercises where

tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

tensDigit' :: Integral a => a -> a
tensDigit' x = snd d
  where d = f $ fst $ f x        
        f = flip divMod 10

nthDigit :: (Integral a) => a -> a -> a
nthDigit n x = snd d
  where divModByN = flip divMod n 
        q = fst $ divModByN x
        d = divMod q 10

hunsD = nthDigit 100

tensDigit'' = nthDigit 10

-----------------------

foldBool :: a -> a -> Bool -> a
foldBool a b c
  | c  = a
  | otherwise = b

foldBool' :: a -> a -> Bool -> a
foldBool' a b c =
    case c of
      True -> a
      False -> b


----------------

g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c)

-----

roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

-- Note: type signature needed for point free version
roundTrip' :: (Show a, Read a) => a -> a
roundTrip' = read . show

-- Don't understand what the last question is asking
-- roundTrip'' :: (Show a, Read b) => a -> b
