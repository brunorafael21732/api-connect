# Script de Setup Automático - API Connect
# Execute com: powershell -ExecutionPolicy Bypass -File setup.ps1

Write-Host ""
Write-Host "====================================" -ForegroundColor Cyan
Write-Host "  API Connect - Setup Automático" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Conteúdo do package.json
$packageJsonContent = @{
    name = "api-connect"
    version = "1.0.0"
    description = "API simples para teste de endpoints"
    main = "server.js"
    scripts = @{
        start = "node server.js"
        dev = "node server.js"
    }
    keywords = @("api", "express", "users")
    author = ""
    license = "ISC"
    dependencies = @{
        express = "^4.18.2"
        "body-parser" = "^1.20.2"
    }
} | ConvertTo-Json

# Criar package.json
Write-Host "Criando package.json..." -ForegroundColor Yellow
$packageJsonContent | Out-File -FilePath "package.json" -Encoding UTF8

if (Test-Path "package.json") {
    Write-Host "✓ package.json criado com sucesso" -ForegroundColor Green
} else {
    Write-Host "✗ Erro ao criar package.json" -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit
}

Write-Host ""
Write-Host "Instalando dependências (Express e Body-Parser)..." -ForegroundColor Yellow
Write-Host "Aguarde... isso pode levar alguns minutos." -ForegroundColor Gray
Write-Host ""

npm install

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Dependências instaladas com sucesso" -ForegroundColor Green
} else {
    Write-Host "✗ Erro ao instalar dependências" -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit
}

Write-Host ""
Write-Host "====================================" -ForegroundColor Cyan
Write-Host "  Setup Concluído!" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "A API está pronta para ser inicializada." -ForegroundColor Green
Write-Host ""
Write-Host "Para iniciar o servidor, execute:" -ForegroundColor Yellow
Write-Host "  npm start" -ForegroundColor Cyan
Write-Host ""
Write-Host "Pressione Enter para iniciar o servidor agora:" -ForegroundColor Yellow
Read-Host

Write-Host ""
Write-Host "Iniciando servidor em http://localhost:3000..." -ForegroundColor Cyan
Write-Host "Pressione Ctrl+C para parar o servidor." -ForegroundColor Yellow
Write-Host ""

npm start
