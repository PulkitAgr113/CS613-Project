import Data.Graph.Inductive.Graph (mkGraph)
import Data.Graph.Inductive.PatriciaTree (Gr)
import Data.Graph.Inductive.Query.SP (sp, spLength)
import Data.Graph.Inductive.Query.MST (msTree)

edges = [(1, 2, 3), (1, 3, 4), (2, 3, 5), (2, 4, 2), (2, 5, 6), (3, 5, 5), (4, 6, 9), (5, 4, 1), (5, 6, 10)]
nodes = [(1,1), (2,2), (3,3), (4,4), (5,5), (6,6)]

g :: Gr Int Int
g = mkGraph nodes edges

shortestPath = sp 1 6 g
minSpan = msTree g
