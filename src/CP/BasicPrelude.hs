module CP.BasicPrelude
  ( module BasicPrelude
  , traverse_
  , sequenceA_
  , for_
  , for
  , (&)
  , module Data.Witherable
  ) where

import BasicPrelude hiding
  ( empty
  , catMaybes
  , filter
  , mapMaybe
  , try
  , tryIOError
  , tryJust
  )
import Data.Foldable (traverse_, sequenceA_, for_)
import Data.Traversable (for)
import Data.Function ((&))
import Data.Witherable
