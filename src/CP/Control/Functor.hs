module CP.Control.Functor
  ( (<$^>)
  ) where

import CorePrelude

(<$^>) :: Functor f => f (a -> b) -> a -> f b
f <$^> a = ($ a) <$> f

infixl 4 <$^>
