module CP.Control.Applicative
  ( module Control.Applicative
  , ($.)
  , whenAlt
  ) where

import CorePrelude
import Control.Applicative

($.) :: Applicative f => (f a -> b) -> a -> b
($.) = (. pure)

infixr 0 $.

whenAlt :: Alternative f => Bool -> f a -> f a
whenAlt p fa = if p then fa else empty
