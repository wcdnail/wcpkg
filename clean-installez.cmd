@echo off & setlocal

for /f "tokens=1*" %%a in ('vcpkg list') do (
    echo Removing: %%a
    vcpkg remove %%a --recurse
)
