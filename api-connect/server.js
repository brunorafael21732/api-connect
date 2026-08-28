const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const PORT = 3000;

// Middleware
app.use(bodyParser.json());

// In-memory storage
let users = [];
let nextId = 1;

// POST /users - Criar novo usuário
app.post('/users', (req, res) => {
  // Validação: verifica se email está presente
  if (!req.body.email) {
    return res.status(400).json({
      error: 'Campo "email" é obrigatório'
    });
  }

  // Validação: verifica se nome está presente
  if (!req.body.nome) {
    return res.status(400).json({
      error: 'Campo "nome" é obrigatório'
    });
  }

  // Criar novo usuário
  const novoUsuario = {
    id: nextId++,
    nome: req.body.nome,
    email: req.body.email
  };

  users.push(novoUsuario);

  res.status(201).json({
    mensagem: 'Usuário criado com sucesso',
    usuario: novoUsuario
  });
});

// GET /users - Listar todos os usuários
app.get('/users', (req, res) => {
  res.status(200).json({
    total: users.length,
    usuarios: users
  });
});

// GET /users/:id - Buscar usuário por ID
app.get('/users/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const usuario = users.find(u => u.id === id);

  if (!usuario) {
    return res.status(404).json({
      error: `Usuário com ID ${id} não encontrado`
    });
  }

  res.status(200).json({
    usuario: usuario
  });
});

// Iniciar servidor
app.listen(PORT, () => {
  console.log(`🚀 Servidor rodando em http://localhost:${PORT}`);
  console.log(`📝 Endpoints disponíveis:`);
  console.log(`   POST   /users      - Criar novo usuário`);
  console.log(`   GET    /users      - Listar todos os usuários`);
  console.log(`   GET    /users/:id  - Buscar usuário por ID`);
});
