module Main(main) where

import System.Environment
import Data.Maybe
--import Data.Map (Map)
--import qualified Data.Map as Map

--options :: Map Char (String -> Int)
--options = Map.fromList[
--	('c',charCount),
--	('l',lineCount),
--	('w',wordCount)]

main :: IO ()
main = do
	args <- getArgs
	case listToMaybe args of
		Nothing -> interact $ compose [charCount, lineCount, wordCount]
		Just "-c" -> interact $ compose [charCount]
		Just "-l" -> interact $ compose [lineCount]
		Just "-w" -> interact $ compose [wordCount]
		_ -> usage

usage :: IO ()
usage = putStrLn "Usage: wc [-clw] [file,...]"

compose :: [String -> Int] -> String -> String
compose [] xs = show (wordCount xs) ++ "\n"
compose args xs = concatMap (\f -> show f ++ "\t") os ++ "\n"
	where os = map ($ xs) args

charCount :: String -> Int
charCount = length

lineCount :: String -> Int
lineCount xs = length $ lines xs

wordCount :: String -> Int
wordCount xs = length $ words xs

