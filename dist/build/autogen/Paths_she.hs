module Paths_she (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,6], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "C:\\Haskell\\bin"
libdir     = "C:\\Haskell\\she-0.6\\ghc-7.6.3"
datadir    = "C:\\Haskell\\she-0.6"
libexecdir = "C:\\Haskell\\she-0.6"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "she_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "she_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "she_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "she_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
