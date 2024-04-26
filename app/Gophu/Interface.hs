module Gophu.Interface (handleArgs) where

data Arg = Flag String | URI String deriving Show

isURI :: Arg -> Bool
isURI (Flag _) = False
isURI (URI _)  = True

-- It's not pretty, but it works. Don't nerdsnipe yourself, not yet.
-- There will always be time for refactoring later.
handleArgs :: [String] -> [Arg]
handleArgs = either error id . validateArgs . parseArgs

parseArgs :: [String] -> [Arg]
parseArgs = map argparser
  where
    argparser :: String -> Arg
    argparser "" = error "empty arg?"
    argparser arg@(c:s)
      -- This flag parsing is obviously flawed, but I'll revisit it when I
      -- begin to work with flags proper.
      -- Use `turtle`?
      | c == '-' = Flag s
      | otherwise = URI arg

validateArgs :: [Arg] -> Either String [Arg]
validateArgs args
  | length (filter isURI args) == 1 = Right args
  | any isURI args                  = Left "Too many URIs provided"
  | otherwise                       = Left "No URI was provided"
