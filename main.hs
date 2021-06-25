import WalkTill (walkTill)
import Test (test, _error)

main :: IO()
main = do
  let as = "abcde"
  test as 'a' (0, 0) $ walkTill as 'a'
  test as 'b' (1, 1) $ walkTill as 'b'
  test as 'c' (2, 2) $ walkTill as 'c'
  test as 'd' (3, 3) $ walkTill as 'd'
  test as 'e' (4, 4) $ walkTill as 'e'
  let a = (walkTill as 'f')
  case a of
    Nothing -> putStr ""
    Just (_, _) -> _error as ' ' (0, 0) a
