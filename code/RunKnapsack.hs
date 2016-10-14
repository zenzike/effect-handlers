
module RunKnapsack where

import Scaffold
import Knapsack

---- shallow embedding 
sem_knapsack :: Int -> [Int] -> [[Int]] 
sem_knapsack = knapsack_scaffold sem_Knapsack_Sol sem_Knapsack_NoSol sem_Knapsack_Choice

---- deep embedding and evaluation using catamorphism
-- create explicit representation
knapsack :: Int -> [Int] -> Knapsack 
knapsack = knapsack_scaffold Sol NoSol Choice

-- apply catamorphism to representation
sem_knapsack2 = (sem_Knapsack .) . knapsack


