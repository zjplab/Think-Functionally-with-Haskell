--using pattern matching 
map :: (a -> b) -> [a] -> [b]
map f []=[]
map f x:xs= f x : map f xs



--basic facts about map
map id=id
map f.g=map f.map g 
--The two facts have a name : the Functor law of a map, the concept borrowed from Category Theory 
--In fact Haskell even has a class called Functor  whose definition is 

class Functor f where
fmap :: (a -> b) -> f a -> f b


--The reason
--for this type class is that the idea of mapping a function over a list can be generalised to one of mapping a function over an arbitrary data structure, such as trees
--of various kinds. For example, consider the type
data Tree a = Tip a | Fork (Tree a) (Tree a)

instance Functor Tree where
fmap f (Tip x) = Tip (f x)
fmap f (Fork u v) = Fork (fmap f u) (fmap f v)

--In fact map is just a synonym for the instance fmap for lists:
fmap (+1) [2,3,4] 
-- [3,4,5]

--another group of laws involving map, all of which have a common theme 
f. head =head. map f 
--requires f to be strict because if you consider 
f (head [])= head (map f [])=head[]

map f.tail = tail. map f 
map f.concat=concat.map f 


-- inner concatenation or outer concatenation yeilds the same result 
concat . map concat = concat . concat

filter p.map f=map f .filter (p.f)
