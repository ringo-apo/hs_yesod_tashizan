{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.Mirror where

import Import
import Data.Text (Text)
import Prelude hiding (getLine, putStrLn)
import Data.Text

conv :: Text -> Int
conv text = read $ Data.Text.unpack text

getMirrorR :: Handler Html
getMirrorR = defaultLayout $(widgetFile "mirror")

postMirrorR :: Handler Html
postMirrorR =  do
        t1 <- runInputPost $ ireq textField "content"
        let ai = conv t1

        bs <- runInputPost $ ireq textField "content2"
        let bi = conv bs

        let ci = ai + bi
        let postedText = ci
        defaultLayout $(widgetFile "posted")
