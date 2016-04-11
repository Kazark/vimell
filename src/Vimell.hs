{-# LANGUAGE OverloadedStrings #-}

module Vimell where

import Control.Monad.Writer
import qualified Data.Text.Lazy as T
import qualified Data.Text.Format as TF

type WriteVimL = Writer T.Text

class Textable a where
    toText :: a -> T.Text

instance Textable T.Text where
    toText text = text

data Expression a =
    Literal a

echo :: Textable a => Expression a -> WriteVimL ()
echo (Literal text) =
    let viml = TF.format "echo \"{}\"\n" $ TF.Only $ toText text
    in writer ((), viml)

echoL :: T.Text -> WriteVimL()
echoL = echo . Literal

helloVimL :: WriteVimL ()
helloVimL = do
    echoL "Hello, VimL!"
    echoL "Hello, Vimell!"
