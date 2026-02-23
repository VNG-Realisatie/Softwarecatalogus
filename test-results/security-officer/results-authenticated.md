# Security Officer Test Results - Authenticated Session

**Tester:** Mark Jansen (Security Officer)
**Date:** 2026-02-23 (re-test session 2)
**Environment:** Local development (Frontend: http://localhost:3000, Backend: http://localhost:8080)
**Login:** mark.jansen@test.nl / WelcomeToTest2026
**Groups:** gebruik-beheerder, software-catalog-users
**Organization:** Test Gemeente (UUID: a44a5556-2001-4ffc-8a08-fe4705605b47)
**Test Method:** Playwright browser automation (browser-3, headless Chromium) + API curl testing
**Browser:** Chromium (headless)

---

## Summary Table

| Issue | Title | Previous Status | Current Status | Severity |
|-------|-------|-----------------|----------------|----------|
| #394 | Contactpersonen van gemeenten publiekelijk zichtbaar | FAIL (CRITICAL) | **FAIL** | **CRITICAL** |
| #315 | Zoekpagina toont deel gemeentelijk applicatielandschap | FAIL (HIGH) | **FAIL** | **HIGH** |
| #85 | Publieke API toegang tot aanbodinformatie | PARTIAL | **PARTIAL** | MEDIUM |
| #183 | Wachtwoord vergeten optie | PARTIAL | **PASS** | -- |
| #395 | Menu linkerkant verdwijnt | CANNOT_TEST | **PASS** | -- |
| #404 | Regelmatig witte schermen | CANNOT_TEST | **PASS** | -- |
| #409 | Footer anders: inlog of uitgelogd | PARTIAL | **PASS** | -- |
| #406 | SiteImprove verwijderen | PARTIAL | **PASS** | -- |

**Overall:** 4 PASS, 1 PARTIAL, 2 FAIL (1 CRITICAL, 1 HIGH), 0 CANNOT_TEST

---

## Issue #394: Contactpersonen van gemeenten publiekelijk zichtbaar

**Status: FAIL**
**Severity: CRITICAL**
**Test Step:** Step 12 (Privacy and visibility)

This remains the highest-priority privacy finding. Contact person data (names, email addresses, phone numbers, roles) of municipalities is accessible through the frontend and the backend API via the `_extend=contactpersonen` parameter.

### Acceptance Criteria Results

- [ ] **CANNOT VERIFY** - Contact persons of **leveranciers** ARE visible on public pages (this is expected/correct behavior)
  - Via curl (unauthenticated), `_extend=contactpersonen` returns EMPTY arrays for all organisations. Leverancier contact visibility could not be confirmed via the public API.

- [ ] **FAIL** - Contact persons of **gemeenten** are NOT visible to unauthenticated users on frontend
  - The frontend detail page for gemeente "Aa en Hunze" (`http://localhost:3000/publicatie/f7db0bc8-ec7a-4aa9-902e-51a23f7bce51`) shows:
    - **Email:** test.vng.swc+Emu@gmail.com (publicly visible)
    - **Telefoon:** +31 23 4567890 (publicly visible)
    - **Contactpersonen tab** with "Arn met een achternaam" including phone number
  - This was visible in an unauthenticated browser session.

- [ ] **NOT TESTED** - Contact persons of **samenwerkingen** are NOT visible to unauthenticated users
  - Not specifically tested for samenwerking, but the same mechanism applies.

- [ ] **PARTIAL** - Public API (`_extend=contactpersonen`) correctly distinguishes: leverancier contacts visible, gemeente/samenwerking contacts hidden
  - **curl (unauthenticated):** Returns EMPTY contactpersonen arrays -- RBAC appears to work at the pure API level.
  - **Browser (unauthenticated):** The same backend URL (`http://localhost:8080/index.php/apps/opencatalogi/api/publications?_extend=contactpersonen&_limit=2&_schema=organisatie`) returns FULL contact data when accessed via browser, even without visible authentication cookies. Browser response showed "total":12641, while curl showed "total":4185.
  - **Inconsistency:** There is a session/cookie-based difference between browser and curl access. The Nextcloud backend appears to set session cookies (`ocvp3112b4wg`, `oc_sessionPassphrase`) even for anonymous requests, and these cookies may grant elevated access.

- [ ] **FAIL** - No personal contact information (name, email, phone) of gemeente users on public pages
  - Frontend detail page shows email, phone, and contact person name for gemeente "Aa en Hunze" to unauthenticated users.

- [ ] **NOT TESTED** - API endpoint enforces RBAC: authenticated gebruik-beheerder can see all contactpersonen, aanbod-beheerder sees only own org

### Evidence

**Frontend exposure (unauthenticated browser):**
- Organisation: Aa en Hunze (gemeente)
- Email displayed: test.vng.swc+Emu@gmail.com
- Phone displayed: +31 23 4567890
- Contact person: "Arn met een achternaam" with phone number
- Screenshot: `gemeente-contact-visible-unauthenticated.png`

**API inconsistency:**
```
curl (unauthenticated): contactpersonen=[] for all orgs, total=4185
browser (unauthenticated): contactpersonen=[full PII] for gemeente orgs, total=12641
```

**Backend API raw response (browser, unauthenticated):**
- Exposed contacts for Aa en Hunze: "Edw met een achternaam" (test.vng.swc+Emu@gmail.com), "Joh met een achternaam" (test.vng.swc+Jbr@gmail.com)
- Exposed contacts for Aalsmeer: "Con met een achternaam" (test.vng.swc+Con@gmail.com)
- Exposed contacts for Aalten: "E. met een achternaam" (test.vng.swc+E@gmail.com), "M met een achternaam" (test.vng.swc+M@gmail.com), "Ssc met een achternaam" (test.vng.swc+S@gmail.com)
- Screenshot: `api-contactpersonen-unauthenticated.png`

### Recommendation

1. **IMMEDIATE (CRITICAL):** Investigate the session-based RBAC bypass in the `_extend=contactpersonen` mechanism. Browser-based anonymous sessions appear to get elevated access compared to non-session API calls.
2. Gemeente and samenwerking contact persons must be filtered out for ALL unauthenticated access paths, including browser sessions with anonymous Nextcloud cookies.

### Console Errors
- None specific to this issue (only manifest syntax errors)

---

## Issue #315: Hoge prioriteit: Zoekpagina toont deel van gemeentelijk applicatielandschap

**Status: FAIL**
**Severity: HIGH**
**Test Step:** Step 14

The search page shows municipalities as suppliers on application cards and exposes private municipal application landscape data including koppelingen.

### Acceptance Criteria Results

- [ ] **FAIL** - "Leverancier" filter on /zoeken contains ONLY actual suppliers, NOT municipalities
  - The "Geregistreerd door" filter shows:
    - Gemeente (9,645) -- 9,645 items registered by municipalities visible
    - Leverancier (1,395)
    - Samenwerking (1,526)
  - The "Organisatietype" filter also shows "Gemeente (354)" as an option

- [ ] **FAIL** - Search result cards show the actual supplier as "aangeboden door", NOT a municipality
  - Multiple cards show municipalities as suppliers:
    - "12view Gisprogramma rioolinspecties" -- "(Aangeboden door Bloemendaal-Heemstede)"
    - "14010 - VANAD - outsourcing" -- "(Aangeboden door Rotterdam)"
    - "1Password" -- "(Aangeboden door Deurne)"
    - "24/7 bewaking gladheidmeetstations" -- "(Aangeboden door Midden-Groningen)"
    - "21QUBZ" -- "(Aangeboden door Tynaarlo)"

- [ ] **FAIL** - Filtering by municipality name is not possible
  - "Geregistreerd door: Gemeente" filter exists with 9,645 items

- [ ] **NOT FULLY TESTED** - Application detail page shows the correct supplier

- [ ] **FAIL** - Municipal application landscape data is not publicly visible to unauthenticated users
  - Koppelingen (3,420 authenticated) appear in search results. Per RBAC, koppelingen should NOT have public read access.
  - The "Type koppeling" filter shows "extern (881)" and "intern (2,539)" -- exposing internal connection topology
  - Authenticated users see 12,642 results vs unauthenticated 4,186, but both include municipality-registered entries

- [ ] **NOT TESTED** - Supplier on search card matches supplier on detail page

### Evidence

**Search page filter data (authenticated, http://localhost:3000/zoeken):**
```
Total results: 12,642

Type (4):
  Applicatie: 6,091
  Dienst: 4
  Koppeling: 3,420     <-- Should NOT be public per RBAC rules
  Organisatie: 3,127

Geregistreerd door (3):
  Gemeente: 9,645       <-- Municipality-registered entries publicly visible
  Leverancier: 1,395
  Samenwerking: 1,526

Type koppeling (2):
  extern: 881
  intern: 2,539
```

**Supplier mismatch examples on search cards:**
| Application | Search Card Shows | Expected |
|-------------|-------------------|----------|
| 1Password | Aangeboden door Deurne | 1Password.com |
| 14010 - VANAD | Aangeboden door Rotterdam | VANAD/Imtech |
| 21QUBZ | Aangeboden door Tynaarlo | 21QUBZ supplier |

Screenshot: `search-authenticated-municipalities-as-suppliers.png`

### Console Errors
- None specific to this issue

---

## Issue #85: (VNGR) Publieke API toegang tot aanbodinformatie

**Status: PARTIAL**
**Severity: MEDIUM**
**Test Step:** Step 12

The public API is accessible and returns data. OAS documentation is partially available.

### Acceptance Criteria Results

- [x] **PASS** - The public API for the Softwarecatalogus register is accessible and returns data
  - Publications API (`/api/apps/opencatalogi/api/publications`) returns data publicly
  - Unauthenticated: 4,186 results; Authenticated: 12,642 results

- [ ] **PARTIAL** - Auto-generated OAS documentation is accessible via Redocly URL
  - Register 2 (Publication) OAS works: `http://localhost:8080/index.php/apps/openregister/api/registers/2/oas` returns valid OpenAPI 3.1.0 spec (both authenticated and unauthenticated)
  - Register 3 (Voorzieningen) OAS FAILS: Returns error "Did expect one result but found none" due to organisation filter in SQL query (both authenticated and unauthenticated)
  - Register 4 (AMEF/GEMMA) OAS FAILS: Same error as register 3
  - No Redocly-rendered documentation page exists -- only raw JSON

- [x] **PASS** - The API returns data about aanbiedende organisaties (offering organizations)
  - Publications API returns organisatie data (schema 15)

- [x] **PASS** - The API returns data about aangeboden softwarepakketten (offered software packages)
  - Catalog schemas include module (25) and dienst (12)

- [ ] **NOT VERIFIED** - The API returns data about ondersteunde standaarden (supported standards)
  - Standards in GEMMA register (ID 4) -- OAS endpoint for that register fails

- [x] **PASS** - The API supports standard query parameters for filtering and pagination
  - Supports `_limit`, `_page`, `_search`, `_extend`, `_order` parameters

- [ ] **FAIL** - The OAS documentation link is accessible from the register action menu in the backend
  - OAS endpoints for registers 3 and 4 fail due to organisation scoping in database query

### Console Errors
- 404/500 errors when accessing non-working OAS endpoints

---

## Issue #183: Wachtwoord vergeten optie

**Status: PASS**
**Severity: --**
**Test Step:** Step 4

### Acceptance Criteria Results

- [x] "Wachtwoord vergeten?" button is visible on the login page
- [x] Clicking the button navigates to `/reminder` page titled "Wachtwoord vergeten"
- [x] Page shows: "Voer uw e-mailadres in om een eenmalige inlogcode te ontvangen."
- [x] Email input field with placeholder "uw.email@voorbeeld.nl"
- [x] "Verstuur code" button to submit the request
- [x] "Terug naar inloggen" button to return to login page

Note: Cannot verify email delivery in local dev environment, but the UI flow is complete.

### Evidence
- Screenshot: `login-page.png`
- Screenshot: `wachtwoord-vergeten.png`

### Console Errors
- Form submission warning (non-critical): "Form submission canceled because the form is not connected"

---

## Issue #395: Menu linkerkant verdwijnt

**Status: PASS**
**Severity: --**
**Test Step:** Step 4

### Acceptance Criteria Results

- [x] Navigate to "Applicaties" overview while logged in -- left menu visible with all 9 items (Dashboard, Mijn Account, Mijn Organisatie, Diensten, Contactpersonen, Applicaties, Gebruik, Koppelingen, View)
- [x] Press F5 to refresh -- left navigation menu remains visible
- [x] Menu present when directly navigating to URL (`http://localhost:3000/beheer/applicaties` via address bar)
- [x] Menu persists across refreshes on other pages (tested Koppelingen page)

### Evidence
- Screenshot: `dashboard-authenticated.png`

### Console Errors
- None related to this issue

---

## Issue #404: Regelmatig witte schermen

**Status: PASS**
**Severity: --**
**Test Step:** General

### Acceptance Criteria Results

- [x] Navigate through all major pages -- no white screens
  - Tested: Homepage, Zoeken, Login, Password Reset, Beheer Dashboard, Applicaties, Koppelingen, Publication detail. All rendered correctly.
- [x] Refreshing pages (F5) does not produce white screens
- [x] After clearing cache, pages load correctly (cleared localStorage, pages loaded fine)
- [x] JavaScript console shows no critical errors causing blank rendering
- [x] NOTE: Team hadn't seen this for a week -- consistent with our testing

Note: Tested in Chromium, not Edge. Cannot replicate Edge-specific behavior, but no white screens observed in any scenario.

### Console Errors
- Only manifest syntax errors (expected/known)

---

## Issue #409: Footer anders: inlog of uitgelogd

**Status: PASS**
**Severity: --**
**Test Step:** Step 21

### Acceptance Criteria Results

- [x] Footer links are identical in logged-in and logged-out states
- [x] "Privacyverklaring" link points to same URL in both states (`/privacyverklaring`)
- [x] "Algemene voorwaarden" link points to same URL in both states (`/algemene-voorwaarden`)
- [x] Footer styling consistent between states

### Detailed Comparison

| Link | Logged Out URL | Logged In URL | Match? |
|------|---------------|---------------|--------|
| Privacy | /privacyverklaring | /privacyverklaring | YES |
| Algemene voorwaarden | /algemene-voorwaarden | /algemene-voorwaarden | YES |
| Disclaimer | /disclaimer | /disclaimer | YES |
| FAQ | /faq | /faq | YES |
| GEMMA Online | https://www.gemmaonline.nl/ | https://www.gemmaonline.nl/ | YES |
| NORA Online | https://www.noraonline.nl/ | https://www.noraonline.nl/ | YES |
| VNG | https://vng.nl/ | https://vng.nl/ | YES |
| Commonground | https://commonground.nl/ | https://commonground.nl/ | YES |

### Console Errors
- None related to this issue

---

## Issue #406: SiteImprove verwijderen

**Status: PASS**
**Severity: --**
**Test Step:** Step 21

### Acceptance Criteria Results

- [x] HTML source does NOT contain `siteimproveanalytics.com` script tag
  - Verified via `document.documentElement.outerHTML.includes('siteimproveanalytics')` = `false`
- [x] No references to "siteimprove" in page source
  - Verified via `document.documentElement.outerHTML.includes('siteimprove')` = `false`
- [ ] Only Piwik analytics script present
  - No Piwik/Matomo found either (`includes('piwik') || includes('matomo')` = `false`). This is a development environment; analytics scripts may not be configured.
- [x] Verify by viewing page source on public pages -- confirmed on homepage
- [ ] Only ONE configurable position for tracking scripts
  - Not verified (requires admin/CMS configuration access)

### Console Errors
- None related to this issue

---

## RBAC Verification Summary

| Test | Result | Notes |
|------|--------|-------|
| Unauthenticated users cannot see gemeente contactpersonen | **FAIL** | Contact data visible on frontend detail pages and via browser API access |
| Unauthenticated users cannot access admin endpoints | **PASS** | /beheer redirects to login |
| Koppelingen not publicly visible | **FAIL** | 3,420 koppelingen in authenticated search, with type filter visible |
| Organisatie publicly readable | **PASS** | Expected per RBAC rules |
| Direct contactpersoon API enforces RBAC | **PARTIAL** | curl blocks correctly; browser bypasses |
| OAS documentation accessible | **PARTIAL** | Register 2 works; registers 3 and 4 fail |
| Session management on login/logout | **PASS** | Login creates session; clearing localStorage forces re-login |
| Direct URL access to restricted /beheer | **PASS** | Redirects to login |

---

## Performance Summary

| Page | Load Time | Status | Notes |
|------|-----------|--------|-------|
| Homepage (unauthenticated) | < 3s | OK | Quick initial load |
| /zoeken (unauthenticated) | ~5s | OK | Filters loaded after delay |
| /login | < 2s | OK | Fast |
| /beheer (authenticated) | ~5s | SLOW | Backend cache warming: 19 schema loads took ~4.5s |
| /beheer/applicaties | < 3s | OK | Menu and table loaded |
| /beheer/koppelingen | < 3s | OK | Similar performance |
| /zoeken (authenticated) | ~5s | OK | 12,642 results, 2,742 UUID name resolutions in background |

### Slow Calls
- Backend cache warming on /beheer: ~4.5s (multiple parallel schema/register loads) -- acceptable for initial load
- Facet UUID resolution: 2,742 names fetched from backend (~5s) -- background operation, non-blocking

---

## Console Errors Summary

### Expected/Known Errors (All Pages)
- `Manifest: Line: 1, column: 1, Syntax error` at `/meta/site.webmanifest` -- webmanifest malformed (2x per page)
- `Slow network is detected` -- development environment

### Dashboard-Specific Errors (Authenticated)
- 26 console errors on dashboard load: Failed to fetch collections for koppeling, module, dienst, contactpersoon, view, gebruik (403 responses)
- These are RBAC-related: the dashboard attempts to fetch data with `_multi=true` that the gebruik-beheerder role may not have access to
- **Severity: MEDIUM** -- Does not break functionality but generates excessive error noise

### Net::ERR_CONNECTION_REFUSED
- CSS resource for organization theme failed to load (non-critical)

---

## Additional Security Observations

### 1. Session State Display Issue
When initially loading the homepage with stale localStorage, the header briefly showed "mark.jansen@test.nl (Test Gemeente)" alongside "Aanmelden" and "Inloggen" buttons simultaneously. After clearing localStorage and reloading, the correct unauthenticated state was shown.
**Recommendation:** Clear user display immediately if authentication validation fails.

### 2. Authenticated vs Unauthenticated Data Volume Difference
- Unauthenticated search: ~4,186 results
- Authenticated search (gebruik-beheerder): 12,642 results
- The 8,456 additional results include koppelingen and additional data visible to authenticated users.

### 3. "Geen titel" Cards Rendering Issue
When the search page initially loads (before data enrichment completes), it briefly displays cards with "Geen titel" and links to `/publicatie/undefined`. This resolves after ~2-3 seconds but could confuse users.

### 4. Header Shows Login Buttons When Authenticated
Even when logged in as mark.jansen@test.nl, the header displays "Aanmelden" and "Inloggen" buttons alongside the user info. Should show "Uitloggen" instead.

---

## Evidence Screenshots

| File | Description |
|------|-------------|
| `homepage-unauthenticated.png` | Homepage as unauthenticated user |
| `search-unauthenticated.png` | Search page (unauthenticated) with filters |
| `gemeente-contact-visible-unauthenticated.png` | Aa en Hunze detail page showing contact PII publicly |
| `api-contactpersonen-unauthenticated.png` | Raw API response showing contact data via browser |
| `login-page.png` | Login page with "Wachtwoord vergeten?" button |
| `wachtwoord-vergeten.png` | Password reset page |
| `dashboard-authenticated.png` | Beheer dashboard after login |
| `search-authenticated-municipalities-as-suppliers.png` | Search page showing municipalities as suppliers |
