module Gophu.Interface (runGophuWithArgs) where

import Gophu.Network

import qualified System.IO as IO

runGophuWithArgs :: [String] -> IO ()
runGophuWithArgs = either (IO.hPutStr IO.stderr) performGopherQuery . handleArgs

-- It's not pretty, but it works. Don't nerdsnipe yourself, not yet.
-- There will always be time for refactoring later.
handleArgs :: [String] -> Either String QueryInfo
handleArgs [arg] = Right . uncurry QueryInfo $ break (=='/') arg
handleArgs _ = Left $ "argument error: gophu takes a single argument, "
                <> "which is the address URI"
