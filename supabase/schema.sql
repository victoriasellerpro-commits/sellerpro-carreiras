-- Rode este script no Supabase: Dashboard > SQL Editor > New query > Run.
-- Cria as tabelas usadas pelo backend "supabase" (stores/supabaseStore.js).

create table if not exists sessions (
  session_id uuid primary key default gen_random_uuid(),
  nome text,
  email text not null,
  telefone text,
  vaga text,
  status text not null default 'EM_ANDAMENTO',
  etapa_atual text not null default 'disc',
  questao_atual int not null default 0,
  respostas jsonb not null default '{"disc":{},"fit_cultural":{},"logic":{}}',
  criado_em timestamptz not null default now(),
  ultima_atividade timestamptz not null default now()
);
create unique index if not exists sessions_email_idx on sessions (lower(email));

create table if not exists results (
  id text primary key,
  data jsonb not null,
  email text not null,
  phone text,
  created_at timestamptz not null default now()
);
create index if not exists results_email_idx on results (lower(email));

create table if not exists job_positions (
  nome text primary key
);
insert into job_positions (nome) values ('Social Media')
  on conflict (nome) do nothing;

-- O backend acessa estas tabelas com a chave service_role, que ignora RLS.
-- Não crie policies para anon/authenticated: o acesso público deve permanecer bloqueado.
alter table sessions enable row level security;
alter table results enable row level security;
alter table job_positions enable row level security;
