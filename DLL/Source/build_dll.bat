@echo off
cl.exe /LD /Fe:DataValidator.dll data_validator.cpp /link /MACHINE:X64
if %errorlevel% == 0 (
  echo SUCCESS: DataValidator.dll built
) else (
  echo ERROR: Build failed

)
