README.md
# API Connect

## Objetivo

API REST simples para gerenciamento de usuários.

A API permite criar usuários, listar usuários cadastrados e buscar um usuário específico pelo seu ID.

Os dados são armazenados em memória e serão perdidos quando o servidor for reiniciado.

## Tecnologias

- Node.js
- Express
- Body-parser
- JavaScript
- Git
- GitHub

## Como executar

### 1. Instalar as dependências

```bash
npm install

2. Iniciar o servidor
npm start

O servidor será executado em:

http://localhost:3000

Endpoints
Método	Endpoint	Descrição
POST	/users	Criar usuário
GET	/users	Listar usuários
GET	/users/:id	Buscar usuário por ID

Exemplos
Criar usuário
POST /users

{
  "nome": "João Silva",
  "email": "joao@email.com"
}

Resposta:

{
  "message": "Usuário criado com sucesso",
  "usuario": {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@email.com"
  }
}

Listar usuários
GET /users

Resposta:

{
  "total": 1,
  "usuarios": [
    {
      "id": 1,
      "nome": "João Silva",
      "email": "joao@email.com"
    }
  ]
}

Buscar usuário por ID
GET /users/1

Resposta:

{
  "usuario": {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@email.com"
  }
}

Validações
Os campos nome e email são obrigatórios.

Se algum deles não for informado, a API retorna:

{
  "error": "Campo \"nome\" é obrigatório"
}

ou:

{
  "error": "Campo \"email\" é obrigatório"
}
