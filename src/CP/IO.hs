{-# LANGUAGE ScopedTypeVariables #-}

module CP.IO
  ( runTestCases
  ) where

import CorePrelude
import BasicPrelude (show)

import Control.Exception.Safe
import Control.Monad.State.Strict

import qualified Data.Attoparsec.Text as A
import Pipes ((>->))
import qualified Pipes as P
import qualified Pipes.Prelude as P
import qualified Pipes.Text.IO as PT
import qualified Pipes.Parse as PP
import qualified CP.Pipes.Attoparsec as PA

runTestCases ::
     forall m i. (MonadIO m, MonadThrow m)
  => (Int -> A.Parser i)
  -> (i -> Text)
  -> m ()
runTestCases tcParser solve = evalStateT solveAll PT.stdin
  where
    nTcParser :: A.Parser Int
    nTcParser = A.decimal <* A.endOfLine A.<?> "number of test cases"
    
    tcParser' :: Int -> A.Parser i
    tcParser' i = tcParser i A.<?> "test case " <> show i

    solveAll :: PP.Parser Text m ()
    solveAll = do
      nTc <- PA.parseThrow nTcParser
      P.runEffect $
        P.each [1 .. nTc]
        >-> P.mapM (PA.parseThrow . tcParser')
        >-> P.map solve
        >-> P.mapM_ putStr
      PA.parseThrow A.endOfInput
