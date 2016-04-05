module Main where

import Control.Monad.Writer
import Vimell
import qualified Data.Text.IO as TIO

main :: IO ()
main =
    TIO.putStr $ execWriter helloVimL
