# GEMMA Softwarecatalogus — Test Results Summary

**Date:** 2026-02-23 (Run 5 — 6 authenticated personas)
**Environment:** Local development (Frontend: http://localhost:3000, Backend: http://localhost:8080)
**Method:** Automated browser testing with 6 persona-based agents using Playwright MCP
**Issues tracked:** ~90 unique issues from [VNG-Realisatie Project Board #17](https://github.com/orgs/VNG-Realisatie/projects/17/views/22)

---

## Overall Results

| Status | Count | Percentage |
|--------|-------|------------|
| **PASS** | 42 | 41.2% |
| **PARTIAL** | 27 | 26.5% |
| **FAIL** | 17 | 16.7% |
| **CANNOT_TEST** | 12 | 11.8% |
| **CANNOT_VERIFY** | 2 | 2.0% |
| **SKIP** | 1 | 1.0% |
| **Total test results** | 101 | — |

> Note: Some issues tested by multiple agents (e.g., #85, #278, #315, #395, #406, #409). Total test results exceeds unique issue count.

### Compared to Previous Run (Run 4)

| Metric | Run 4 | Run 5 | Change |
|--------|-------|-------|--------|
| PASS | 54 | 42 | -12 |
| PARTIAL | 25 | 27 | +2 |
| FAIL | 7 | **17** | **+10** |
| CANNOT_TEST | 24 | **12** | **-12** |
| SKIP | 3 | 1 | -2 |
| Personas | 7 | 6 | -1 (no bezoeker) |

**Key changes:** CANNOT_TEST dropped significantly (-12) as proper test organizations enabled wizard walkthroughs and org-specific features. FAIL count increased (+10) because previously untestable issues are now testable and revealing real bugs (tussenvoegsel, duplicate columns, actions menu). The leverancier agent tested 54 issues (most comprehensive). All 3 leverancier wizards and the gemeente usage wizard completed successfully.

---

## FAIL Issues (Requires Attention)

| Issue | Title | Severity | Agent | Summary |
|-------|-------|----------|-------|---------|
| **#394** | Contactpersonen van gemeenten publiekelijk zichtbaar | **CRITICAL** | Security Officer | Contact person PII (names, emails, phones) visible to unauthenticated browser users on gemeente detail pages. Browser sessions bypass RBAC that curl correctly enforces. |
| **#315** | Zoekpagina toont deel gemeentelijk applicatielandschap | **HIGH** | Security, Gemeente | Municipalities shown as suppliers ("Aangeboden door Rotterdam"); 9,645 gemeente-registered entries and 3,420 koppelingen publicly visible |
| **#306** | Dienst: Overzicht controleren verbeteren | HIGH | Leverancier | Duplicate "Diensttype" column in diensten table |
| **#352** | Mijn account - Contactpersoon niet veranderd | HIGH | Leverancier | Contact person name mismatch; wizard shows different name than logged-in user |
| **#356** | Diensten: geen tussenvoegsel bij namen | HIGH | Leverancier | "Jan Berg" instead of "Jan van de Berg" — tussenvoegsel missing |
| **#357** | Diensten: Diensttype en Type door elkaar | HIGH | Leverancier | "Diensttype" column appears twice in diensten table |
| **#367** | Contactpersonen: Tussenvoegsel wordt niet getoond | HIGH | Leverancier | Same tussenvoegsel bug across contactpersonen views |
| **#372** | Applicaties: Kolom Contactpersoon geen tussenvoegsel | HIGH | Leverancier | Tussenvoegsel missing in applicaties table |
| **#384** | Applicaties: eenduidige manier van bewerken | MEDIUM | Leverancier | Actions menu shows 6 options instead of just Bewerken + Verwijderen |
| **#410** | Dashboard schrijfwijze softwarecatalogus | MEDIUM | Leverancier, Func. Beheerder | "Softwarecatalogus" uses uppercase S instead of lowercase |
| **#350** | Link achter gebruikersnaam naar Mijn account | LOW | Gemeente | No username displayed in top navigation |

*Issues #306/#357 share root cause (duplicate column). Issues #352/#356/#367/#372 share root cause (tussenvoegsel bug).*

---

## CANNOT_TEST Issues (Blocked)

| Issue | Title | Agent | Reason |
|-------|-------|-------|--------|
| #348 | Standaarden Centric Begraven | Leverancier | Application not in test org |
| #359 | Diensten wizard tekst aanpassen | Leverancier | Requires PowerPoint image comparison |
| #360 | Diensten wizard i's niet overeen | Leverancier | Requires PowerPoint image comparison |
| #365 | Contactpersoon save error | Leverancier | Edit/save flow not tested |
| #378 | Standaarden na wijzigen veranderd | Leverancier | Issue labeled "wontfix" |
| #392 | Geimporteerde gebruiker error | Leverancier | Backend operation not performed |
| #399 | Versie andere leverancier foutmelding | Leverancier | Cross-supplier test not executed |
| #15 | Data exporteren | Gemeente | No data in gemeente tables |
| #286 | 500-error wachtwoord wijzigen | Gemeente | No contact persons in Test Gemeente |
| #355 | Diensten export UUID's | Gemeente | Diensten table not accessible |
| #141 | Organisaties samenvoegen | Func. Beheerder | Requires admin-level data access |

---

## Results by Agent

### 1. Leverancier — Jan Pietersen (Aanbod-beheerder, Test Leverancier BV)

**File:** `leverancier/results-authenticated.md` | **Browser:** browser-1

| PASS | PARTIAL | FAIL | CANNOT_TEST | SKIP | Total |
|------|---------|------|-------------|------|-------|
| 23 | 11 | 13 | 6 | 1 | 54 |

Key findings:
- **All 3 wizards completed successfully** (Applicatie 6 steps, Dienst 3 steps, Koppeling 4 steps)
- **RBAC works correctly** (#105 PASS) — only own org's data visible
- **Tussenvoegsel bug** affects 4 issues (#352, #356, #367, #372) — "Jan Berg" instead of "Jan van de Berg"
- **Duplicate Diensttype column** (#306, #357) — two identical columns
- **Actions menu** (#384) — 6 options instead of just Bewerken + Verwijderen
- Standard links use correct single "id-" prefix (#407 PASS)
- "NIET ONDERSTEUND" consistently used (#381 PASS)

### 2. Gemeente — Maria van der Berg (Gebruik-beheerder, Test Gemeente)

**File:** `gemeente/results-authenticated.md` | **Browser:** browser-2

| PASS | PARTIAL | FAIL | CANNOT_TEST | CANNOT_VERIFY | Total |
|------|---------|------|-------------|---------------|-------|
| 6 | 4 | 2 | 3 | 2 | 17 |

Key findings:
- **Wizard executed**: Registered Centric Burgerzaken usage with Zaakregistratiecomponent
- **Pagination fixed** (#346 PASS) — page 2 shows different results from page 1
- **UUID filter fixed** (#349 PASS) — all 23 standaardversies human-readable
- **Type koppeling filter added** (#343 PASS) — extern/intern options
- **Mijn Account works** (#266 PASS) — all fields populated including tussenvoegsel
- Municipal data exposure (#315 FAIL) — municipalities shown as suppliers
- Imported koppelingen show arrows as titles; wizard-created ones correct

### 3. Security Officer — Mark Jansen (Gebruik-beheerder, Test Gemeente)

**File:** `security-officer/results-authenticated.md` | **Browser:** browser-3

| PASS | PARTIAL | FAIL | Total |
|------|---------|------|-------|
| 4 | 1 | 2 | 7 |

Key findings:
- **CRITICAL: PII leak** (#394) — gemeente contact data visible to unauthenticated browser users. API via curl blocks correctly, but browser sessions bypass RBAC
- **Municipal landscape exposed** (#315) — 9,645 gemeente entries, 3,420 koppelingen visible
- Password reset works (#183 PASS)
- No white screens (#404 PASS)
- Footer consistent (#409 PASS), SiteImprove removed (#406 PASS)
- Left menu persists (#395 PASS)

### 4. Functioneel Beheerder — Peter van Dijk (Admin, Default Organisation)

**File:** `functioneel-beheerder/results-authenticated.md` | **Browser:** browser-4

| PASS | PARTIAL | FAIL | CANNOT_TEST | Total |
|------|---------|------|-------------|-------|
| 8 | 7 | 0 | 3 | 18 |

Key findings:
- **Glossary fully functional** (#155 PASS) — 10 terms, search, page detection
- **Delete dialog correct** (#403 PASS) — dynamic object name/type insertion
- **CMS pages manageable** (#397 PASS) — 7 pages via backend
- **My Account broken** (#169 PARTIAL) — 404 on page data, user fields null
- **OAS 500 with auth** (#393 PARTIAL) — register OAS fails when authenticated
- **Nextcloud 32.0.5** (#396 PASS)
- **Piwik present, SiteImprove removed** (#406 PASS, #92 PARTIAL)

### 5. Samenwerking — Linda Bakker (Gebruik-beheerder, Test Samenwerking)

**File:** `samenwerking/results-authenticated.md` | **Browser:** browser-5

| PASS | PARTIAL | FAIL | Total |
|------|---------|------|-------|
| 0 | 2 | 0 | 2 |

Key findings:
- **Organization switch crashes** (#57 PARTIAL) — `TypeError: userGroups.includes` at ac-dashboard.js:200. 100% reproducible. Workaround: page reload
- **Koppelingen partially work** (#186 PARTIAL) — wizard-created data correct, imported data shows "null" and arrow-only titles
- Organization context persists after reload

### 6. Architectuur Expert — Dr. Sarah de Vries (VNG-raadpleger, Default Organisation)

**File:** `architectuur-expert/results-authenticated.md` | **Browser:** browser-7

| PASS | PARTIAL | FAIL | Total |
|------|---------|------|-------|
| 1 | 2 | 0 | 3 |

Key findings:
- **Excellent render performance** (#160 PASS) — 388-node view in 908.8ms (12x under 11s benchmark)
- **GEMMA API works** (#148 PARTIAL) — 2,741 elements, 5,790 relations, 249 views; null properties not omitted, model-id filter broken
- **Views overview broken** — `/beheer/views` shows "Geen weergaven beschikbaar" despite 249 views
- **Referentie-architectuur broken** — `/beheer/referentie-architectuur` shows "Geen data gevonden"
- **Public view pages don't render diagrams** — "View data is missing nodes and connections"
- Error handling improved (PvE eis 102 PASS)

---

## Critical Findings

### 1. CRITICAL — Contact Person PII Leak (#394)
Contact person data (names, emails, phone numbers) of municipalities is visible to unauthenticated users on frontend detail pages. The API via `curl` correctly blocks access (empty arrays), but browser-based anonymous sessions bypass RBAC through Nextcloud session cookies. **Privacy regulation violation requiring immediate attention.**

### 2. HIGH — Municipal Application Landscape Exposed (#315)
Search page shows municipalities as software suppliers ("Aangeboden door Rotterdam"). 9,645 gemeente-registered entries and 3,420 koppelingen visible to authenticated users, exposing internal municipal IT topology including connection types (extern/intern).

### 3. HIGH — Organization Switch Crash (#57)
Switching organizations via dashboard dropdown crashes with `TypeError: userGroups.includes is not a function` at `ac-dashboard.js:200`. 100% reproducible. Page reload required as workaround.

### 4. HIGH — My Account Page Broken (#169)
`/my-account` returns blank (404 on page data). User session shows `firstName=null`, `lastName=null`, `functie=null` — contact person data not syncing to Nextcloud account. (Note: gemeente persona's Mijn Account works; this may be role/user-specific.)

### 5. HIGH — OAS Endpoint Fails with Authentication (#393)
Register OAS endpoint returns 500 when authenticated for registers 3 and 4. Error: `"Did expect one result but found none"` from organisation filter. Works unauthenticated.

### 6. HIGH — Public ArchiMate Pages Non-Functional
`/beheer/views` shows "Geen weergaven beschikbaar" despite 249 views. Public `/views/{id}` shows title but no diagram. Public `/referentie-architectuur` nearly blank.

---

## Improvements Since Run 4

| Issue | Title | Run 4 | Run 5 | Agent | Notes |
|-------|-------|-------|-------|-------|-------|
| #266 | Mijn account leeg | PASS | PASS | Gemeente | Remains working |
| #344 | Geen resultaten Gravenbeheercomponent | PASS | PASS | Gemeente | Stable |
| #346 | Paginering werkt niet | PASS | PASS | Gemeente | Confirmed: pages show different results |
| #349 | UUID's onder standaarden filter | PASS | PASS | Gemeente | All 23 names verified human-readable |
| #403 | Tekst verwijderen aanpassen | PASS | PASS | Func. Beheerder | Delete dialog works correctly |
| #406 | SiteImprove verwijderen | PASS | PASS | Security, Func. Beheerder | Confirmed removed |
| #409 | Footer inlog/uitgelogd | PASS | PASS | Security, Func. Beheerder | Consistent both states |
| #410 | Dashboard schrijfwijze | PARTIAL | PARTIAL | Func. Beheerder | Content correct, capitalization still wrong |
| #135 eis 102 | Error handling views | PARTIAL | PASS | Architectuur Expert | User-friendly error message for missing views |
| #186 | Koppelingen bugs | FAIL | PARTIAL | Samenwerking | No longer crashes; data quality issues remain |
| #367 | Tussenvoegsel niet getoond | PASS | FAIL | Leverancier | Regressed — "Jan Berg" instead of "Jan van de Berg" |

---

## Regressions

| Issue | Title | Run 4 | Run 5 | Agent | Notes |
|-------|-------|-------|-------|-------|-------|
| #367 | Tussenvoegsel niet getoond | PASS | FAIL | Leverancier | Was fixed in Run 4, now showing "Jan Berg" again |
| #144 | Overzicht organisaties met zoek-/filteropties | PASS | PARTIAL | Gemeente | Municipality names as suppliers degrades quality |

---

## Performance Overview

### Slowest Endpoints

| URL Pattern | Time | Agent | Context |
|-------------|------|-------|---------|
| Facet UUID resolution (2,757 UUIDs) | ~1.7-5s | Gemeente, Security | Search filter label resolution |
| /api/objects/vng-gemma/element | ~2.0s | Architectuur Expert | GEMMA elements list |
| /api/objects/vng-gemma/relation | ~1.5s | Architectuur Expert | GEMMA relations list |
| Backend cache warming (19 schemas) | ~4.5s | Security Officer | First authenticated page load |
| /beheer/contactpersonen | ~5s | Func. Beheerder | Contact persons table |
| /beheer/koppelingen (app name resolution) | ~3s | Leverancier | Loading state for app names |

---

## Console Errors Overview

### Most Frequent Errors

| Error | Agents | Severity |
|-------|--------|----------|
| `Manifest: Line: 1, column: 1, Syntax error` (site.webmanifest) | All | Known/Expected |
| `TypeError: userGroups.includes is not a function` (ac-dashboard.js:200) | Samenwerking | HIGH |
| 404 on `/api/pages/my-account` | Func. Beheerder | HIGH |
| 404 on `schemas/referentie-architectuur/related` | Architectuur Expert | MEDIUM |
| `Collection not found for type: voorziening` | Leverancier | LOW |
| Dashboard 403 errors (collection fetch with gebruik-beheerder) | Security Officer | MEDIUM |
| 404 for names API (orphaned UUIDs) | Samenwerking, Gemeente | MEDIUM |

---

## Environment Limitations

1. **Single browser engine** — Chromium only via Playwright. Edge/Firefox issues (#402) untestable.
2. **Local development** — Performance may differ from production. Dev-mode warnings present.
3. **Header branding** — Shows "DEVELOPMENT CATALOGUS" (dev configuration).
4. **Footer branding** — Shows "Open Tilburg" instead of VNG branding.
5. **No email delivery** — Cannot verify password reset email.
6. **PowerPoint comparison** — ~6 issues (#359, #360, #376, #386, #387, #390) require image comparison not performed.
7. **Imported data quality** — Many imported records have missing references, making bug vs. data quality distinction difficult.

---

## Recommendations

### Immediate (Security/Privacy)
1. **Fix PII leak (#394)** — Investigate browser-based RBAC bypass for gemeente contact persons. Ensure session cookies don't grant elevated anonymous access.
2. **Fix municipal data exposure (#315)** — Show actual suppliers on search cards, not municipalities. Restrict gemeente-registered entries from public results.
3. **Fix koppelingen visibility** — 3,420 koppelingen should not be visible to unauthenticated users per RBAC rules.

### High Priority
4. **Fix organization switch crash (#57)** — Add null-check for `userGroups` in `ac-dashboard.js:200`.
5. **Fix tussenvoegsel display (#352, #356, #367, #372)** — Single root cause affecting multiple views.
6. **Fix duplicate Diensttype column (#306, #357)** — Remove duplicate from diensten table.
7. **Fix My Account page (#169)** — Resolve 404 on page data and sync contact person to Nextcloud account.
8. **Fix OAS endpoint with auth (#393)** — Organisation filter should not apply to multi-org registers.
9. **Fix public ArchiMate pages** — Views overview, referentie-architectuur, and public view rendering all broken.

### Before Next Test Run
10. Populate Test Gemeente with contact persons for password change testing (#286).
11. Configure proper VNG branding (replace "Development Catalogus" and "Open Tilburg").
12. Prepare reference PowerPoint images for wizard text comparison tests.
13. Create test data for cross-supplier version viewing (#399) and merge testing (#141).

---

## Test Artifacts

Each agent directory contains:
- `results-authenticated.md` — Detailed test results with acceptance criteria checkboxes
- `*.png` — Screenshots documenting evidence

| Directory | Files | Status |
|-----------|-------|--------|
| `leverancier/` | results + 18 screenshots | Complete |
| `gemeente/` | results + screenshots | Complete |
| `security-officer/` | results + 13 screenshots | Complete |
| `functioneel-beheerder/` | results + 9 screenshots | Complete |
| `samenwerking/` | results + 13 screenshots | Complete |
| `architectuur-expert/` | results + 9 screenshots | Complete |
