module Gophu.Network (performGopherQuery) where

import qualified Data.ByteString as BS
import Data.ByteString.Char8 as BSC
import Network.Simple.TCP (HostName, connect, recv, send)

performGopherQuery :: HostName -> IO ()
performGopherQuery hn = connect hn "gopher" $ \(s, _) -> do
  send s crlf
  repeatUntilNothing (recv s 1024) BS.putStr

repeatUntilNothing :: IO (Maybe bs) -> (bs -> IO ()) -> IO ()
repeatUntilNothing getMore perform = go
  where
    go = getMore >>=
      maybe (return ()) (\chunk -> perform chunk >> go)

crlf :: ByteString
crlf = BSC.pack "\r\n"
