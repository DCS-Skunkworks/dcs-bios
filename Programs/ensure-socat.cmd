@echo off
REM This serves to help new users/installer unpack socat correctly.

if not EXIST socat\socat.exe (
	echo Socat not found.  Extracting...
	tar -xf ./socat/WIN_socat-1.7.4.4-64bit.zip
)

if NOT EXIST socat\socat.exe CANCEL