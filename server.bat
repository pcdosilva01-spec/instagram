@echo off
echo ========================================
echo    SERVIDOR INSTAGRAM CLONE
echo ========================================
echo.
echo Obtendo seu IP local...
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do set IP=%%a
set IP=%IP:~1%
echo.
echo Servidor iniciado!
echo.
echo Acesse localmente: http://localhost:8000
echo Acesse da rede: http://%IP%:8000
echo.
echo Compartilhe o link da rede com outras pessoas!
echo Pressione Ctrl+C para parar o servidor
echo ========================================
echo.
python -m http.server 8000
pause
