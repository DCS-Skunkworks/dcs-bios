REM Specify the number of the COM port your Arduino is connected to:

set COMPORT=5



set /A TTYNUM=%COMPORT%-1
mode COM%COMPORT% BAUD=250000 PARITY=N DATA=8 STOP=1 TO=off DTR=on
socat\socat -v UDP4-RECV:5010,ip-add-membership=239.255.50.10:127.0.0.1,reuseaddr!!udp-sendto:localhost:7778 /dev/ttyS%TTYNUM%

pause
