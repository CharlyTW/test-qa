# Rendu — Test QA Cocon (MSG-42)

**Candidat :**  
**Temps passé (approx.) :**  
**Lien dépôt / branche de rendu :**

Présente tes résultats de façon **claire et compréhensible**. Une preuve par finding (URL, compte, action, ou `fichier:ligne`).

---

## 1. Compréhension du besoin (ticket)

- Comportements que tu retiens (liste) :
- Zones floues / questions posées (ou que tu aurais posées) :
- Hors périmètre que tu as volontairement écarté :
- Ce que « archiver » veut dire pour toi (et ce que ce n’est **pas**) :

---

## 2. Recette (application qui tourne)

Pour chaque écart constaté en recette :

### F-xx — titre court

- **Sévérité :** bloquant / majeur / mineur  
- **Lien ticket :** (comportement attendu concerné)  
- **Preuve :** URL, compte(s), fenêtre, action  
- **Attendu vs actuel :**  
- **Correction suggérée :** (ou « corrigé dans le code » + fichiers)

---

## 3. Analyse livraison / code / conventions / specs

Même format que la section 2.  
Preuve = `fichier:ligne` + extrait court si utile.  
Couvre au minimum : écarts aux [`CONVENTIONS.md`](CONVENTIONS.md), specs existantes, problèmes de qualité visibles sur le périmètre messagerie / annonces.

---

## 4. Cas particuliers et scénarios

- Cas limites ou enchaînements que tu juges sources d’erreur (liste courte) :
- Scénarios Gherkin : voir [`scenarios.feature`](scenarios.feature) (**ne pas** coller le Gherkin ici).

Les scénarios doivent rester **cohérents** avec ce que tu as réellement recetté (couverture utile, maintenables, pas une liste décorative).

---

## 5. Axes d’amélioration (revue)

Points à améliorer ou à revoir pour un code / une livraison de meilleure qualité (pratiques, structure, tests, clarté produit…).  
Tu peux te limiter aux classes et fichiers utiles au projet (pas besoin d’auditer le cœur de Rails).

- …
- …

---

## 6. Bonus (optionnel)

Non pénalisé si absent.

- Specs ajoutées : fichiers + intention en 2 lignes ; comment les lancer  
- Correctifs : fichiers + intention en 2 lignes  
- Sinon : « non traité »
