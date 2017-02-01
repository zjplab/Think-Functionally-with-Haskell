factorial :: Integer -> Integerfact :: (Integer,Integer) -> Integer
factorial n = fact (n,1)

fact :: (Integer,Integer) -> Integer
fact (x,y) = if x==0 then y else fact (x-1,x*y) --recursive definition 

