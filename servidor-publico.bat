@echo off
echo ========================================
echo   SERVIDOR COM ACESSO PELA INTERNET
echo ========================================
echo.
echo Baixe o ngrok em: https://ngrok.com/download
echo Extraia o ngrok.exe nesta pasta
echo.
echo Depois execute este bat novamente
echo.
pause

if not exist ngrok.exe (
    echo ERRO: ngrok.exe nao encontrado!
    echo Baixe em https://ngrok.com/download
    pause
    exit
)

echo.
echo Iniciando servidor local...
start /min python -m http.server 80 --bind 0.0.0.0

timeout /t 3 >nul

echo Criando tunel publico...
echo.
echo ========================================
echo COMPARTILHE O LINK QUE APARECER ABAIXO:
echo ========================================
echo.
ngrok http 80
