@echo off

::https://mikero.bytex.digital/Downloads
SET PathMakePbo="C:\Program Files (x86)\Mikero\DePboTools\bin\MakePbo.exe"

::copyToClipboard ((("true" configClasses (configFile >> "CfgWorldList")) apply {configName _x}) joinString " ")
SET SandBoxMaps=(Stratis kerama Catalina Altis intro sara saralite utes sara_dbe1 fallujah chernarus chernarus_summer porto takistan zargabad reshmaan Caribou Mountains_ACR Woodland_ACR Bootcamp_ACR Desert_E ProvingGrounds_PMC Shapur_BAF mbg_celle2 VR bozcaada isladuala3 lingor3 Tanoa Chernarus_Winter dingor lythium Malden WL_Rosche tem_kujari vt7 Enoch)

:: _________________________________________________________

echo [[ Welcome to TFTSandbox packing tool ]]
echo|set /p=--- Checking input data:

IF NOT EXIST "sandbox.VR" (
    echo Error: Template folder sandbox.VR not found!
    echo.
    echo Press "ENTER" to exit
    PAUSE
    EXIT
)

IF NOT EXIST %PathMakePbo% (
    echo Error: MakePbo not found!
    echo.
    echo Press "ENTER" to exit
    PAUSE
    EXIT
)

echo  OK
echo.

echo.
echo|set /p=--- Packing missions...

FOR %%m IN %SandBoxMaps% DO (
    %PathMakePbo% -B -P sandbox.VR TFT8_Sandbox.%%m
)

echo DONE
PAUSE
