// ============================================================
// AUDUN Partners — QCM Platform
// Vercel Edge Function — /api/send-email
// ============================================================
// Variables d'env requises (Vercel Settings → Environment Variables) :
//   RESEND_API_KEY, ADMIN_EMAIL, FROM_EMAIL

export const config = { runtime: 'edge' };

export default async function handler(req) {
  // CORS preflight
  if (req.method === 'OPTIONS') {
    return new Response(null, {
      status: 204,
      headers: corsHeaders(),
    });
  }

  if (req.method !== 'POST') {
    return json({ error: 'Method not allowed' }, 405);
  }

  let body;
  try {
    body = await req.json();
  } catch {
    return json({ error: 'Invalid JSON' }, 400);
  }

  const { type, data } = body;
  if (!type || !data) {
    return json({ error: 'Missing type or data' }, 400);
  }

  const RESEND_API_KEY = process.env.RESEND_API_KEY;
  const ADMIN_EMAIL    = process.env.ADMIN_EMAIL    || 'recrutement@audun-partners.com';
  const FROM_EMAIL     = process.env.FROM_EMAIL     || 'noreply@audun-partners.com';

  if (!RESEND_API_KEY) {
    return json({ error: 'RESEND_API_KEY not configured' }, 500);
  }

  try {
    if (type === 'submission') {
      await sendSubmissionEmails({ data, RESEND_API_KEY, ADMIN_EMAIL, FROM_EMAIL });
    } else if (type === 'fraud_alert') {
      await sendFraudAlert({ data, RESEND_API_KEY, ADMIN_EMAIL, FROM_EMAIL });
    } else {
      return json({ error: 'Unknown type' }, 400);
    }

    return json({ ok: true });
  } catch (err) {
    console.error('send-email error:', err);
    return json({ error: err.message || 'Send failed' }, 500);
  }
}

// ============================================================
// Submission : email admin + email candidat
// ============================================================
async function sendSubmissionEmails({ data, RESEND_API_KEY, ADMIN_EMAIL, FROM_EMAIL }) {
  const {
    prenom, nom, email, promo,
    score, score_max = 20,
    duree_minutes,
    fraude_flag = 'ok',
    nb_fraud_events = 0,
  } = data;

  const fraudLabel = fraude_flag === 'alerte'
    ? 'Alerte 🚨'
    : fraude_flag === 'suspicion'
      ? 'Suspicion ⚠️'
      : 'OK';

  // Email admin
  const adminHtml = `
    <div style="font-family:Inter,Arial,sans-serif;color:#1e293b;max-width:600px">
      <h2 style="color:#0a1628">Test soumis — ${prenom} ${nom}</h2>
      <table style="width:100%;border-collapse:collapse">
        <tr><td style="padding:8px 0;color:#64748b;width:160px">Candidat</td>
            <td style="padding:8px 0"><strong>${prenom} ${nom}</strong> &lt;${email}&gt;</td></tr>
        <tr><td style="padding:8px 0;color:#64748b">Session</td>
            <td style="padding:8px 0">${promo || '—'}</td></tr>
        <tr><td style="padding:8px 0;color:#64748b">Score</td>
            <td style="padding:8px 0"><strong>${score} / ${score_max}</strong></td></tr>
        <tr><td style="padding:8px 0;color:#64748b">Durée</td>
            <td style="padding:8px 0">${duree_minutes || '—'} minutes</td></tr>
        <tr><td style="padding:8px 0;color:#64748b">Fraude</td>
            <td style="padding:8px 0">${fraudLabel}</td></tr>
        <tr><td style="padding:8px 0;color:#64748b">Événements détectés</td>
            <td style="padding:8px 0">${nb_fraud_events}</td></tr>
      </table>
    </div>`;

  // Email candidat
  const candidatHtml = `
    <div style="font-family:Inter,Arial,sans-serif;color:#1e293b;max-width:600px">
      <img src="https://audun-partners.com/logo.png" alt="AUDUN Partners"
           style="height:40px;margin-bottom:24px" onerror="this.style.display='none'">
      <p>Bonjour ${prenom},</p>
      <p>Nous confirmons la bonne réception de votre test.</p>
      <p>L'équipe AUDUN Partners reviendra vers vous prochainement.</p>
      <br>
      <p>Cordialement,<br><strong>L'équipe AUDUN Partners</strong></p>
    </div>`;

  await Promise.all([
    resendSend({
      api_key: RESEND_API_KEY,
      from: `AUDUN Partners <${FROM_EMAIL}>`,
      to: [ADMIN_EMAIL],
      subject: `[QCM AUDUN] Test soumis — ${prenom} ${nom}`,
      html: adminHtml,
    }),
    resendSend({
      api_key: RESEND_API_KEY,
      from: `AUDUN Partners <${FROM_EMAIL}>`,
      to: [email],
      subject: 'AUDUN Partners — Confirmation de réception',
      html: candidatHtml,
    }),
  ]);
}

// ============================================================
// Fraud alert : email admin uniquement
// ============================================================
async function sendFraudAlert({ data, RESEND_API_KEY, ADMIN_EMAIL, FROM_EMAIL }) {
  const { prenom, nom, email, events = [] } = data;

  const eventsHtml = events.map(e => `
    <tr>
      <td style="padding:6px 8px;border-bottom:1px solid #e2e8f0">${e.type}</td>
      <td style="padding:6px 8px;border-bottom:1px solid #e2e8f0;color:#64748b">
        ${new Date(e.timestamp).toLocaleString('fr-FR')}
      </td>
      <td style="padding:6px 8px;border-bottom:1px solid #e2e8f0;color:#64748b">
        ${e.details || '—'}
      </td>
    </tr>`).join('');

  const html = `
    <div style="font-family:Inter,Arial,sans-serif;color:#1e293b;max-width:600px">
      <h2 style="color:#ef4444">🚨 Alerte fraude — ${prenom} ${nom}</h2>
      <p style="color:#64748b">${email}</p>
      <table style="width:100%;border-collapse:collapse;margin-top:16px">
        <thead>
          <tr style="background:#fef2f2">
            <th style="padding:8px;text-align:left;border-bottom:2px solid #fecaca">Type</th>
            <th style="padding:8px;text-align:left;border-bottom:2px solid #fecaca">Horodatage</th>
            <th style="padding:8px;text-align:left;border-bottom:2px solid #fecaca">Détails</th>
          </tr>
        </thead>
        <tbody>${eventsHtml}</tbody>
      </table>
    </div>`;

  await resendSend({
    api_key: RESEND_API_KEY,
    from: `AUDUN Partners <${FROM_EMAIL}>`,
    to: [ADMIN_EMAIL],
    subject: `🚨 [QCM AUDUN] Alerte fraude — ${prenom} ${nom}`,
    html,
  });
}

// ============================================================
// Resend HTTP helper
// ============================================================
async function resendSend({ api_key, from, to, subject, html }) {
  const res = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${api_key}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ from, to, subject, html }),
  });

  if (!res.ok) {
    const err = await res.text();
    throw new Error(`Resend error ${res.status}: ${err}`);
  }

  return res.json();
}

// ============================================================
// Helpers
// ============================================================
function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json', ...corsHeaders() },
  });
}

function corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
  };
}
