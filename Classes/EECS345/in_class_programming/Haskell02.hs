-- merge
merge [] l = l
merge l [] = l
merge (h1:t1) (h2:t2)
    | h1 < h2       = h1 : merge t1 (h2:t2)
    | otherwise     = h2 : merge (h1:t1) t2

-- factorial_cps 6 (\v -> v)
factorial_cps n return =
    if n == 0
        then
            return 1
        else
            factorial_cps (n-1) (\v -> return (n * v))

-- append_cps
-- "append_cps [1,2,3] [4,5,6,7] (\v -> v)"
append_cps [] l return = return l
append_cps (h:t) l return = append_cps t l (\v -> return (h:v))

-- split-cps
-- "split_cps [1,2,3,4,5] (\v1 v2 -> [v1,v2])"
-- takes a list and returns two lists, dividing the elements between them
split_cps [] return         = return [] []
--                                      note the swapping of v1 and v2
split_cps (h:t) return      = split_cps t (\v1 v2 -> return v2 (h:v1))



-- merge_cps
merge_cps [] l return = return l
merge_cps l [] return = return l
merge_cps (h1:t1) (h2:t2) return
    | h1 < h2       = merge_cps t1 (h2:t2) (\v -> return (h1:v))
    | otherwise     = merge_cps (h1:t1) t2 (\v -> return (h2:v))

-- mergesort
-- "mergesort_cps [4,1,2,7,6,4,5,1,4,2,8,7] (\v -> v)"*
mergesort_cps [] return = return []
mergesort_cps [a] return = return [a]
mergesort_cps l return = split_cps l (\l1 l2 -> mergesort_cps l1 
                (\s1 -> mergesort_cps l2 (\s2 -> merge_cps s1 s2 return)))

{- defining types in Haskell -}

-- create a "coordinate" type (2 doubles or 3 doubles)
-- the type is called "Coordinate", Coord3D and Coord2D are separate 
--      constructors f/ instantiating this type
data Coordinate = Coord3D Double Double Double | Coord2D Double Double deriving (Show)

{- returns the distance between two coordinates -}
distance (Coord2D a b) (Coord2D c d) = sqrt((a-c)*(a-c) + (b-d)*(b-d))
-- distance (Coord3D a b c) (Coord3D d e f) = 