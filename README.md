# api-connect

1. Criar um usuário
POST /users

Exemplo de requisição:

POST http://localhost:3000/users
Content-Type: application/json

Corpo:

{
  "nome": "João Silva",
  "email": "joao@email.com"
}

Exemplo de resposta:

{
  "message": "Usuário criado com sucesso",
  "usuario": {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@email.com"
  }
}

O endpoint retorna o status HTTP 201 quando o usuário é criado com sucesso.

Os campos nome e email são obrigatórios.

2. Listar todos os usuários
GET /users

Exemplo:

GET http://localhost:3000/users

Exemplo de resposta:

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

O endpoint retorna o status HTTP 200 quando a consulta é realizada com sucesso.

3. Buscar usuário por ID
GET /users/:id

Exemplo:

GET http://localhost:3000/users/1

Exemplo de resposta:

{
  "usuario": {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@email.com"
  }
}

O endpoint retorna o status HTTP 200 quando o usuário é encontrado.

Caso o ID informado não exista, a API retorna o status HTTP 404:

{
  "error": "Usuário com ID 99 não encontrado"
}

Validações
O endpoint de criação de usuários possui validações para os campos obrigatórios:

email deve ser informado;
nome deve ser informado.
Quando um desses campos não é enviado, a API retorna o status HTTP 400.

Exemplo:

{
  "error": "Campo \"email\" é obrigatório"
}

ou:

{
  "error": "Campo \"nome\" é obrigatório"
}

Estrutura básica do projeto
api-connect-nome-sobrenome/
├── node_modules/
├── package.json
├── package-lock.json
├── server.js
├── README.md
└── .gitignore

A pasta node_modules não deve ser versionada no Git.

Git e versionamento
Para inicializar o controle de versão do projeto:

git init

Adicionar os arquivos:

git add .

Criar o primeiro commit:

git commit -m "feat: primeira versão da API Connect"

Depois de criar o repositório público no GitHub, adicionar o repositório remoto:

git remote add origin https://github.com/SEU-USUARIO/api-connect-nome-sobrenome.git

Enviar o projeto para o GitHub:

git branch -M main
git push -u origin main

.gitignore
O projeto deve possuir um arquivo .gitignore na raiz para impedir o versionamento de dependências locais e outros arquivos desnecessários.

Exemplo:

node_modules/
.env
npm-debug.log*
.DS_Store

Status do projeto
Projeto desenvolvido como MVP de uma API REST para gerenciamento básico de usuários.

Atualmente, os dados são armazenados apenas em memória. Para uma aplicação de produção, recomenda-se a integração com um banco de dados e a implementação de recursos adicionais de segurança, autenticação e validação.
