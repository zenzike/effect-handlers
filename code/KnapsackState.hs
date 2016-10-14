

-- UUAGC 0.9.52.1 (KnapsackState.ag)
module KnapsackState where


{-# LINE 17 "Knapsack.ag" #-}

showKnapsack :: Knapsack -> String
showKnapsack (Sol ls) = show ls
showKnapsack NoSol    = "x"
showKnapsack (Choice l r) = "(" ++ showKnapsack l ++ "," ++ showKnapsack r ++ ")"
{-# LINE 14 "KnapsackState.hs" #-}
-- Knapsack ----------------------------------------------------
data Knapsack = Sol (([Int]))
              | NoSol
              | Choice (Knapsack) (Knapsack)
              | Modify ((Int -> Int)) (Knapsack)
-- cata
sem_Knapsack :: Knapsack ->
                T_Knapsack
sem_Knapsack (Sol _sol) =
    (sem_Knapsack_Sol _sol)
sem_Knapsack (NoSol) =
    (sem_Knapsack_NoSol)
sem_Knapsack (Choice _left _right) =
    (sem_Knapsack_Choice (sem_Knapsack _left) (sem_Knapsack _right))
sem_Knapsack (Modify _trans _left) =
    (sem_Knapsack_Modify _trans (sem_Knapsack _left))
-- semantic domain
type T_Knapsack = Int ->
                  ( ([[Int]]),Int)
sem_Knapsack_Sol :: ([Int]) ->
                    T_Knapsack
sem_Knapsack_Sol sol_ =
    (\ _lhsIstate ->
         (let _lhsOallsols :: ([[Int]])
              _lhsOstate :: Int
              _lhsOallsols =
                  ({-# LINE 10 "Knapsack.ag" #-}
                   [sol_]
                   {-# LINE 43 "KnapsackState.hs" #-}
                   )
              _lhsOstate =
                  ({-# LINE 7 "KnapsackState.ag" #-}
                   _lhsIstate
                   {-# LINE 48 "KnapsackState.hs" #-}
                   )
          in  ( _lhsOallsols,_lhsOstate)))
sem_Knapsack_NoSol :: T_Knapsack
sem_Knapsack_NoSol =
    (\ _lhsIstate ->
         (let _lhsOallsols :: ([[Int]])
              _lhsOstate :: Int
              _lhsOallsols =
                  ({-# LINE 7 "Knapsack.ag" #-}
                   []
                   {-# LINE 59 "KnapsackState.hs" #-}
                   )
              _lhsOstate =
                  ({-# LINE 7 "KnapsackState.ag" #-}
                   _lhsIstate
                   {-# LINE 64 "KnapsackState.hs" #-}
                   )
          in  ( _lhsOallsols,_lhsOstate)))
sem_Knapsack_Choice :: T_Knapsack ->
                       T_Knapsack ->
                       T_Knapsack
sem_Knapsack_Choice left_ right_ =
    (\ _lhsIstate ->
         (let _lhsOallsols :: ([[Int]])
              _lhsOstate :: Int
              _leftOstate :: Int
              _rightOstate :: Int
              _leftIallsols :: ([[Int]])
              _leftIstate :: Int
              _rightIallsols :: ([[Int]])
              _rightIstate :: Int
              _lhsOallsols =
                  ({-# LINE 7 "Knapsack.ag" #-}
                   ((++) _leftIallsols _rightIallsols)
                   {-# LINE 83 "KnapsackState.hs" #-}
                   )
              _lhsOstate =
                  ({-# LINE 7 "KnapsackState.ag" #-}
                   _rightIstate
                   {-# LINE 88 "KnapsackState.hs" #-}
                   )
              _leftOstate =
                  ({-# LINE 7 "KnapsackState.ag" #-}
                   _lhsIstate
                   {-# LINE 93 "KnapsackState.hs" #-}
                   )
              _rightOstate =
                  ({-# LINE 7 "KnapsackState.ag" #-}
                   _leftIstate
                   {-# LINE 98 "KnapsackState.hs" #-}
                   )
              ( _leftIallsols,_leftIstate) =
                  left_ _leftOstate
              ( _rightIallsols,_rightIstate) =
                  right_ _rightOstate
          in  ( _lhsOallsols,_lhsOstate)))
sem_Knapsack_Modify :: (Int -> Int) ->
                       T_Knapsack ->
                       T_Knapsack
sem_Knapsack_Modify trans_ left_ =
    (\ _lhsIstate ->
         (let _leftOstate :: Int
              _lhsOallsols :: ([[Int]])
              _lhsOstate :: Int
              _leftIallsols :: ([[Int]])
              _leftIstate :: Int
              _leftOstate =
                  ({-# LINE 10 "KnapsackState.ag" #-}
                   trans_ _lhsIstate
                   {-# LINE 118 "KnapsackState.hs" #-}
                   )
              _lhsOallsols =
                  ({-# LINE 7 "Knapsack.ag" #-}
                   _leftIallsols
                   {-# LINE 123 "KnapsackState.hs" #-}
                   )
              _lhsOstate =
                  ({-# LINE 7 "KnapsackState.ag" #-}
                   _leftIstate
                   {-# LINE 128 "KnapsackState.hs" #-}
                   )
              ( _leftIallsols,_leftIstate) =
                  left_ _leftOstate
          in  ( _lhsOallsols,_lhsOstate)))