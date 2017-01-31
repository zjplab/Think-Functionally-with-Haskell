>units, teens, tens :: [String]
> units = ["zero","one","two","three","four","five",
> "six","seven","eight","nine"]
> teens = ["ten","eleven","twelve","thirteen","fourteen",
> "fifteen","sixteen","seventeen","eighteen",
> "nineteen"]
> tens = ["twenty","thirty","forty","fifty","sixty",
> "seventy","eighty","ninety"]

Returning to the task in hand, a good way to tackle tricky problems is to solve
a simpler problem first. The simplest version of our problem is when the given
number n contains only one digit, so 0 ≤ n < 10. Let convert1 deal with this
version. We can immediately define

> convert1 :: Int -> String
> convert1 n = units!!n

This definition uses the list-indexing operation (!!). Given a list xs and an index
n, the expression xs!!n returns the element of xs at position n, counting from 0.
In particular, units!!0 = "zero". And, yes, units!!10 is undefined because
units contains just ten elements, indexed from 0 to 9. In general, the functions we
define in a script are partial functions that may not return well-defined results for
each argument.

The next simplest version of the problem is when the number n has up to two digits,
so 0 ≤ n < 100. Let convert2 deal with this case. We will need to know what the
digits are, so we first define

> digits2 :: Int -> (Int,Int)
> digits2 n = (div n 10, mod n 10)

The number div n k is the whole number of times k divides into n, and mod n k
is the remainder. We can also write

> digits2 n = (n `div` 10, n `mod` 10)

The operators `div` and `mod` are infix versions of div and mod, that is, they
come between their two arguments rather than before them. This device is useful
for improving readability. For instance a mathematician would write x div y and
x mod y for these expressions. Note that the back-quote symbol ` is different from
the single quote symbol ' used for describing individual characters.
Now we can define

> convert2 :: Int -> String
> convert2 = combine2 . digits2

The definition of combine2 uses the Haskell syntax for guarded equations:

> combine2 :: (Int,Int) -> String
> combine2 (t,u)
> | t==0 = units!!u
> | t==1 = teens!!u
> | 2<=t && u==0 = tens!!(t-2)
> | 2<=t && u/=0 = tens!!(t-2) ++ "-" ++ units!!u

To understand this code you need to know that the Haskell symbols for equality
and comparison tests are as follows:
== (equals to)
/= (not equals to)
<= (less than or equal to)


another version:
combine2 :: (Int,Int) -> String
combine2 (t,u)
| t==0 = units!!u
| t==1 = teens!!u
| u==0 = tens!!(t-2)
| otherwise = tens!!(t-2) ++ "-" ++ units!!u
