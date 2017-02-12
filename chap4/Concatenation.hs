(++) ::[a]->[a]->[a]
[] ++ys =ys
(x:xs) ++ y= x:(xs ++ y)

--By the way , the length can be calculated this way
length::[a]->Int
length []=0
length x:xs=1+length xs

--concat using pattern matching 
concat::[ [a]]->[a]
concat []=[]
concat xs:xss= xs ++ xss
