module Paths_wc (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/sam/scm/wc/.cabal-sandbox/bin"
libdir     = "/Users/sam/scm/wc/.cabal-sandbox/lib/x86_64-osx-ghc-7.6.3/wc-0.1.0.0"
datadir    = "/Users/sam/scm/wc/.cabal-sandbox/share/x86_64-osx-ghc-7.6.3/wc-0.1.0.0"
libexecdir = "/Users/sam/scm/wc/.cabal-sandbox/libexec"
sysconfdir = "/Users/sam/scm/wc/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "wc_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "wc_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "wc_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "wc_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "wc_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
