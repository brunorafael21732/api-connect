# Testes de API - Documentação Completa

## Cenários de Teste Cobridos

Esta API implementa 4 cenários de teste conforme solicitado:

---

## 1️⃣ TESTE DE SUCESSO: Criação com sucesso (HTTP 201)

### Objetivo
Cadastrar um novo usuário enviando nome e e-mail no corpo da requisição.

### Requisição
```http
POST /users HTTP/1.1
Host: localhost:3000
Content-Type: application/json

{
  "nome": "João Silva",
  "email": "joao@example.com"
}
```

### Resposta Esperada
**Status:** `201 Created`

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

### Validações
- ✅ Status HTTP deve ser **201**
- ✅ Resposta contém a mensagem de sucesso
- ✅ Usuário foi armazenado com um ID único
- ✅ Nome e email foram preservados corretamente

---

## 2️⃣ TESTE DE FALHA (Validação): Falta campo obrigatório (HTTP 400)

### Objetivo
Tentar cadastrar um usuário SEM o campo "email", validando o tratamento de erro.

### Requisição
```http
POST /users HTTP/1.1
Host: localhost:3000
Content-Type: application/json

{
  "nome": "Pedro Costa"
}
```

### Resposta Esperada
**Status:** `400 Bad Request`

```json
{
  "error": "Campo \"email\" é obrigatório"
}
```

### Validações
- ✅ Status HTTP deve ser **400**
- ✅ Mensagem de erro clara indicando o campo faltante
- ✅ Usuário NÃO foi criado (verificável com GET /users)

### Nota
Também é possível testar a falta do campo "nome":

**Requisição:**
```json
{
  "email": "usuario@example.com"
}
```

**Resposta:**
```json
{
  "error": "Campo \"nome\" é obrigatório"
}
```

---

## 3️⃣ TESTE DE SUCESSO: Listagem geral (HTTP 200)

### Objetivo
Executar o método GET na raiz do recurso para obter todos os registros cadastrados.

### Requisição
```http
GET /users HTTP/1.1
Host: localhost:3000
Content-Type: application/json
```

### Resposta Esperada
**Status:** `200 OK`

```json
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

### Validações
- ✅ Status HTTP deve ser **200**
- ✅ Campo "total" contém a quantidade de usuários
- ✅ Array "usuarios" lista todos os registros cadastrados
- ✅ Cada usuário contém: id, nome e email

### Cenário Especial: Lista Vazia
Se nenhum usuário foi criado ainda:

```json
{
  "total": 0,
  "usuarios": []
}
```

---

## 4️⃣ TESTE DE FALHA: Busca inexistente (HTTP 404)

### Objetivo
Procurar um usuário através de um ID que comprovadamente não existe na estrutura de memória.

### Requisição
```http
GET /users/999 HTTP/1.1
Host: localhost:3000
Content-Type: application/json
```

### Resposta Esperada
**Status:** `404 Not Found`

```json
{
  "error": "Usuário com ID 999 não encontrado"
}
```

### Validações
- ✅ Status HTTP deve ser **404**
- ✅ Mensagem de erro clara indicando o ID procurado
- ✅ Nenhum dado de usuário é retornado

### Teste com ID Válido (Comparação)
Para demonstrar o contraste, buscar um ID que existe:

**Requisição:**
```http
GET /users/1 HTTP/1.1
Host: localhost:3000
```

**Resposta (200 OK):**
```json
{
  "usuario": {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@example.com"
  }
}
```

---

## 📊 Resumo dos Testes

| # | Cenário | Método | Endpoint | Esperado | Status |
|---|---------|--------|----------|----------|--------|
| 1 | Criação com sucesso | POST | /users | 201 | ✅ |
| 2 | Falha na validação | POST | /users | 400 | ✅ |
| 3 | Listagem geral | GET | /users | 200 | ✅ |
| 4 | Busca inexistente | GET | /users/999 | 404 | ✅ |

---

## 🛠️ Ferramentas Recomendadas para Teste

### Thunder Client (VS Code)
- Extensão integrada ao VS Code
- Arquivo `testes.http` já configurado
- Executar requisição: clique no botão "Send"

### Postman
- Desktop ou Web
- Importar requisições manualmente
- Salvar coleção de testes

### cURL (Terminal)
```bash
# Teste 1: Criar usuário
curl -X POST http://localhost:3000/users \
  -H "Content-Type: application/json" \
  -d '{"nome":"João Silva","email":"joao@example.com"}'

# Teste 2: Falha (sem email)
curl -X POST http://localhost:3000/users \
  -H "Content-Type: application/json" \
  -d '{"nome":"Pedro Costa"}'

# Teste 3: Listar todos
curl http://localhost:3000/users

# Teste 4: Buscar inexistente
curl http://localhost:3000/users/999
```

---

## ✅ Checklist de Validação

Ao executar cada teste, verifique:

- [ ] **Teste 1**: Status 201, usuário criado com ID
- [ ] **Teste 2**: Status 400, mensagem de erro por email faltante
- [ ] **Teste 3**: Status 200, lista contém usuários cadastrados
- [ ] **Teste 4**: Status 404, mensagem de erro por ID não encontrado

Todos os 4 cenários cobrem o ciclo completo de testes:
- ✅ Caminho feliz (sucesso)
- ✅ Validação de entrada
- ✅ Operações de leitura
- ✅ Tratamento de erros
