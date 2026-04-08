# AUDUN Partners — Plateforme QCM

Test de recrutement M&A — Full-stack Supabase + Vercel + Resend.

---

## Déploiement en 9 étapes

### 1. Créer un projet Supabase

1. Aller sur [supabase.com](https://supabase.com) → **New project**
2. Choisir un nom, une région (ex : `eu-west-2`), définir un mot de passe BDD
3. Dans **Project Settings → API**, noter :
   - `Project URL` → valeur de `SUPABASE_URL`
   - `anon public` → valeur de `SUPABASE_ANON_KEY`
   - `service_role` → valeur de `SUPABASE_SERVICE_ROLE_KEY` (à garder secret)

---

### 2. Exécuter le schéma SQL

1. Dans Supabase → **SQL Editor**
2. Copier-coller le contenu de `supabase-schema.sql`
3. Cliquer **Run**

Pour le bucket de stockage (logo) :
```sql
insert into storage.buckets (id, name, public) values ('assets', 'assets', true);
```

---

### 3. Configurer Resend

1. Créer un compte sur [resend.com](https://resend.com)
2. **Domains** → ajouter et vérifier votre domaine expéditeur (ex : `audun-partners.com`)
3. **API Keys** → créer une clé → noter la valeur pour `RESEND_API_KEY`
4. L'adresse `FROM_EMAIL` doit correspondre au domaine vérifié (ex : `noreply@audun-partners.com`)

---

### 4. Injecter les clés Supabase dans les fichiers HTML

Avant de déployer, remplacer les placeholders dans `index.html` et `admin.html` :

```html
<!-- Chercher et remplacer : -->
const SUPABASE_URL  = '__SUPABASE_URL__';
const SUPABASE_ANON = '__SUPABASE_ANON_KEY__';
```

**Option A — Manuel** : ouvrir les deux fichiers et remplacer `__SUPABASE_URL__` et `__SUPABASE_ANON_KEY__` par vos vraies valeurs.

**Option B — Script** (bash) :
```bash
sed -i "s|__SUPABASE_URL__|https://xxxx.supabase.co|g" index.html admin.html
sed -i "s|__SUPABASE_ANON_KEY__|votre_anon_key|g" index.html admin.html
```

> **Note** : la clé `anon` est publique par conception — elle est sécurisée par les politiques RLS dans Supabase.

---

### 5. Pousser sur GitHub

```bash
git init
git add .
git commit -m "feat: plateforme QCM AUDUN"
git remote add origin https://github.com/votre-org/audun-qcm.git
git push -u origin main
```

---

### 6. Importer sur Vercel

1. Aller sur [vercel.com](https://vercel.com) → **Add New Project**
2. Importer le repo GitHub
3. **Framework Preset** : Other (pas de build step)
4. Laisser les paramètres par défaut → **Deploy**

---

### 7. Configurer les variables d'environnement Vercel

Dans Vercel → **Settings → Environment Variables**, ajouter :

| Variable | Valeur |
|---|---|
| `RESEND_API_KEY` | Votre clé Resend |
| `ADMIN_EMAIL` | Email destinataire des notifications |
| `FROM_EMAIL` | Expéditeur vérifié dans Resend |
| `ADMIN_PASSWORD` | Mot de passe admin (min. 8 caractères) |

> `SUPABASE_URL` et `SUPABASE_ANON_KEY` sont injectées directement dans les fichiers HTML (étape 4).

Après ajout des variables → **Redeploy**.

---

### 8. Créer la première session

1. Ouvrir `https://votre-projet.vercel.app/admin.html`
2. Entrer le mot de passe configuré en `ADMIN_PASSWORD`
3. Onglet **Sessions** → **Nouvelle session**
4. Renseigner : Label (ex : `Promotion Mai 2025`), Code (ex : `AUDUN2025`), Temps/question
5. Noter le code d'accès

---

### 9. Tester le parcours complet

1. Ouvrir `https://votre-projet.vercel.app/index.html`
2. Entrer le code d'accès créé
3. Remplir nom / prénom / email
4. Effectuer le test complet
5. Vérifier dans l'admin → Dashboard que le candidat apparaît
6. Vérifier la réception des emails (admin + candidat)

---

## Structure des fichiers

```
/
├── index.html          → Interface candidat (SPA)
├── admin.html          → Interface admin (SPA)
├── api/
│   └── send-email.js   → Vercel Edge Function (emails via Resend)
├── supabase-schema.sql → Schéma BDD + RLS policies
├── .env.example        → Template des variables d'environnement
├── vercel.json         → Config déploiement Vercel
├── logo.png            → Logo AUDUN (à placer à la racine)
└── README.md           → Ce fichier
```

---

## Architecture technique

| Couche | Technologie |
|---|---|
| Frontend | HTML/CSS/JS vanilla — zéro framework |
| Base de données | Supabase (PostgreSQL) |
| Authentification BDD | RLS Supabase (anon key côté client) |
| Emails | Resend API (via Edge Function) |
| Déploiement | Vercel (Edge Function + static files) |

---

## Sécurité

- **Clé Resend** : uniquement dans `api/send-email.js` (Edge Function) — jamais exposée côté client
- **Clé anon Supabase** : visible côté client mais sécurisée par les RLS policies
- **Interface admin** : protégée par mot de passe stocké en `localStorage`
- **Anti-fraude** : détection côté client de 7 types d'événements, persistés en BDD avec horodatage
- **Retour arrière impossible** : chaque réponse est persistée en BDD immédiatement

---

## Personnalisation

- **Logo** : déposer `logo.png` à la racine (hauteur recommandée : 48px, fond transparent)
- **Nombre de questions** : modifier `NB_QUESTIONS = 20` dans `index.html`
- **Temps par question** : configurable par session dans l'interface admin
- **Thèmes / sujets** : gérés via le champ `theme` dans la banque de questions
# Test-stagiaire
