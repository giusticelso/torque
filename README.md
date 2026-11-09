# Torque - Sistema da Oficina Mecanica

Projeto de estudo (SENAI) para controle de clientes, veiculos e agendamentos
de uma oficina mecanica, com protecao do CPF (LGPD) e login com token JWT.

Versao simplificada: o **back** (`app.js`) e o **front** (arquivos `.html`) ficam separados.
Sem CSS e sem JavaScript no navegador: o servidor preenche os `{{marcadores}}` dos `.html`.

## Estrutura

```
app.js           BACK: rotas, regras, login, criptografia e SQL
paginas/         FRONT: HTML puro (login, principal, clientes, veiculos, agendamentos)
gerar-script.js  gera o database/script.sql
database/        script.sql
docs/            roteiro-live-coding.md (material do professor)
```

## 1. Banco de dados

Com o MySQL rodando, execute:

```bash
mysql -u root -p < database/script.sql
```

(Para gerar o script de novo, por exemplo apos mudar a chave do `.env`: `npm run gerar-script`)

## 2. Rodar o sistema

```bash
cp .env.example .env   # ajuste os dados do seu MySQL
npm install
npm start
```

Acesse `http://localhost:3000`.

## Usuario de teste

- E-mail: `admin@oficina.com`
- Senha: `123456`
