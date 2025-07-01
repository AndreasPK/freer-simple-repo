module CountDown (fused) where

import Control.Algebra
import qualified Control.Carrier.State.Strict as Eff

fused :: Has (Eff.State Int) sig m => m Int
fused = do
  n <- Eff.get
  if n <= 0 then pure n else Eff.put (n - 1) >> fused
{-# INLINEABLE fused #-}

