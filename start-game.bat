@echo off

title Toontown Stride Game Launcher

echo Choose your connection method!
echo.
echo #1 - Singleplayer
echo #2 - Multiplayer
echo.

:selection

set INPUT=-1
set /P INPUT=Selection: 

if %INPUT%==1 (
    set TTS_GAMESERVER=127.0.0.1
) else if %INPUT%==2 (
    echo.
    set /P TTS_GAMESERVER=Gameserver: 
) else (
	goto selection
)

echo.

if %INPUT%==2 (
    set /P ttsUsername="Username: "
    set /P ttsPassword="Password: "
) else (
    set /P TTS_PLAYCOOKIE=Username: 
)

echo.

echo ===============================
echo Starting Toontown Stride...
echo ppython: "dependencies\panda\Panda3D-1.10.0-x64/python/ppython.exe"

if %INPUT%==2 (
    echo Username: %ttsUsername%
) else if %INPUT%==4 (
    echo Username: %ttsUsername%
) else (
    echo Username: %TTS_PLAYCOOKIE%
)

echo Gameserver: %TTS_GAMESERVER%
echo ===============================

:main
if %INPUT%==2 (
    "dependencies\panda\Panda3D-1.10.0-x64/python/ppython.exe" -m toontown.toonbase.ToontownStart
) else if %INPUT%==1 (
	start win32\bulk_ai.bat
	start win32\bulk_ast.bat
	start win32\bulk_ud.bat
	"dependencies\panda\Panda3D-1.10.0-x64/python/ppython.exe" -m toontown.toonbase.ToontownStart
) else (
    "dependencies\panda\Panda3D-1.10.0-x64/python/ppython.exe" -m toontown.toonbase.ToontownStart
)
pause

goto main
