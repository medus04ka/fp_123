module R where

-- checkI :: Int -> Int -> Bool
-- checkI n i = all (\j -> i `mod` j == 0) [1..n]

-- -- лень
-- pik :: Int -> Int
-- pik n = head [i | i <- [n, 2*n..], checkI n i]


-- -- рекурсия
-- pik :: Int -> Int
-- pik n = go n
--   where
--     go x
--       | checkI n x = x
--       | otherwise    = go (x + n)


-- -- попытка в хвост (вроде норм_(оно ХУЙНЯ))))) МЕНЯТЬ\\Ъ\\\Ъ\Ъ\Ъ)
checkI :: Int -> Int -> Bool
checkI n x = all (\k -> x `mod` k == 0) [1..n]

pik :: Int -> Int
pik n = go n
  where
    go x
      | checkI n x = x
      | otherwise    = go (x + n)



-- -- fold????????????/
-- pik :: Int -> Int
-- pik n = foldl lcm 1 [1..n]

-- -- 
-- pik :: Int -> Int
-- pik n =
--   fst . head . filter snd $
--     map (\x -> (x, checkI n x)) [n, 2*n..]


-- 
-- candidates :: Int -> [Int]
-- candidates n = [n, 2*n..]

-- valid :: Int -> [Int] -> [Int]
-- valid n xs = filter (checkI n) xs

-- pik :: Int -> Int
-- pik n = head (valid n (candidates n))

