{-# LANGUAGE BangPatterns #-}

module Main (main) where

import qualified Control.Carrier.State.Strict as Eff

import qualified CountDown

{-# NOINLINE countDownEff #-}
countDownEff :: Int -> (Int, Int)
countDownEff start = Eff.run (Eff.runState start CountDown.fused)


main :: IO ()
main = go countDownEff 10000 10000
  where
    go :: (Int -> (Int,Int)) -> Int -> Int -> IO ()
    go f 0 x = print (f x) >> print "Done"
    go f n x = let (!_,!_) = f x
               in go f (n-1) x

