@echo off
set AWS_REGION=eu-west-1
rem set AWS_DEFAULT_REGION=%AWS_REGION%

if "%1"=="" (
    call :awsProfiles
    goto EOF
    )

if "%1"=="profiles" (
    call :awsProfiles
    goto EOF
    )

if "%1"=="unset" (
    call :cleanup
    goto EOF
    )

if "%1"=="clear" (
    call :cleanup
    goto EOF
    )

if "%1"=="whoami" (
    call :awsWhoami
    goto EOF
    )

if "%1"=="/?" (
    call :usage
    goto EOF
    )

goto setEnv

:usage
echo Usage:
echo   awsprofile
echo    or
echo   awsprofile profiles
echo    - list configured profiles 
echo.
echo   awsprofile ^<profileName^> ^[regionName^]
echo    - set profile and optional region
echo.
echo   awsprofile clear ^| unset
echo    - clear AWS Environment Vars
echo.
echo   awsprofile whoami
echo    - show AWS Environment Vars
echo.
goto EOF

:awsWhoami
echo AWS Environment Vars:
echo ---------------------
echo.
set | findstr /B /i "aws"
echo.
goto EOF

:echoEnv
echo Using AWS profile %AWS_DEFAULT_PROFILE% in region %AWS_DEFAULT_REGION%
echo.
goto EOF

:awsProfiles
set string=
echo AWS CLI Profiles:
echo -----------------
echo.
setlocal enabledelayedexpansion
for /F "delims=" %%G IN ('type %HOME%\.aws\config ^| findstr /B ^"[^"') DO (
    set str=%%G
    set str=!str: =!
    set str=!str:[=!
    set str=!str:]=!
    echo !str!
    )
echo.
goto EOF


:cleanup
rem echo on
echo clearing AWS CLI Environment Vars
echo ---------------------------------
echo.
set AWS_PROFILE=""
set AWS_DEFAULT_PROFILE=""
set AWS_REGION=""
set AWS_DEFAULT_REGION=""
@echo off
echo.
goto EOF

:setEnv
rem echo on
set AWS_PROFILE=%1
set AWS_DEFAULT_PROFILE=%AWS_PROFILE%
if not "%2"=="" (
    set AWS_REGION=%2
    )
set AWS_DEFAULT_REGION=%AWS_REGION%
@echo off
echo.
call :awsWhoami
goto EOF

:EOF
EXIT /B 0
