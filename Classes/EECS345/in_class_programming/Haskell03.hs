{-
    explain hw questions
-}
-- type is creating a type alias
type Scale = Double

doubleScale:: Scale -> Scale
doubleScale n = 2*n

{-
    creating a data type
-}
--   Name         Constructor
data Coordinate =   Zero |
                    Coord1 Double |
                    Coord2 Double Double |
                    Coord3 Double Double Double
                        deriving (Show)

instance (Floating t, Eq t) => Eq (Coordinate t) where
    c1 == c2 = distance c1 c2 == 0

{- helper methods to access the different parts of a Coordinate -}
getx Zero = 0
getx (Coord1 a) = a
getx (Coord2 a b) = a
getx (Coord3 a b c) = a

gety Zero = 0
gety (Coord1 a) = 0
gety (Coord2 a b) = b
gety (Coord3 a b c) = b

getz Zero = 0
getz (Coord1 a) = 0
getz (Coord2 a b) = 0
getz (Coord3 a b c) = c

{- distance function: computes the distance between two points -}
diffsquared a b dim = ((dim a - dim b) * (dim a - dim b))
distance a b = sqrt((diffsquared a b getx) + (diffsquared a b gety) + (diffsquared a b getz))

{- distance again, but as an infix function -}
(##) a b = distance a b

{-
Coach wants a function that will sum two coordinates (pairwise sum each individual value)
    - If you sum two coordinates with different constructors, the result should be the wider of the two
    ex
        (Coord1 2.0) -|- (Coord2 3.0 4.0) => (Coord2 5.0 4.0)
-}

-- sumdim a b dim = ((dim a) + (dim b))

-- sumcoord a b = (Coord3 (sumdim a b getx) (sumdim a b gety) (sumdim a b getz))

-- sumcoord a b
--     | (a == Zero) && (b == Zero)        Zero
--     | (getx a == 0) && (getx b == 0)    (Coord)

-- (-|-) a b = sumcoord a b

(-|-) Zero c = c
(-|-) c Zero = c
(-|-) (Coord1 a) (Coord1 b) = Coord1 (a + b)
(-|-) (Coord2 a b) (Coord2 c d) = Coord2 (a + c) (b + d)
(-|-) (Coord3 a b c) (Coord3 d e f) = Coord3 (a + d) (b + e) (c + f)
(-|-) (Coord1 a) (Coord2 b c) = Coord2 (a + b) c