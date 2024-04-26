module Main where

import System.Environment (getArgs)
import Gophu.Interface
import Gophu.Network (performGopherQuery)

main :: IO ()
main = do
  args <- getArgs
  either putStrLn (uncurry performGopherQuery) $ handleArgs args
