{-
binary tree
    - leaf, empty, or node w/ 2 children
-}

data BinaryTree t = Empty |
                    Leaf t |
                    InnerNode t (BinaryTree t) (BinaryTree t)
                    deriving (Show, Eq)

{-
inorder conversion of the tree to a list

sample tree
let t = InnerNode 6 (InnerNode 3 (Leaf 1) (InnerNode 5 (Leaf 4) Empty)) (InnerNode 10 (Leaf 8) Empty)
-}

inorder Empty = []
inorder (Leaf a) = [a]
inorder (InnerNode a l r) = (inorder l) ++ a : (inorder r)

{-
pre-order conversion of the tree to a list (node, left child, right child)
-}
preorder Empty = []
preorder (Leaf a) = [a]
preorder (InnerNode a l r) = a : (preorder l) ++ (preorder r)

{-
insert an element into the tree in order
-}
insert e Empty = (Leaf e)
insert e (Leaf a)
    | e < a         = (InnerNode a (Leaf e) Empty)
    | otherwise     = (InnerNode a Empty (Leaf e))
insert e (InnerNode a l r)
    | e < a         = InnerNode a (insert e l) r
    | otherwise     = InnerNode a l (insert e r)

{-
applytotree takes a function (of 1 input) and applies the function to all values stored in the tree
-}
applytotree f Empty = Empty
applytotree f (Leaf a) = (Leaf (f a))
applytotree f (InnerNode a l r) = (InnerNode (f a) (applytotree f l) (applytotree f r))

{-
foldinorder, foldpostorder
    takes a binary function and a value, it applies the function to a node value with the second value, the result is passed to the next node in the tree.  use the input value as the second operand of the function
-}
-- foldinorder (:) [] t
--      this is an interesting application
foldinorder f v Empty = v
foldinorder f v (Leaf a) = f a v
foldinorder f v (InnerNode a l r) = (foldinorder f (f a (foldinorder f v l)) r)