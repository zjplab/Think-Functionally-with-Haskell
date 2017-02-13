commonWords :: Int -> [Char] -> [Char]
commonWords n = concat . map showRun . take n .
            sortRuns . countRuns . sortWords .
            words . map toLower

showRun :: (Int,Word) -> [Char]
showRun (n,w) = w ++ ": " ++ show n ++ "\n"

countRuns :: [Word] -> [(Int,Word)]
countRuns [] = []
countRuns (w:ws) = (1+length us,w):countRuns vs         --I believe here is a mistake 
where (us,vs) = span (==w) ws

--The prelude function span p splits a list into two, the first being the longest prefix
--of the list all of whose elements satisfy the test p, and the second being the suffix
--that remains.
span :: (a -> Bool) -> [a] -> ([a],[a])
span p [] = ([],[])
span p (x:xs) = if p x then (x:ys,zs)
else ([],x:xs)
where (ys,zs) = span p xs

import Data.List (sort)
sort :: (Ord a) => [a] -> [a] 

sortWords :: [Word] -> [Word]
sortWords = sort

sortRuns :: [(Int,Word)] -> [(Int,Word)]
sortRuns = reverse . sort


