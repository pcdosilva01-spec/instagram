@echo off
set /p repo="Digite a URL do repositorio GitHub: "
git remote add origin %repo%
git push -u origin main
pause
