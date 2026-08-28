# Setup da API Connect

## Pré-requisitos
- Node.js instalado (v14 ou superior)
- npm ou yarn

## Instalação

1. Abra o terminal na pasta do projeto:
```bash
cd c:\Users\HP\OneDrive\Desktop\api-connect
```

2. Crie o arquivo package.json com o seguinte conteúdo:
```json
{
  "name": "api-connect",
  "version": "1.0.0",
  "description": "API simples para teste de endpoints",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "node server.js"
  },
  "dependencies": {
    "express": "^4.18.2",
    "body-parser": "^1.20.2"
  }
}
```

3. Instale as dependências:
```bash
npm install
```

## Execução

Para iniciar o servidor:
```bash
npm start
```

Você verá no console:
```
🚀 Servidor rodando em http://localhost:3000
📝 Endpoints disponíveis:
   POST   /users      - Criar novo usuário
   GET    /users      - Listar todos os usuários
   GET    /users/:id  - Buscar usuário por ID
```

## Testando a API

Existem dois arquivos para testes:
1. **testes.http** - Arquivo com todas as requisições HTTP (compatível com Thunder Client e REST Client)
2. **TESTES.md** - Documentação detalhada dos testes

### Usando Thunder Client (extensão do VS Code)

1. Instale a extensão "Thunder Client" no VS Code
2. Abra o arquivo `testes.http`
3. Clique no ícone de "play" ao lado de cada requisição para executá-la

### Usando Postman

1. Abra o Postman
2. Crie uma nova requisição para cada caso de teste
3. Use as URLs e payloads do arquivo `testes.http`

### Usando cURL no terminal

Exemplos:
```bash
# Criar usuário
curl -X POST http://localhost:3000/users \
  -H "Content-Type: application/json" \
  -d '{"nome":"João","email":"joao@example.com"}'

# Listar usuários
curl http://localhost:3000/users

# Buscar usuário por ID
curl http://localhost:3000/users/1
```

## Status dos Testes

Todos os 4 cenários solicitados estão implementados e prontos para teste.
