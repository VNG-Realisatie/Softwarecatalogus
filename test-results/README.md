# GEMMA Softwarecatalogus — Test Results Summary

**Date:** 2026-02-23
**Environment:** http://localhost:3000 (Frontend), http://localhost:8080 (Backend)
**Method:** Automated browser testing with 6 persona-based agents using Playwright MCP

---

## Overall Results

| Status | Count | Percentage |
|--------|-------|------------|
| **PASS** | 30 | 37% |
| **PARTIAL** | 16 | 20% |
| **FAIL** | 8 | 10% |
| **CANNOT_TEST** | 27 | 33% |
| **Total tested** | 81 | — |

> **Note:** Counts reflect distinct issues across all 6 agents, deduplicated where the same issue was tested by multiple agents (keeping the most informative result). The leverancier agent had 42 CANNOT_TEST results due to browser session instability; these are counted individually only where no other agent tested the same issue. Seven "NOT TESTED" results from the gemeente agent (wizard steps #316-#322, #328) are excluded as the wizards were never executed.

---

## FAIL Issues (Requires Attention)

| Issue | Title | Severity | Agent | Summary |
|-------|-------|----------|-------|---------|
| #315 | Zoekpagina toont gemeentelijk applicatielandschap | CRITICAL | Security Officer, Gemeente | 9,645 gemeente-registered items and 3,422 koppelingen publicly visible. "Aangeboden door Rotterdam" shown instead of actual vendor. Frontend proxy authenticates as admin (`x-user-id: admin`), bypassing all RBAC — exposes 12,645 items vs. 1,853 on direct backend. |
| #267 | Naam is softwarecatalogus i.p.v. Softwarecatalogus | LOW | Leverancier, Func. Beheerder | Header shows "Development Catalogus" instead of "Softwarecatalogus" on all pages. Tab titles, headers, and login page affected. Configuration issue. |
| #306 | Dienst: Overzicht controleren verbeteren | MEDIUM | Leverancier | "Diensttype" column appears TWICE in diensten table header. |
| #312 | Koppeling heeft verplicht een naam | MEDIUM | Leverancier | 3 of 6 koppelingen show UUID-based names (e.g., "2bad5e09-eb5f-408f-a53f-588d89514cd5 <-> DigiD") instead of auto-generated human-readable names. |
| #357 | Diensten: Diensttype en Type door elkaar | MEDIUM | Leverancier | Duplicate "Diensttype" columns in diensten table (same root cause as #306). |
| #367 | Contactpersonen: Tussenvoegsel niet getoond | MEDIUM | Leverancier | Name shows "Jan Berg" instead of "Jan van de Berg" — Dutch tussenvoegsel missing from display. |
| #86 | NL API strategie standaarden (within #135) | MEDIUM | Architectuur Expert | No OpenAPI Specification document available. `/api/apps/openregister/api/oas` and `/api/apps/opencatalogi/api/oas` both return 404. Fails NL API strategie requirement. |
| #148 | GEMMA-architectuur API (OAS/filtering) | MEDIUM | Architectuur Expert | Data endpoints work (5/10 criteria pass). OAS documentation missing (404). Empty properties not omitted (80 of 88 fields null). `model-id` filter parameter does not work. ID fields undocumented. |

---

## PARTIAL Issues

| Issue | Title | Agent | Summary |
|-------|-------|-------|---------|
| #186 | Koppelingen | Samenwerking | Older koppelingen show arrow-only titles, "null" for missing app references, raw UUIDs for standaardversies. Newer koppelingen correct in body but UUID in h1 heading. |
| #394 | Contactpersonen publiekelijk zichtbaar | Security Officer | All contactpersonen arrays return empty — cannot confirm RBAC enforcement vs. missing test data. Proxy authenticates as admin, masking real access control behavior. |
| #85 | Publieke API toegang tot aanbodinformatie | Security Officer | API accessible and returns data. Pagination works. `_schema` filter does not work. Koppeling details accessible by direct ID without auth. OAS/Redocly docs not found. |
| #144 | Overzicht organisaties zoek/filter | Gemeente | Search returns 12,645 results with sort options. Filter facets not fully tested. Supplier names on cards sometimes show municipalities instead of vendors. |
| #280 | Zoeken: sorteren gaat niet goed | Gemeente | Sort dropdown present with 5 options. Could not verify actual result reordering due to session instability. |
| #324 | Applicatie toevoegen: Stap 2 Gebruiksinformatie | Gemeente | Status default is "Verwerving" instead of expected "in productie". All other fields correct. |
| #340 | Bevindingen tussenoplevering Zoeken | Gemeente | Default sorting correct ("Naam A-Z"). Dates visible on cards. "Diensttype" rename and "Meest relevant" tooltip not verified. |
| #346 | Zoeken: paginering werkt niet | Gemeente | Pagination present (633 pages, ~20 per page). Clicking page 2 caused session redirect — could not verify different results appear. |
| #350 | Link achter gebruikersnaam naar Mijn account | Gemeente | "Beheer" link changes URL based on current page — inconsistent. No explicit username link visible in navigation. |
| #395 | Menu linkerkant verdwijnt | Gemeente, Security Officer | No left sidebar navigation exists in current implementation. Beheer uses top-bar navigation only. Possibly redesigned. |
| #376 | Applicaties: labels wizard en tabel anders | Leverancier | Step 1 wizard labels match table ("Naam", "Website", "Korte omschrijving"). Full comparison with spec not completed. |
| #387 | Applicatie publiceren: i niet aanwezig | Leverancier | Tooltip (i) icons present on all Step 1 fields. Version step not reached to verify. |
| #308 | Diensten: default kolommen + kolom verwijderen | Leverancier | Default columns shown but "Diensttype" appears as duplicate. Column persistence not tested. |
| #332 | Voorpagina inrichten | Func. Beheerder | 3 content blocks OK. Missing user info in header. No quote section visible. English "General" block is inconsistent with Dutch UI. |
| #410 | Dashboard schrijfwijze softwarecatalogus | Func. Beheerder | Welcome text uses correct lowercase "softwarecatalogus". Header still says "Development Catalogus". |
| #135 | Non-functionele eisen Referentiearchitectuur | Architectuur Expert | 7/19 criteria pass, 5 partial, 1 fail (#86 OAS), 6 cannot test. Performance NFRs fully met. Basic accessibility present. |

---

## PASS Issues

| Issue | Title | Agent |
|-------|-------|-------|
| #105 | Aanbieders zien applicatielandschappen niet | Leverancier |
| #300 | Beheer: overzicht applicaties correct aantal | Leverancier |
| #307 | Diensten overzicht: correct aantal diensten | Leverancier |
| #358 | Diensten: Status "Concept" niet meer getoond | Leverancier |
| #364 | Contactpersonen: e-mailadres zichtbaar | Leverancier |
| #366 | Contactpersonen: veld Rollen consistent | Leverancier |
| #369 | Applicatie publiceren: koppeling zichtbaar | Leverancier |
| #370 | Applicatie: correcte kolommen getoond | Leverancier |
| #266 | Na inloggen: Mijn account gegevens zichtbaar | Gemeente |
| #323 | Applicatie toevoegen: Stap 1 Applicatie zoeken | Gemeente |
| #325 | Applicatie toevoegen: Stap 3 Referentiecomponenten | Gemeente |
| #326 | Applicatie toevoegen: Stap 4 Deelnemer (correct skip) | Gemeente |
| #327 | Applicatie toevoegen: Stap 5 Controleren | Gemeente |
| #183 | Wachtwoord vergeten optie | Security Officer |
| #404 | Regelmatig witte schermen (appears resolved) | Security Officer |
| #406 | SiteImprove verwijderen | Security Officer, Func. Beheerder |
| #409 | Footer anders: inlog of uitgelogd | Security Officer, Func. Beheerder |
| #397 | Pagina aanmaken via CMS | Func. Beheerder |
| #155 | Definities via interactieve optie (Begrippenlijst) | Func. Beheerder |
| #92 | Webstatistiekenpakket (Piwik Pro) | Func. Beheerder |
| #85 | Publieke API toegang (data endpoints) | Func. Beheerder |
| #148 | GEMMA-architectuur API (data endpoints) | Func. Beheerder |
| #278 | Filterteksten aanpassen | Func. Beheerder |
| #396 | Verouderde NextCloud versie (now 32.0.5) | Func. Beheerder |
| #225 | Testresultaten 29-10-2025 (own apps visible) | Func. Beheerder |
| #160 | Performance plotten views | Architectuur Expert |
| #169 | Rest issues Organisatie (no auth timeout errors) | Func. Beheerder |
| #393 | Backend fouten voorzieningenregister (API works) | Func. Beheerder |

---

## CANNOT_TEST Issues (Blocked)

| Issue | Title | Agent | Reason |
|-------|-------|-------|--------|
| #57 | Pakketten opvoeren voor samenwerkingsverband | Samenwerking | No member municipality management UI exists. Organization selector only shows own orgs. Core collaboration feature untestable. |
| #141 | Organisaties samenvoegen na herindeling | Func. Beheerder | Backend-specific merge operation with risk of modifying production-like data. |
| #15 | Data exporteren | Gemeente | Export functionality not reached due to session instability. |
| #286 | Aanmelden organisatie: 500-error wachtwoord | Gemeente | Password change flow not tested. |
| #328 | Applicatie toevoegen: Nieuwe applicatie opvoeren | Gemeente | "Applicatie niet gevonden" sub-step not clicked through. |
| #342 | Zoeken: referentiecomponenten op kaartjes | Gemeente | Filter panel not accessible during session. |
| #343 | Zoeken: Filter 'Type koppeling' toevoegen | Gemeente | Filter panel not accessible during session. |
| #344 | Zoeken: Geen resultaten Gravenbeheercomponent | Gemeente | Filter panel not accessible during session. |
| #349 | Zoeken: UUID's onder standaarden filter | Gemeente | Filter panel not accessible during session. |
| #353 | Mijn account: Functie niet aangepast na bewerken | Gemeente | Edit/save flow not tested. |
| #355 | Diensten: Export geeft UUID's | Gemeente | Diensten table not accessed during session. |
| #403 | Tekst verwijderen aanpassen | Func. Beheerder | No suitable test object found; delete dialog not triggered. |
| #274 | Wizard dienst: tekst aanpassen | Leverancier | Could not complete dienst wizard (browser instability). |
| #314 | Wizard Koppeling: eigen applicaties niet gevonden | Leverancier | Could not run koppeling wizard in session. |
| #348 | Standaarden Centric Begraven | Leverancier | Could not navigate to application detail page. |
| #365 | Contactpersoon save error | Leverancier | Did not attempt to edit/save a contact person. |
| #391 | Testen met gebruiker bestaande organisatie | Leverancier | Backend activation test, not testable from frontend. |
| #392 | Geimporteerde gebruiker error bij omzetten | Leverancier | Backend test, not testable from frontend. |
| #399 | Versie andere leverancier foutmelding | Leverancier | Could not navigate to public search and view another supplier's version. |
| #400 | Koppeling opslaan foutmelding | Leverancier | Could not run koppeling wizard. Evidence of successful creation exists (6 koppelingen in table). |
| #401 | Geimporteerde koppelingen kaartjes leeg | Leverancier | Could not navigate to individual koppeling detail pages. |

> **Additional leverancier CANNOT_TEST:** 20+ detail-page and wizard-step issues were blocked by browser session instability (fullPage screenshots crashing context, session drops on navigation). These include #294, #302, #373, #375, #377, #379-#386, #388-#390, #407-#408, #185, #248, #351-#352, #354, #356, #359-#363, #368, #371-#372, #374, #378.

---

## Results by Agent

### 1. Leverancier — Jan Pietersen
| PASS | PARTIAL | FAIL | CANNOT_TEST | SKIP |
|------|---------|------|-------------|------|
| 10 | 2 | 5 | 42 | 1 |

Key findings:
- RBAC data scoping works correctly across all beheer pages — only own organization's data visible (#105, #300, #307 all PASS)
- Duplicate "Diensttype" column in diensten table is a clear UI regression (#306, #357)
- Tussenvoegsel missing from contact person names (#367 FAIL: "Jan Berg" instead of "Jan van de Berg")
- Koppeling auto-naming fails when created without explicit name — uses UUID of Applicatie A (#312)
- Browser session instability prevented testing 42 issues (detail pages, wizard steps 2+, compliance views)

### 2. Gemeente — Maria van der Berg
| PASS | PARTIAL | FAIL | CANNOT_TEST |
|------|---------|------|-------------|
| 6 | 5 | 1 | 12 |

Key findings:
- Applicatie toevoegen wizard Steps 1, 3, 4 (skip), and 5 all PASS; Step 2 has wrong default status (#324: "Verwerving" instead of "in productie")
- Municipal application landscapes exposed in search — municipalities shown as suppliers (#315 FAIL)
- Mijn Account page fully populated with correct personal data including tussenvoegsel (#266 PASS)
- Dienst and Koppeling wizards not executed due to concurrent agent session conflicts

### 3. Security Officer — Mark Jansen
| PASS | PARTIAL | FAIL | CANNOT_TEST |
|------|---------|------|-------------|
| 4 | 2 | 1 | 2 |

Key findings:
- CRITICAL infrastructure finding: frontend proxy authenticates ALL requests as admin, exposing 12,645 publications vs. 1,853 on direct backend API
- 9,645 gemeente-registered items and 3,422 koppelingen visible to unauthenticated users through proxy
- Password reset uses secure one-time code approach (#183 PASS)
- No white screens observed across extensive navigation (#404 PASS)
- SiteImprove fully removed, Piwik Pro present (#406 PASS)

### 4. Functioneel Beheerder — Peter van Dijk
| PASS | PARTIAL | FAIL | CANNOT_TEST |
|------|---------|------|-------------|
| 9 | 5 | 1 | 5 |

Key findings:
- Public API fully functional for both Softwarecatalogus and GEMMA registers (#85, #148 PASS)
- CMS page management works with 7 pages manageable via backend (#397 PASS)
- Nextcloud updated to version 32.0.5 (#396 PASS)
- All search filter labels correct and in Dutch (#278 PASS)
- Interactive glossary with 10 terms fully functional (#155 PASS)
- Footer shows incorrect "Open Tilburg — Een plek voor alle publicaties van Gemeente Tilburg" branding

### 5. Samenwerking — Linda Bakker
| PASS | PARTIAL | FAIL | CANNOT_TEST |
|------|---------|------|-------------|
| 0 | 1 | 0 | 1 |

Key findings:
- Koppelingen have mixed quality: wizard-created data correct, imported data shows "null" for missing app references, arrow-only titles, and raw UUIDs for standaardversies (#186 PARTIAL)
- Member municipality management feature not available — cannot register packages on behalf of members (#57 CANNOT_TEST)
- "Test Samenwerking" appears 7 times as duplicate in Deelnames dialog (data quality issue)
- Debug panel ("Debug: Koppeling Data") visible in wizard — should be hidden in production

### 6. Architectuur Expert — Dr. Sarah de Vries
| PASS | PARTIAL | FAIL | CANNOT_TEST |
|------|---------|------|-------------|
| 1 | 2 | 0 | 0 |

Key findings:
- Excellent ArchiMate view rendering performance: 388-node view renders in 925ms, well under 11-second benchmark (#160 PASS)
- GEMMA API data fully functional: 2,741 elements, 5,790 relations, 249 views, 1 model, 74 property definitions
- Missing OAS documentation (404 on all endpoints) fails NL API strategie requirement (#86, #148)
- API responses include 80 null fields per element — significant payload bloat
- Cross-browser testing (Edge, Firefox) not performed

---

## Critical Findings

### 1. Frontend Proxy Authentication Leak (CRITICAL)
The frontend proxy at `localhost:3000/api/` authenticates ALL requests with admin credentials (confirmed by `x-user-id: admin` response header). This bypasses all RBAC restrictions:
- **Frontend proxy** returns **12,645 publications** (includes restricted data)
- **Direct backend API** returns **1,853 publications** (correct public count)
- **Impact:** ~10,792 items that should be RBAC-restricted (koppelingen, gebruik, gemeente-registered applications) are exposed
- This must be verified on accept and production environments — same pattern would be a critical vulnerability if deployed.

### 2. Municipal Application Landscapes Publicly Visible (#315)
Search results show municipalities as software suppliers (e.g., "Aangeboden door Rotterdam", "Aangeboden door Deurne", "Aangeboden door Bloemendaal-Heemstede"). The "Geregistreerd door" filter reveals 9,645 items registered by gemeenten. Municipal IT topology including internal connection types is exposed. The supplier shown on search cards does not match the supplier on detail pages.

### 3. Missing OpenAPI Specification Documentation (#148, #86)
No OAS documentation is available for either the Softwarecatalogus or GEMMA architecture APIs. Both `/api/apps/openregister/api/oas` and `/api/apps/opencatalogi/api/oas` return 404. This is a formal requirement of the NL API strategie and blocks API consumers from self-service integration.

### 4. Tussenvoegsel Display Bug (#367)
Contact person names omit the Dutch tussenvoegsel across multiple views. "Jan van de Berg" displays as "Jan Berg". This affects contactpersonen tables and likely applicatie/dienst detail pages as well.

### 5. Duplicate Diensttype Column (#306, #357)
The diensten table header shows "Diensttype" twice — a clear regression. Same root cause for both issues.

---

## Recommendations

### Immediate (Security/Privacy)
1. **Fix frontend proxy authentication** — the proxy MUST NOT pass admin credentials for unauthenticated or regular user requests. Each request should forward the actual user's session token or none for public access.
2. **Verify proxy configuration on accept and production environments** — confirm the same admin authentication bypass does not exist in deployed environments.
3. **Filter search results by RBAC** — gemeente-registered applications, koppelingen, and usage data must not be publicly visible to unauthenticated users.
4. **Restrict koppeling detail access** — direct backend API returns koppeling publication details (schema 18) without authentication.

### High Priority
1. **Fix duplicate "Diensttype" column** in diensten table (#306, #357).
2. **Fix tussenvoegsel display** — single root cause affecting contact person name rendering (#367).
3. **Fix koppeling auto-naming** — use resolved application names instead of UUIDs when auto-generating names (#312).
4. **Fix wizard status default** — "Applicatie toevoegen" Step 2 should default to "in productie" not "Verwerving" (#324).
5. **Generate OAS documentation** for Softwarecatalogus and GEMMA architecture APIs (#148, #86).
6. **Handle null application references** gracefully on koppeling detail pages — currently shows literal "null" (#186).
7. **Configure catalog name** to "Softwarecatalogus" instead of "Development Catalogus" (#267).
8. **Remove debug panels** from wizard forms visible to end users.
9. **Fix "Open Tilburg" footer branding** — should reflect VNG Softwarecatalogus, not Gemeente Tilburg.
10. **Omit null properties from API responses** — 80 of 88 fields null per ArchiMate element creates unnecessary payload.

### Before Next Test Run
1. **Isolate browser sessions** — concurrent agents sharing the same Nextcloud backend cause session conflicts. Run agents sequentially or assign dedicated sessions.
2. **Avoid fullPage screenshots** in Playwright — these crash the browser context. Use viewport-only screenshots.
3. **Populate test data** — contact person records for all organizations, member municipalities for samenwerkingen, cross-supplier version data.
4. **Fix site.webmanifest syntax error** — appears on every page load across all agents (cosmetic but noisy).
5. **Test filter panel separately** — multiple issues (#342, #343, #344, #349) blocked because filter panel was inaccessible during session instability.
6. **Deduplicate "Test Samenwerking"** entries in Deelnames dialog (appears 7 times).

---

## Test Artifacts

Each agent directory contains:
- `results-authenticated.md` — Detailed test results with acceptance criteria checkboxes
- `*.png` — Screenshots documenting evidence

| Directory | Agent | Issues Tested |
|-----------|-------|---------------|
| `leverancier/` | Jan Pietersen (aanbod-beheerder) | 54 |
| `gemeente/` | Maria van der Berg (gebruik-beheerder) | 24 |
| `security-officer/` | Mark Jansen (gebruik-beheerder) | 9 |
| `functioneel-beheerder/` | Peter van Dijk (functioneel-beheerder) | 20 |
| `samenwerking/` | Linda Bakker (gebruik-beheerder) | 2 |
| `architectuur-expert/` | Dr. Sarah de Vries (VNG-raadpleger) | 3 |
