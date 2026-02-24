# Test Results: Samenwerking (Authenticated)

**Persona:** Linda Bakker -- Coordinator at a municipal collaboration (samenwerkingsverband)
**Role:** Gebruik-beheerder
**Login:** linda.bakker@test.nl
**Environment:** http://localhost:3000 (Frontend), http://localhost:8080 (Backend)
**Date:** 2026-02-24 (Re-test #2)
**Browser:** Playwright (browser-7, headless)

---

## Login Verification

- **Status:** PASS
- **Details:** Successfully logged in as linda.bakker@test.nl with password WelcomeToTest2026. Dashboard loaded at `/beheer` showing "Default Organisation" with organization selector dropdown. Two organizations available: "Default Organisation" and "Test Samenwerking".
- **Screenshot:** `01-dashboard-login.png`
- **My Account page** confirms email: linda.bakker@test.nl, Organisation: "Default Organisation"
- **Screenshot:** `04-my-account.png`

---

## Issue #57: Pakketten opvoeren voor samenwerkingsverband

**Title:** Als gebruik-beheerder van een samenwerkingsverband wil ik softwarepakketten kunnen opvoeren voor de gemeenten waarvoor we werken
**GitHub:** https://github.com/VNG-Realisatie/Softwarecatalogus/issues/57
**Labels:** Gebruik, PvE eis
**Test Step:** Step 20 (Samenwerkingen en Multi-Organisatie Beheer)
**Previous Status:** PARTIAL

### Acceptance Criteria Results

Issue #57 does not have detailed acceptance criteria in `issues.md`. The issue body states: "zodat deze gemeenten een volledig applicatieportfolio hebben, inclusief de uitbestede diensten." Based on the Step 20 test guide, the following was tested:

| # | Criterion | Result | Notes |
|---|-----------|--------|-------|
| 1 | Organization selector shows samenwerking | **PASS** | "Test Samenwerking" appears in the dropdown alongside "Default Organisation" |
| 2 | Can switch to samenwerking context | **FAIL** | JavaScript crash on org switch (TypeError: Cannot read properties of undefined reading 'includes') |
| 3 | Dashboard shows management options for samenwerking | **FAIL** | After reload with Test Samenwerking selected: "Geen wizards beschikbaar voor deze organisatie" + 404 errors fetching org data |
| 4 | Can add packages for member municipalities | **CANNOT_TEST** | Dashboard broken for samenwerking context, no wizard buttons shown |
| 5 | Can manage packages across member municipalities | **CANNOT_TEST** | Dependent on above |
| 6 | Bulk operations for multiple organizations | **CANNOT_TEST** | No bulk operation UI found |
| 7 | Collective license management | **CANNOT_TEST** | No collective license management feature found |
| 8 | Member municipality data is correctly scoped | **CANNOT_TEST** | Cannot test data scoping when samenwerking context is broken |

### Critical Bug: Dashboard Crash on Organization Switch

**Error:** `TypeError: Cannot read properties of undefined (reading 'includes')`
**Location:** `src/views/ac-beheer/core/components/ac-dashboard.js:200`

When switching from "Default Organisation" to "Test Samenwerking" (or vice versa) using the organization dropdown, the application throws an unhandled TypeError. The code at line 202 calls `userGroups.includes('aanbod-beheerder')` but `userGroups` is undefined after the org switch.

- **Impact:** Application crashes with a development error overlay. In production, this would result in a blank/broken page.
- **Screenshot:** `02-org-switch-error.png`
- **Reproducible:** Yes, occurs consistently on every org switch

### "Test Samenwerking" Dashboard State

After a full page reload (not using the dropdown) with "Test Samenwerking" remembered:
- Dashboard heading shows "Mijn softwarecatalogus" with "Test Samenwerking" selected
- Message: "Geen wizards beschikbaar voor deze organisatie" (No wizards available for this organization)
- The "Applicatie toevoegen", "Koppeling toevoegen", and "Dienst toevoegen" buttons are NOT shown
- Backend returns 404 errors:
  - `Failed to load resource: 404` for voorzieningen_organisatie object
  - `Error fetching voorzieningen_organisatie` (404)
  - `Error fetching organization data: AxiosError` (404)
- **Screenshot:** `03-test-samenwerking-dashboard.png`

### Missing Samenwerking-Specific Features

The following features described in Step 20 of the test guide are not yet implemented or not accessible:

1. **Leden Beheer** -- No member management page for defining which municipalities belong to the samenwerking
2. **Adding products on behalf of members** -- No workflow to select a member municipality and register packages for them with approval
3. **Bulk operations** -- No ability to add a product to multiple organizations simultaneously
4. **Collective license management** -- No shared license management feature
5. **Organization fusies** -- No merge/transfer feature

### Verdict: **FAIL**

The samenwerkingsverband functionality is fundamentally broken. Switching to the "Test Samenwerking" organization causes a JavaScript crash, and even after reload, the dashboard shows no management options and returns 404 errors for organization data. Linda Bakker cannot perform any actions on behalf of member municipalities.

---

## Issue #186: Koppelingen

**Title:** Koppelingen
**GitHub:** https://github.com/VNG-Realisatie/Softwarecatalogus/issues/186
**Labels:** Aanbod, Bevinding, Restpunt, Koppeling
**Test Step:** Step 11 (Koppeling wizard)

### Acceptance Criteria Results

| # | Criterion | Result | Evidence |
|---|-----------|--------|----------|
| 1 | Koppelingen display in a table format with readable titles (not blank or UUID-only) | **PARTIAL** | Most koppelingen have readable names (e.g., "Drupal voor Gemeenten (DVG) <-> JOIN Klantcontact"). However, some have incomplete names: "Makelaarsuite <->" (missing second app), "COMPAS <->" (missing second app), "CiVision Gemeentelijke Servicebus <->" (missing second app), and one shows only "<->" (completely blank name). Per the testing note in issues.md, these are caused by bad client data (referencing deleted applications), not a code bug. |
| 2 | Koppelingen linked to "buitengemeentelijke voorzieningen" correctly display the referenced external service | **CANNOT_TEST** | No buitengemeentelijke voorziening koppelingen were identifiable in the local test data. The public search for category "Koppelingen" returns 0 results. |
| 3 | Koppelingen do not reference non-existent applications (graceful handling) | **PARTIAL** | Some koppelingen show names like "Makelaarsuite <->" or "COMPAS <->" where the second application is missing, but no errors are thrown (graceful). However, the display is confusing for end users. |
| 4 | Detail page shows all relevant fields: name, type, transport protocol, linked applications, external service | **PARTIAL** | Fields shown: title (correct), richting (correct), transportprotocol (correct), status (correct). However, Applicatie A and Applicatie B show "-" on beheer detail page. Direction widget shows "null <-> null". Public detail page shows "[object Object]" for Applicatie B. |
| 5 | Koppeling detail page at /publicatie/{uuid} renders correctly | **PARTIAL** | Page renders but with bugs: (a) Browser tab title shows UUID instead of name, (b) Applicatie B displays "[object Object]", (c) Direction widget shows "[object Object]" for B-side. |

### Detailed Observations

#### Beheer Koppelingen Overview (`/beheer/koppelingen`)

- Table displays with columns: Naam, Status, Korte beschrijving, Applicatie A, Applicatie B, Acties
- Status column initially shows "Loading..." then resolves to "In gebruik" / "in gebruik" (inconsistent capitalization)
- "Korte beschrijving" column shows "-" for all entries
- "Applicatie A" and "Applicatie B" columns show "-" for all entries (data not resolved in table view)
- Pagination works (2 pages visible with 20 items per page)
- "Toevoegen" button is available and functional
- Actions dropdown per row offers: Bekijken, Bewerken, Verwijderen
- **Screenshot:** `05-koppelingen-overview.png`

#### Beheer Koppeling Detail (`/beheer/koppeling/{uuid}`)

Tested with: Drupal voor Gemeenten (DVG) <-> JOIN Klantcontact

- **Title:** "Drupal voor Gemeenten (DVG) <-> JOIN Klantcontact" -- correct readable name
- **Direction widget:** Shows "null <-> null" -- **BUG** (should show application names)
- **Applicatie A:** "-" (not resolved)
- **Applicatie B:** "-" (not resolved)
- **Richting:** "bi-directioneel (<->)" -- correct
- **Transportprotocol:** "intern" -- correct
- **Status:** "in gebruik" -- correct
- **Applicaties tab:** Shows "Applicaties (1)" with only Drupal voor Gemeenten (DVG) -- missing the second application (JOIN Klantcontact)
- **Screenshot:** `06-koppeling-detail-dvg.png`

#### Public Koppeling Detail (`/publicatie/{uuid}`)

Tested with UUID: 062878e7-8d8a-5b21-a135-6e992eb3223b

- **Main heading:** "Drupal voor Gemeenten (DVG) <-> JOIN Klantcontact" -- correct
- **Browser tab title:** "33980275-9a5d-5fa3-95b8-68fa8b065442 <->" -- **BUG** (shows UUID instead of readable name)
- **Applicatie A:** "Drupal voor Gemeenten (DVG)" -- correct
- **Applicatie B:** "[object Object]" -- **BUG** (JavaScript object serialization error)
- **Direction widget:** "Drupal voor Gemeenten (DVG) <-> [object Object]" -- **BUG**
- **Richting:** "bi-directioneel (<->)" -- correct
- **Transportprotocol:** "intern" -- correct
- **Status:** "in gebruik" -- correct
- **Applicaties tab:** Shows "Applicaties (1)" with Drupal voor Gemeenten (DVG) card
- **Screenshot:** `07-koppeling-publicatie-detail.png`

#### Koppeling Wizard

- Accessible from dashboard via "Koppeling toevoegen" button
- URL: `/forms/gebruik/koppeling?type=aanbieden-koppeling`
- Wizard has 3 steps: (1) Een koppeling zoeken, (2) Gebruiksinformatie, (3) Controleren
- Step 1 loads correctly with application selector and existing koppeling check
- Debug panel visible ("Debug: Koppeling Data (Click to expand)") -- should be hidden in production
- **Screenshot:** `08-koppeling-wizard-step1.png`

### Key Bugs Found

1. **[object Object] for Applicatie B on public detail page** -- The public-facing koppeling detail page (`/publicatie/{uuid}`) renders `[object Object]` instead of the application B name. The application object is being coerced to string instead of being resolved to its display name.

2. **"null <-> null" in direction widget on beheer detail page** -- The beheer koppeling detail page shows "null" for both application names in the direction visualization widget.

3. **Applicatie A and B show "-" in beheer overview table and detail page** -- All koppelingen in the management table and beheer detail pages show "-" for both Applicatie A and Applicatie B columns.

4. **Browser tab title shows UUID** -- The public detail page `<title>` contains a raw UUID ("33980275-9a5d-5fa3-95b8-68fa8b065442 <->") instead of a readable koppeling name.

5. **Inconsistent status capitalization** -- Some entries show "In gebruik" (capitalized) and others "in gebruik" (lowercase).

6. **Only 1 of 2 applications shown in Applicaties tab** -- Despite the koppeling connecting two applications, only one appears in the Applicaties tab on both beheer and public detail pages.

### Verdict: **PARTIAL**

The koppelingen feature has significant display issues. While koppelingen are shown in a table with mostly readable names and the wizard is accessible, the detail pages have multiple rendering bugs (null values, [object Object], missing application references). The core table display works but with incomplete data resolution.

---

## Console Errors Summary

| Page | Error Count | Significant Errors |
|------|-------------|-------------------|
| `/login` | 1 | Manifest syntax error (ignorable) |
| `/beheer` (Default Org) | 1 | Manifest syntax error (ignorable) |
| `/beheer` (org switch) | 7+ | TypeError: Cannot read properties of undefined (reading 'includes') at AcDashboard + 404 errors for org data |
| `/beheer` (Test Samenwerking reload) | 8+ | 404 errors for voorzieningen_organisatie |
| `/beheer/koppelingen` | 1 | Manifest syntax error (ignorable) |
| `/beheer/koppeling/{uuid}` | 1 | Manifest syntax error (ignorable) |
| `/publicatie/{uuid}` (koppeling) | 2 | Manifest syntax error (ignorable) |
| `/beheer/my-account` | 1 | Manifest syntax error (ignorable) |
| `/beheer/my-organisation` | 1 | Manifest syntax error (ignorable) |
| `/zoeken?categorie=Koppelingen` | 1 | Manifest syntax error (ignorable) |

### Recurring Non-Ignorable Errors

| Error | Trigger | Severity |
|-------|---------|----------|
| `TypeError: Cannot read properties of undefined (reading 'includes')` in AcDashboard | Organization switch via dropdown | **CRITICAL** |
| `404` for voorzieningen_organisatie | "Test Samenwerking" org selected | **CRITICAL** (org data not found in backend) |

---

## Performance Summary

No API calls were observed with response times exceeding 500ms during this test session. All network requests returned 200 OK except:
- Organization data fetch for "Test Samenwerking" UUID returns 404 (organization not properly registered in the backend voorzieningen register)

---

## Overall Summary

| Issue | Title | Status | Key Finding |
|-------|-------|--------|-------------|
| #57 | Pakketten opvoeren voor samenwerkingsverband | **FAIL** | Organization switch crashes with TypeError; samenwerkingsverband dashboard broken (404 + no wizards). No samenwerking-specific features (member management, bulk operations, collective licenses) exist. |
| #186 | Koppelingen | **PARTIAL** | Table display mostly works with readable names. Wizard is functional. But detail pages show "null", "[object Object]", and UUIDs instead of proper names. Applicatie A/B columns not resolved in table or detail views. |

### Comparison with Previous Test Run

| Issue | Previous Status | Current Status | Change |
|-------|----------------|----------------|--------|
| #57 | PARTIAL | **FAIL** | Regressed -- org switch crash still present, no new samenwerking features added |
| #186 | PARTIAL | **PARTIAL** | No change -- same display bugs persist ([object Object], null values) |

### Recommendations

1. **Issue #57 (Critical):**
   - Fix the `userGroups` undefined error in `ac-dashboard.js` (line ~200) by adding null-safety: `userGroups?.includes('aanbod-beheerder')` or defaulting to an empty array
   - Ensure "Test Samenwerking" organization is registered in the backend voorzieningen register (currently returns 404)
   - Implement samenwerking-specific features: member management, acting on behalf of members, collective license management

2. **Issue #186 (High):**
   - Fix `[object Object]` rendering for Applicatie B on public detail pages -- resolve the application object to its display name before rendering
   - Fix "null <-> null" in the direction widget on beheer detail pages -- resolve application names from UUIDs
   - Fix the browser tab `<title>` to show the koppeling name instead of a UUID
   - Resolve Applicatie A and B columns in the beheer overview table and detail pages (currently always show "-")
   - Normalize status capitalization ("In gebruik" vs "in gebruik")
   - Show both linked applications in the Applicaties tab (currently only shows 1 of 2)

---

## Screenshots Index

| File | Description |
|------|-------------|
| `01-dashboard-login.png` | Dashboard after login with Default Organisation selected |
| `02-org-switch-error.png` | TypeError crash overlay when switching organizations |
| `03-test-samenwerking-dashboard.png` | Dashboard with Test Samenwerking (no wizards, 404 errors) |
| `04-my-account.png` | My Account page confirming linda.bakker@test.nl |
| `05-koppelingen-overview.png` | Koppelingen management table (full page) |
| `06-koppeling-detail-dvg.png` | Beheer detail page for DVG <-> JOIN Klantcontact koppeling |
| `07-koppeling-publicatie-detail.png` | Public detail page showing [object Object] bug |
| `08-koppeling-wizard-step1.png` | Koppeling wizard Step 1 |
| `09-my-organisation-empty.png` | My Organisation page for Default Organisation |
