-- ============================================================
-- AUDUN Partners — QCM Platform
-- Supabase PostgreSQL Schema
-- ============================================================

-- Extensions
create extension if not exists "pgcrypto";

-- ============================================================
-- TABLES
-- ============================================================

create table if not exists sessions (
  id                  uuid primary key default gen_random_uuid(),
  code                text unique not null,
  promo               text,
  temps_par_question  int default 25,
  actif               boolean default true,
  created_at          timestamptz default now()
);

create table if not exists questions (
  id              uuid primary key default gen_random_uuid(),
  enonce          text not null,
  contexte        text,
  option_a        text not null,
  option_b        text not null,
  option_c        text not null,
  option_d        text not null,
  bonne_reponse   char(1) not null check (bonne_reponse in ('A','B','C','D')),
  explication     text,
  difficulte      text,
  theme           text,
  actif           boolean default true,
  created_at      timestamptz default now()
);

create table if not exists candidates (
  id                uuid primary key default gen_random_uuid(),
  session_id        uuid references sessions(id),
  nom               text not null,
  prenom            text not null,
  email             text not null,
  questions_tirees  uuid[],
  reponses          jsonb default '{}',
  score             int,
  score_max         int default 20,
  started_at        timestamptz,
  submitted_at      timestamptz,
  statut            text default 'en_cours',
  fraude_flag       text default 'ok'
);

create table if not exists fraud_events (
  id            uuid primary key default gen_random_uuid(),
  candidate_id  uuid references candidates(id),
  type          text not null,
  timestamp     timestamptz default now(),
  details       text
);

-- ============================================================
-- ROW LEVEL SECURITY
-- ============================================================

alter table sessions      enable row level security;
alter table questions     enable row level security;
alter table candidates    enable row level security;
alter table fraud_events  enable row level security;

-- sessions : lecture publique, écriture service role uniquement
create policy "sessions_select_public"
  on sessions for select
  using (true);

create policy "sessions_insert_service"
  on sessions for insert
  with check (auth.role() = 'service_role');

create policy "sessions_update_service"
  on sessions for update
  using (auth.role() = 'service_role');

create policy "sessions_delete_service"
  on sessions for delete
  using (auth.role() = 'service_role');

-- questions : lecture publique, écriture service role uniquement
create policy "questions_select_public"
  on questions for select
  using (true);

create policy "questions_insert_service"
  on questions for insert
  with check (auth.role() = 'service_role');

create policy "questions_update_service"
  on questions for update
  using (auth.role() = 'service_role');

create policy "questions_delete_service"
  on questions for delete
  using (auth.role() = 'service_role');

-- candidates : insert et select publics, pas de update/delete public
create policy "candidates_select_public"
  on candidates for select
  using (true);

create policy "candidates_insert_public"
  on candidates for insert
  with check (true);

create policy "candidates_update_public"
  on candidates for update
  using (true);

-- fraud_events : insert et select publics
create policy "fraud_events_select_public"
  on fraud_events for select
  using (true);

create policy "fraud_events_insert_public"
  on fraud_events for insert
  with check (true);

-- ============================================================
-- INDEXES
-- ============================================================

create index if not exists idx_sessions_code       on sessions(code);
create index if not exists idx_sessions_actif      on sessions(actif);
create index if not exists idx_questions_actif     on questions(actif);
create index if not exists idx_candidates_session  on candidates(session_id);
create index if not exists idx_candidates_email    on candidates(email);
create index if not exists idx_fraud_candidate     on fraud_events(candidate_id);

-- ============================================================
-- STORAGE (logo)
-- ============================================================
-- Exécuter manuellement dans l'éditeur Supabase si besoin :
-- insert into storage.buckets (id, name, public) values ('assets', 'assets', true);
