data Nat = Zero | Succ Nat

exp :: Num a => a -> Nat -> a
exp x Zero = 1
exp x (Succ n) = x * exp x n
