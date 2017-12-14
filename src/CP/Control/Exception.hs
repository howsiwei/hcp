module CP.Control.Exception
  ( fromRightM
  , fromRightMM
  ) where

import CorePrelude
import Control.Exception.Safe

fromRightM :: (MonadThrow m, Exception e) => Either e a -> m a
fromRightM = either throwM pure

fromRightMM :: (MonadThrow m, Exception e) => m (Either e a) -> m a
fromRightMM = (>>= fromRightM)
