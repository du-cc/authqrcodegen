@echo off
:main
cls
title noob generator
echo 2 Factor Authenticator QR Code Generator
echo.
echo Generator options:
echo 1. Random
echo 2, Custom
echo.
set /p e=^> 
if %e% == 1 goto r
if %e% == 2 goto c
echo Invalid!
timeout /t 001 /nobreak >nul
goto main

:r
cls
echo Generator options: Random
echo.
set "url=https://www.google.com/chart?chs=200x200^&chld=M^|0^&cht=qr^&chl=otpauth://totp/%random%?secret=JBSWY3DPEHPK3PXP^&issuer=Example"
echo Redirecting...
start %url%
echo URL: %url%
echo.
echo Press any key to quit...
pause >nul
exit /b

:c
cls
echo Generator option: Custom
set /p name=Name of the QR code: 
if not defined name (
    echo Enter a name!
    timeout /t 001 /nobreak >nul
    goto c
)
echo.
set /p issuer=Issuer of the QR code (idk what is this): 
if not defined issuer (
    echo Enter an issuer!
    timeout /t 001 /nobreak >nul
    goto c
)
set "url=https://www.google.com/chart?chs=200x200&chld=M|0&cht=qr&chl=otpauth://totp/%name%?secret=JBSWY3DPEHPK3PXP&issuer=%issuer%"
set "urle= https://www.google.com/chart?chs=200x200^&chld=M^|0^&cht=qr^&chl=otpauth://totp/%name%?secret=JBSWY3DPEHPK3PXP^&issuer=%issuer%"
echo Redirecting...
start "" "%url%"
echo Url: %urle%
echo.
echo Press any key to quit...
pause >nul
exit /b