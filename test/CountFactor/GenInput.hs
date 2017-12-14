{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE NegativeLiterals #-}
{-# LANGUAGE NumDecimals #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE DeriveGeneric #-}

import CP.Prelude
import Control.Monad.Random
import Options.Generic

data Options = Options
  { _num :: !Int
  , _lowerBound :: !Int
  , _upperBound :: !Int
  } deriving Generic

instance ParseRecord Options where
  parseRecord = parseRecordWithModifiers lispCaseModifiers
    { shortNameModifier = firstLetter . dropWhile (== '_')
    }

main :: IO ()
main = do
  Options
    { _num = num
    , _lowerBound = lowerBound
    , _upperBound = upperBound
    } <-
      getRecord "Generate num random numbers"
  print num
  replicateM_ num $ do
    k :: Int <- getRandomR (lowerBound, upperBound)
    print k
