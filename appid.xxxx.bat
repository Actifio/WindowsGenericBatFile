@echo off
REM Don't remove the echo off above or the UDSAgent.log will get silly comments


REM THE SECTION BELOW CAN BE USED TO STORE VARIABLES.   The examples are for max DB.  Delete this section if not needed
@set DATABASE=MaxDB
@set USERNAME=DBADMIN
@set PASSWORD=Passw0rd9
@set "PATH=C:\Program Files"
REM THE SECTION ABOVE NEEDS CUSTOMIZATION

REM  This is where the script is driven by the connector supplying one parm,   you can use this for testing the script
set TASK=%1
if %TASK% equ init goto :handle_init
if %TASK% equ fini goto :handle_fini
if %TASK% equ freeze goto :handle_freeze
if %TASK% equ thaw goto :handle_thaw
if %TASK% equ abort goto :handle_abort
echo Invalid task was given for the script to run, use init, fini, freeze, thaw or abort
goto :dirtyexit

:handle_init
echo Got an init command.  Nothing to do
goto :cleanexit

:handle_fini
echo Got an fini command.  Nothing to do
goto :cleanexit

:handle_freeze
echo ------------------------------------------ 
echo Got an freeze command.  Nothing to do
IF %ERRORLEVEL% EQU 0 GOTO cleanexit
exit /B 1

:handle_thaw
echo ------------------------------------------ 
echo Got a thaw command.  Nothing to do
IF %ERRORLEVEL% EQU 0 GOTO cleanexit
exit /B 1


:handle_abort
echo ------------------------------------------ 
echo Got an abort command, this should be the same as thaw contents
IF %ERRORLEVEL% EQU 0 GOTO cleanexit
exit /B 1

:cleanexit
exit /B 0

:dirtyexit
exit /B 1
