module PointFree where

negativeSum :: (Num a, Foldable t) => t a -> a
negativeSum = negate . sum
