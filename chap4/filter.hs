-- using pattern matching 
filter::(a->Bool)->[a]->[a]
filter p []=[]
filter p x:xs=if p x then x:filter p xs
                     else filter p xs 

-- alternative definition of filter 
filter p =concat. map (test p)
test p x =if p x then [x] else []
