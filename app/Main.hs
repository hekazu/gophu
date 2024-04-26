module Main where

import System.Environment (getArgs)
import Gophu.Interface

main :: IO ()
main = do
  args <- getArgs
  mapM_ print $ handleArgs args
