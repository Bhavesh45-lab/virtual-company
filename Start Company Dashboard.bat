@echo off
title Virtual Company Dashboard
cd /d "%~dp0"

rem Stop an older copy of the dashboard so the newest version starts.
for /f "tokens=5" %%p in ('netstat -ano ^| findstr /r /c:":8765 .*LISTENING"') do taskkill /F /PID %%p >nul 2>&1

echo Starting the company dashboard...
echo Keep this window open while you use the dashboard. Close it to stop.
echo.
python server.py
pause
