@echo off
echo ========================================
echo   DIAGNOSTICO DE REDE
echo ========================================
echo.
echo Seu IP:
ipconfig | findstr /c:"IPv4"
echo.
echo Testando se a porta 80 esta aberta...
netstat -an | findstr :80
echo.
echo Regras do firewall:
netsh advfirewall firewall show rule name="Instagram Clone Server"
echo.
echo ========================================
echo.
echo Seu amigo esta na mesma rede Wi-Fi?
echo Ele consegue pingar seu IP?
echo.
pause
