
module RunKnapsackState where

import Scaffold
import KnapsackState

knapsack = knapsack_scaffold Sol NoSol ((incr .) . Choice)

incr cnt = Modify (+1) cnt 

sem_knapsack w vs = sem_Knapsack (knapsack w vs) 0 {- default state -}


