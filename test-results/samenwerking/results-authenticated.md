# Test Results: Samenwerking (Linda Bakker) - Authenticated Tests

**Date:** 2026-02-23
**Persona:** Linda Bakker - Coordinator at Test Samenwerking
**Role:** Gebruik-beheerder (software-catalog-users)
**Environment:** Frontend http://localhost:3000 / Backend http://localhost:8080
**Browser:** Playwright MCP (browser-7, headless)

---

## Login Summary

- **URL:** http://localhost:3000/login
- **Credentials used:** linda.bakker@test.nl / TestPassword1!
- **Note:** The credential in the skill file (`WelcomeToTest2026`) failed with 401. The credential from the orchestrator message (`TestPassword1!`) succeeded.
- **Result:** Login successful, redirected to /beheer
- **Organization auto-selected:** Test Samenwerking
- **Console errors on login:** Manifest syntax error (cosmetic, site.webmanifest), plus the failed first login attempt (401)

---

## Issue #186: Koppelingen

**Labels:** Aanbod, Bevinding, Restpunt, Koppeling
**Test Step:** Step 11
**Status: PARTIAL**

### Acceptance Criteria Results

| # | Criterion | Result | Evidence |
|---|-----------|--------|----------|
| 1 | Koppelingen display in a table format with readable titles (not blank or UUID-only) | **FAIL** | Older/imported koppelingen display only directional arrows as titles (e.g., left-arrow, right-arrow, bidirectional-arrow). No human-readable names. See screenshot `03-koppelingen-search-no-titles.png`. |
| 2 | Koppelingen linked to "buitengemeentelijke voorzieningen" correctly display the referenced external service | **PASS** | On the detail page for koppeling `c8a8323e-650b-5577-9343-271d31568368`, the field "Buitengemeentelijke voorziening: BRK - Basisregistratie Kadaster" displays correctly. See screenshot `04-koppeling-detail-old.png`. |
| 3 | Koppelingen do not reference non-existent applications (graceful handling) | **FAIL** | The older koppeling shows "Applicatie A: -" (dash) and the page header displays the literal text "null" before the arrow: "null - BRK - Basisregistratie Kadaster". The system does not gracefully handle missing application references. See screenshot `04-koppeling-detail-old.png`. |
| 4 | Detail page shows all relevant fields: name, type, transport protocol, linked applications, external service | **PARTIAL** | Older koppelingen detail pages show: Richting, Transportprotocol, Status, Intermediair, Standaardversies, and Buitengemeentelijke voorziening. However, Standaardversies displays a raw UUID (`419ba65d-7202-4195-babd-e6a1d493bfd4`) instead of a resolved name. Newer koppelingen (e.g., "Test Wizard App - Open Zaakbrug") show Applicatie A, Applicatie B, Richting, and Status correctly. See screenshots `04-koppeling-detail-old.png` and `05-koppeling-detail-new.png`. |
| 5 | Koppeling detail page at /publicatie/{uuid} renders correctly | **PARTIAL** | Pages render but with issues: (a) Newer koppeling `5929659e-978c-40ec-abe2-0f71a225f392` has h1 heading showing raw UUID instead of app name: "1a8e00e8-d42d-4b19-a700-f9a43a4fa6a0 - Open Zaakbrug" while the body correctly resolves to "Test Wizard App - Open Zaakbrug". (b) Older koppelingen show "null" in the h1 and arrow-only titles. See screenshot `05-koppeling-detail-new.png`. |

### Additional Findings

1. **Search schema filter does not work:** Navigating to `/zoeken?_schema=koppeling` returns 12,645 results (all types) instead of filtering to only koppelingen. The `_schema` parameter does not filter results.

2. **Initial search render shows "Geen titel" and undefined URLs:** Before data enrichment completes, search result cards briefly display "Geen titel" with links to `/publicatie/undefined`. After a few seconds, data enriches and shows actual content. This is a UX issue (flash of incorrect content).

3. **Duplicate "Test Samenwerking" entries:** In the "Deelnames bewerken" dialog, "Test Samenwerking" appears 7 times as separate entries in the Samenwerkingsverbanden list. This is a data quality issue.

4. **Koppeling wizard loads with debug panel:** The "Koppeling toevoegen" wizard shows a debug panel ("Debug: Koppeling Data (Click to expand)") which should not be visible in production.

### Console Errors (Non-Manifest)

- `Failed to load resource: the server responded with a status of 404` for name resolution of UUID `419ba65d-7202-4195-babd-e6a1d493bfd4` (standaardversie reference)
- Schema not found warnings for type "koppeling" during wizard loading (5 occurrences)

### Performance

- All API calls returned within acceptable time (<500ms)
- No SLOW or PERFORMANCE_FAIL requests observed
- Backend cache loading completed in ~1078ms on login

---

## Issue #57: Pakketten opvoeren voor samenwerkingsverband

**Labels:** Gebruik, PvE eis
**Test Step:** Step 20
**Status: CANNOT_TEST**

### Context

Issue #57 describes the ability for a gebruik-beheerder of a samenwerkingsverband to register software packages on behalf of member municipalities. This is a core collaboration feature.

### Test Observations

1. **Organization selector:** The beheer dashboard shows a "Selecteer organisatie" dropdown with only two options: "Default Organisation" and "Test Samenwerking". There are no member municipalities available to switch to.

2. **No member municipality management:** The "Mijn Organisatie" page for Test Samenwerking shows organization details, contact info, and a "Deelnames" option. The Deelnames dialog allows joining existing samenwerkingsverbanden (via checkbox list), but there is no mechanism to define which municipalities are MEMBERS of this samenwerking.

3. **No multi-org package registration:** There is no visible UI flow to register software packages on behalf of member municipalities. The "Applicatie toevoegen", "Koppeling toevoegen", and "Dienst toevoegen" buttons all operate in the context of the currently selected organization (Test Samenwerking), not for member municipalities.

4. **Organization profile incomplete:** Test Samenwerking has no short description, no long description, and no member municipality configuration visible in the profile.

### Acceptance Criteria (Inferred from Issue Title)

| # | Criterion | Result | Notes |
|---|-----------|--------|-------|
| 1 | Samenwerking can view member municipalities | **CANNOT_TEST** | No member municipality section exists in organization profile |
| 2 | Samenwerking can add software packages for member municipalities | **CANNOT_TEST** | Organization selector only shows own organizations, no member municipality switching |
| 3 | Packages registered for members are attributed correctly | **CANNOT_TEST** | Prerequisite (member management) not available |

### Reason for CANNOT_TEST

The Test Samenwerking organization does not have member municipalities configured, and the UI does not provide a mechanism to define or manage member municipalities. The core feature described in #57 (registering packages on behalf of member municipalities) cannot be tested because the prerequisite organizational relationships are not set up, and there appears to be no UI to create them.

---

## General Observations

### Beheer Dashboard

- Dashboard loads correctly with organization selector
- Welcome message explains the three main actions: Dienst, Gebruik, Koppeling registreren
- Links to "Mijn Account" and "Mijn Organisatie" work correctly
- No table/list view of existing items appears on the dashboard for Test Samenwerking (likely because no items are registered yet)

### Organization Profile (/beheer/my-organisation)

- Displays organization name: "Test Samenwerking"
- Shows 1 contact person: Linda Bakker (Beheerder, +31 6 45678901)
- "Acties" menu provides: Edit contact info, Edit short description, Edit long description, Deelnames
- Deelnames dialog shows Communities (empty) and Samenwerkingsverbanden (long list with checkboxes)
- **Data quality issue:** "Test Samenwerking" appears 7 times in the Samenwerkingsverbanden list

### Console Errors Summary

Only recurring error across all pages is the Manifest syntax error at `site.webmanifest` -- this is a cosmetic/configuration issue not related to functionality. No functional JavaScript errors were observed during normal navigation.

### Performance Summary

- All API endpoints responded with 200 OK
- No requests exceeded 500ms threshold
- Backend cache loading completed in ~1078ms
- No SLOW or PERFORMANCE_FAIL events

---

## Screenshots

| File | Description |
|------|-------------|
| `01-login-success.png` | Successful login, beheer dashboard with Test Samenwerking selected |
| `02-koppeling-wizard.png` | Koppeling toevoegen wizard (Step 1) |
| `03-koppelingen-search-no-titles.png` | Search results for koppelingen showing arrow-only titles and mixed result types |
| `04-koppeling-detail-old.png` | Detail page for older/imported koppeling showing "null" reference and raw UUID |
| `05-koppeling-detail-new.png` | Detail page for newer koppeling showing UUID in h1 heading |
| `06-org-selector.png` | Organization selector dropdown showing 2 organizations |
| `07-my-organisation.png` | "Mijn Organisatie" page for Test Samenwerking |
| `08-org-actions-dropdown.png` | Organization actions dropdown menu |
| `09-deelnames-dialog.png` | "Deelnames bewerken" dialog showing samenwerkingsverbanden list |

---

## Summary Table

| Issue | Title | Status | Key Finding |
|-------|-------|--------|-------------|
| #186 | Koppelingen | **PARTIAL** | Older koppelingen have no readable titles (arrows only), show "null" for missing apps, display raw UUIDs for standaardversies. Newer koppelingen render correctly in body but have UUID in h1. Buitengemeentelijke voorziening displays correctly. |
| #57 | Pakketten opvoeren voor samenwerkingsverband | **CANNOT_TEST** | No member municipality management or multi-org package registration feature visible in the UI. Organization selector only shows own organizations. |
