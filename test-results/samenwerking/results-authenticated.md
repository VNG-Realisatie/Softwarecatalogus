# Test Results: Samenwerking (Authenticated)

**Persona:** Linda Bakker - Coordinator at a municipal collaboration (samenwerkingsverband)
**Role:** Gebruik-beheerder
**Date:** 2026-02-23 (6th iteration)
**Environment:** Local development (Frontend: http://localhost:3000, Backend: http://localhost:8080)
**Login used:** linda.bakker@test.nl / WelcomeToTest2026
**Organization:** Test Samenwerking
**Browser:** Playwright (browser-5, headless, 1400x900)

---

## Summary Table

| Issue | Title | Previous Status | Current Status | Severity |
|-------|-------|-----------------|----------------|----------|
| #57 | Pakketten opvoeren voor samenwerkingsverband | PARTIAL | PARTIAL | HIGH |
| #186 | Koppelingen | N/A (new) | PARTIAL | HIGH |

---

## Issue #57: Pakketten opvoeren voor samenwerkingsverband

**GitHub:** [#57](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/57)
**Test Step:** Step 20 (Collaborations and multi-org management)
**Previous Status:** PARTIAL
**Current Status:** PARTIAL

### Description

As a gebruik-beheerder of a samenwerkingsverband, I want to be able to add software packages for the municipalities we work for, so that these municipalities have a complete application portfolio, including the outsourced services.

### Acceptance Criteria

Since issue #57 does not have detailed acceptance criteria in issues.md, the following criteria are derived from the issue title and the samenwerking persona requirements:

- [x] **Organization selector is present** on the Beheer dashboard with a dropdown showing available organizations
- [x] **Multiple organizations are available** in the dropdown: "Default Organisation" and "Test Samenwerking"
- [ ] **Organization switching works without errors** - FAIL: Switching organizations causes a JavaScript crash (`TypeError: Cannot read properties of undefined (reading 'includes')` in AcDashboard component, line 200). The error occurs because `userGroups` is undefined during the organization switch transition.
- [x] **After page reload, the new organization context is active** - the switch DOES persist correctly; only the real-time transition crashes
- [x] **"Applicatie toevoegen" wizard is accessible** and functional for adding software packages
- [x] **"Koppeling toevoegen" wizard is accessible** and functional for adding connections
- [x] **"Dienst toevoegen" button is available** on the dashboard
- [x] **Left sidebar navigation is complete** with: Dashboard, Mijn Account, Mijn Organisatie, Diensten, Contactpersonen, Applicaties, Gebruik, Koppelingen, View
- [ ] **Specific municipality member management** - The organization selector shows "Default Organisation" rather than named member municipalities. It is unclear whether this represents actual member municipalities of the samenwerking or just a generic fallback organization. The issue asks for managing packages for "gemeenten waarvoor we werken" (municipalities we work for), but the dropdown does not clearly identify municipalities by name.

### Findings

1. **CRITICAL BUG: Organization switch crashes the dashboard**
   - **Severity:** HIGH
   - **Reproducible:** Yes (100% reproduction rate, tested twice in both directions)
   - **Error:** `TypeError: Cannot read properties of undefined (reading 'includes')` at `src/views/ac-beheer/core/components/ac-dashboard.js:200`
   - **Root cause:** `userGroups` variable is undefined when the AcDashboard component re-renders during organization switch. Line 202 calls `userGroups.includes('aanbod-beheerder')` without null-checking.
   - **Impact:** Dashboard shows error overlays (in dev mode) and becomes non-functional until page reload. In production, this would be a white screen / React error boundary.
   - **Workaround:** Navigate away or reload the page after switching organizations.
   - **Evidence:** Screenshots `06-org-switch-error.png`, `07-default-org-dashboard.png`

2. **Organization context persists correctly after reload**
   - After switching and reloading, the header correctly shows the new organization (e.g., `linda.bakker@test.nl (Default Organisation)`)
   - The dropdown reflects the currently selected organization
   - All dashboard features (Applicatie/Koppeling/Dienst toevoegen) are available in both organization contexts

3. **Application addition wizard is functional**
   - The "Applicatie toevoegen" wizard loads correctly at `/forms/gebruik/applicatie`
   - Multi-step wizard: Step 1 (Applicatie), Step 2 (Gebruik configuratie with Gebruikinformatie and Referentiecomponenten), Step 4 (Controleren)
   - Application selector dropdown is present with search capability
   - "Ik kan de gewenste applicatie niet vinden" fallback button exists
   - Evidence: Screenshot `08-applicatie-toevoegen-wizard.png`

4. **Missing municipality-specific context**
   - The organization dropdown only shows "Default Organisation" and "Test Samenwerking"
   - There is no explicit concept of "member municipalities" visible in the UI
   - For the samenwerking use case, one would expect to see the actual gemeenten that the samenwerking manages (e.g., "Gemeente X", "Gemeente Y")
   - This may be a configuration issue rather than a feature gap

### Console Errors
- `Manifest: Line: 1, column: 1, Syntax error.` at `site.webmanifest` - Known/expected (web manifest format issue)
- `TypeError: Cannot read properties of undefined (reading 'includes')` - **UNEXPECTED** - Organization switch crash (HIGH severity)

### Performance Notes
- All API requests returned 200 OK
- Backend cache warming completed successfully in ~1.4s
- No network requests exceeded 500ms threshold during normal navigation

---

## Issue #186: Koppelingen

**GitHub:** [#186](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/186)
**Test Step:** Step 11 (Connection wizard)
**Previous Status:** N/A (new issue for this persona)
**Current Status:** PARTIAL

### Description

Multiple bugs in the "Koppelingen" (connections) feature: displaying titles, linked external services, handling non-existent applications, detail pages.

### Acceptance Criteria

- [ ] **Koppelingen display in a table format with readable titles (not blank or UUID-only)** - PARTIAL: The beheer table (`/beheer/koppeling`) shows proper columns (Naam, Status, Korte beschrijving, Applicatie A, Applicatie B, Acties) but has no data for this test organization. In the public search view, many legacy koppelingen (3,420 total) show only arrow symbols (left-arrow, right-arrow, double-arrow) as titles instead of proper names. Some recently created koppelingen DO show proper titles (e.g., "Test Wizard App (double-arrow) Open Zaakbrug", "Test Wizard App (double-arrow) DigiD").
- [x] **Koppelingen linked to "buitengemeentelijke voorzieningen" correctly display the referenced external service** - PASS: On the detail page for a koppeling with a buitengemeentelijke voorziening (UUID `c8a8323e-650b-5577-9343-271d31568368`), the field "Buitengemeentelijke voorziening: BRK - Basisregistratie Kadaster" is correctly displayed and resolved to a human-readable name.
- [ ] **Koppelingen do not reference non-existent applications (graceful handling)** - FAIL: Multiple koppelingen reference applications that cannot be resolved. The detail page shows the literal string "null" for Applicatie A, and the Applicatie A field shows just "-" (dash). The title degrades to only showing the direction arrow. Graceful handling should show a placeholder message like "Onbekende applicatie" instead of "null".
- [ ] **Detail page shows all relevant fields: name, type, transport protocol, linked applications, external service** - PARTIAL: The detail page renders and shows fields including Applicatie A, Applicatie B (or Buitengemeentelijke voorziening), Richting, Transportprotocol, Status, Intermediair, Standaardversies. However: (a) some fields show raw UUIDs (e.g., Standaardversies shows `419ba65d-7202-4195-babd-e6a1d493bfd4`), (b) Applicatie A sometimes shows "null" or "-", and (c) the page title is just an arrow character for broken koppelingen.
- [x] **Koppeling detail page at /publicatie/{uuid} renders correctly** - PASS: Both a broken koppeling (`/publicatie/c8a8323e-650b-5577-9343-271d31568368`) and a working koppeling (`/publicatie/5929659e-978c-40ec-abe2-0f71a225f392`) render at their respective publicatie URLs without page crashes. The page structure is correct. Breadcrumb shows "Home > Zoeken > Koppeling".

### Findings

1. **Many legacy koppelingen lack proper titles**
   - **Severity:** MEDIUM
   - Many koppelingen (primarily legacy/imported data) show only direction arrows as titles (left-arrow, right-arrow, double-arrow)
   - The title is constructed from "AppA {direction} AppB" - when AppA is null/missing, the title degrades to just the arrow
   - Recently created koppelingen (e.g., "Test Wizard App (double-arrow) Open Zaakbrug" from 2026-02-22) show proper titles
   - This indicates the title construction logic works for new data, but legacy imported data has missing application references
   - **Evidence:** Screenshot `10-search-koppelingen-no-titles.png`

2. **Literal "null" displayed on detail page**
   - **Severity:** HIGH
   - On the detail page, when Applicatie A cannot be resolved, the literal string "null" is displayed in the header area
   - Example: `null (left-arrow) BRK - Basisregistratie Kadaster`
   - The field "Applicatie A:" shows "-" (dash) instead of "null", creating an inconsistency between the header visualization and the field value
   - This should be handled gracefully with a fallback like "Onbekende applicatie" or hidden entirely
   - **Evidence:** Screenshot `11-koppeling-detail-null.png`

3. **Unresolved UUID in Standaardversies**
   - **Severity:** MEDIUM
   - The Standaardversies field shows a raw UUID `419ba65d-7202-4195-babd-e6a1d493bfd4` instead of a human-readable standard name
   - Console shows a 404 error when trying to resolve this UUID via the names API endpoint
   - This indicates either the referenced standard no longer exists in the system or the names endpoint cannot find it
   - Should show a fallback like "Onbekende standaard" or hide the entry

4. **Working example demonstrates correct behavior (positive)**
   - Koppeling "Test koppeling" at `/publicatie/5929659e-978c-40ec-abe2-0f71a225f392` shows all fields correctly:
     - Title: "Test koppeling"
     - Visual: "Test Wizard App (double-arrow) Open Zaakbrug"
     - Applicatie A: Test Wizard App
     - Applicatie B: Open Zaakbrug
     - Richting: bi-directioneel
     - Status: in gebruik
     - Applicaties tab: shows both linked applications with clickable links
   - This proves the feature works correctly when all referenced data exists
   - **Evidence:** Screenshot `12-koppeling-detail-good.png`

5. **Koppeling wizard is functional**
   - The "Koppeling toevoegen" wizard at `/forms/gebruik/koppeling?type=aanbieden-koppeling` loads correctly
   - Multi-step process: Step 1 (Een koppeling zoeken with Gebruiksinformatie and Deelnemers toevoegen), Step 4 (Controleren)
   - Includes deduplication check: "Controleer eerst of de koppeling al bestaat" with two suggested methods
   - Shows "Schema laden..." while loading, then presents "Bestaande koppelingen" section
   - **Evidence:** Screenshot `13-koppeling-wizard.png`

6. **Beheer Koppelingen table structure is correct**
   - The beheer view at `/beheer/koppeling` shows a proper table with columns: Naam, Status, Korte beschrijving, Applicatie A, Applicatie B, Acties
   - Sorting is available on all data columns (up/down arrows)
   - Pagination controls and items-per-page selector are present
   - Search bar and filter options are available
   - The table shows "Geen data gevonden" for Test Samenwerking (expected - no koppelingen added yet)
   - **Evidence:** Screenshot `09-koppelingen-empty.png`

### Console Errors
- `Manifest: Line: 1, column: 1, Syntax error.` at `site.webmanifest` - Known/expected
- `Failed to load resource: the server responded with a status of 404` for names API call for UUID `419ba65d-7202-4195-babd-e6a1d493bfd4` - **UNEXPECTED** - UUID cannot be resolved to a name (MEDIUM severity)

### Performance Notes
- Search page with 12,641 total results loaded successfully
- Facet resolution (2,758 UUIDs) completed through background name cache warming
- 7 UUID fallbacks were cached for items that could not be resolved (indicating 7 orphaned references)
- No significant performance issues detected

---

## Performance Summary

| Page | Load Time | Status |
|------|-----------|--------|
| Login page | < 1s | OK |
| Beheer dashboard | ~1.5s (incl. cache warming) | OK |
| Mijn Organisatie | < 1s | OK |
| Applicatie toevoegen wizard | ~1s | OK |
| Beheer Koppelingen | < 1s | OK |
| Search (zoeken) | ~2s (12,641 results + facet resolution) | OK |
| Koppeling detail page | ~3s (schema loading) | ACCEPTABLE |
| Koppeling toevoegen wizard | ~1s | OK |

## Console Errors Summary

| Error | Frequency | Expected? | Severity |
|-------|-----------|-----------|----------|
| Manifest syntax error (site.webmanifest) | Every page load (x2) | Yes (known) | NONE |
| TypeError: userGroups.includes is not a function | On every organization switch | No | HIGH |
| Failed to load resource 404 (names API for UUID) | On koppeling detail with missing standards | No | MEDIUM |

## Screenshots Index

| File | Description |
|------|-------------|
| `01-login-dashboard.png` | Initial login, dashboard with Test Samenwerking |
| `02-org-selector-dropdown.png` | Organization dropdown showing both organizations |
| `03-beheer-fullpage.png` | Full page Beheer dashboard (mobile width) |
| `04-beheer-desktop.png` | Desktop width Beheer dashboard with sidebar |
| `05-mijn-organisatie.png` | Mijn Organisatie page for Test Samenwerking |
| `06-org-switch-error.png` | JavaScript crash when switching organizations |
| `07-default-org-dashboard.png` | Dashboard after switching to Default Organisation (post-reload) |
| `08-applicatie-toevoegen-wizard.png` | Application addition wizard (Step 1) |
| `09-koppelingen-empty.png` | Koppelingen table in beheer (empty for Test Samenwerking) |
| `10-search-koppelingen-no-titles.png` | Search results showing koppelingen without proper titles |
| `11-koppeling-detail-null.png` | Koppeling detail page with "null" for Applicatie A |
| `12-koppeling-detail-good.png` | Working koppeling detail page (Test Wizard App to Open Zaakbrug) |
| `13-koppeling-wizard.png` | Koppeling toevoegen wizard (Step 1) |
