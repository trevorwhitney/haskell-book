module Chapter9 where

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead [x] = Just x
safeHead (x:_) = Just x

fibs :: Int -> Int
fibs i = last $ take i ifibs 
  where ifibs = 0 : 1 : [ a + b | (a, b) <- zip ifibs (tail ifibs) ]

