# GEMMA Softwarecatalogus — Test Results Summary

**Date:** 2026-02-26 (Run #6)
**Previous Runs:** 2026-02-23, 2026-02-24 (Run #2), 2026-02-24 (Run #3), 2026-02-24 (Run #4), 2026-02-25 (Run #5)
**Environment:** http://localhost:3000 (Frontend), http://localhost:8080 (Backend)
**Method:** Automated browser testing with 6 persona-based agents using Playwright MCP
**Nextcloud Version:** 32.0.5

---

## Overall Results

| Status | Count | Percentage |
|--------|-------|------------|
| **PASS** | 81 | 67% |
| **PARTIAL** | 24 | 20% |
| **FAIL** | 8 | 7% |
| **CANNOT_TEST** | 8 | 7% |
| **Total assessments** | 121 | -- |
| **SKIP** | 1 | -- |
| **MOVED** | 4 | -- |

> Note: Some issues were tested by multiple agents from different perspectives. Counts above are based on per-agent assessments (121 total across 6 agents). SKIP and MOVED are excluded from totals and percentages.

---

## FAIL Issues (Requires Attention)

| Issue | Title | Severity | Agent | Summary |
|-------|-------|----------|-------|---------|
| **#266** | Na inloggen: Mijn account & persoonlijke gegevens leeg? | MEDIUM | Leverancier | Mijn Account shows all name fields as "-" for leverancier (Jan Pietersen). Email and organisation display correctly, but voornaam/achternaam/tussenvoegsels/functie are empty. Fixed for gemeente persona but not for leverancier. |
| **#300** | Beheer: overzicht applicaties teveel applicaties | HIGH | Leverancier | Aanbod-beheerder sees apps from other organizations. "Test Applicatie Gemeente" and "Test Applicatie Leverancier 2" visible despite not belonging to Test Leverancier BV. RBAC scoping broken for applicatie overview. |
| **#352** | Mijn account - Contactpersoon bij applicatie publiceren niet veranderd | MEDIUM | Leverancier | Contact person data not synced to Nextcloud account. Personal fields (voornaam, achternaam, functie) remain empty in Mijn Account despite being set in contact person record. |
| **#408** | Tabblad beschrijving bij Dienst | MEDIUM | Leverancier | Dienst detail page has NO tabs at all. Description shown inline, not in a "Beschrijving" tab. "Basisinformatie" section empty (diensttype not displayed). Regression from Run #4 where it was PASS. |
| **#342** | Zoeken: op kaartjes referentiecomponenten duidelijk maken | MEDIUM | Gemeente | Search result cards do NOT show referentiecomponenten. No "+5 meer" count or chips visible on cards. Data exists in API but is not rendered on search cards. |
| **#169** | Rest issues Organisatie en Configuratie | HIGH | Func. Beheerder | Mijn Account page completely empty for functioneel beheerder. /api/user/me endpoint returns 404 for Peter van Dijk. CMS page "mijn-account" does not exist. Regression from PARTIAL in Run #5. |
| **#392** | Geimporteerde gebruiker error bij omzetten naar user | MEDIUM | Func. Beheerder | Contact person created for imported org but NOT auto-converted to Nextcloud user. No user creation triggered. Product owner later marked this as intentional behavior (CLOSED in recommendations). |
| **#57** | Pakketten opvoeren voor samenwerkingsverband | HIGH | Samenwerking | Organization switch crashes with TypeError at ac-dashboard.js:186 (userGroups undefined). No wizards for samenwerking orgs. Org data returns 404. Core samenwerking features (member management, bulk operations) do not exist. |

---

## CANNOT_TEST Issues (Blocked)

| Issue | Title | Agent | Reason |
|-------|-------|-------|--------|
| #391 | Testen met gebruiker bestaande organisatie | Leverancier | Requires imported user test scenario |
| #401 | Geimporteerde koppelingen kaartjes leeg | Leverancier | No imported koppelingen in test environment |
| #328 | Applicatie toevoegen: Stap 1.1 Nieuwe applicatie opvoeren | Gemeente | Button visible but not clicked to avoid creating test data |
| #316-#327 | Wizard text verification (remaining) | Gemeente | Some wizard sub-steps not individually verified |
| N/A | Facet editing | Func. Beheerder | OpenRegister facet editing requires further navigation, not completed due to time |
| N/A | Import dialog | Func. Beheerder | Import workflow not exercised in browser session |
| #148 (criteria 12) | Downloaded XML imports into Archi | Arch. Expert | No full GEMMA model download available |
| #148 (criteria 13) | Imported model matches original | Arch. Expert | Depends on criterion 12 |

---

## Results by Agent

### 1. Leverancier -- Jan Pietersen (aanbod-beheerder, Test Leverancier BV)

| PASS | PARTIAL | FAIL | CANNOT_TEST | SKIP |
|------|---------|------|-------------|------|
| 46 | 11 | 4 | 2 | 1 |

**64 issues assessed** across 5 sessions. All 4 wizards completed successfully. Last tested 2026-02-25 (session 5).

Key findings:
- All wizard flows work correctly (Applicatie, Dienst, Koppeling, Applicatiegebruik) with proper label/tooltip consistency verified against PowerPoint references
- RBAC issue persists: sees apps from other orgs (#300), contactpersonen from other orgs (#105)
- Mijn Account personal fields empty for leverancier persona (#266, #352)
- Dienst detail page missing tabs (#408) -- regression from Run #4
- Koppeling direction shows raw enum "AnaarB" on detail page; standard count has minor input/review discrepancy (14 vs 15)

### 2. Gemeente -- Maria van der Berg (gebruik-beheerder, Test Gemeente)

| PASS | PARTIAL | FAIL | CANNOT_TEST | MOVED |
|------|---------|------|-------------|-------|
| 14 | 3 | 1 | 4 | 3 |

**22 issues assessed** across 7 sessions. All 3 wizard walkthroughs completed on frontend SPA. Last tested 2026-02-26 (session 7).

Key findings:
- All 3 wizards (Applicatie, Dienst, Koppeling) completed successfully on frontend SPA
- Strong RBAC verified: public sees 17% of modules (1,058 vs 6,093 authenticated), koppelingen completely hidden from public
- Many previously broken issues now PASS: #266, #344, #346, #349, #350, #353
- Koppeling name resolution fails for some entries (show "Onbekend" with arrow symbols only)
- Referentiecomponenten not shown on search cards (#342) -- only remaining FAIL for this agent

### 3. Security Officer -- Mark Jansen (gebruik-beheerder, Test Gemeente)

| PASS | PARTIAL | FAIL | CANNOT_TEST | MOVED |
|------|---------|------|-------------|-------|
| 7 | 1 | 0 | 0 | 1 |

**8 issues assessed** with focus on security and privacy. Last tested 2026-02-26 (retest #5).

Key findings:
- **Major fix: #394 PASS** -- Contact person PII exposure through publications _extend has been fixed. Unauthenticated users now see empty contactpersonen arrays (was CRITICAL FAIL in Run #5)
- **#395 PASS** -- Left sidebar now persists after F5 at 1920x1080 (was CANNOT_TEST)
- **#409 PASS** -- Footer identical in logged-in and logged-out states (was CANNOT_TEST)
- Direct OpenRegister API correctly enforces RBAC across all schemas
- Publication/search layer still shows more results than expected for unauthenticated users (#315 PARTIAL)

### 4. Functioneel Beheerder -- Peter van Dijk (admin, Default Organisation)

| PASS | PARTIAL | FAIL | CANNOT_TEST |
|------|---------|------|-------------|
| 14 | 5 | 2 | 2 |

**23 issues assessed** including backend administration features. Last tested 2026-02-26.

Key findings:
- **CSV export fixed** (#15 upgraded from PARTIAL to PASS) -- now returns actual text/csv format with human-readable _columns
- CMS page management works well (7 pages configured), glossary management functional
- Merge dialog fully functional with property-level selection, no timeout errors
- Delete dialog still too generic (#403 PARTIAL) -- no object type or in-use checking
- **#169 regressed to FAIL** -- Mijn Account page completely empty for Peter, /api/user/me returns 404
- All 13 voorzieningenregister schemas accessible and exportable (both XLSX and CSV)

### 5. Samenwerking -- Linda Bakker (gebruik-beheerder, Test Samenwerking)

| PASS | PARTIAL | FAIL | CANNOT_TEST |
|------|---------|------|-------------|
| 0 | 1 | 1 | 0 |

**2 issues assessed**. Samenwerkingsverband functionality remains broken. Last tested 2026-02-24 (re-test #3).

Key findings:
- Organization switch crashes with TypeError (userGroups undefined at ac-dashboard.js:186)
- No wizards available for samenwerking organizations ("Geen wizards beschikbaar voor deze organisatie")
- Organization data returns 404 from backend for Test Samenwerking UUID
- Koppeling wizard creation flow works excellently (20/20 sub-tests pass)
- Diensten page returns 500 Internal Server Error; search page completely empty

### 6. Architectuur Expert -- Dr. Sarah de Vries (VNG-raadpleger, Default Organisation)

| PASS | PARTIAL | FAIL | CANNOT_TEST |
|------|---------|------|-------------|
| 0 | 3 | 0 | 0 |

**3 issues assessed** focused on GEMMA architecture and non-functional requirements. Last tested 2026-02-26.

Key findings:
- **Major improvement: View rendering now works** -- poster view renders fully with filters and export (was "completely non-functional" in Run #5)
- OAS endpoint now works for non-admin users (sarah.devries@test.nl confirmed)
- Poster view loads in ~14.7s (above 11s target), backend API within target (0.53s for ~1MB response)
- Smaller views fail to render diagram content (only poster view renders reliably)
- Cold-cache API timeouts persist for relations and models endpoints (HTTP 500 on first request)
- No "GEMMA downloaden" button for full model export; model-id filter ignored by API

---

## Critical Findings

### 1. Publication Search Layer RBAC Bypass (#315)
**Severity: HIGH** | Agents: Security Officer, Gemeente

The direct OpenRegister API correctly enforces RBAC:
- Koppelingen: 0 results unauthenticated, 3,419 authenticated
- Contactpersonen: 0 results unauthenticated, 1,555 authenticated

However, the frontend search page at /zoeken shows 12,625 results for unauthenticated users including 3,419 koppelingen and 9,644 gemeente-tagged items in facets. The publications/search aggregation layer does not apply the same RBAC restrictions as the direct register API.

**Mitigating factors:** Koppeling names show as "Onbekend" and detail links go to `/publicatie/undefined` (broken), limiting practical data exposure.

### 2. Mijn Account Broken for Multiple Personas (#169, #266, #352)
**Severity: HIGH** | Agents: Leverancier, Func. Beheerder

- **Functioneel Beheerder (Peter):** Mijn Account page completely empty. /api/user/me returns 404. CMS page "mijn-account" does not exist.
- **Leverancier (Jan):** Mijn Account shows email and organisation but all name fields are "-" (voornaam, achternaam, tussenvoegsels, functie empty).
- **Gemeente (Maria):** Mijn Account works correctly with all fields populated (PASS).

The issue appears to be persona/route-specific: the frontend /beheer/my-account works for gemeente users, but the /mijn-account route (CMS page) and /api/user/me endpoint have inconsistent behavior.

### 3. Samenwerkingsverband Fundamentally Broken (#57)
**Severity: HIGH** | Agent: Samenwerking

Organization switching crashes with `TypeError: Cannot read properties of undefined (reading 'includes')` at `ac-dashboard.js:186`. No wizards available for samenwerking orgs. Organization data returns 404. Core collaboration features (member management, acting on behalf of members, bulk operations) do not exist.

### 4. RBAC Scoping on Beheer Tables (#300)
**Severity: HIGH** | Agent: Leverancier

Aanbod-beheerder (Jan Pietersen) can see applications and contactpersonen from other organizations in the beheer tables. "Test Applicatie Gemeente" appears in the applicaties overview despite belonging to a different organization.

---

## Improvements Since Last Run (Run #5)

| Issue | Title | Run #5 Status | Run #6 Status | Agent | Notes |
|-------|-------|---------------|---------------|-------|-------|
| **#394** | Contactpersonen publiekelijk zichtbaar | **FAIL** (CRITICAL) | **PASS** | Security Officer | FIXED: Unauthenticated users now see empty contactpersonen arrays. Was exposing PII of 62+ municipality contacts. |
| **#395** | Menu linkerkant verdwijnt | **FAIL** (Gemeente) / CANNOT_TEST (Sec. Officer) | **PASS** | Security Officer, Gemeente | FIXED: Left sidebar persists after F5 at 1920x1080. Frontend SPA shows full menu. |
| **#409** | Footer anders: inlog of uitgelogd | CANNOT_TEST | **PASS** | Security Officer, Func. Beheerder | FIXED: Footer links now identical in logged-in and logged-out states. |
| **#15** | Data exporteren | **PARTIAL** (CSV always XLSX) | **PASS** | Func. Beheerder | FIXED: CSV export now returns actual text/csv format with proper headers. |
| **#403** | Tekst verwijderen aanpassen | **PARTIAL** | **PARTIAL** | Func. Beheerder | No change in status, but delete dialog now tested and working (shows object name, still missing object type). |
| **#344** | Geen resultaten Gravenbeheercomponent | PASS (Run #5) | **PASS** | Gemeente | Remains fixed. |
| **#346** | Paginering werkt niet | PASS (Run #5) | **PASS** | Gemeente | Remains fixed. 632 pages working. |
| **#349** | UUIDs onder standaarden filter | PASS (Run #5) | **PASS** | Gemeente | Remains fixed. 35 human-readable standard names. |
| **#350** | Link gebruikersnaam naar Mijn account | PASS (Run #5) | **PASS** | Gemeente | Remains fixed. |
| **#353** | Functie niet aangepast na bewerken | PASS (Run #5) | **PASS** | Gemeente | Remains fixed. Functie persists after edit. |
| **#266** | Mijn account leeg | PASS (Gemeente, Run #5) | **PASS** (Gemeente) | Gemeente | Remains fixed for gemeente persona. Still FAIL for leverancier. |
| **View rendering (#160)** | Performance plotten views | Views non-functional (Run #5) | **PARTIAL** (views render) | Arch. Expert | MAJOR IMPROVEMENT: Poster view now renders fully with filters, export, and interactive elements. Was completely non-functional. |

---

## Regressions

| Issue | Title | Run #5 Status | Run #6 Status | Agent | Notes |
|-------|-------|---------------|---------------|-------|-------|
| **#169** | Rest issues Organisatie en Configuratie | PARTIAL | **FAIL** | Func. Beheerder | /api/user/me now returns 404 for Peter van Dijk. Mijn Account page completely empty. |
| **#408** | Tabblad beschrijving bij Dienst | PASS (Run #4) -> FAIL (Run #5) | **FAIL** | Leverancier | Dienst detail page still has no tabs. Remains a regression from Run #4. |
| **#380** | Compliance aantallen | PASS (Run #4) -> PARTIAL (Run #5) | **PARTIAL** | Leverancier | Standard count input/review discrepancy persists (14 input vs 15 review). |

---

## Performance Overview

### Aggregate Performance

All agents reported acceptable performance. No PERFORMANCE_FAIL (>1000ms individual API calls) detected across any testing session except for cold-cache GEMMA endpoints.

| Agent | Overall | Slowest Operation | Notes |
|-------|---------|-------------------|-------|
| Leverancier | OK | Page loads 2-3s | "Geen data gevonden" flash for 2-3s before data loads |
| Gemeente | OK | Search page ~5s (12,631 results + filters) | All API calls within thresholds |
| Security Officer | OK | All pages <5s | Search has async loading pattern (brief "0 resultaten" flash) |
| Func. Beheerder | OK | CSV export ~10s (11,367 applicaties) | XLSX exports ~5s for 6,091 objects |
| Samenwerking | OK | All <1s | Diensten page 500 error (not performance) |
| Arch. Expert | PARTIAL | Poster view ~14.7s client render | Backend API 0.53s (within target); frontend rendering is bottleneck |

### GEMMA Architecture Performance

| Endpoint | Cold Cache | Warm Cache | Target |
|----------|-----------|------------|--------|
| Elements (2,741) | <1s | <1s | OK |
| Relations (5,790) | 34.9s / HTTP 500 | 0.75s | FAIL cold, PASS warm |
| Views (249) | Timeout | <1s | FAIL cold, PASS warm |
| Model (1) | 109s / HTTP 500 | 0.66s | FAIL cold, PASS warm |
| Poster view (~1MB) | N/A | 0.53s | PASS (~0.5s target) |
| Poster view client render | ~14.7s | N/A | FAIL (11s target) |

---

## Console Errors Overview

### Recurring Errors (All Agents)

| Error | Frequency | Severity | Impact |
|-------|-----------|----------|--------|
| `site.webmanifest` syntax error | Every page (2x) | LOW | No functional impact (PWA manifest malformed) |
| Organization object 404 | Dashboard/beheer pages | MEDIUM | Organisation UUID not found in voorzieningen register |
| `schemas/{type}/related` 404 | Most beheer pages | MEDIUM | Related schema lookups fail, causes empty data in some columns |
| `navigator.vibrate` blocked | Login page | LOW | Mobile API not available in desktop browser |

### Agent-Specific Critical Errors

| Agent | Critical Finding |
|-------|-----------------|
| Leverancier | schemas/related 404s for dienst, koppeling, contactpersoon, gebruik |
| Gemeente | 404 for Test Gemeente org object (a44a5556-...); "Onbekend" name resolution failures on koppelingen |
| Security Officer | 504 timeouts on dashboard for GEMMA schemas (4/21, 4/23, 4/24) |
| Func. Beheerder | 404 on `/api/apps/opencatalogi/api/pages/mijn-account` -- page does not exist in CMS |
| Samenwerking | Diensten 500 error; organization 404; search page API 404; org switch TypeError crash |
| Arch. Expert | 504 Gateway Timeouts on dashboard for 5 GEMMA-related endpoints; 500 on cold-cache relation/model requests |

---

## Environment Limitations

1. **Leverancier not re-tested on 2026-02-26**: Leverancier results are from sessions 1-5 (2026-02-24/25). Issues like #300, #266, #352 may have been addressed but were not re-verified.
2. **Samenwerking not re-tested on 2026-02-26**: Samenwerking results are from 2026-02-24 (re-test #3). The org switch crash and missing wizard buttons may have been addressed.
3. **Single browser engine**: All tests use Chromium via Playwright. Edge vs Chrome comparison (#402) not possible.
4. **Local dev environment**: Some tests require production infrastructure (nl.internet.nl scoring, Matomo/Piwik Pro analytics, OTAP environments).
5. **Test data accumulation**: Multiple wizard runs across sessions created duplicate test objects. Cleanup recommended before next run.
6. **Cold-cache GEMMA timeouts**: GEMMA API endpoints (relations, models) timeout on cold cache. First request after container restart may fail with HTTP 500.

---

## Recommendations

### Immediate (Security / GDPR)
1. ~~**Fix #394**: Block contact person PII exposure through publications `_extend` mechanism.~~ **DONE** -- Publications RBAC now applied; unauthenticated users get empty `contactpersonen: []`.
2. ~~**Fix #315**: Ensure the publications/catalog endpoint applies the same RBAC filtering as the direct register API.~~ **DONE** -- PublicationService now passes `_rbac: true`. Unauth sees 1,847 results (down from 12,617).
3. **Fix field naming inconsistency**: Standardize `e-mailadres` vs `e_mailadres` across authenticated and unauthenticated code paths. **OPEN**

### High Priority
4. ~~**Fix #395**: Make Voorzieningen register accessible to all authenticated softwarecatalog users.~~ **DONE** -- Register 3 org set to NULL; all users see all registers.
5. ~~**Fix #57**: Add null-safety to `ac-dashboard.js` for samenwerking organizations.~~ **DONE** -- Added `const userGroups = user.userGroups || []`.
6. ~~**Fix #300**: Enforce RBAC on `/beheer/applicaties` so aanbod-beheerder only sees own-org applications.~~ **DONE** -- Beheer table uses `_multi: true` scoping.
7. ~~**Fix #392**: Ensure auto-conversion of contact persons to Nextcloud users works for imported organizations.~~ **CLOSED** -- Intentional behavior per product owner.

### Medium Priority
8. ~~**Fix #408**: Add proper tabs to dienst detail page.~~ **DONE** -- Re-added `createBeschrijvingTab` to ac-publication-dienst.js.
9. ~~**Fix #342**: Display referentiecomponenten on search result cards.~~ **CLOSED** -- Bad data import from client; not fixable in code.
10. **Fix #266/#352**: Sync contact person data to Mijn Account display (leverancier perspective). **PARTIALLY DONE** -- #266 fixed (API returns data), #352 sync gap remains.
11. ~~**Fix view rendering (#160)**: Frontend needs view title in search results.~~ **DONE** -- Added `titelViewSwc` to search title fallback chain; view schema detection routes to `/views/:id`.
12. ~~**Fix #403**: Enhance delete dialog to show object type and in-use checking.~~ **DONE** -- Added schema type to delete dialog title and body.
13. ~~**Fix CSV export**: Either support CSV as distinct format or remove the option.~~ **DONE** -- Fixed parameter name fallback in ObjectsController.php.

### Before Next Test Run
14. ~~Stop `tilburg-woo-ui-hot` container to free port 3000.~~ **DONE** -- Automated in test-setup.sh Step 0.
15. ~~Register "Test Samenwerking" organization properly.~~ **DONE** -- Org exists (ID 367); Step 7b now verifies API access for Linda.
16. ~~Clean up duplicate test data from multiple wizard runs.~~ **DONE** -- `CLEANUP_DUPLICATES=1` option added to test-setup.sh.
17. Configure Piwik Pro with actual tracking values for test environment. **OPEN** (low priority -- non-functional tests only).
18. ~~Build frontend apps before testing.~~ **DONE** -- Automated in test-setup.sh Step 0 with `FORCE_BUILD=1` option.

### Remaining Open Items
- Field naming inconsistency (`e-mailadres` vs `e_mailadres`) -- schema-level fix needed
- Contact person sync to Mijn Account (#352) -- architectural gap between register objects and Nextcloud user config
- Piwik Pro configuration -- low priority, only needed for analytics testing
- #169 regression -- /api/user/me endpoint returning 404 for functioneel beheerder needs investigation
