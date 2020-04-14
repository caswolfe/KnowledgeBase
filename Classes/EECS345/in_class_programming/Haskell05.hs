{- Monads are a type where a value is wrapped in a "context" to give information about the value -}
-- simalar to a Java "Optional"

data RedBlack t = Red t | Black t

{- our "monad" example, a value -}
data Value t = Value t | NoValue deriving (Show, Eq)

{- We need two basic functions, return and bind -}

myreturn:: t -> Value t
myreturn x = Value x

mybind:: Value t -> (t -> Value s) -> Value s
mybind (Value x) f = f x
mybind NoValue _ = NoValue

{- math operations on the monad -}
-- prefix
(+++) vx vy = mybind vx (\x -> mybind vy (\y -> myreturn (x + y)))

-- infix
(~~) vx vy = vx `mybind` (\x -> vy `mybind` (\y -> myreturn (x - y)))

-- my solution
-- (//) vx vy
--     | vy == (Value 0)   = NoValue
--     | otherwise         = (vx `mybind` (\x -> vy `mybind` (\y -> myreturn (x / y))))

-- connamacher's solution
(//) vx vy = vx `mybind` (\x -> vy `mybind` (\y -> if y == 0 then NoValue else myreturn (x / y)))


{- Haskell has many monads: Maybe, IO, list 

data Maybe t = Just t | Nothing

return function is return

bind function is >>=

-}

-- Haskell monads☺
(++++) mx my = mx >>= (\x -> my >>= (\y -> return (x + y)))

-- short cut!
(~~~) mx my = do
    x <- mx
    y <- my
    return (x - y)

-- division (///) and square root (msqrt) using Maybe monad
-- mine (wrong)
-- (///) mx my = do
--     x <- mx
--     y <- my
--     return (if y == 0 then Nothing else (x / y))

-- Prof Connamacher's
(///) mx my = do
    x <- mx
    y <- my
    if y == 0 then Nothing else return (x / y)

-- mine (wrong)
-- (msqrt) mv = do
--     v <- mv
--     return (v * v)

-- Prof Connamacher's
msqrt mx = mx >>= (\x -> if x < 0 then Nothing else return (sqrt x))

{- mapply takes two monads mx my and a function f, I want to apply "mx `f` my" -}
myapply mx f my = do
    x <- mx
    y <- my
    return (x `f` y)