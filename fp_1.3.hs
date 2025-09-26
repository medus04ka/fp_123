module K where

import Data.List (maximumBy)
import Data.Function (on)

naturalNumbers :: [Integer]
naturalNumbers = [1..]

--based
-- dlina :: Integer -> Integer
-- dlina n
--   | n `mod` 2 == 0 = dlina (n `div` 2)
--   | n `mod` 5 == 0 = dlina (n `div` 5)
--   | otherwise      = head [x | x <- naturalNumbers, (10^x - 1) `mod` n == 0]

-- -- rec
-- dlina :: Integer -> Integer
-- dlina n
--   | n `mod` 2 == 0 = dlina (n `div` 2)
--   | n `mod` 5 == 0 = dlina (n `div` 5)
--   | otherwise      = search 1
--   where
--     search k
--       | (10^k - 1) `mod` n == 0 = k
--       | otherwise               = search (k+1)


--hvost
dlina :: Integer -> Integer
dlina n
  | n `mod` 2 == 0 = dlina (n `div` 2)
  | n `mod` 5 == 0 = dlina (n `div` 5)
  | otherwise      = go 1
  where
    go k
      | (10^k - 1) `mod` n == 0 = k
      | otherwise               = go (k+1)


--map/filter/fold
-- dlina :: Integer -> Integer
-- dlina n
--   | n `mod` 2 == 0 = dlina (n `div` 2)
--   | n `mod` 5 == 0 = dlina (n `div` 5)
--   | otherwise      = head $ filter (\x -> (10^x - 1) `mod` n == 0) [1..]

-- main :: IO ()
-- main =
--   let lengths = map (\d -> (d, dlina d)) [1..999]
--       (d, _)  = foldl1 (\acc@(_, l1) x@(_, l2) -> if l2 > l1 then x else acc) lengths
--   in print d


--map
-- main :: IO ()
-- main =
--   let lengths = map (\d -> (d, dlina d)) [1..999]
--   in print $ fst $ maximumBy (compare `on` snd) lengths


--list comprehension
-- main :: IO ()
-- main =
--   let pairs = [(d, dlina d) | d <- [1..999]]
--   in print $ fst $ maximumBy (compare `on` snd) pairs

-- beskone4no
-- main :: IO ()
-- main =
--   let fractions = [(d, dlina d) | d <- [1..]]
--   in print $ fst $ maximumBy (compare `on` snd) (take 999 fractions)


answer :: Integer
answer = fst $ maximumBy (compare `on` snd) [(d, dlina d) | d <- [1..999]]

main :: IO ()
main = print answer