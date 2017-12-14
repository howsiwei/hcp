{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE NegativeLiterals #-}
{-# LANGUAGE NumDecimals #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE MultiWayIf #-}

import CP.Prelude
import Control.Monad.Writer.Strict
import Data.Attoparsec.Text as A

data Input = Input
  { _iTc :: !Int
  , _n :: !Int
  }

inputParser :: Int -> A.Parser Input
inputParser iTc = do
  n <- A.decimal <* A.endOfLine
  pure Input
    { _iTc = iTc
    , _n = n
    }

data Output = Output
  { _iTc' :: !Int
  , _nFactor :: !Int
  }

writeOutput :: FromBuilder s => Output -> s
writeOutput Output
  { _iTc' = iTc
  , _nFactor = nFactor
  }
  =
  fromBuilder . execWriter $ do
    tell $ "Case #" <> build iTc <> ": "
    tell $ build nFactor <> "\n"

solve :: Input -> Output
solve Input
  { _iTc = iTc
  , _n = n
  }
  = Output
  { _iTc' = iTc
  , _nFactor = nFactor
  }
  where
    nFactor = length $ filter (\ k -> n `mod` k == 0) [1 .. n]

main :: IO ()
main = runTestCases inputParser (writeOutput . solve)
