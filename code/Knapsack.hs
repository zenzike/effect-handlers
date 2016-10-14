

-- UUAGC 0.9.52.1 (Knapsack.ag)
module Knapsack where


{-# LINE 17 "Knapsack.ag" #-}

showKnapsack :: Knapsack -> String
showKnapsack (Sol ls) = show ls
showKnapsack NoSol    = "x"
showKnapsack (Choice l r) = "(" ++ showKnapsack l ++ "," ++ showKnapsack r ++ ")"
{-# LINE 14 "Knapsack.hs" #-}
-- Knapsack ----------------------------------------------------
data Knapsack = Sol (([Int]))
              | NoSol
              | Choice (Knapsack) (Knapsack)
-- cata
sem_Knapsack :: Knapsack ->
                T_Knapsack
sem_Knapsack (Sol _sol) =
    (sem_Knapsack_Sol _sol)
sem_Knapsack (NoSol) =
    (sem_Knapsack_NoSol)
sem_Knapsack (Choice _left _right) =
    (sem_Knapsack_Choice (sem_Knapsack _left) (sem_Knapsack _right))
-- semantic domain
type T_Knapsack = ( ([[Int]]))
sem_Knapsack_Sol :: ([Int]) ->
                    T_Knapsack
sem_Knapsack_Sol sol_ =
    (let _lhsOallsols :: ([[Int]])
         _lhsOallsols =
             ({-# LINE 10 "Knapsack.ag" #-}
              [sol_]
              {-# LINE 37 "Knapsack.hs" #-}
              )
     in  ( _lhsOallsols))
sem_Knapsack_NoSol :: T_Knapsack
sem_Knapsack_NoSol =
    (let _lhsOallsols :: ([[Int]])
         _lhsOallsols =
             ({-# LINE 7 "Knapsack.ag" #-}
              []
              {-# LINE 46 "Knapsack.hs" #-}
              )
     in  ( _lhsOallsols))
sem_Knapsack_Choice :: T_Knapsack ->
                       T_Knapsack ->
                       T_Knapsack
sem_Knapsack_Choice left_ right_ =
    (let _lhsOallsols :: ([[Int]])
         _leftIallsols :: ([[Int]])
         _rightIallsols :: ([[Int]])
         _lhsOallsols =
             ({-# LINE 7 "Knapsack.ag" #-}
              ((++) _leftIallsols _rightIallsols)
              {-# LINE 59 "Knapsack.hs" #-}
              )
         ( _leftIallsols) =
             left_
         ( _rightIallsols) =
             right_
     in  ( _lhsOallsols))