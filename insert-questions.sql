-- ============================================================
-- AUDUN Partners — Import banque de questions (40 questions)
-- ============================================================

insert into questions (enonce, option_a, option_b, option_c, option_d, bonne_reponse, theme, difficulte, actif) values

-- Q1
('Une société affiche un EBIT de 1 200 K€, un taux d''IS de 25%, des D&A de 200 K€, une variation de BFR de +150 K€ (besoin en hausse) et un Capex de 220 K€. Calculez le FCFF.',
'1 030 K€', '730 K€', '630 K€', '780 K€', 'B', 'DCF / Free Cash Flow', 'Difficile', true),

-- Q2
('Le management présente un EBITDA de 3,2 M€ incluant : subvention one-shot 400 K€, plus-value cession immo 180 K€, loyer intra-groupe sous-évalué vs marché de 90 K€/an, frais de restructuration depuis 4 ans consécutifs de 120 K€/an. Quel est l''EBITDA normatif ?',
'2 620 K€', '2 500 K€', '2 380 K€', '2 740 K€', 'B', 'Normalisation EBITDA', 'Difficile', true),

-- Q3
('EV implicite : 18,5 M€. Bilan de clôture : Trésorerie 1,2 M€ / Dette bancaire LT 4,8 M€ / Dette bancaire CT 0,8 M€ / CCA actif 0,3 M€ / Comptes courants bloqués 36 mois 1,1 M€ / Provision litige (probabilité 70%) 0,6 M€ / Dividendes dus non versés 0,4 M€. Quelle est la VT ?',
'13,3 M€', '12,8 M€', '13,7 M€', '12,4 M€', 'A', 'Bridge EV → Valeur des titres', 'Difficile', true),

-- Q4
('Dans un DCF, la valeur terminale représente 76% de l''EV. WACC = 9%, g = 2%. Quel est l''impact approximatif sur l''EV si g passe de 2% à 2,5% ?',
'+3 à 4%', '+8 à 10%', '+5 à 7%', '+12 à 15%', 'B', 'Sensibilité DCF', 'Difficile', true),

-- Q5
('Une holding acquiert 60% d''une filiale pour 4,2 M€. La quote-part d''actif net à la date d''acquisition est de 3,0 M€ (100%). Quel est le goodwill comptabilisé en consolidation ?',
'1,2 M€', '2,4 M€', 'Charge exceptionnelle de 1,2 M€', '2,4 M€ amorti sur 5 ans', 'B', 'Consolidation / Goodwill', 'Intermédiaire', true),

-- Q6
('CA = 24 M€. DSO moyen pondéré = 52 jours. DIO = 38 jours. DPO = 45 jours. Quel est le BFR normatif en jours de CA et en valeur absolue ?',
'45 jours — 3,0 M€', '52 jours — 3,4 M€', '38 jours — 2,5 M€', '55 jours — 3,7 M€', 'A', 'BFR normatif', 'Intermédiaire', true),

-- Q7
('Dans un mécanisme locked-box, le vendeur encaisse un dividende de 500 K€ post locked-box date et facture 80 K€ de management fees intra-groupe non prévus au SPA. Que peut réclamer l''acquéreur ?',
'580 K€ de leakage avec intérêts contractuels', '500 K€ uniquement (les mgmt fees sont permis)', '80 K€ uniquement', 'Rien si les comptes ont été audités', 'A', 'Locked-box / Leakage', 'Difficile', true),

-- Q8
('Cible IFRS : EBITDA = 2,8 M€, loyers capitalisés IFRS 16 = 600 K€/an, amortissement droit d''usage = 550 K€, charge d''intérêt dette locative = 60 K€, dette locative résiduelle = 1,8 M€. Pour une analyse en comparables pre-IFRS 16, quel EBITDA retraité et quelle NFD ajustée ?',
'EBITDA 2,2 M€ / NFD +1,8 M€', 'EBITDA 2,2 M€ / NFD inchangée', 'EBITDA 2,8 M€ / NFD +1,8 M€', 'EBITDA 2,25 M€ / NFD +1,8 M€', 'A', 'IFRS 16 / Retraitement', 'Expert', true),

-- Q9
('EBE = 4,5 M€. Multiple EV/EBE médian = 8,5x. NFD = 6,2 M€. Trésorerie excédentaire identifiée = 0,8 M€. Quel est le range de VT raisonnable (multiple ±5%) ?',
'32,0 à 33,6 M€', '30,6 à 32,1 M€', '31,8 à 34,1 M€', '29,5 à 31,0 M€', 'B', 'Valorisation par multiples', 'Intermédiaire', true),

-- Q10
('Une société passe en charges une campagne publicitaire pluriannuelle de 240 K€ sur N. L''analyste considère que 2/3 relèvent d''un investissement amortissable sur 3 ans. Quel impact sur l''EBITDA normatif de N ?',
'+160 K€ EBITDA / activation 160 K€ en immo incorporelles', '+240 K€ EBITDA / activation 240 K€', '+80 K€ EBITDA / activation 160 K€', 'Aucun retraitement possible sur frais de pub', 'A', 'Retraitement / Activation', 'Difficile', true),

-- Q11
('Bêta désendetté = 0,85. Structure cible : 40% dette / 60% CP. Taux sans risque = 3,2%. Prime de risque marché = 5,5%. Coût de la dette brut = 4,8%. IS = 25%. Calculez le WACC.',
'7,8%', '8,4%', '7,2%', '8,9%', 'A', 'WACC', 'Difficile', true),

-- Q12
('CA SaaS : 4,2 M€ → 4,8 M€. 3 nouveaux clients signés en décembre N pour 480 K€ ARR (reconnu au prorata = 40 K€ en N). Client historique churné en mars N (480 K€ ARR). Quel est le CA run-rate normatif à fin N ?',
'4,8 M€', '4,76 M€', '5,24 M€', '4,36 M€', 'C', 'QoE / Run-rate SaaS', 'Difficile', true),

-- Q13
('Un SPA prévoit un earn-out si EBITDA N+1 > 3 M€. Post-closing, l''acquéreur réaffecte 2 cadres clés de la cible, dégradant l''EBITDA N+1 à 2,7 M€. Le vendeur réclame l''earn-out. Quelle position est la plus défendable ?',
'Le vendeur a raison : l''acquéreur a dégradé le résultat', 'L''acquéreur n''est pas tenu : la condition n''est pas remplie', 'Dépend de la clause de good faith / non-interference du SPA', 'L''earn-out est requalifié en complément de prix automatique', 'C', 'Earn-out / SPA', 'Expert', true),

-- Q14
('BFR 31/12/N : 3,8 M€ / BFR 30/06/N : 5,1 M€ / BFR 31/12/N-1 : 3,6 M€. CA = 18 M€. Activité à forte saisonnalité estivale. Closing prévu 31/03/N+1. Quel BFR normatif retenir pour le peg ?',
'3,8 M€ (clôture N)', '4,17 M€ (moyenne des 3 points)', '5,1 M€ (pic saisonnier)', '3,7 M€ (moyenne N et N-1)', 'B', 'BFR peg / Saisonnalité', 'Difficile', true),

-- Q15
('5 transactions comparables EV/EBITDA : 7,2x — 8,1x — 14,8x — 7,9x — 8,4x. Quelle approche est correcte ?',
'Moyenne simple = 9,3x', 'Médiane = 8,0x après exclusion du 14,8x', 'Médiane brute = 8,1x sans exclusion', 'Moyenne harmonique des 5 multiples', 'B', 'Comparables transactionnels', 'Intermédiaire', true),

-- Q16
('Une société signe un crédit-bail pour une machine à 500 K€ sur 5 ans. En normes françaises (PCG), quel est le traitement comptable à la signature ?',
'Activation 500 K€ en immobilisation / dette financière 500 K€', 'Loyers en charges classe 6, aucune écriture bilan', 'Engagement hors-bilan uniquement', 'Charge exceptionnelle 500 K€', 'C', 'Crédit-bail / PCG', 'Intermédiaire', true),

-- Q17
('CA N : 10 M€ vs N-1 : 8,5 M€. Volume +5%, le reste en effet prix. Marge brute N : 42% vs N-1 : 45%. EBITDA N : 1,4 M€ vs N-1 : 1,3 M€. Quelle lecture critique ?',
'Croissance saine : CA et EBITDA en hausse', 'Alerte : croissance price-driven et compression de marge brute', 'Volume tiré par des remises — analyser le DSO', 'Performance conforme — effet mix favorable', 'B', 'Analyse P&L / Qualité de croissance', 'Difficile', true),

-- Q18
('LBO : dette senior = 3x EBITDA (5 M€) à 5%, dette mezz = 1,25x EBITDA à 10% PIK. D&A = 500 K€. Capex normatif = 1 M€. IS = 25%. Quel est le cash interest coverage ratio en année 1 ?',
'2,8x', '3,5x', '4,0x', '2,1x', 'C', 'LBO / Structure financière', 'Expert', true),

-- Q19
('Dans un processus sell-side structuré, à quel stade l''acquéreur accède-t-il à la data room complète ?',
'Après signature de la LOI non-exclusive', 'Après NDA', 'Après sélection en shortlist (post-offres indicatives)', 'Simultanément à l''envoi du Process Letter', 'C', 'Process M&A sell-side', 'Intermédiaire', true),

-- Q20
('DCF 5 ans : FCF Y1=0,8M€, Y2=1,1M€, Y3=1,4M€, Y4=1,6M€, Y5=1,8M€. WACC=9%, g=2%. Quelle est approximativement la part de la valeur terminale dans l''EV ?',
'~55%', '~65%', '~75%', '~85%', 'C', 'DCF / Valeur terminale', 'Expert', true),

-- Q21
('Vous êtes analyste sur un sell-side. Le senior vous envoie à 17h30 : "Prépare-moi un exec summary de 2 slides sur la cible pour demain 8h, le MD présente au client." Vous n''avez que la plaquette comptable et un vieux teaser. Quelle est votre première action ?',
'Produire les 2 slides avec les données disponibles et envoyer sans relecture', 'Répondre au senior pour demander un brief de 5 minutes avant de commencer', 'Attendre d''avoir plus d''informations avant de démarrer', 'Déléguer la recherche documentaire à un autre stagiaire', 'B', 'Opérationnel / Gestion des priorités', 'Intermédiaire', true),

-- Q22
('Dans un modèle Excel de valorisation, vous constatez que le DCF sort une EV de 42 M€ mais les comparables donnent 28 M€. Le management insiste pour utiliser le DCF. Quelle est la réaction professionnelle correcte ?',
'Utiliser le DCF puisque le management le demande', 'Moyenner les deux approches mécaniquement : (42+28)/2 = 35 M€', 'Documenter l''écart, identifier les hypothèses drivers du DCF et présenter une analyse de sensibilité', 'Rejeter le DCF car les comparables sont plus fiables en M&A', 'C', 'Jugement professionnel / Valorisation', 'Difficile', true),

-- Q23
('Vous rédigez la section "Profil financier" d''un Information Memorandum. Vous avez un EBITDA en baisse sur 3 ans (de 2,1 M€ à 1,4 M€) mais le management explique que c''est dû à des investissements commerciaux exceptionnels. Comment présentez-vous cela dans l''IM ?',
'Ne pas mentionner la baisse et ne présenter que l''EBITDA normatif', 'Présenter la baisse brute sans commentaire pour rester neutre', 'Présenter l''EBITDA reporté ET l''EBITDA normatif retraité, avec explication factuelle des retraitements', 'Mettre la baisse en annexe pour qu''elle soit moins visible', 'C', 'Rédaction IM / Sell-side', 'Difficile', true),

-- Q24
('Un acquéreur potentiel vous pose cette question en management presentation : "Quel est votre taux de churn client sur les 3 dernières années ?" Le management ne vous a jamais communiqué cette donnée. Vous êtes l''analyste assis en salle. Quelle est la bonne posture ?',
'Inventer un chiffre cohérent avec le reste du dossier', 'Répondre "je ne sais pas" et passer à autre chose', 'Ne rien dire et laisser le management répondre', 'Intervenir pour dire que la donnée sera transmise dans les prochains jours et noter la question', 'C', 'Posture en situation client', 'Intermédiaire', true),

-- Q25
('Vous faites une market review sur le secteur de la maintenance industrielle pour un teaser. Vous avez 2 heures. Quelle est la structure de recherche la plus efficace ?',
'Lire l''intégralité des rapports sectoriels disponibles avant de commencer à rédiger', 'Identifier d''abord les 5 à 7 messages clés attendus, puis chercher les données qui les étayent', 'Copier-coller les données de plusieurs sources et synthétiser à la fin', 'Commencer par les concurrents directs puis remonter au marché global', 'B', 'Opérationnel / Market review', 'Intermédiaire', true),

-- Q26
('Dans un tableau de comparables boursiers, vous observez qu''une société affiche un EV/EBITDA de 3,2x alors que le reste du panel tourne entre 7x et 10x. Quelle est votre réaction analytique immédiate ?',
'L''inclure dans le panel car c''est une donnée de marché objective', 'La retirer automatiquement car c''est un outlier', 'Vérifier si la société est en difficulté financière, en run-off ou si l''EBITDA est anormalement gonflé', 'Faire la moyenne avec et sans pour présenter deux scénarios', 'C', 'Analyse comparables / Jugement', 'Difficile', true),

-- Q27
('Votre senior vous demande de "nettoyer le modèle Excel avant l''envoi au client." Que faites-vous en priorité ?',
'Supprimer tous les onglets de calcul intermédiaires pour alléger le fichier', 'Vérifier les liens entre onglets, supprimer les formules cassées, figer les hypothèses clés et protéger les cellules de calcul', 'Changer les couleurs et la mise en forme pour que ça soit plus présentable', 'Envoyer le modèle tel quel avec un mot d''excuse sur le manque de temps', 'B', 'Opérationnel / Excel', 'Intermédiaire', true),

-- Q28
('Une cible réalise 60% de son CA avec un seul client depuis 5 ans, sous contrat renouvelable annuellement. Dans quelle section de l''IM mentionnez-vous ce risque et comment ?',
'Vous ne le mentionnez pas — c''est au buy-side de le découvrir en due diligence', 'Vous le mentionnez dans les risques en dernière page, en petit', 'Vous le présentez factuellement dans la section "Base clients" avec la durée de la relation et l''historique de renouvellement comme éléments rassurants', 'Vous demandez au management de diversifier avant la vente', 'C', 'Rédaction IM / Gestion des risques', 'Difficile', true),

-- Q29
('Laquelle de ces affirmations sur le mécanisme de completion accounts est correcte ?',
'Le prix est définitivement fixé à la signature du SPA, sans ajustement possible', 'L''ajustement porte sur l''écart entre le BFR/NFD réel au closing et le BFR/NFD cible défini au SPA', 'Le locked-box et le completion accounts peuvent coexister dans le même SPA', 'Le completion accounts est toujours favorable au vendeur', 'B', 'Structuration / Completion accounts', 'Difficile', true),

-- Q30
('Un dirigeant-vendeur vous dit en réunion de préparation : "Mettez un EBITDA normatif de 3 M€ dans l''IM, j''ai fait le calcul moi-même." Votre propre analyse ressort à 2,2 M€. Que faites-vous ?',
'Utiliser les 3 M€ du dirigeant — c''est lui le client', 'Utiliser vos 2,2 M€ sans en parler au dirigeant', 'Escalader au senior immédiatement et présenter votre analyse documentée', 'Faire une moyenne à 2,6 M€ pour trouver un compromis', 'C', 'Éthique professionnelle / Sell-side', 'Expert', true),

-- Q31
('Dans un LBO, quel est l''impact mécanique d''une augmentation de 1 point du taux d''intérêt sur la dette senior (covenant DSCR minimum 1,2x, actuellement à 1,35x) ?',
'Aucun impact si le covenant n''est pas breché', 'Réduction du cash disponible pour le remboursement du principal, compression du DSCR, risque de breach si la hausse est significative', 'Augmentation de l''EV car le coût de la dette est tax-deductible', 'Impact uniquement sur la dette mezzanine, pas sur la senior', 'B', 'LBO / Covenants', 'Expert', true),

-- Q32
('Vous devez envoyer un teaser à 15 acquéreurs potentiels. Votre senior vous dit "garde-le anonyme." Laquelle de ces informations NE doit PAS figurer dans le teaser ?',
'Le secteur d''activité de la cible', 'La fourchette de CA et d''EBITDA', 'Le nom de la société et le nom du dirigeant', 'La localisation géographique approximative', 'C', 'Process M&A / Teaser', 'Intermédiaire', true),

-- Q33
('Vous construisez un tableau de bord de suivi de deal pour votre senior. Quels sont les 3 indicateurs les plus pertinents à suivre sur un sell-side en phase de data room ?',
'Nombre de slides de l''IM, nombre de mails envoyés, nombre de réunions planifiées', 'Nombre d''acquéreurs actifs en data room, nombre de Q&A reçues, date limite de remise des offres fermes', 'Valorisation moyenne des offres indicatives, taux de réponse aux teasers, durée moyenne des calls', 'Nombre de NDAs signés, CA de la cible, EBITDA normatif', 'B', 'Opérationnel / Suivi de deal', 'Intermédiaire', true),

-- Q34
('Une société de services affiche une forte croissance du CA (+25%) mais une dégradation du DSO de 45 à 72 jours sur la même période. Quelle est l''interprétation analytique correcte ?',
'La croissance est de qualité : plus de CA = plus de créances, c''est normal', 'Signal de risque : la croissance est potentiellement financée par un allongement du crédit client, à investiguer (qualité des créances, litiges, concentration)', 'Le DSO à 72 jours est dans la norme pour une société de services', 'Il faut uniquement regarder le DPO pour avoir une vision complète', 'B', 'Analyse BFR / Qualité des revenus', 'Difficile', true),

-- Q35
('Votre senior vous demande une "bridge EBITDA N-1 vers N" pour un comité. La différence est de +800 K€. Vous identifiez : nouveau client +1,1 M€, perte d''un contrat −400 K€, hausse masse salariale −200 K€, effet change +300 K€. Quelle présentation est correcte ?',
'Un seul chiffre : +800 K€ de croissance EBITDA', 'Une waterfall avec les 4 contributeurs classés par impact décroissant', 'Deux colonnes N-1 et N avec le delta en pourcentage', 'Un graphique en camembert des contributeurs', 'B', 'Opérationnel / Présentation financière', 'Intermédiaire', true),

-- Q36
('Dans le cadre d''une due diligence acheteur, vous analysez les contrats clients d''une cible SaaS. Quel élément est le plus critique à vérifier en priorité ?',
'La date de signature des contrats', 'Le nombre de pages de chaque contrat', 'Les clauses de changement de contrôle (change of control) qui peuvent permettre la résiliation au closing', 'Le nom du signataire côté client', 'C', 'Due diligence / Risques juridiques', 'Difficile', true),

-- Q37
('Vous présentez oralement une analyse à un client pour la première fois. Après 3 minutes, il vous interrompt : "Passez directement aux conclusions." Que faites-vous ?',
'Expliquer poliment que le contexte est nécessaire pour comprendre les conclusions', 'Sauter immédiatement aux conclusions et adapter votre discours en conséquence', 'Continuer votre présentation normalement pour ne pas perdre le fil', 'Demander combien de temps il vous reste', 'B', 'Communication client / Soft skills', 'Intermédiaire', true),

-- Q38
('Une note de bas de page dans les comptes d''une cible indique : "La société a reçu une mise en demeure d''un ancien salarié pour licenciement abusif, montant réclamé 180 K€, issue incertaine." Comment traitez-vous cela dans votre analyse FDD ?',
'Ignorer car c''est un litige RH, pas financier', 'Mentionner en annexe sans quantification', 'Intégrer dans les ajustements de NFD avec une probabilité pondérée et demander confirmation au management et aux avocats', 'Déduire 180 K€ intégralement de la VT sans discussion', 'C', 'Due diligence / Passifs éventuels', 'Difficile', true),

-- Q39
('Vous êtes sur un buy-side et l''IM du vendeur présente un EBITDA normatif de 4,2 M€. Votre propre retraitement ressort à 3,1 M€. Au multiple de 8x, l''écart de VT est de 8,8 M€. Quelle est votre approche pour la négociation ?',
'Utiliser l''EBITDA du vendeur pour ne pas froisser la relation', 'Utiliser votre EBITDA de 3,1 M€ et présenter un prix ferme non négociable', 'Documenter précisément chaque retraitement, les soumettre au vendeur avant l''offre et ancrer votre prix sur votre analyse', 'Faire une offre à mi-chemin entre les deux EBITDA', 'C', 'Négociation / Buy-side', 'Expert', true),

-- Q40
('Lequel de ces éléments NE fait PAS partie des livrables standards d''une mission de Financial Due Diligence (FDD) buy-side ?',
'Quality of Earnings (QoE) — normalisation de l''EBITDA', 'Analyse de la dette financière nette et des éléments debt-like', 'Rédaction du SPA et des garanties d''actif-passif', 'Analyse de la soutenabilité du BFR et du besoin en trésorerie', 'C', 'Périmètre FDD', 'Intermédiaire', true);
