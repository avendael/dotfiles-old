import XMonad
import XMonad.Core

import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Man

import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.SetWMName

import XMonad.Util.EZConfig
import XMonad.Util.Run
import Graphics.X11.Xlib
import qualified Data.Map as M
import System.IO

main = do
   myStatusBarPipe <- spawnPipe myStatusBar
   conkyBar <- spawnPipe myConkyBar
   xmonad $ myUrgencyHook $ defaultConfig
      { terminal = "urxvt"
      , normalBorderColor  = myInactiveBorderColor
      , focusedBorderColor = myActiveBorderColor
      , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
      , layoutHook = avoidStruts $ myLayoutHook
      , startupHook = setWMName "LG3D"
      , logHook = dynamicLogWithPP $ myDzenPP myStatusBarPipe
      , modMask = mod4Mask
      , keys = myKeys
      , workspaces = myWorkspaces
     }

-- Paths
myBitmapsPath = "/home/avendael/.dzen/bitmaps/"

-- Font
myFont = "-*-terminus-*-*-*-*-12-*-*-*-*-*-iso8859-*"

-- Colors
myBgBgColor = "black"
myFgColor = "gray80"
myBgColor = "gray20"
myHighlightedFgColor = "white"
myHighlightedBgColor = "gray40"

myActiveBorderColor = "gray80"
myInactiveBorderColor = "gray20"

myCurrentWsFgColor = "white"
myCurrentWsBgColor = "gray40"
myVisibleWsFgColor = "gray80"
myVisibleWsBgColor = "gray20"
myHiddenWsFgColor = "gray80"
myHiddenEmptyWsFgColor = "gray50"
myUrgentWsBgColor = "brown"
myTitleFgColor = "white"

myUrgencyHintFgColor = "white"
myUrgencyHintBgColor = "brown"

-- dzen general options
myDzenGenOpts = "-fg '" ++ myFgColor ++ "' -bg '" ++ myBgColor ++ "' -fn '" ++ myFont ++ "' -h '16'"

-- Status Bar
myStatusBar = "dzen2 -w 665 -ta l " ++ myDzenGenOpts

-- Conky Bar
myConkyBar = "conky -c ~/.conky_bar | dzen2 -x 660 -w 365 " ++ myDzenGenOpts

-- Layouts
myLayoutHook = smartBorders $ (tiled ||| Mirror tiled ||| Full)
  where
    tiled = ResizableTall nmaster delta ratio []
    nmaster = 1
    delta = 3/100
    ratio = 1/2

-- Workspaces
myWorkspaces =
   [
      wrapBitmap "sm4tik/arch_10x10.xbm",
      wrapBitmap "sm4tik/fox.xbm",
      wrapBitmap "sm4tik/dish.xbm",
      wrapBitmap "sm4tik/cat.xbm",
      wrapBitmap "sm4tik/empty.xbm",
      wrapBitmap "sm4tik/shroom.xbm",
      wrapBitmap "sm4tik/bug_02.xbm",
      wrapBitmap "sm4tik/eye_l.xbm",
      wrapBitmap "sm4tik/eye_r.xbm"
   ]
   where
      wrapBitmap bitmap = "^p(5)^i(" ++ myBitmapsPath ++ bitmap ++ ")^p(5)"

-- Urgency hint configuration
myUrgencyHook = withUrgencyHook dzenUrgencyHook
    {
      args = [
         "-x", "0", "-y", "576", "-h", "15", "-w", "1024",
         "-ta", "r",
         "-fg", "" ++ myUrgencyHintFgColor ++ "",
         "-bg", "" ++ myUrgencyHintBgColor ++ ""
         ]
    }

myManageHook = composeAll
   [ className =? "Gimp" --> doFloat ]

-- Prompt config
myXPConfig = defaultXPConfig {
  position = Bottom,
  promptBorderWidth = 0,
  height = 15,
  bgColor = myBgColor,
  fgColor = myFgColor,
  fgHLight = myHighlightedFgColor,
  bgHLight = myHighlightedBgColor
  }

-- Union default and new key bindings
myKeys x  = M.union (M.fromList (newKeys x)) (keys defaultConfig x)

-- Add new and/or redefine key bindings
newKeys conf@(XConfig {XMonad.modMask = modm}) = [
  -- Use shellPrompt instead of default dmenu
  ((modm, xK_p), shellPrompt myXPConfig),
  -- Do not leave useless conky, dzen and xxkb after restart
  ((modm, xK_q), spawn "killall conky dzen2 xxkb; xmonad --recompile; xmonad --restart")
   ]

-- Dzen config
myDzenPP h = defaultPP {
  ppOutput = hPutStrLn h,
  ppSep = "^bg(" ++ myBgBgColor ++ ")^r(1,15)^bg()",
  ppWsSep = "",
  ppCurrent = wrapFgBg myCurrentWsFgColor myCurrentWsBgColor,
  ppVisible = wrapFgBg myVisibleWsFgColor myVisibleWsBgColor,
  ppHidden = wrapFg myHiddenWsFgColor,
  ppHiddenNoWindows = wrapFg myHiddenEmptyWsFgColor,
  ppUrgent = wrapBg myUrgentWsBgColor,
  ppTitle = (\x -> " " ++ wrapFg myTitleFgColor x),
  ppLayout  = dzenColor myFgColor"" .
                (\x -> case x of
                    "ResizableTall" -> wrapBitmap "rob/tall.xbm"
                    "Mirror ResizableTall" -> wrapBitmap "rob/mtall.xbm"
                    "Full" -> wrapBitmap "rob/full.xbm"
                )
  }
  where
    wrapFgBg fgColor bgColor content= wrap ("^fg(" ++ fgColor ++ ")^bg(" ++ bgColor ++ ")") "^fg()^bg()" content
    wrapFg color content = wrap ("^fg(" ++ color ++ ")") "^fg()" content
    wrapBg color content = wrap ("^bg(" ++ color ++ ")") "^bg()" content
    wrapBitmap bitmap = "^p(5)^i(" ++ myBitmapsPath ++ bitmap ++ ")^p(5)"