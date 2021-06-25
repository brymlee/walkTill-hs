import WalkTill (walkTill)

first = "Assertion Error: "
second = "For \""
third = "\" Expected \""

_error :: String -> Char -> Int -> Maybe (Int, Int) -> IO()
_error a _ _ Nothing = result
  where
    fourth = "\"Nothing\" and did not"
    message = first ++ second ++ a ++ third ++ fourth
    result = error message
_error a c i (Just m) = result
  where
    fourth = "\" to be at index \""
    fifth = "\" but got \""
    sixth = "\""
    _c = [c]
    _i = show i
    _m = show $ Just m
    message = first ++ second ++ a ++ third ++ _c ++ fourth ++ _i ++ fifth ++ _m ++ sixth
    result = error message

test :: String -> Char -> Int -> Maybe (Int, Int) -> IO()
test a c i m = 
  case m of 
    Nothing -> _error a c i m
    Just (_a, _b) -> 
      result
        where
          f = \ (_i, _) -> 
            case (_a == _b) && (_b == i) of
              True -> _i == 1 
              False -> _i == 0 
          __error = _error a c i m
          first = (0, __error) :: (Int, IO())
          second = (1, putStr "") :: (Int, IO())
          xs = [first, second]
          _filter = filter f xs
          _head = head _filter
          g = \ (_, _result) -> _result
          result = g _head

main :: IO()
main = do
  let as = "abcde"
  test as 'a' 0 $ walkTill as 'a'
  test as 'b' 1 $ walkTill as 'b'
  test as 'c' 2 $ walkTill as 'c'
  test as 'd' 3 $ walkTill as 'd'
  test as 'e' 4 $ walkTill as 'e'
  let a = (walkTill as 'f')
  case a of
    Nothing -> putStr ""
    Just (_, _) -> _error as ' ' 0 a
