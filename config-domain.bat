@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Solicitando privilegios de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

echo ========================================
echo   CONFIGURAR DOMINIO FALSO
echo ========================================
echo.
echo Adicionando "instagran.com" ao arquivo hosts...
echo.

findstr /C:"instagran.com" C:\Windows\System32\drivers\etc\hosts >nul
if %errorLevel% equ 0 (
    echo Dominio ja configurado!
) else (
    echo 127.0.0.1 instagran.com >> C:\Windows\System32\drivers\etc\hosts
    echo Dominio configurado com sucesso!
)

echo.
echo Agora execute server.bat e acesse: http://instagran.com:8000/login
echo.
pause
