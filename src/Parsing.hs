module Parsing where

import Control.Applicative (Alternative ((<|>)))
import Data.Functor ((<&>))
import Data.Time (UTCTime (UTCTime))
import Data.Time.Format.ISO8601 (iso8601ParseM)

{- | Parses a timestamp in either iso8601 extended format (yyyy-mm-ddThh:mm:ss[.sss]Z ) or day format (yyyy-mm-dd)
 >>> readTimestamp "2023-05-23"
 Right 2023-05-23 00:00:00 UTC
 >>> readTimestamp "2023-05-23T09:57:29Z"
 Right 2023-05-23 09:57:29 UTC
-}
readTimestamp :: String -> Either String UTCTime
readTimestamp t = maybe (Left $ "error parsing timestamp " <> show t) Right (iso8601ParseM t <|> (iso8601ParseM t <&> flip UTCTime 0))
