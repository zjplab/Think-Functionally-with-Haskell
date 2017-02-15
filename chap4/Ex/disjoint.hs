disjoint::[Ord a]=>[a]->[a]->Bool
--takes two lists in ascending order, and determines whether or not they have an
--element in common.
disjoint xs [] = True
disjoint [] ys = True
disjoint xs'@(x:xs) ys'@(y:ys)
| x < y = disjoint xs ys'
| x == y = False
| x > y = disjoint xs' ys
