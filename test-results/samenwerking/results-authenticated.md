# Test Results: Samenwerking (Authenticated)

**Persona:** Linda Bakker -- Coordinator at a municipal collaboration (samenwerkingsverband)
**Role:** Gebruik-beheerder
**Login:** linda.bakker@test.nl
**Environment:** http://localhost:3000 (Frontend), http://localhost:8080 (Backend)
**Date:** 2026-02-24 (Re-test #3)
**Browser:** Playwright (browser-7, headless)

---

## Login Verification

- **Status:** PASS
- **Details:** Successfully logged in as linda.bakker@test.nl with password WelcomeToTest2026. Dashboard loaded at `/beheer` showing "Test Samenwerking" with organization selector dropdown. Two organizations available: "Default Organisation" and "Test Samenwerking".
- **localStorage cleared** before login as required
- **Screenshot:** `01-login-dashboard.png`

---

## Issue #57: Pakketten opvoeren voor samenwerkingsverband

**Title:** Als gebruik-beheerder van een samenwerkingsverband wil ik softwarepakketten kunnen opvoeren voor de gemeenten waarvoor we werken
**GitHub:** https://github.com/VNG-Realisatie/Softwarecatalogus/issues/57
**Labels:** Gebruik, PvE eis
**Test Step:** Step 20 (Samenwerkingen en Multi-Organisatie Beheer)
**Previous Status:** PARTIAL (re-test #2: FAIL)

### Acceptance Criteria Results

Issue #57 does not have detailed acceptance criteria in `issues.md`. The issue body states: "zodat deze gemeenten een volledig applicatieportfolio hebben, inclusief de uitbestede diensten." Based on the Step 20 test guide, the following was tested:

| # | Criterion | Result | Notes |
|---|-----------|--------|-------|
| 1 | Organization selector shows samenwerking | **PASS** | "Test Samenwerking" appears in the dropdown alongside "Default Organisation" |
| 2 | Can switch to samenwerking context | **FAIL** | JavaScript crash on org switch (TypeError: Cannot read properties of undefined reading 'includes') at ac-dashboard.js:186 |
| 3 | Dashboard shows management options for samenwerking | **FAIL** | "Geen wizards beschikbaar voor deze organisatie" -- no wizard buttons (Applicatie, Koppeling, Dienst) are displayed for "Test Samenwerking" |
| 4 | Can add packages for member municipalities | **CANNOT_TEST** | Dashboard broken for samenwerking context, no wizard buttons shown |
| 5 | Can manage packages across member municipalities | **CANNOT_TEST** | Dependent on above |
| 6 | Bulk operations for multiple organizations | **CANNOT_TEST** | No bulk operation UI found |
| 7 | Collective license management | **CANNOT_TEST** | No collective license management feature found |
| 8 | Member municipality data is correctly scoped | **CANNOT_TEST** | Cannot test data scoping when samenwerking context is broken |
| 9 | Gebruik page accessible | **PASS** | /beheer/gebruik loads with proper table structure (Type, Applicatie, Applicatie versie, Referentiecomponenten, Hosting, Acties) and "Toevoegen" button |
| 10 | Mijn Account page shows correct user data | **PASS** | Shows Linda Bakker, linda.bakker@test.nl, Coordinator, with "Bewerken" button |
| 11 | Mijn Organisatie page accessible | **PARTIAL** | Loads with "Test Samenwerking" heading but shows "Geen korte beschrijving" and organization data returns 404 |

### Critical Bug: Dashboard Crash on Organization Switch

**Error:** `TypeError: Cannot read properties of undefined (reading 'includes')`
**Location:** `src/views/ac-beheer/core/components/ac-dashboard.js:186` (line 202: `userGroups.includes('aanbod-beheerder')`)

When switching from "Test Samenwerking" to "Default Organisation" using the organization dropdown, the application throws an unhandled TypeError. The `userGroups` variable is undefined after the org switch.

- **Impact:** Application crashes with a development error overlay. In production, this would result in a blank/broken page.
- **Screenshot:** `10-org-switch-crash.png`
- **Reproducible:** Yes, occurs consistently on every org switch

### Organization State Comparison

| Feature | Test Samenwerking | Default Organisation |
|---------|-------------------|----------------------|
| Dashboard wizards | None ("Geen wizards beschikbaar") | 3 buttons: Applicatie, Koppeling, Dienst |
| Organization data API | 404 Not Found | Works (no org-level 404) |
| Gebruik page | Accessible (empty table) | Accessible (empty table) |
| Koppelingen page | Accessible (empty table) | Accessible (empty table) |

### Missing Samenwerking-Specific Features

The following features described in Step 20 of the test guide are not yet implemented or not accessible:

1. **Leden Beheer** -- No member management page for defining which municipalities belong to the samenwerking
2. **Adding products on behalf of members** -- No workflow to select a member municipality and register packages for them
3. **Bulk operations** -- No ability to add a product to multiple organizations simultaneously
4. **Collective license management** -- No shared license management feature
5. **Organization fusies** -- No merge/transfer feature

### Verdict: **FAIL**

The samenwerkingsverband functionality is fundamentally broken. The "Test Samenwerking" organization has no wizards and its organization data returns 404 from the backend. Switching organizations causes a JavaScript crash. Linda Bakker cannot perform any actions on behalf of member municipalities.

### Comparison with Previous Test Runs

| Run | Status | Notes |
|-----|--------|-------|
| Re-test #1 | PARTIAL | - |
| Re-test #2 | FAIL | Org switch crash, no wizards, 404 errors |
| Re-test #3 (current) | **FAIL** | Same issues persist: org switch crash at line 186, no wizards for samenwerking, organization data 404 |

---

## Issue #186: Koppelingen

**Title:** Koppelingen
**GitHub:** https://github.com/VNG-Realisatie/Softwarecatalogus/issues/186
**Labels:** Aanbod, Bevinding, Restpunt, Koppeling
**Test Step:** Step 11 (Koppeling wizard)

### Acceptance Criteria Results

| # | Criterion | Result | Evidence |
|---|-----------|--------|----------|
| 1 | Koppelingen display in a table format with readable titles (not blank or UUID-only) | **PARTIAL** | Table structure is correct with columns: Naam, Status, Korte beschrijving, Applicatie A, Applicatie B, Acties. However, no koppelingen data exists for the "Test Samenwerking" organization. The table shows "Geen data gevonden". |
| 2 | Koppelingen linked to "buitengemeentelijke voorzieningen" correctly display the referenced external service | **CANNOT_TEST** | No existing koppelingen data for this organization to verify |
| 3 | Koppelingen do not reference non-existent applications (graceful handling) | **CANNOT_TEST** | No existing koppelingen data for this organization |
| 4 | Detail page shows all relevant fields: name, type, transport protocol, linked applications, external service | **CANNOT_TEST** | No existing koppelingen to view detail pages |
| 5 | Koppeling detail page at /publicatie/{uuid} renders correctly | **CANNOT_TEST** | No existing koppelingen to navigate to |

### Koppeling Wizard Test (Step 11)

The wizard was tested thoroughly by navigating to `/forms/koppeling` via the "Toevoegen" button:

| # | Test | Status | Notes |
|---|------|--------|-------|
| W1 | Wizard accessible from /beheer/koppelingen via "Toevoegen" button | **PASS** | Button present and functional, navigates to /forms/koppeling |
| W2 | Step 1: "Controleren op bestaande koppeling" heading and instructions | **PASS** | Clear instructions with two methods to check for existing koppelingen |
| W3 | Step 1: Application selector | **PASS** | Dropdown shows 20 applications; selecting one enables "Volgende" button |
| W4 | Step 1: Existing koppelingen check | **PASS** | After selecting "Webcast", shows "Reeds bestaande koppelingen voor Webcast" with proper message when none exist: "Geen bestaande koppelingen gevonden voor Webcast. U kunt deze zelf toevoegen in de volgende stap." |
| W5 | Step 1: "Ik kan de gewenste applicatie niet vinden" button | **PASS** | Alternative action button present |
| W6 | Step 1: Info alert about search page | **PASS** | Shows "Zoekpagina" info box explaining alternative workflow |
| W7 | Step 2: "Koppelingen met andere applicaties" form | **PASS** | Form renders with all required fields |
| W8 | Step 2: Applicatie A pre-filled | **PASS** | Shows "Webcast" (from step 1 selection), not editable |
| W9 | Step 2: Richting dropdown | **PASS** | Three options: "A -> B", "B -> A", "Bi-directioneel" |
| W10 | Step 2: Applicatie B of BGV dropdown | **PASS** | 72 options available. "Webcast (al gekozen bij A)" is properly disabled. Includes both applications and buitengemeentelijke voorzieningen (DigiD, BRK, etc.) |
| W11 | Step 2: Naam field (required) | **PASS** | Text input with placeholder "Naam van de koppeling" |
| W12 | Step 2: Status and Startdatum fields | **PASS** | Status dropdown available; Startdatum disabled until status is selected (correct behavior) |
| W13 | Step 2: "Nieuwe koppeling toevoegen" button | **PASS** | Present for adding additional connections in the same session |
| W14 | Step 2: "Rij 1 verwijderen" button | **PASS** | Present but disabled when only 1 row exists (correct) |
| W15 | Step 2: Legend indicators | **PASS** | Shows "Applicatie" (green dot) and "Buiten Gemeentelijke Voorziening" (blue dot) legend |
| W16 | Step 3: "Aanvullende informatie over uw koppelingen" | **PASS** | Shows koppeling name as heading, with fields: Korte beschrijving (255 chars), Lange beschrijving (markdown editor with full toolbar), Standaardversies dropdown, Transportprotocol dropdown, Intermediair dropdown |
| W17 | Step 3: Markdown editor | **PASS** | Full toolbar with: Bold, Italic, Strikethrough, HR, Title, Link, Quote, Code, Code Block, Comment, Image, Table, Unordered List, Ordered List, Checked List, Help |
| W18 | Step 4: "Controleer uw gegevens" review page | **PASS** | Shows clear summary: "Test Koppeling Samenwerking" with "Webcast -> RVTools" direction |
| W19 | Step 4: "Opslaan" button | **PASS** | Save button present (not clicked to avoid creating test data) |
| W20 | Navigation (Vorige/Volgende) | **PASS** | Previous/Next buttons work correctly throughout all 4 wizard steps; step indicators show completed steps with checkmarks |

### Koppelingen Table Page

| # | Test | Status | Notes |
|---|------|--------|-------|
| T1 | Page loads at /beheer/koppelingen | **PASS** | Page renders with proper heading and table structure |
| T2 | Table columns correct | **PASS** | Columns: Naam, Status, Korte beschrijving, Applicatie A, Applicatie B, Acties |
| T3 | Search available | **PASS** | "Toon zoekbalk" button present |
| T4 | Filters available | **PASS** | "Filters openen" button present |
| T5 | Toevoegen button | **PASS** | Present and functional |
| T6 | Acties dropdown | **PASS** | "Acties" button present |
| T7 | Pagination | **PASS** | Shows "Pagina 1 van 1" with items-per-page selector (default 20) |
| T8 | Select all checkbox | **PASS** | Present (disabled when no data) |

### Key Console Errors on Koppelingen Pages

- `koppeling/related` endpoint returns 404 -- the related schemas endpoint is missing
- Organization data 404 errors (same as all authenticated pages)
- Schema warnings: "Schema not found for type: koppeling" (non-critical, display still works)

### Evidence

| Screenshot | Description |
|------------|-------------|
| `03-koppelingen-page.png` | Koppelingen table page (empty, "Geen data gevonden") |
| `04-koppeling-wizard-step1.png` | Wizard step 1: search for existing koppelingen |
| `04b-koppeling-wizard-step1-full.png` | Wizard step 1: full page view |
| `05-koppeling-wizard-app-selected.png` | Application "Webcast" selected, existing koppelingen check displayed |
| `06-koppeling-wizard-step2.png` | Wizard step 2: connection definition form with all fields |
| `07-koppeling-wizard-step3.png` | Wizard step 3: additional information (markdown editor, standard versions, etc.) |
| `08-koppeling-wizard-step4-review.png` | Wizard step 4: review showing "Test Koppeling Samenwerking: Webcast -> RVTools" |

### Verdict: **PARTIAL**

**Rationale:**
- The koppeling wizard (creation flow) works excellently across all 4 steps (20/20 tests pass) with proper field validation, clear instructions, comprehensive dropdown options, and a useful review step
- The koppelingen table page structure is correct with all expected columns and functionality
- However, the core acceptance criteria about existing koppelingen **display** (titles, linked services, detail pages) could NOT be tested because no koppelingen data exists for the "Test Samenwerking" organization
- The `koppeling/related` API endpoint returns 404, which may affect related entity management

### Comparison with Previous Test Runs

| Run | Status | Key Change |
|-----|--------|------------|
| Re-test #2 | PARTIAL | Detail pages had [object Object], null values, UUID in tab title; koppelingen data existed for testing in Default Organisation context |
| Re-test #3 (current) | **PARTIAL** | Wizard flow fully tested and works well (20/20). Display criteria untestable due to no data for samenwerking org. |

### Note on Previous Bugs

The following bugs from re-test #2 were NOT re-verified in this session because the samenwerking context has no koppelingen data. These bugs may still exist:
1. `[object Object]` for Applicatie B on public detail page
2. `null <-> null` in direction widget on beheer detail page
3. Applicatie A and B show "-" in beheer overview table
4. Browser tab title shows UUID instead of name on public detail page

---

## Additional Observations

### Mijn Account Page (`/beheer/my-account`)
- **Status:** PASS
- Shows correct user details: E-mailadres: linda.bakker@test.nl, Voornaam: Linda, Achternaam: Bakker, Functie: Coordinator
- "Bewerken" (Edit) button present
- Organization link shows "Default Organisation" (reflects last selected org from dropdown, not the primary samenwerking)
- **Screenshot:** `13-my-account.png`

### Mijn Organisatie Page (`/beheer/my-organisation`)
- **Status:** PARTIAL
- Page loads and shows "Test Samenwerking" heading
- Body shows only "Geen korte beschrijving" (No short description)
- "Acties" button present but no organizational details displayed
- Organization data API returns 404 for the organization UUID
- Warning in console: "Organization not found (404), using fallback data"
- **Screenshot:** `02-my-organisation.png`

### Search Page (`/search`)
- **Status:** FAIL
- The search page is completely empty (blank main content area)
- `/api/apps/opencatalogi/api/pages/search` returns 404
- Cannot search for koppelingen, applications, or any other entities
- **Screenshot:** `09-search-page.png`

### Diensten Page (`/beheer/diensten`)
- **Status:** FAIL
- Returns 500 Internal Server Error
- Error message: "Er is een fout opgetreden. Er kon geen verbinding worden gemaakt met de server."
- Multiple 500 errors: organization data, schema/related endpoint, schema fetch, register fetch
- **Screenshot:** `14-diensten-error.png`

---

## Console Errors Summary

### Persistent Errors (every authenticated page)
1. **Manifest syntax error** -- `site.webmanifest` returns invalid content (minor, ignorable)
2. **Organization 404** -- `voorzieningen_organisatie/5ba08c6a-5fd8-48f0-ba14-99d9f974159e` returns 404 on every page. This is the "Test Samenwerking" organization UUID that does not exist in the voorzieningen register.

### Page-Specific Errors
3. **Organization switch crash** -- `TypeError: Cannot read properties of undefined (reading 'includes')` in `ac-dashboard.js:186` when switching organizations via dropdown
4. **Koppeling related schemas 404** -- `/api/schemas/koppeling/related` returns 404 on koppelingen page
5. **Diensten 500** -- Multiple 500 Internal Server Errors when loading the Diensten page
6. **Search pages 404** -- `/api/apps/opencatalogi/api/pages/search` returns 404
7. **Schema warnings** -- "Schema not found for type: koppeling" on wizard pages (non-critical)

### Ignored (as per instructions)
- Favicon 404s
- ResizeObserver loop errors
- Service worker failures
- Webpack dev server reconnection messages

---

## Performance Summary

| Page | Load Time | Status |
|------|-----------|--------|
| /login | Normal | OK |
| /beheer | Normal | OK (despite 404 errors) |
| /beheer/koppelingen | Normal | OK |
| /forms/koppeling | Normal | OK |
| /beheer/gebruik | Normal | OK |
| /beheer/my-account | Normal | OK |
| /beheer/my-organisation | Normal | OK (despite 404) |
| /beheer/diensten | Slow/Error | 500 errors |
| /search | Normal | Empty (404 on API) |

No API calls were observed exceeding 1000ms (PERFORMANCE_FAIL threshold). Backend cache loading completed in ~1183ms for all schemas (reported in console). All other requests completed within acceptable timeframes.

---

## Overall Summary

| Issue | Title | Status | Key Finding |
|-------|-------|--------|-------------|
| #57 | Pakketten opvoeren voor samenwerkingsverband | **FAIL** | Organization switch crashes with TypeError; samenwerkingsverband dashboard broken (404 + no wizards). Core samenwerking-specific features (member management, bulk operations) do not exist. |
| #186 | Koppelingen | **PARTIAL** | Koppeling wizard works excellently (20/20 tests pass). Table structure correct. But display criteria for existing koppelingen untestable due to no data. Previous bugs (null values, [object Object]) not re-verified. |

### Recommendations

1. **Issue #57 (Critical):**
   - Fix the `userGroups` undefined error in `ac-dashboard.js` (line 186/200) by adding null-safety: `userGroups?.includes('aanbod-beheerder')` or defaulting to an empty array
   - Ensure "Test Samenwerking" organization is registered in the backend voorzieningen register (UUID `5ba08c6a-5fd8-48f0-ba14-99d9f974159e` currently returns 404)
   - Enable wizard buttons for samenwerking organizations (currently shows "Geen wizards beschikbaar")
   - Implement samenwerking-specific features: member management, acting on behalf of members, collective license management

2. **Issue #186 (Medium):**
   - Fix the `koppeling/related` API endpoint (currently returns 404)
   - Verify and fix previous bugs from re-test #2: [object Object] rendering, null values in direction widget, UUID in browser tab title
   - Ensure koppelingen data can be created and displayed for samenwerking organizations

3. **General:**
   - Fix the search page API (`/api/apps/opencatalogi/api/pages/search` returns 404)
   - Fix the Diensten page 500 errors
   - Register the "Test Samenwerking" organization properly in the voorzieningen register

---

## Screenshots Index

| File | Description |
|------|-------------|
| `01-login-dashboard.png` | Dashboard after login with Test Samenwerking selected (no wizards) |
| `02-my-organisation.png` | Mijn Organisatie page showing "Geen korte beschrijving" |
| `03-koppelingen-page.png` | Koppelingen table page (empty) |
| `04-koppeling-wizard-step1.png` | Koppeling wizard Step 1: search |
| `04b-koppeling-wizard-step1-full.png` | Koppeling wizard Step 1: full page |
| `05-koppeling-wizard-app-selected.png` | Koppeling wizard: Webcast selected, existing check shown |
| `06-koppeling-wizard-step2.png` | Koppeling wizard Step 2: connection definition form |
| `07-koppeling-wizard-step3.png` | Koppeling wizard Step 3: additional information |
| `08-koppeling-wizard-step4-review.png` | Koppeling wizard Step 4: review summary |
| `09-search-page.png` | Search page (empty, API 404) |
| `10-org-switch-crash.png` | TypeError crash when switching organizations |
| `11-default-org-dashboard.png` | Dashboard with Default Organisation (wizards visible) |
| `12-gebruik-page.png` | Gebruik page with empty table |
| `13-my-account.png` | Mijn Account page showing Linda Bakker details |
| `14-diensten-error.png` | Diensten page 500 Internal Server Error |
