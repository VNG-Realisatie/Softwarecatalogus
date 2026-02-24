# Security Officer Test Results - Authenticated Session

**Persona**: Mark Jansen -- Information Security Officer
**Date**: 2026-02-24 (Retest #3)
**Previous Test Dates**: 2026-02-23, 2026-02-24, 2026-02-24
**Environment**: Frontend http://localhost:3000 | Backend http://localhost:8080
**Credentials**: mark.jansen@test.nl / WelcomeToTest2026
**Browser**: Playwright (headless Chromium, browser-4, 1920x1080)

---

## Summary

| Issue | Title | Status | Severity |
|-------|-------|--------|----------|
| #394 | Contactpersonen van gemeenten publiekelijk zichtbaar | **FAIL** | CRITICAL |
| #315 | Zoekpagina toont deel gemeentelijk applicatielandschap | **FAIL** | CRITICAL |
| #85 | Publieke API toegang tot aanbodinformatie | **PARTIAL** | MEDIUM |
| #183 | Wachtwoord vergeten optie | **PASS** | -- |
| #404 | Regelmatig witte schermen | **PASS** | -- |
| #395 | Menu linkerkant verdwijnt | **PASS** | -- |
| #409 | Footer anders: inlog of uitgelogd | **PASS** | -- |
| #406 | SiteImprove verwijderen | **PASS** | -- |
| #105 | Aanbieders zien applicatielandschappen niet | **MOVED** | -- |

---

## Issue #394: Contactpersonen van gemeenten publiekelijk zichtbaar

**Status: FAIL**
**Severity: CRITICAL**

### Test Method
Tested the backend API both authenticated (as Mark Jansen / gebruik-beheerder) and unauthenticated (curl without auth / fresh browser without session).

### Findings

**Unauthenticated API test** (`curl` to `http://localhost:8080/index.php/apps/opencatalogi/api/publications?_schema=organisatie&_extend[]=contactpersonen&_limit=5`):

The API returned **full contact person details** for gemeente organizations to unauthenticated users, including:
- First names (voornaam)
- Last names (achternaam)
- Email addresses (e-mailadres)
- Phone numbers (telefoonnummer)
- Roles (rollen: Gebruik-beheerder, Gebruik-raadpleger)
- Organisation UUIDs

**Example exposed data** (unauthenticated):
- "Aa en Hunze" municipality: 2 contact persons with names, emails (test.vng.swc+Emu@gmail.com, test.vng.swc+Jbr@gmail.com), phone (+31 23 4567890), roles (Gebruik-beheerder)
- "Almere" municipality: 3 contact persons with names, emails, roles (Gebruik-raadpleger, Gebruik-beheerder)

### Acceptance Criteria Results
- [ ] **FAIL** -- Contact persons of leveranciers ARE visible on public pages (expected behavior) -- **not tested in isolation because all contacts are exposed regardless of org type**
- [ ] **FAIL** -- Contact persons of gemeenten are NOT visible to unauthenticated users -- **GEMEENTE CONTACTS ARE FULLY VISIBLE VIA `_extend=contactpersonen`**
- [ ] **FAIL** -- Contact persons of samenwerkingen are NOT visible to unauthenticated users -- **LIKELY ALSO EXPOSED (same mechanism)**
- [ ] **FAIL** -- Public API correctly distinguishes leverancier vs gemeente contacts -- **NO DISTINCTION: all contacts returned regardless of org type**
- [ ] **FAIL** -- No personal contact information of gemeente users on public pages -- **NAMES, EMAILS, PHONE NUMBERS ALL EXPOSED**
- [ ] **N/A** -- API endpoint enforces RBAC for different roles -- tested as gebruik-beheerder (sees all, expected)

### Evidence
- Screenshot: `homepage-authenticated.png` (authenticated homepage)
- Raw API response confirmed contact details for "Aa en Hunze" and "Almere" municipalities returned without authentication

### Security Impact
**CRITICAL**: Personal data (names, email addresses, phone numbers, roles) of all municipality contact persons is publicly accessible without authentication. This is a GDPR/AVG violation. The `_extend=contactpersonen` parameter bypasses RBAC controls on the contactpersoon schema.

---

## Issue #315: Zoekpagina toont deel van gemeentelijk applicatielandschap

**Status: FAIL**
**Severity: CRITICAL**

### Test Method
Compared search results between authenticated (gebruik-beheerder) and unauthenticated sessions on the frontend search page.

### Findings

**Unauthenticated search page** (http://localhost:3000/zoeken):
- Shows **12,617 results** -- identical to authenticated count
- Expected for unauthenticated: approximately 1,853 results (per RBAC reference in issues.md)
- "Koppeling" type shows 3,416 items -- **should NOT be publicly visible per RBAC rules**
- "Geregistreerd door" filter shows:
  - Gemeente (9,644) -- **should NOT be visible to public**
  - Leverancier (1,395) -- correct (expected public)
  - Samenwerking (1,526) -- **should NOT be visible to public**

**Application cards showing municipalities as suppliers on the unauthenticated search page:**
- "12view Gisprogramma rioolinspecties" -- Aangeboden door **Bloemendaal-Heemstede** (gemeente)
- "14010 - VANAD - outsourcing" -- Aangeboden door **Rotterdam** (gemeente)
- "1Password" -- Aangeboden door **Deurne** (gemeente)
- "21QUBZ" -- Aangeboden door **Tynaarlo** (gemeente)
- "24/7 bewaking gladheidmeetstations" -- Aangeboden door **Midden-Groningen** (gemeente)
- "2TS Bouwtoezicht" -- Aangeboden door **Berkelland** (gemeente)
- "360 Feedback" -- Aangeboden door **Almere** (gemeente)

### Acceptance Criteria Results
- [ ] **CANNOT VERIFY** -- "Leverancier" filter on /zoeken contains ONLY actual suppliers, NOT municipalities
- [ ] **FAIL** -- Search result cards show the actual supplier as "aangeboden door", NOT a municipality -- **MUNICIPALITIES SHOWN AS SUPPLIERS PUBLICLY**
- [ ] **FAIL** -- Filtering by municipality name is not possible -- **Gemeente filter option publicly visible with 9,644 entries**
- [ ] **CANNOT VERIFY** -- Application detail page shows correct supplier
- [ ] **FAIL** -- Municipal application landscape data is not publicly visible to unauthenticated users -- **ALL 12,617 ITEMS VISIBLE INCLUDING ALL GEMEENTE DATA**
- [ ] **CANNOT VERIFY** -- Supplier on search card matches supplier on detail page
- [ ] **FAIL** -- RBAC-based filtering replaces the old "published" status approach -- **RBAC NOT FILTERING: identical count authenticated vs unauthenticated**
- [ ] **CANNOT VERIFY** -- Import data no longer contains @self.published

### Evidence
- Screenshot: `search-unauthenticated-critical.png` (unauthenticated search showing 12,617 results with Koppeling type and Gemeente filter)
- Screenshot: `search-authenticated.png` (authenticated search showing identical 12,617 results)

### Security Impact
**CRITICAL**: The entire municipal application landscape, including all koppelingen (connections) and gemeente-registered applications, is publicly visible. RBAC filtering is NOT being applied on the publications endpoint for unauthenticated users. The unauthenticated and authenticated result counts are identical (12,617), proving that no RBAC scoping is happening on the frontend search.

---

## Issue #85: Publieke API toegang tot aanbodinformatie

**Status: PARTIAL**
**Severity: MEDIUM**

### Test Method
Tested OAS documentation endpoints for registers 2, 3, and 4. Tested publications API for data availability.

### Findings

**OAS Documentation endpoints** (all tested unauthenticated):
- Register 2 (`/index.php/apps/openregister/api/registers/2/oas`): Returns valid OAS documentation (115K+ characters) -- **PASS**
- Register 3 / Voorzieningen (`/index.php/apps/openregister/api/registers/3/oas`): Returns valid OAS documentation (211K+ characters) -- **PASS** (previously reported as returning 500 for non-org users)
- Register 4 / VNG-GEMMA (`/index.php/apps/openregister/api/registers/4/oas`): Returns valid OAS documentation (123K+ characters) -- **PASS** (previously reported as returning 500)

**Publications API**:
- Returns data for organisaties, modules (applicaties), diensten
- Supports standard query parameters (_limit, _page, _schemas, _extend)
- Returns data about aanbiedende organisaties
- Returns data about aangeboden softwarepakketten

### Acceptance Criteria Results
- [x] **PASS** -- The public API for the Softwarecatalogus register is accessible and returns data
- [x] **PASS** -- Auto-generated OAS documentation is accessible per register at `/index.php/apps/openregister/api/registers/{id}/oas` (tested registers 2, 3, and 4)
- [x] **PASS** -- The API returns data about aanbiedende organisaties (offering organizations)
- [x] **PASS** -- The API returns data about aangeboden softwarepakketten (offered software packages)
- [ ] **CANNOT VERIFY** -- The API returns data about ondersteunde standaarden (supported standards) -- not tested
- [x] **PASS** -- The API supports standard query parameters for filtering and pagination
- [ ] **CANNOT VERIFY** -- The OAS documentation link is accessible from the register action menu in the backend (requires admin/functioneel beheerder access)

### Notes
The OAS bug mentioned in the acceptance criteria (registers with `organisation` field returning 500) appears to be resolved in this environment. All three registers return valid OAS documentation without authentication.

However, the API returns TOO MUCH data publicly (see #315 and #394) -- RBAC is not properly filtering the publications endpoint data.

---

## Issue #183: Wachtwoord vergeten optie

**Status: PASS**

### Test Method
Navigated to the login page, verified the "Wachtwoord vergeten?" button, clicked it, and verified the password reset form.

### Findings
- Login page at http://localhost:3000/login shows a clearly visible "Wachtwoord vergeten?" button below the login form
- Clicking it navigates to http://localhost:3000/reminder
- The page displays:
  - Title: "Wachtwoord vergeten"
  - Instructions: "Voer uw e-mailadres in om een eenmalige inlogcode te ontvangen."
  - Email input field with placeholder "uw.email@voorbeeld.nl"
  - "Verstuur code" submit button
  - "Terug naar inloggen" navigation button

### Acceptance Criteria Results
(No formal acceptance criteria section in issues.md for this issue; testing basic functionality)
- [x] **PASS** -- "Wachtwoord vergeten?" option is visible on login page
- [x] **PASS** -- Clicking navigates to a dedicated password reset form
- [x] **PASS** -- Form requests email address input
- [x] **PASS** -- "Verstuur code" action button present
- [x] **PASS** -- "Terug naar inloggen" back navigation present

### Evidence
- Screenshot: `login-page-wachtwoord-vergeten.png` (login page with "Wachtwoord vergeten?" button visible)
- Screenshot: `password-reset-page.png` (password reset form with email field and submit button)

---

## Issue #404: Regelmatig witte schermen

**Status: PASS**

### Test Method
Per testing hints, attempted to reproduce white screens through multiple scenarios:
1. Direct URL navigation to /beheer/applicaties, /beheer/diensten, /zoeken
2. F5 refresh on beheer pages
3. Page loads after logout and re-login

### Findings
- Direct URL navigation to `/beheer/applicaties` loaded correctly with full content
- Direct URL navigation to `/beheer/diensten` loaded correctly with left menu and table
- F5 refresh on `/beheer/applicaties` preserved all content (left menu + table)
- Direct URL navigation to `/zoeken` loaded search results correctly with 12,617 results
- No blank white screens observed in any scenario after 5+ attempts

### Acceptance Criteria Results
- [x] **PASS** -- Navigate through all major pages -- no white screens
- [x] **PASS** -- Refreshing pages (F5) does not produce white screens
- [ ] **N/A** -- After clearing cache in Edge (testing in Chromium via Playwright)
- [x] **PASS** -- JavaScript console shows no critical errors causing blank rendering (errors present but pages render completely)
- [x] **PASS** -- Team noted issue not seen for a week -- confirmed not reproducible in automated testing

### Notes
White screen was not reproduced in automated testing on 2026-02-24 after multiple attempts. Console errors exist (Manifest syntax errors, organization fetch 404s, name resolution 404s) but none prevent page rendering.

---

## Issue #395: Menu linkerkant verdwijnt

**Status: PASS**

### Test Method
Per testing hints:
1. Resized browser to 1920x1080 (wide viewport)
2. Navigated to `/beheer/applicaties`
3. Verified left menu visible with all items
4. Pressed F5 to refresh
5. Verified left menu still present after refresh
6. Navigated directly to `/beheer/diensten` via URL
7. Verified left menu present on that page too

### Findings
- Left navigation menu renders with all expected items: Dashboard, Mijn Account, Mijn Organisatie, Diensten, Contactpersonen, Applicaties, Gebruik, Koppelingen, View
- Menu persists after F5 refresh on /beheer/applicaties
- Menu present when directly navigating to URLs (not just SPA navigation)
- Menu works consistently across /beheer/applicaties and /beheer/diensten

### Acceptance Criteria Results
- [x] **PASS** -- Navigate to "Applicaties" overview while logged in -- left menu visible
- [x] **PASS** -- Press F5 or Ctrl+R to refresh -- left navigation menu remains visible
- [x] **PASS** -- Menu present when directly navigating to URL (not just SPA navigation)
- [x] **PASS** -- Menu persists across refreshes on other pages (Diensten tested)

### Evidence
- Screenshot: `beheer-applicaties-before-refresh.png` (left menu visible with all items before F5)
- Screenshot: `beheer-applicaties-after-refresh.png` (left menu still visible after F5 refresh)

---

## Issue #409: Footer anders: inlog of uitgelogd

**Status: PASS**

### Test Method
Compared footer links and structure between authenticated and unauthenticated states using JavaScript DOM inspection.

### Findings

**Authenticated footer links** (logged in as Mark Jansen):
| Link Text | URL |
|-----------|-----|
| GEMMA Online | https://www.gemmaonline.nl/ |
| NORA Online | https://www.noraonline.nl/ |
| VNG | https://vng.nl/ |
| Commonground | https://commonground.nl/ |
| Privacy | /privacyverklaring |
| Algemene voorwaarden | /algemene-voorwaarden |
| Disclaimer | /disclaimer |
| FAQ | /faq |

**Unauthenticated footer links**: **Identical** to authenticated -- same links, same URLs, same structure.

### Acceptance Criteria Results
- [x] **PASS** -- Footer links are identical in logged-in and logged-out states
- [x] **PASS** -- "Privacyverklaring" link points to same URL in both states (`/privacyverklaring`)
- [x] **PASS** -- "Algemene voorwaarden" link points to same URL in both states (`/algemene-voorwaarden`)
- [x] **PASS** -- Footer styling consistent between states (same structure, same navigation sections)
- [x] **PASS** -- Team could not replicate -- confirmed not reproducible
- [x] **PASS** -- A single, definitive set of footer links is applied to both states

### Evidence
- Screenshot: `homepage-authenticated.png` (footer while logged in as Mark Jansen)
- Screenshot: `homepage-unauthenticated.png` (footer while logged out -- same links visible)

---

## Issue #406: SiteImprove verwijderen

**Status: PASS**

### Test Method
Checked page HTML source for SiteImprove and Piwik/Matomo references on both authenticated and unauthenticated pages using JavaScript `document.documentElement.outerHTML` inspection.

### Findings
- **Authenticated page source**: `siteimprove` = false, `piwik/matomo` = true
- **Unauthenticated page source**: `siteimprove` = false, `piwik/matomo` = true
- No `siteimproveanalytics.com` script tags found in HTML source
- No script tags referencing SiteImprove in any form
- Piwik/Matomo analytics references confirmed present

### Acceptance Criteria Results
- [x] **PASS** -- HTML source does NOT contain `siteimproveanalytics.com` script tag
- [x] **PASS** -- No references to "siteimprove" in page source
- [x] **PASS** -- Piwik analytics is present (confirmed Piwik/Matomo references in page source)
- [x] **PASS** -- Verified by viewing page source on public pages (both authenticated and unauthenticated)
- [ ] **CANNOT VERIFY** -- Only ONE configurable position for tracking scripts (requires admin/CMS check)
- [ ] **N/A** -- Production/accept environment verification (testing on local dev)

---

## Issue #105: Aanbieders zien applicatielandschappen en koppelingen niet

**Status: MOVED**

This issue requires testing as **aanbod-beheerder** role to verify that suppliers cannot see other organizations' application landscapes and connections. Mark Jansen is a **gebruik-beheerder**, which has unrestricted read access to applicaties and koppelingen. This issue has been assigned to the leverancier testing agent who has the correct aanbod-beheerder role.

---

## RBAC Security Verification Summary

### Tests Performed

| Test | Expected Result | Actual Result | Status |
|------|----------------|---------------|--------|
| Unauthenticated: contactpersonen via _extend | Hidden (gemeente/samenwerking) | **Fully visible with PII** | **FAIL** |
| Unauthenticated: search result count | ~1,853 | **12,617** (identical to authenticated) | **FAIL** |
| Unauthenticated: koppeling visibility | Hidden | **3,416 visible** | **FAIL** |
| Unauthenticated: gemeente-registered apps | Hidden | **9,644 visible via "Geregistreerd door" filter** | **FAIL** |
| Unauthenticated: leverancier apps | Visible | Visible (1,395) | PASS |
| Unauthenticated: organisatie data | Visible | Visible (3,107) | PASS |
| Unauthenticated: admin endpoints | Blocked | Not tested (out of scope) | N/A |
| Gebruik-beheerder: sees all data | Yes | Yes (12,617) | PASS |

### Critical Security Findings

1. **RBAC not enforced on publications endpoint**: The frontend search page (http://localhost:3000/zoeken) returns identical results (12,617) for both authenticated and unauthenticated users. This proves that NO RBAC filtering is being applied for the publications catalog endpoint. The expected behavior is ~1,853 results for unauthenticated users.

2. **Contact person PII exposure (GDPR/AVG violation)**: Full personal data (first names, last names, email addresses, phone numbers, roles) of all municipality contact persons is returned via the `_extend=contactpersonen` API parameter without any authentication. This is a data protection violation.

3. **Koppeling (connection) data publicly visible**: All 3,416 koppelingen are visible to unauthenticated users. Per the RBAC rules in `softwarecatalogus_register.json`, the koppeling schema should NOT have public read access.

4. **Municipality application landscape fully exposed**: All 9,644 gemeente-registered applications are publicly visible on the search page, showing which municipalities use which applications. This operational data should be restricted to authenticated users with appropriate roles.

---

## Performance Summary

| Page | Load Behavior | Notes |
|------|---------------|-------|
| Homepage (authenticated) | Normal | Renders within 2-3s |
| Homepage (unauthenticated) | Delayed initial render | Full content appears after ~2s (SPA hydration) |
| /zoeken (authenticated) | Normal | 12,617 results + facets load in 3-5s |
| /zoeken (unauthenticated) | Normal | Same as authenticated (12,617 results) |
| /beheer/applicaties | Normal | Left menu + table renders within 3s |
| /beheer/diensten | Normal | Similar load time as applicaties |
| OAS endpoints (registers 2,3,4) | Large responses | Up to 211K chars, loads successfully |
| /login | Normal | Form renders immediately |
| /reminder (password reset) | Normal | Form renders immediately |

No individual API calls flagged as SLOW (>500ms) or PERFORMANCE_FAIL (>1000ms) during testing. Facet name resolution on the search page takes 3-5 seconds due to resolving 2,700+ UUIDs.

---

## Console Errors Summary

### Recurring Errors (observed across all authenticated pages)
1. **Manifest syntax error**: `Manifest: Line: 1, column: 1, Syntax error` at `/meta/site.webmanifest` -- Severity: LOW (cosmetic, PWA manifest issue)
2. **Organization fetch 404**: `Error fetching voorzieningen_organisatie` with 404 status -- Severity: MEDIUM (functional, user's organization not found in voorzieningen register)
3. **Name resolution 404**: 7 UUIDs consistently fail to resolve via `/api/names/{uuid}` -- Severity: LOW (cosmetic, gracefully handled with fallback caching)
4. **Schema related 404**: `/api/schemas/{type}/related` returning 404 -- Severity: LOW (non-blocking, related actions fail gracefully)

### Development-Only Errors
5. **Webpack HMR errors**: `loadable-components: failed to asynchronously load component` and `SyntaxError` in build -- Severity: LOW (development hot-reload artifacts, would not appear in production)

### Assessment
All console errors are non-blocking. Pages render successfully despite these errors. The organization fetch 404 may indicate that Mark Jansen's organization ("Test Gemeente") is not properly mapped in the voorzieningen register, but this does not prevent navigation or functionality.
