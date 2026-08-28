# ⚡ Guia de Início Rápido - API Connect

## 🚀 Quick Start (5 minutos)

### Opção 1: Setup Automático (Recomendado para Windows)

#### A. Via Batch (.bat)
1. Abra o explorador de arquivos
2. Navegue até: `c:\Users\HP\OneDrive\Desktop\api-connect\`
3. Clique duplo em **`setup.bat`**
4. O script fará tudo automaticamente:
   - Criar package.json
   - Instalar dependências
   - Iniciar o servidor

#### B. Via PowerShell
1. Abra PowerShell como Administrador
2. Navegue até a pasta:
   ```powershell
   cd "c:\Users\HP\OneDrive\Desktop\api-connect"
   ```
3. Execute:
   ```powershell
   powershell -ExecutionPolicy Bypass -File setup.ps1
   ```

### Opção 2: Setup Manual (Terminal/CMD)

```bash
# 1. Navegue até a pasta
cd c:\Users\HP\OneDrive\Desktop\api-connect

# 2. Instale as dependências
npm install

# 3. Inicie o servidor
npm start
```

---

## ✅ Confirmação de Sucesso

Quando o servidor estiver rodando, você verá:

```
🚀 Servidor rodando em http://localhost:3000
📝 Endpoints disponíveis:
   POST   /users      - Criar novo usuário
   GET    /users      - Listar todos os usuários
   GET    /users/:id  - Buscar usuário por ID
```

---

## 🧪 Como Testar a API

### Opção 1: Thunder Client (Extensão VS Code)

1. **Instale a extensão:**
   - Abra VS Code
   - Vá para Extensions (Ctrl+Shift+X)
   - Procure por "Thunder Client"
   - Clique em Install

2. **Abra o arquivo de testes:**
   - Abra `testes.http` no VS Code
   - Clique no ícone "⚡" ao lado de cada teste
   - Veja a resposta em tempo real

### Opção 2: Postman

1. **Baixe o Postman:** https://www.postman.com/downloads/
2. **Crie requisições manualmente** usando os exemplos de `TESTES.md`

### Opção 3: cURL (Terminal/CMD)

```bash
# Teste 1: Criar usuário
curl -X POST http://localhost:3000/users ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\":\"João Silva\",\"email\":\"joao@example.com\"}"

# Teste 2: Listar usuários
curl http://localhost:3000/users

# Teste 3: Buscar usuário (ID 1)
curl http://localhost:3000/users/1

# Teste 4: Buscar usuário inexistente (ID 999)
curl http://localhost:3000/users/999
```

### Opção 4: Insomnia

1. **Baixe o Insomnia:** https://insomnia.rest/
2. **Crie requisições** seguindo `TESTES.md`

---

## 📝 Arquivos do Projeto

```
api-connect/
├── server.js           ← Código da API (Express)
├── package.json        ← Dependências (criado ao rodar setup)
├── testes.http         ← Testes para Thunder Client
├── TESTES.md           ← Documentação dos 4 cenários de teste
├── README.md           ← Documentação técnica
├── SETUP.md            ← Instruções de setup detalhadas
├── QUICKSTART.md       ← Este arquivo
├── setup.bat           ← Script automático (Windows CMD)
├── setup.ps1           ← Script automático (PowerShell)
└── .vscode/            ← Pasta para configurações do VS Code
```

---

## 🎯 Os 4 Cenários de Teste

Todos os 4 casos de teste solicitados estão implementados na API:

| # | Cenário | Método | Endpoint | Status | Exemplo |
|---|---------|--------|----------|--------|---------|
| 1️⃣ | **Criação com sucesso** | POST | /users | 201 | `{"nome":"João","email":"joao@example.com"}` |
| 2️⃣ | **Falha (Validação)** | POST | /users | 400 | `{"nome":"João"}` (sem email) |
| 3️⃣ | **Listagem geral** | GET | /users | 200 | Retorna array com todos os usuários |
| 4️⃣ | **Busca inexistente** | GET | /users/999 | 404 | ID que não existe |

Veja `TESTES.md` para documentação completa com todas as requisições e respostas esperadas.

---

## 🐛 Solução de Problemas

### Erro: "npm: command not found"
- **Solução:** Node.js não está instalado
- Baixe em: https://nodejs.org/

### Erro: "Address already in use"
- **Solução:** A porta 3000 já está em uso
- Edite `server.js` e mude a constante `PORT`

### Erro ao executar setup.bat
- **Solução:** Use `setup.ps1` ou faça setup manual

---

## 📚 Próximos Passos

1. ✅ Executar o servidor com `npm start`
2. ✅ Abrir `testes.http` no Thunder Client
3. ✅ Executar os 4 testes de cenários
4. ✅ Validar todas as respostas em `TESTES.md`

**Sucesso! A API está pronta para teste!** 🎉
