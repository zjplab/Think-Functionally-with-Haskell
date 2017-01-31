>units, teens, tens :: [String]
> units = ["zero","one","two","three","four","five",
> "six","seven","eight","nine"]
> teens = ["ten","eleven","twelve","thirteen","fourteen",
> "fifteen","sixteen","seventeen","eighteen",
> "nineteen"]
> tens = ["twenty","thirty","forty","fifty","sixty",
> "seventy","eighty","ninety"]



> convert1 :: Int -> String
> convert1 n = units!!n



> digits2 :: Int -> (Int,Int)
> digits2 n = (div n 10, mod n 10)

> digits2 n = (n `div` 10, n `mod` 10)


> convert2 :: Int -> String
> convert2 = combine2 . digits2

> combine2 :: (Int,Int) -> String
> combine2 (t,u)
> | t==0 = units!!u
> | t==1 = teens!!u
> | 2<=t && u==0 = tens!!(t-2)
> | 2<=t && u/=0 = tens!!(t-2) ++ "-" ++ units!!u


