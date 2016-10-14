
module Scaffold where

knapsack_scaffold :: ([Int] -> a) -> a -> (a -> a -> a) -> Int -> [Int] -> a
knapsack_scaffold sol nosol choice = knapsack' []
 where 
    knapsack' acc w vs
      | w <  0 = nosol
      | w == 0 = sol acc
      | w >  0 = foldr choice nosol [ knapsack' (v:acc) (w-v) vs | v <- vs ]
