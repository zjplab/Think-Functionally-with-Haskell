position::(Eq a )=>a->[a]->Int
position x xs
=head ([j | (j,y) <- zip [0..] xs, y==x] ++ [-1])
-- a single requires lots of thought 
