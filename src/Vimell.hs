{-# LANGUAGE OverloadedStrings #-}

module Vimell where

import Control.Monad.Writer
import qualified Data.Text.Lazy as T
import qualified Data.Text.Format as TF

type WriteVimL = Writer T.Text

echo :: T.Text -> WriteVimL ()
echo text =
    let viml = TF.format "echo \"{}\"\n" $ TF.Only text
    in writer ((), viml)

helloVimL :: WriteVimL ()
helloVimL = do
    echo "Hello, VimL!"
    echo "Hello, Vimell!"
