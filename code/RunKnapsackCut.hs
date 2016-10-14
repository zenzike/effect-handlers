
module RunKnapsackCut where

import KnapsackCut
import Scaffold

---- find only first solution
cut_knapsack :: Int -> [Int] -> Knapsack
cut_knapsack = knapsack_scaffold (\r -> (Sol r) `Choice` Cut) NoSol Choice

sem_cut_knapsack w vs = sem_Knapsack (cut_knapsack w vs) NoSol 
