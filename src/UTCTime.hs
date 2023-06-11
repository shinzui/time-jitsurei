module UTCTime where

import Data.Fixed (Pico)
import Data.Time

type Hour = Int
type Minute = Int
type Second = Pico

mkUTCTime :: (Year, MonthOfYear, DayOfMonth) -> (Hour, Minute, Second) -> UTCTime
mkUTCTime (year, month, day) (hour, minute, sec) =
    UTCTime
        { utctDay = fromGregorian year month day
        , utctDayTime = timeOfDayToTime $ TimeOfDay hour minute sec
        }

mkUTCTimeForDay :: (Year, MonthOfYear, DayOfMonth) -> UTCTime
mkUTCTimeForDay (year, month, day) = UTCTime{utctDayTime = timeOfDayToTime midnight, utctDay = fromGregorian year month day}
