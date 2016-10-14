

-- UUAGC 0.9.52.1 (KnapsackCut.ag)
module KnapsackCut where

import Scaffold

-- Knapsack ----------------------------------------------------
data Knapsack = Sol (([Int]))
              | NoSol
              | Choice (Knapsack) (Knapsack)
              | Cut
              | Call (Knapsack)
-- cata
sem_Knapsack :: Knapsack ->
                T_Knapsack
sem_Knapsack (Sol _sol) =
    (sem_Knapsack_Sol _sol)
sem_Knapsack (NoSol) =
    (sem_Knapsack_NoSol)
sem_Knapsack (Choice _left _right) =
    (sem_Knapsack_Choice (sem_Knapsack _left) _right)
sem_Knapsack (Cut) =
    (sem_Knapsack_Cut)
sem_Knapsack (Call _chld) =
    (sem_Knapsack_Call (sem_Knapsack _chld))
-- semantic domain
type T_Knapsack = Knapsack ->
                  ( ([[Int]]))
sem_Knapsack_Sol :: ([Int]) ->
                    T_Knapsack
sem_Knapsack_Sol sol_ =
    (\ _lhsIalts ->
         (let _lhsOallsols :: ([[Int]])
              _lhsOallsols =
                  ({-# LINE 14 "KnapsackCut.ag" #-}
                   [sol_]
                   {-# LINE 39 "KnapsackCut.hs" #-}
                   )
          in  ( _lhsOallsols)))
sem_Knapsack_NoSol :: T_Knapsack
sem_Knapsack_NoSol =
    (\ _lhsIalts ->
         (let _lhsOallsols :: ([[Int]])
              x_val_ :: Knapsack
              _xOalts :: Knapsack
              _xIallsols :: ([[Int]])
              _lhsOallsols =
                  ({-# LINE 18 "KnapsackCut.ag" #-}
                   _xIallsols
                   {-# LINE 52 "KnapsackCut.hs" #-}
                   )
              x_val_ =
                  ({-# LINE 20 "KnapsackCut.ag" #-}
                   _lhsIalts
                   {-# LINE 57 "KnapsackCut.hs" #-}
                   )
              x_inst_ =
                  (sem_Knapsack x_val_)
              _xOalts =
                  ({-# LINE 9 "KnapsackCut.ag" #-}
                   _lhsIalts
                   {-# LINE 64 "KnapsackCut.hs" #-}
                   )
              ( _xIallsols) =
                  x_inst_ _xOalts
          in  ( _lhsOallsols)))
sem_Knapsack_Choice :: T_Knapsack ->
                       Knapsack ->
                       T_Knapsack
sem_Knapsack_Choice left_ right_ =
    (\ _lhsIalts ->
         (let _leftOalts :: Knapsack
              _lhsOallsols :: ([[Int]])
              _leftIallsols :: ([[Int]])
              _leftOalts =
                  ({-# LINE 16 "KnapsackCut.ag" #-}
                   right_
                   {-# LINE 80 "KnapsackCut.hs" #-}
                   )
              _lhsOallsols =
                  ({-# LINE 10 "KnapsackCut.ag" #-}
                   _leftIallsols
                   {-# LINE 85 "KnapsackCut.hs" #-}
                   )
              ( _leftIallsols) =
                  left_ _leftOalts
          in  ( _lhsOallsols)))
sem_Knapsack_Cut :: T_Knapsack
sem_Knapsack_Cut =
    (\ _lhsIalts ->
         (let _lhsOallsols :: ([[Int]])
              _lhsOallsols =
                  ({-# LINE 22 "KnapsackCut.ag" #-}
                   []
                   {-# LINE 97 "KnapsackCut.hs" #-}
                   )
          in  ( _lhsOallsols)))
sem_Knapsack_Call :: T_Knapsack ->
                     T_Knapsack
sem_Knapsack_Call chld_ =
    (\ _lhsIalts ->
         (let _chldOalts :: Knapsack
              _lhsOallsols :: ([[Int]])
              _chldIallsols :: ([[Int]])
              _chldOalts =
                  ({-# LINE 24 "KnapsackCut.ag" #-}
                   NoSol
                   {-# LINE 110 "KnapsackCut.hs" #-}
                   )
              _lhsOallsols =
                  ({-# LINE 10 "KnapsackCut.ag" #-}
                   _chldIallsols
                   {-# LINE 115 "KnapsackCut.hs" #-}
                   )
              ( _chldIallsols) =
                  chld_ _chldOalts
          in  ( _lhsOallsols)))