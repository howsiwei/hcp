{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE RankNTypes #-}

module CP.Pipes.Prelude
  ( (&>->)
  -- , chunksOf'
  -- , parMapChunk
  ) where

import CP.BasicPrelude
-- import Control.Monad.Except
-- import Control.Monad.State.Strict
-- import Data.Foldable (for_)
-- import qualified Control.Foldl as L
-- import Control.Parallel.Strategies

-- import Pipes
-- import Pipes.Prelude
import qualified Pipes as P
-- import qualified Pipes.Prelude as P
-- import qualified Pipes.Group as PG

(&>->) ::
     Monad m
  => P.Proxy a' a () b m r
  -> P.Proxy () b c' c m r
  -> P.Proxy a' a c' c m r
(&>->) = (P.>->)

infixl 1 &>->

-- chunksOf' :: Monad m => Int -> P.Producer a m r -> P.Producer [a] m r
-- chunksOf' n =
--   L.purely PG.folds L.list . view (PG.chunksOf n)
--   -- P.unfoldr $ (runExceptT .) . runStateT $ do
--   --   replicateM n next
--   -- where next = StateT (ExceptT . P.next)

-- parMapChunk ::
--      Monad m
--   => Int
--   -> Strategy b
--   -> (a -> b)
--   -> P.Producer a m r
--   -> P.Producer b m r
-- parMapChunk n strat f p =
--   chunksOf' n p
--   &>-> P.map (parMap strat f)
--   &>-> P.concat
