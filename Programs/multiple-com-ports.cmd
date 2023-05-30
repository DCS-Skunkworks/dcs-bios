@echo off
REM The COMPORTS variable should be set to a space-separated list of COM port numbers:
set COMPORTS=4 3

for %%i in (%COMPORTS%) do start /b cmd /c connect-serial-port.cmd /Q %%i