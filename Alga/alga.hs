import Algebra.Graph

fold :: b -> (a -> b) -> (b -> b -> b) -> (b -> b -> b) -> Graph a -> b

fold e v o c = go
    where
    go Empty         = e
    go (Vertex  x  ) = v x
    go (Overlay x y) = o (go x) (go y)
    go (Connect x y) = c (go x) (go y)

trans :: Graph a -> Graph a
trans = fold Empty Vertex Overlay (flip Connect)

induced :: (a -> Bool) -> Graph a -> Graph a
induced predicate = fold Empty (\x -> if predicate x then Vertex x else Empty) Overlay Connect

remVertex :: Eq a => a -> Graph a -> Graph a
remVertex x = induced (/=x)

g = Overlay (Vertex 1) (Connect (Vertex 2) (Vertex 3))