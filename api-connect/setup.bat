@echo off
REM Script de Setup Automático - API Connect
REM Este script fará todo o setup necessário

echo.
echo ====================================
echo   API Connect - Setup Automático
echo ====================================
echo.

REM Criar package.json
echo Criando package.json...
(
  echo {
  echo   "name": "api-connect",
  echo   "version": "1.0.0",
  echo   "description": "API simples para teste de endpoints",
  echo   "main": "server.js",
  echo   "scripts": {
  echo     "start": "node server.js",
  echo     "dev": "node server.js"
  echo   },
  echo   "keywords": ["api", "express", "users"],
  echo   "author": "",
  echo   "license": "ISC",
  echo   "dependencies": {
  echo     "express": "^4.18.2",
  echo     "body-parser": "^1.20.2"
  echo   }
  echo }
) > package.json

if exist package.json (
  echo ✓ package.json criado com sucesso
) else (
  echo ✗ Erro ao criar package.json
  pause
  exit /b 1
)

echo.
echo Instalando dependências (Express e Body-Parser)...
echo Aguarde... isso pode levar alguns minutos.
echo.

call npm install

if %errorlevel% equ 0 (
  echo ✓ Dependências instaladas com sucesso
) else (
  echo ✗ Erro ao instalar dependências
  pause
  exit /b 1
)

echo.
echo ====================================
echo   Setup Concluído!
echo ====================================
echo.
echo A API está pronta para ser inicializada.
echo.
echo Para iniciar o servidor, execute:
echo   npm start
echo.
echo Ou deixe este script rodar e pressione uma tecla para iniciar:
echo.
pause

echo.
echo Iniciando servidor em http://localhost:3000...
echo Pressione Ctrl+C para parar o servidor.
echo.

npm start
