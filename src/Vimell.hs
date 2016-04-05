{-# LANGUAGE OverloadedStrings #-}

module Vimell where

import Control.Monad.Writer
import qualified Data.Text as T

type VimL = Writer T.Text

echo :: T.Text -> VimL ()
echo text =
    -- TODO use text-format package for formatting VimL strings
    -- http://hackage.haskell.org/package/text-format
    let viml = T.append "echo \"" $ T.append text "\"\n"
    in writer ((), viml)

helloVimL :: VimL ()
helloVimL = do
    echo "Hello, VimL!"
    echo "Hello, Vimell!"
