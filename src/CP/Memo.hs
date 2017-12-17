module CP.Memo
  ( Memo
  , MemoT
  , arrayMemo
  , arrayMemoT
  ) where

import CorePrelude
import CP.Control.Applicative (($.))

import Data.Array

type Gen a = a -> a

type Memo a b = Gen (a -> b)

type MemoT a b = (a -> Gen b) -> Memo a b

arrayMemo :: Ix a => (a, a) -> Memo a b
arrayMemo bnds = arrayMemoT bnds $. id

arrayMemoT :: Ix a => (a, a) -> MemoT a b
arrayMemoT bnds trans f = (listArray bnds (trans <*> f <$> range bnds) !)
