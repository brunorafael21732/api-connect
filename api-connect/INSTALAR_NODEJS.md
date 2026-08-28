# 📦 Instalação do Node.js

## ⚠️ Node.js não está instalado

Para executar a API, você precisa instalar o **Node.js** primeiro.

---

## 🔽 Passo 1: Baixar Node.js

1. Acesse: **https://nodejs.org/**
2. Clique em "LTS" (versão Long Term Support recomendada)
3. Baixe o instalador para Windows

---

## 🛠️ Passo 2: Instalar Node.js

1. Abra o arquivo `.msi` que foi baixado
2. Clique em "Next" (Próximo) para continuar
3. Aceite os termos de licença
4. Deixe as opções padrão marcadas
5. Clique em "Install" (Instalar)
6. Espere a instalação completar
7. Clique em "Finish" (Concluir)

---

## ✅ Passo 3: Verificar Instalação

1. Abra o **CMD** ou **PowerShell**
2. Execute:
   ```bash
   node --version
   ```
3. Execute:
   ```bash
   npm --version
   ```

Você deve ver números de versão para ambos os comandos.

---

## 🚀 Passo 4: Executar a API

Após instalar Node.js:

### Opção A: Usar Script Automático
1. Clique duplo em **`setup.bat`** (Windows CMD)
2. Ou execute **`setup.ps1`** (PowerShell)

### Opção B: Manual
```bash
cd c:\Users\HP\OneDrive\Desktop\api-connect
npm install
npm start
```

---

## 📺 Saída Esperada

Quando tudo estiver funcionando:

```
🚀 Servidor rodando em http://localhost:3000
📝 Endpoints disponíveis:
   POST   /users      - Criar novo usuário
   GET    /users      - Listar todos os usuários
   GET    /users/:id  - Buscar usuário por ID
```

---

## 💡 Dicas

- Reinicie o VS Code ou terminal após instalar Node.js
- Certifique-se de que tem acesso à internet para instalar as dependências
- Se tiver problemas, verificar a versão recomendada do Node.js: **v16.x ou superior**

**Depois de instalar Node.js, volte ao `QUICKSTART.md` para continuar!**
