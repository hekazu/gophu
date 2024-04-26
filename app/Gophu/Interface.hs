module Gophu.Interface (handleArgs) where

import Gophu.Network (ResourceName)
import Network.Simple.TCP (HostName)

-- It's not pretty, but it works. Don't nerdsnipe yourself, not yet.
-- There will always be time for refactoring later.
handleArgs :: [String] -> Either String (HostName, ResourceName)
handleArgs [arg] = Right $ break (=='/') arg
handleArgs _ = Left $ "argument error: gophu takes a single argument, "
                <> "which is the address URI"
