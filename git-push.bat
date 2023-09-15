@echo off

REM Set date for the log files
set str=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%

REM Navigate to the directory containing local repo
D: 
cd /software_engineering/TBRIDGE/SAVA_FIELD_APP_DB

REM Push with git command
git push

REM Check if changes pushed succeeded and log 
if %errorlevel%==0 (
cd logs/success
echo LOG ENTRY >>%str%.txt
echo. >>%str%.txt
echo MESSAGE: Backup Changes Pushed Succesfully >>%str%.txt
echo DATE: %date% >>%str%.txt
echo TIME: %TIME% >>%str%.txt
echo. >>%str%.txt
)

REM Check if changes pushed failed and log
if %errorlevel%==128 (
cd logs/failed
echo LOG ENTRY >>%str%.txt
echo. >>%str%.txt
echo MESSAGE: Failed to Push Backup changes To Remote Repository >>%str%.txt
echo DATE: %date% >>%str%.txt
echo TIME: %TIME% >>%str%.txt
echo. >>%str%.txt
pause
)
