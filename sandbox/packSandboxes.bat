@echo off

SET FileBank="Path\To\FileBank.exe"
SET DataDir="Path\To\Sandbox\Content\Folder\From\Git"
SET MissionsFolder="Path\To\Where\Sandbox\Maps\Are"
SET OutputDir="Path\Where\Pbos\Should\Go"

:: _________________________________________________________

echo [[ Welcome to TFTSandbox packing tool ]]
echo|set /p=--- Checking input data:

IF NOT EXIST %FileBank% (
    echo Error: FileBank not found!
    echo.
    echo Press "ENTER" to exit
    PAUSE
    EXIT
)
IF NOT EXIST %DataDir% (
    echo Error: Could not find data directory!
    echo.
    echo Press "ENTER" to exit
    PAUSE
    EXIT
)
IF NOT EXIST %MissionsFolder% (
    echo Error: Could not find missions folder!
    echo.
    echo Press "ENTER" to exit
    PAUSE
    EXIT
)
IF NOT EXIST %OutputDir% (
    echo Error: Output directory does not exist
    echo.
    echo Press "ENTER" to exit
    PAUSE
    EXIT
)

echo  OK
echo.

SET Overwrite=/-Y
SET OverwriteDisp=n
SET /p OverwriteDisp="Overwrite files if necessary? [y/N] "
IF %OverwriteDisp% == y SET Overwrite=/Y

echo --- Moving files and folders ---
echo     (Except of mission.sqm)
echo.

SET AnythingToDo=no
FOR /d %%d IN (%MissionsFolder%\TFTSandbox.*) DO (
    SET AnythingToDo=yes
    ROBOCOPY %DataDir% "%%d" /S /XF mission.sqm
)
IF %AnythingToDo% == no (
    echo No TFTSandbox folders found in %MissionsFolder%. Aborting
    echo.
    echo Press "ENTER" to exit
    PAUSE
    EXIT
)

echo.
echo|set /p=--- Packing missions...

FOR /d %%d IN (%MissionsFolder%\TFTSandbox.*) DO (
    %FileBank% -dst %OutputDir% "%%d"
)

echo  DONE
echo Press "ENTER" to exit
PAUSE
