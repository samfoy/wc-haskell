import System.Environment
import qualified Data.Map as Map

options :: Map.Map Char (String -> Int)
options = Map.fromList[
	('c',charCount),
	('l',lineCount),
	('w',wordCount)]

main :: IO ()
main = do
	args <- getArgs
	if null args
		then interact $ compose [charCount, lineCount, wordCount]
	else
		case head args of
			"-c" -> interact $ anyCount charCount
			"-l" -> interact $ anyCount lineCount
			"-w" -> interact $ anyCount wordCount
			_ -> usage

usage :: IO ()
usage = putStrLn "Usage: WC [-clw]"

compose :: [String -> Int] -> String -> String
compose [] xs = show (wordCount xs) ++ "\n"
compose args xs = concatMap (\f -> show f ++ "\t") os ++ "\n"
	where os = map ($ xs) args

anyCount :: (String -> Int) -> String -> String
anyCount f s = show (f s) ++ "\n"

charCount :: String -> Int
charCount = length

lineCount :: String -> Int
lineCount xs = length $ lines xs

wordCount :: String -> Int
wordCount xs = length $ words xs

