@echo off
REM Specify the COM port number to connect to in the following line.
REM If set to the default value of ASK, the script will ask you to type it in each time.
set COMPORT=ASK

REM Set PROTOCOL to "TCP" if UDP does not work for you. When using TCP,
REM you have to start the script after you have started the mission and the simulation
REM has been unpaused, otherwise the connection will fail ("Connection refused").
set PROTOCOL=UDP

set VERBOSE=-v
set MODE_OUTPUT_REDIR=CON
if "%1" == "/Q" (
	set VERBOSE=
	set MODE_OUTPUT_REDIR=NUL
	shift
)

if not "%1" == "" set COMPORT=%1
if "%COMPORT%" == "ASK" set /p COMPORT=Enter a COM Port Number:

set /A TTYNUM=%COMPORT%-1
if "%MODE_OUTPUT_REDIR%" == "NUL" echo Connecting to COM port %COMPORT%
mode COM%COMPORT% BAUD=250000 PARITY=N DATA=8 STOP=1 TO=off DTR=off > %MODE_OUTPUT_REDIR%
timeout 2
if "%PROTOCOL%" == "UDP" socat\socat %VERBOSE% UDP4-RECV:5010,ip-add-membership=239.255.50.10:0.0.0.0,reuseaddr!!udp-sendto:localhost:7778 /dev/ttyS%TTYNUM%
if "%PROTOCOL%" == "TCP" socat\socat %VERBOSE% TCP4-CONNECT:127.0.0.1:7778 /dev/ttyS%TTYNUM%


pause
