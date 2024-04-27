module Gophu.Interface (runGophuWithArgs) where

import Gophu.Network
import Network.Simple.TCP (HostName)

runGophuWithArgs :: [String] -> IO ()
runGophuWithArgs = either putStrLn (uncurry performGopherQuery) . handleArgs

-- It's not pretty, but it works. Don't nerdsnipe yourself, not yet.
-- There will always be time for refactoring later.
handleArgs :: [String] -> Either String (HostName, ResourceName)
handleArgs [arg] = Right $ break (=='/') arg
handleArgs _ = Left $ "argument error: gophu takes a single argument, "
                <> "which is the address URI"
