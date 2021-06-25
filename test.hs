module Test where

first = "Assertion Error: "
second = "For \""
third = "\" Expected \""

_error :: String -> Char -> (Int, Int) -> Maybe (Int, Int) -> IO()
_error a _ _ Nothing = result
  where
    fourth = "\"Nothing\" and did not"
    message = first ++ second ++ a ++ third ++ fourth
    result = error message
_error a c (f, g) (Just m) = result
  where
    fourth = "\" to be at index \""
    fifth = "\" but got \""
    sixth = "\""
    _c = [c]
    _i = show (f, g)
    _m = show $ Just m
    message = first ++ second ++ a ++ third ++ _c ++ fourth ++ _i ++ fifth ++ _m ++ sixth
    result = error message

test :: String -> Char -> (Int, Int) -> Maybe (Int, Int) -> IO()
test a c (f, g) m = 
  case m of 
    Nothing -> _error a c (f, g) m
    Just (_f, _g) -> 
      result
        where
          h = \ (_i, _) -> 
            case (f == _f) && (g == _g) of
              True -> _i == 1 
              False -> _i == 0 
          __error = _error a c (f, g) m
          first = (0, __error) :: (Int, IO())
          second = (1, putStr "") :: (Int, IO())
          xs = [first, second]
          _filter = filter h xs
          _head = head _filter
          j = \ (_, _result) -> _result
          result = j _head
