data Nat= Zero | Succ Nat

instance Eq Nat where 
Zero==Zero = True 
Zero==Succ n =Flase 
Succ m ==Zero =False 
Succ m= Succ n= (m==n)

instance Show Nat Where 
show Zero ="Zero"
show(Succ Zero)="Succ Zero"
show(SUcc (Succ n))="Succ ("++show(Succ n)++")"
 
--data Nat = Zero | Succ Nat deriving (Eq,Ord,Show)
-- alternative way of writing things 

instance Num Nat where
m + Zero = m
m + Succ n = Succ (m+n)
m * Zero = Zero
m * (Succ n)=m*n+m
abs n = n
signum Zero = Zero
signum (Succ n) = Succ Zero
m - Zero = m
Zero - Succ n = Zero
Succ m - Succ n = m - n
fromInteger x
| x <= 0 = Zero
| otherwise = Succ (fromInteger (x-1)) 

