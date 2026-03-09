@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Solicitando privilegios de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

echo ========================================
echo   LIBERANDO FIREWALL
echo ========================================
echo.

netsh advfirewall firewall delete rule name="Instagram Clone Server" >nul 2>&1
netsh advfirewall firewall add rule name="Instagram Clone Server" dir=in action=allow protocol=TCP localport=80

echo Firewall configurado!
echo Porta 80 liberada para conexoes externas.
echo.
pause
