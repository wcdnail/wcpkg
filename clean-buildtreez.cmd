@echo off

echo Clean VCPKG buildtrees directory: %VCPKG_ROOT%

rem FORFILES /P "%VCPKG_ROOT%\buildtrees" /S /M x64-windows* /C "cmd /c echo @path"

setlocal
setlocal enabledelayedexpansion
@echo off
for /d /r "%VCPKG_ROOT%\buildtrees" %%i in (x64-windows*) do (
  set _dir=%%i
  echo Removing !_dir! ...
  @echo on
  rd /S /Q !_dir!
  @echo off
)
endlocal

