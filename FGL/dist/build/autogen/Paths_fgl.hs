{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_fgl (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [5,7,0,3] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/usr/local/bin"
libdir     = "/usr/local/lib/x86_64-linux-ghc-8.6.5/fgl-5.7.0.3-6ccCmgBPGh1GU9abXQtAa5"
dynlibdir  = "/usr/local/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/usr/local/share/x86_64-linux-ghc-8.6.5/fgl-5.7.0.3"
libexecdir = "/usr/local/libexec/x86_64-linux-ghc-8.6.5/fgl-5.7.0.3"
sysconfdir = "/usr/local/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "fgl_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "fgl_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "fgl_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "fgl_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "fgl_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "fgl_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
