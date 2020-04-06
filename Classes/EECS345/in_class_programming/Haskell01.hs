{- this is a comment -}

{-
ghci            compiler
load file.hs    load the file
-}

{-
curring example
f = myappend1 [1,2]
f [10, 20]
= [1,2,10,20]
-}

{- factorial function, 3 ways, first "standard" -}
factorial n =
    if n == 0
        then
            1
        else
            n * factorial (n - 1)

{- factorial using "lambda" -}
factorial2 =
    \n ->
        if n == 0
            then
                1
            else
                n * factorial2 (n - 1)

{- factorial using pattern matching -}
factorial3 0 = 1
factorial3 n = n * factorial3  (n - 1)


{- myappend 3 ways -}
myappend1 l1 l2 =
    if l1 == []
        then
            l2
        else
            {-
            scheme definition
            (cons (car l1) (myappend (cdr l1) l2))
            -}
            (head l1) : myappend1 (tail l1) l2

{- myappend with a lambda -}
myappend2 :: Eq a => [a] -> [a] -> [a]
myappend2 =
    \l1 l2 ->
        if l1 == []
            then
                l2
            else
                (head l1) : myappend2 (tail l1) l2

{- myappend using patterns -}
myappend3 [] l = l
myappend3 (h:t) l = h : myappend3 t l


{- remove all of an element from a list -}
removeall a [] = []
{- 
how we think about this, actually incorrect
removeall a (a:t) = removeall a t
removeall a (h:t) = h : (removeall a t)
-}
removeall a (h:t) =
    if (h == a)
        then
            removeall a t
        else
            h : (removeall a t)

removeall2 _ [] = []
{-
_ is a wildcard
| is a case statement
-}
removeall2 a (h:t)
    | a == h    = removeall2 a t
    | otherwise = h : removeall2 a t

{-
CLASS PRACTICE
replaceall a b list
myreverse list
merge list1 list2
-}

replaceall _ _ [] = []
replaceall a b (h:t)
    | a == h        = b : (replaceall a b t)
    | otherwise     = h : (replaceall a b t)

-- myreverse :: [_] -> [_]
-- myreverse [] = []
-- myreverse (h:t) = (myappend3 (myreverse t) h)

-- merge [] [] = []
-- merge (h:t) [] = 

-- SOLUTIONS

myreverse [] = []
myreverse (h:t) = (myappend3 (myreverse t) [h])
-- all I had to do was specify that h was in a list

myreverse2 [] = []
myreverse2 (h:t) = (myreverse2 t) ++ [h]

-- function composition
myreverse3 [] = []
myreverse3 (h:t) = (myappend3 . myreverse) t [h]
-- also valid:
--      myreverse3 (h:t) = ((++) . myreverse) t [h]
