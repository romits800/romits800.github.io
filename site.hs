--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "publications/*" $ do
        route   idRoute
        compile copyFileCompiler


    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match (fromList ["about.markdown", "contact.markdown", "teaching.markdown", "publications.markdown", "activities.markdown"] ) $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

--     match "index.html" $ do
--         route idRoute
--         compile $ do
--             posts <- recentFirst =<< loadAll "posts/*"
--             let indexCtx =
--                     listField "posts" postCtx (return posts) `mappend`
--                     constField "title" "Home"                `mappend`
--                     defaultContext
-- 
--             getResourceBody
--                 >>= applyAsTemplate indexCtx
--                 >>= loadAndApplyTemplate "templates/default.html" indexCtx
--                 >>= relativizeUrls


    match "index.html" $ do
        route idRoute
        compile $ do
            getResourceBody
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext
