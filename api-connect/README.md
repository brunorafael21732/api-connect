# API Connect - Gerenciamento de Usuários

Uma API simples construída com Node.js e Express para gerenciar usuários.

## Endpoints

### 1. POST /users
**Criar um novo usuário**

**Requisição:**
```json
{
  "nome": "João Silva",
  "email": "joao@example.com"
}
```

**Resposta (201):**
```json
{
  "mensagem": "Usuário criado com sucesso",
  "usuario": {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@example.com"
  }
}
```

**Erro (400) - Falta email:**
```json
{
  "error": "Campo \"email\" é obrigatório"
}
```

### 2. GET /users
**Listar todos os usuários**

**Resposta (200):**
```json
{
  "total": 1,
  "usuarios": [
    {
      "id": 1,
      "nome": "João Silva",
      "email": "joao@example.com"
    }
  ]
}
```

### 3. GET /users/:id
**Buscar um usuário específico**

**Resposta (200):**
```json
{
  "usuario": {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@example.com"
  }
}
```

**Erro (404) - Usuário não encontrado:**
```json
{
  "error": "Usuário com ID 999 não encontrado"
}
```

## Como Executar

1. Instalar dependências:
```bash
npm install
```

2. Iniciar o servidor:
```bash
npm start
```

O servidor rodará em `http://localhost:3000`
