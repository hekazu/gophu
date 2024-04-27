module Main where

import System.Environment (getArgs)
import Gophu.Interface

main :: IO ()
main = getArgs >>= runGophuWithArgs
