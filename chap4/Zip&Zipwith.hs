zip::[a]->[b]->[(a,b)]
zip (x:xs) (y:ys)=(x,y):zip xs ys 
zip _ _ =[]

-- without don't care pattern 
zip::[a]->[b]->[(a,b)]
zip [] ys =[]
zip xs []=[]
zip (x:xs) (y:ys)=(x,y):zip xs ys 


zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith f (x:xs) (y:ys)=(f x y): zipWith f xs ys 
Zipwith f _ _=[]

zip=zipWith (,)

--usage example 
 nondec::(Ord a)=>[a] -> Bool
 nondec []=True
 nondex [x] =True
 nondec (x:y:ys)= (x<=y) && nondec (y:ys)
 
 --equivalent and shorter definition
 nondec xs =and (zipWith (<=) xs (tail xs))
 
and :: [Bool] -> Bool
and [] = True
and (x:xs) = x && and xs
 
