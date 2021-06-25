module WalkTill where

walkTill :: String -> Char -> Maybe (Int, Int)
walkTill s c = walkTillr s _l c $ Just (0, 0)
  where
    _l = length s

walkTillr :: String -> Int -> Char -> (Maybe (Int, Int)) -> Maybe (Int, Int)
walkTillr [] _ _ _ = Nothing
walkTillr [x] l c (Just (a, b)) = result
  where
    aValid = a >= 0 && a < l
    bValid = b >= 0 && b < l
    xIsC = x == c
    f = \ (i, j, k) -> 
      case i of 
        True -> 
          case j of 
            True -> 
              case k of
                True -> True
                False -> False
            False -> False
        False -> False
    is = f (aValid, bValid, xIsC)
    result = 
      case is of 
        True -> Just (a, b)
        False -> walkTillr [] l c Nothing
walkTillr (x:xs) l c (Just (a, b)) = result
  where 
    is = (==) x c
    _a = (+) a 1
    _b = (+) b 1
    result = 
      case is of
        True -> walkTillr [x] l c $ Just (a, b) 
        False -> walkTillr xs l c $ Just (_a, _b)
