@echo off
title Virtual Company - log in the company brain
setlocal

rem Find the Claude Code program that came with the Claude desktop app.
set "CLAUDE="
for /f "delims=" %%f in ('dir /b /s /o-d "%APPDATA%\Claude\claude-code\claude.exe" 2^>nul') do if not defined CLAUDE set "CLAUDE=%%f"
if not defined CLAUDE for /f "delims=" %%f in ('where claude 2^>nul') do if not defined CLAUDE set "CLAUDE=%%f"
if not defined CLAUDE (
  echo Claude Code was not found on this PC. Open the Claude desktop app once, then run this file again.
  pause
  exit /b 1
)

echo This logs in the real brain of your company (Claude Code) with your own Claude account.
echo A browser page opens. Sign in there and allow access, then come back to this window.
echo.
"%CLAUDE%" auth login
echo.
echo Checking the login...
"%CLAUDE%" auth status
echo.
echo If you see  "loggedIn": true  above, it worked. Refresh the dashboard; the red warning disappears.
pause
