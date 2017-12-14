module CP.Control.Applicative
  ( module Control.Applicative
  , whenAlt
  ) where

import CorePrelude
import Control.Applicative

whenAlt :: Alternative f => Bool -> f a -> f a
whenAlt p fa = if p then fa else empty
