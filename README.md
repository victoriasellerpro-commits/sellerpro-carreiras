# SellerPro Carreiras

Aplicação de avaliações de personalidade BIG 5, fit cultural e raciocínio lógico para processos seletivos.

## Requisitos

- Node.js
- Um projeto Supabase para armazenar avaliações em produção

## Desenvolvimento local

1. Instale as dependências:

   ```sh
   npm install
   ```

2. Copie `.env.example` para `.env` e preencha as configurações. Não publique o arquivo `.env`.
3. Em um terminal, inicie o backend:

   ```sh
   node server.js
   ```

4. Em outro terminal, inicie o frontend:

   ```sh
   npm run dev
   ```

   A aplicação ficará disponível em `http://localhost:3000`.

## Configuração do Supabase

1. Crie um projeto no Supabase.
2. No **SQL Editor** do painel do projeto, execute o conteúdo de [`supabase/schema.sql`](./supabase/schema.sql).
3. Configure estas variáveis no `.env` local ou como secrets no serviço que hospeda o backend:

   - `DATA_BACKEND=supabase`
   - `SUPABASE_URL`: URL do projeto
   - `SUPABASE_SERVICE_KEY`: chave `service_role` do projeto
   - `ADMIN_PASSWORD`: senha de acesso à área administrativa
   - `SESSION_SECRET`: segredo aleatório para assinar sessões

   Gere um segredo de sessão com:

   ```sh
   node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
   ```

   **Nunca** inclua `SUPABASE_SERVICE_KEY`, `.env` ou outros segredos no frontend ou no GitHub. A chave `service_role` deve existir somente no backend, como variável secreta.

## Publicação

- Publique o frontend com `npm run build`; a pasta gerada é `dist`.
- Hospede `server.js` em um serviço Node.js e configure nele as variáveis secretas listadas acima.
- Configure o proxy `/api/*` do frontend para apontar ao endereço público desse backend.
- No GitHub, mantenha o repositório público livre de `.env`, chaves e dados pessoais. Os arquivos locais de resultados e sessões já são ignorados pelo `.gitignore`.
