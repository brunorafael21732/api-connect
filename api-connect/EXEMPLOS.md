# 📝 Exemplos de Requisições e Respostas

## Guia Prático para Testes

Copie e cole estes exemplos nos seus testes!

---

## 🧪 Teste 1: Criar Usuário (201 - Sucesso)

### Requisição
```
POST http://localhost:3000/users HTTP/1.1
Content-Type: application/json

{
  "nome": "João Silva",
  "email": "joao@example.com"
}
```

### Resposta Esperada
```json
HTTP/1.1 201 Created
Content-Type: application/json

{
  "mensagem": "Usuário criado com sucesso",
  "usuario": {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@example.com"
  }
}
```

### ✅ Validações
- [x] Status HTTP: **201**
- [x] Campo "mensagem" presente
- [x] Campo "usuario" com id, nome e email
- [x] ID foi auto-gerado (1, 2, 3...)

---

## 🧪 Teste 2: Validação Falha - Sem Email (400)

### Requisição 2a: Falta o campo email
```
POST http://localhost:3000/users HTTP/1.1
Content-Type: application/json

{
  "nome": "Pedro Costa"
}
```

### Resposta Esperada
```json
HTTP/1.1 400 Bad Request
Content-Type: application/json

{
  "error": "Campo \"email\" é obrigatório"
}
```

---

### Requisição 2b: Falta o campo nome
```
POST http://localhost:3000/users HTTP/1.1
Content-Type: application/json

{
  "email": "carlos@example.com"
}
```

### Resposta Esperada
```json
HTTP/1.1 400 Bad Request
Content-Type: application/json

{
  "error": "Campo \"nome\" é obrigatório"
}
```

### ✅ Validações
- [x] Status HTTP: **400**
- [x] Campo "error" com mensagem clara
- [x] Usuário NÃO foi criado
- [x] Próximo ID continua sendo 2 (ou o próximo disponível)

---

## 🧪 Teste 3: Listar Todos os Usuários (200)

### Requisição
```
GET http://localhost:3000/users HTTP/1.1
Content-Type: application/json
```

(Sem corpo na requisição GET)

### Resposta Esperada (com usuários)
```json
HTTP/1.1 200 OK
Content-Type: application/json

{
  "total": 2,
  "usuarios": [
    {
      "id": 1,
      "nome": "João Silva",
      "email": "joao@example.com"
    },
    {
      "id": 2,
      "nome": "Maria Santos",
      "email": "maria@example.com"
    }
  ]
}
```

### Resposta Esperada (lista vazia)
```json
HTTP/1.1 200 OK
Content-Type: application/json

{
  "total": 0,
  "usuarios": []
}
```

### ✅ Validações
- [x] Status HTTP: **200**
- [x] Campo "total" com quantidade correta
- [x] Array "usuarios" com todos os registros
- [x] Cada usuário tem id, nome e email

---

## 🧪 Teste 4: Buscar ID Inexistente (404)

### Requisição
```
GET http://localhost:3000/users/999 HTTP/1.1
Content-Type: application/json
```

### Resposta Esperada
```json
HTTP/1.1 404 Not Found
Content-Type: application/json

{
  "error": "Usuário com ID 999 não encontrado"
}
```

### ✅ Validações
- [x] Status HTTP: **404**
- [x] Campo "error" com mensagem clara
- [x] Nenhum dado de usuário retornado

---

## 📌 Teste Comparativo: ID Válido vs Inválido

### ✅ Buscar ID que EXISTE (200)

**Requisição:**
```
GET http://localhost:3000/users/1 HTTP/1.1
```

**Resposta:**
```json
HTTP/1.1 200 OK

{
  "usuario": {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@example.com"
  }
}
```

---

### ❌ Buscar ID que NÃO EXISTE (404)

**Requisição:**
```
GET http://localhost:3000/users/999 HTTP/1.1
```

**Resposta:**
```json
HTTP/1.1 404 Not Found

{
  "error": "Usuário com ID 999 não encontrado"
}
```

---

## 🔄 Sequência Recomendada de Testes

1. **Primeiro:** Execute Teste 1 → Criar usuário (201)
2. **Segundo:** Execute Teste 2 → Validação falha (400)
3. **Terceiro:** Execute Teste 3 → Listar todos (200)
4. **Quarto:** Execute Teste 1 novamente → Criar outro usuário (201)
5. **Quinto:** Execute Teste 3 novamente → Ver 2 usuários (200)
6. **Sexto:** Execute Teste 4 → Buscar ID 999 (404)
7. **Sétimo:** Execute GET /users/1 → Buscar ID válido (200)

---

## 📝 Template de Teste no Postman

```javascript
// Teste 1: Verificar status 201
pm.test("Criação bem-sucedida", function() {
  pm.response.to.have.status(201);
  pm.response.to.be.json;
  pm.expect(pm.response.json().usuario.id).to.exist;
});

// Teste 2: Verificar erro de validação
pm.test("Validação falha", function() {
  pm.response.to.have.status(400);
  pm.expect(pm.response.json().error).to.exist;
});

// Teste 3: Verificar lista
pm.test("Listagem bem-sucedida", function() {
  pm.response.to.have.status(200);
  pm.expect(pm.response.json().total).to.be.a('number');
  pm.expect(pm.response.json().usuarios).to.be.an('array');
});

// Teste 4: Verificar 404
pm.test("Usuário não encontrado", function() {
  pm.response.to.have.status(404);
  pm.expect(pm.response.json().error).to.exist;
});
```

---

## 💡 Dicas de Teste

1. **Use Thunder Client** - Extensão do VS Code, bem integrada
2. **Postman alternativa** - Mais completo, com histórico
3. **cURL manual** - Útil para debugging rápido
4. **Valide tudo** - Status HTTP + estrutura de resposta
5. **Teste sequencialmente** - Mantenha o servidor rodando entre testes

---

## 🎯 Você está pronto!

Agora você tem:
- ✅ Exemplos práticos de requisição
- ✅ Respostas esperadas
- ✅ Validações a verificar
- ✅ Sequência recomendada
- ✅ Scripts de teste (Postman)

**Comece a testar agora com QUICKSTART.md!**
