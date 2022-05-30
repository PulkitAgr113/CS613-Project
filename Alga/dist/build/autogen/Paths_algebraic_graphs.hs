{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_algebraic_graphs (
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
version = Version [0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/usr/local/bin"
libdir     = "/usr/local/lib/x86_64-linux-ghc-8.6.5/algebraic-graphs-0.6-3ZIepFa9cnJAUjsZYyPJi4"
dynlibdir  = "/usr/local/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/usr/local/share/x86_64-linux-ghc-8.6.5/algebraic-graphs-0.6"
libexecdir = "/usr/local/libexec/x86_64-linux-ghc-8.6.5/algebraic-graphs-0.6"
sysconfdir = "/usr/local/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "algebraic_graphs_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "algebraic_graphs_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "algebraic_graphs_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "algebraic_graphs_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "algebraic_graphs_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "algebraic_graphs_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
