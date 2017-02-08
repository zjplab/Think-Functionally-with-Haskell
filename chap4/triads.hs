-- quick and dirty version :triads n = [(x,y,z) | x <- [1..n], y <- [1..n],z <- [1..n], x*x+y*y==z*z]

divisors x = [d | d <- [2..x-1], x `mod` d == 0]
coprime x y = disjoint (divisors x) (divisors y)

--
--   triads n=[(x,y,z) | x<-[1..n],y<-[x+1..n], coprime x y, z<-[y+1..n],x^2+y^2==z^2]
--

-------------------------------------------------------------------------------------------------------------
--------------------------final version----------------------------------------------------------------------
triads n=[(x,y,z) | x<-[m..n],y<-[x+1..n], coprime x y, z<-[y+1..n],x^2+y^2==z^2]
  where m=floor (fromIntegral n/sqrt 2)
  
