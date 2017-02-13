sort::(Ord a )=>a->[a]->[a]
sort []=[]
sort [x]=[x]
sort xs=merge (sort ys) (sort zs)
where (ys,zs)=halve xs 

halve xs = (take n xs, drop n xs)
where n = length xs `div` 2

merge::(Ord a )=>a->[a]->[a]->[a]
merge [] ys=ys
merge xs []=xs 
merge x:xs y:ys
| x<=y = x:merge xs (y:ys)
| otherwise = y:merge (x:xs) ys

--In fact,many Haskell programmers wouldn’t write the last clause of merge in quite
--this way. Instead they would write

merge xs'@(x:xs) ys'@(y:ys) --'as' pattern 
| x <= y = x:merge xs ys'
| otherwise = y:merge xs' ys

