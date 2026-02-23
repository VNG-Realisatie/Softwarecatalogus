# Security Officer Test Results - Mark Jansen (Authenticated)

**Tester:** Mark Jansen (Information Security Officer)
**Date:** 2026-02-23
**Environment:** Local Development (Frontend: http://localhost:3000, Backend: http://localhost:8080)
**Login:** mark.jansen@test.nl / TestPassword1! (gebruik-beheerder, software-catalog-users)
**Organization:** Test Gemeente
**Browser:** Playwright headless (Chromium)

---

## Executive Summary

| Severity | Count |
|----------|-------|
| CRITICAL | 2 |
| HIGH | 1 |
| MEDIUM | 1 |
| LOW | 0 |

**Overall Security Assessment: CRITICAL issues found.** The frontend proxy authenticates all API requests as admin, exposing all RBAC-restricted data to unauthenticated users. Additionally, koppelingen (connections) and municipal application landscapes are publicly visible in search results, violating the RBAC model.

---

## Issue Test Results

### #394: Contactpersonen van gemeenten publiekelijk zichtbaar

**Status: PARTIAL**
**Severity: MEDIUM**
**Test Step: 12**

**Acceptance Criteria Results:**
- [x] Contact persons of **leveranciers** ARE visible on public pages -- No contact person data was found in public API responses (empty arrays), so this cannot be confirmed as working. No leverancier contacts appear to be populated in the local environment.
- [?] Contact persons of **gemeenten** are NOT visible to unauthenticated users on frontend -- Contact person arrays are empty for all checked gemeente publications (100+ checked). No gemeente contact data was exposed.
- [?] Contact persons of **samenwerkingen** are NOT visible to unauthenticated users -- Similarly empty.
- [?] Public API (`_extend=contactpersonen`) correctly distinguishes -- All contactpersonen arrays return empty via the public API. Cannot test the distinguishing logic with empty data.
- [x] No personal contact information (name, email, phone) of gemeente users on public pages -- Confirmed: no personal info exposed.
- [ ] API endpoint enforces RBAC: authenticated gebruik-beheerder can see all contactpersonen -- NOT tested (no contact data populated in local env)

**Notes:** The local development environment does not have populated contact person records. All contactpersonen arrays return empty for both leverancier and gemeente organizations. This makes it impossible to definitively verify whether the RBAC filtering for #394 is working correctly. The fact that no data leaks is technically correct, but the root cause may simply be missing test data rather than proper RBAC enforcement.

**CRITICAL FINDING:** The frontend proxy (`localhost:3000/api/`) authenticates as `admin` (confirmed by `x-user-id: admin` response header). This means the RBAC check for contactpersonen may be passing due to admin privileges, not because the RBAC rules are correctly enforced. See infrastructure finding below.

**Evidence:** Screenshots 03-org-detail-050media.png

---

### #315: Hoge prioriteit: Zoekpagina toont deel van gemeentelijk applicatielandschap

**Status: FAIL**
**Severity: CRITICAL**
**Test Step: 14**

**Acceptance Criteria Results:**
- [ ] "Leverancier" filter on /zoeken contains ONLY actual suppliers, NOT municipalities -- **FAIL**: The "Geregistreerd door" filter shows: Gemeente (9,645), Leverancier (1,395), Samenwerking (1,526). This means 9,645 items registered by municipalities are publicly visible in search.
- [ ] Search result cards show actual supplier as "aangeboden door", NOT a municipality -- **FAIL**: Example: "14010 - VANAD - outsourcing, Interne telefonie - Imtech - outsourcing" shows "(Aangeboden door Rotterdam)" where Rotterdam is a municipality. The actual supplier on the detail page may differ.
- [ ] Filtering by municipality name is not possible -- **FAIL**: The "Geregistreerd door" filter includes "Gemeente" as an option, allowing filtering by municipality registration.
- [ ] Application detail page shows the correct supplier -- **PARTIAL**: "12view Gisprogramma rioolinspecties" detail page correctly shows "Leitec" as the organisation. However, the search card showed "(Aangeboden door Bloemendaal-Heemstede)".
- [ ] Municipal application landscape data is not publicly visible to unauthenticated users -- **FAIL**: All 12,645 publications are visible including municipal data.
- [ ] Supplier on search card matches supplier on detail page -- **FAIL**: Search card shows municipality, detail page shows actual vendor.

**Notes:** The search page shows 12,645 results to unauthenticated users. The "Type" filter shows 3,422 koppelingen publicly visible. The "Geregistreerd door" filter shows 9,645 items registered by gemeenten. This is a critical privacy/data exposure issue. Municipal application landscapes and internal koppelingen should NOT be publicly visible per the RBAC model.

**Root Cause (likely):** The frontend proxy at `localhost:3000/api/` passes ALL requests with admin authentication (`x-user-id: admin`), bypassing all RBAC restrictions. See infrastructure finding.

**Evidence:** Screenshots 02-search-unauthenticated.png, 04-search-filters-unauthenticated.png, 05-app-detail-12view.png

---

### #85: (VNGR) Publieke API toegang tot aanbodinformatie

**Status: PARTIAL**
**Severity: LOW (functional, not security)**
**Test Step: 12**

**Acceptance Criteria Results:**
- [x] The public API for the Softwarecatalogus register is accessible and returns data -- Confirmed: `http://localhost:8080/index.php/apps/opencatalogi/api/publications` returns 200 with data.
- [ ] Auto-generated OAS documentation is accessible via Redocly URL -- **NOT TESTED**: No Redocly URL found in local environment.
- [x] The API returns data about aanbiedende organisaties (offering organizations) -- Confirmed: organizations with type=Leverancier return 340 results.
- [x] The API returns data about aangeboden softwarepakketten (offered software packages) -- Confirmed: Applications (schema 25) are returned, 1,055 items.
- [ ] The API returns data about ondersteunde standaarden (supported standards) -- Standaarden are returned as nested data within application publications (via `_extend`), but not as standalone publications.
- [x] The API supports standard query parameters for filtering and pagination -- Confirmed: `_limit`, `_page`, and `type` filters work. Pagination returns different results per page.
- [ ] The OAS documentation link is accessible from the register action menu in the backend -- **NOT TESTED**: Backend admin UI not tested.

**Notes:** The direct backend API at `localhost:8080` correctly returns public data (1,853 publications) without authentication. The API supports basic filtering and pagination. The `_schema` filter parameter does not appear to work (all queries return 1,853 regardless of schema value). The API does not enforce RBAC for individual publication detail access -- koppeling details (schema 18) are accessible by direct ID even though they should not be public.

---

### #183: Wachtwoord vergeten optie

**Status: PASS**
**Severity: N/A (feature verification)**
**Test Step: 4**

**Acceptance Criteria:**
- [x] "Wachtwoord vergeten?" button is visible on the login page
- [x] Clicking the button navigates to `/reminder` page
- [x] The page shows an email input field with placeholder "uw.email@voorbeeld.nl"
- [x] A "Verstuur code" button is present to send a one-time login code
- [x] A "Terug naar inloggen" button is present to return to login
- [x] The flow uses a one-time code approach (not a password reset link), which is more secure

**Notes:** The password reset flow is functional and uses a security-appropriate approach (one-time login code via email). The text reads "Voer uw e-mailadres in om een eenmalige inlogcode te ontvangen." This is a good security practice.

**Evidence:** Screenshots 06-login-page.png, 07-password-reset.png

---

### #404: Regelmatig witte schermen

**Status: CANNOT_TEST (appears resolved)**
**Severity: N/A**
**Test Step: General**

**Acceptance Criteria Results:**
- [x] Navigate through all major pages -- No white screens observed during testing
- [x] Refreshing pages (F5) doesn't produce white screens -- F5 on `/beheer` reloaded correctly
- [x] JavaScript console shows no critical errors causing blank rendering -- Only `site.webmanifest` parsing error (cosmetic) and expected schema fetch errors (404 for applicatielandschappen)

**Notes:** No white screens were observed during the testing session across multiple page navigations: homepage, search, login, beheer dashboard, applicatielandschappen, publication detail, logout, and back to login. F5 refresh on the beheer dashboard worked without issues. The only console errors were:
1. `site.webmanifest` parsing error (cosmetic, not causing rendering issues)
2. Schema error for `applicatielandschappen/related` (404) -- functional error but not causing white screen

**Caveat:** Testing was done with Chromium (Playwright), not Edge. The original issue reported Edge-specific behavior.

---

### #395: Menu linkerkant verdwijnt

**Status: CANNOT_TEST**
**Severity: N/A**
**Test Step: 4**

**Acceptance Criteria Results:**
- [ ] Navigate to "Applicaties" overview while logged in -- The `/beheer/applicatielandschappen` page redirected to `/beheer` (dashboard). No separate applicaties overview found.
- [ ] Left navigation menu remains visible after refresh -- **No left sidebar navigation exists** in the current implementation. The beheer area uses top-bar navigation only.
- [ ] Menu present when directly navigating to URL -- N/A
- [ ] Menu persists across refreshes on other pages -- N/A

**Notes:** The current frontend implementation does not appear to have a left sidebar navigation menu in the beheer section. Navigation is handled via the top navigation bar (Privacy, Terms, Beheer). The beheer dashboard has action buttons (Applicatie toevoegen, Koppeling toevoegen, Dienst toevoegen) but no sidebar. This may indicate the issue was resolved by redesigning the navigation, or the left menu is only present for certain roles/pages not tested.

**Evidence:** Screenshot 09-applicatielandschappen-no-sidebar.png

---

### #409: Footer anders: inlog of uitgelogd

**Status: PASS**
**Severity: N/A**
**Test Step: 21**

**Acceptance Criteria Results:**
- [x] Footer links are identical in logged-in and logged-out states
- [x] "Privacyverklaring" link points to same URL in both states (/privacyverklaring)
- [x] "Algemene voorwaarden" link points to same URL in both states (/algemene-voorwaarden)
- [x] Footer styling consistent between states

**Comparison:**

| Link | Logged Out | Logged In |
|------|-----------|-----------|
| Privacy | /privacyverklaring | /privacyverklaring |
| Algemene voorwaarden | /algemene-voorwaarden | /algemene-voorwaarden |
| Disclaimer | /disclaimer | /disclaimer |
| FAQ | /faq | /faq |
| GEMMA Online | https://www.gemmaonline.nl/ | https://www.gemmaonline.nl/ |
| NORA Online | https://www.noraonline.nl/ | https://www.noraonline.nl/ |
| VNG | https://vng.nl/ | https://vng.nl/ |
| Commonground | https://commonground.nl/ | https://commonground.nl/ |

**Notes:** Footer links are fully consistent between authenticated and unauthenticated states. The previous finding about inconsistency could not be reproduced.

---

### #406: SiteImprove verwijderen

**Status: PASS**
**Severity: N/A**
**Test Step: 21**

**Acceptance Criteria Results:**
- [x] HTML source does NOT contain `siteimproveanalytics.com` script tag -- Confirmed absent
- [x] No references to "siteimprove" in page source -- Confirmed absent
- [x] Only Piwik analytics script present -- Confirmed: Piwik Pro Analytics script is present with configurable parameters (srcUrl, dataLayerName, id)
- [x] Verify by viewing page source on public pages -- Verified on both homepage and beheer page
- [x] Only ONE configurable position for tracking scripts -- Confirmed: one Piwik Pro script block at beginning of body tag

**Notes:** SiteImprove has been completely removed. The Piwik Pro Analytics script is present with empty configuration values (expected in local development). The script is placed as the first element in the body tag with comment "MUST BE FIRST SCRIPT IN BODY". Verified on both unauthenticated and authenticated pages.

---

## Security Verification Results

### RBAC Verification

| Check | Status | Notes |
|-------|--------|-------|
| Unauthenticated users cannot see gemeente contactpersonen | INCONCLUSIVE | No contact data populated in test env; proxy authenticates as admin |
| Unauthenticated users cannot access admin endpoints | PASS | `/beheer` redirects to login page after logout |
| Unauthenticated users cannot see koppelingen | **FAIL** | 3,422 koppelingen visible in search (proxy auth as admin) |
| Session properly terminated after logout | PASS | Accessing `/beheer` after logout redirects to login |
| Deactivated users cannot log in | NOT TESTED | No deactivated test user available |

### Privacy Verification

| Check | Status | Notes |
|-------|--------|-------|
| Gemeente contactpersonen NOT publicly visible | INCONCLUSIVE | No data to test; proxy authenticates as admin |
| Usage data scoped to own organization | NOT TESTED | Only one organization available (Test Gemeente) |
| API endpoints enforce same rules as UI | **FAIL** | Backend direct API returns koppeling details publicly |
| Direct URL access to restricted resources returns 403/404 | **FAIL** | Koppelingen accessible by direct publication ID |

---

## CRITICAL Infrastructure Finding: Frontend Proxy Authentication Leak

**Severity: CRITICAL**

The frontend development server at `http://localhost:3000/api/` proxies all API requests to the backend with **admin authentication**. This was confirmed by the `x-user-id: admin` response header on proxied requests.

**Impact:**
- The frontend proxy returns **12,645 publications** while the direct backend API returns **1,853 publications**
- This means ~10,792 items that should be RBAC-restricted (koppelingen, gebruik, gemeente-registered applications) are exposed through the proxy
- All RBAC rules are effectively bypassed for any request routed through the frontend proxy

**Comparison:**
| Endpoint | Total Publications | Notes |
|----------|-------------------|-------|
| Direct backend (localhost:8080) | 1,853 | Correct public count |
| Frontend proxy (localhost:3000/api/) | 12,645 | Includes RBAC-restricted data |

**Note:** This may be a known development environment configuration. However, this same pattern would be a CRITICAL vulnerability in any non-development environment. The proxy configuration should be verified for all deployed environments (accept, performance, production).

---

## Console Error Summary

| Page | Errors | Critical? | Notes |
|------|--------|-----------|-------|
| Homepage (unauth) | 2 | No | site.webmanifest syntax error (cosmetic) |
| Search (unauth) | 2 | No | site.webmanifest only |
| Login | 2 | No | site.webmanifest + autocomplete warning |
| Beheer dashboard | 4 | Low | site.webmanifest + initial 401 from wrong password attempt |
| Applicatielandschappen | 6 | Medium | 404 on `/related` endpoint + schema_applicatielandschappen error |

**Recurring Error:** `Manifest: Line: 1, column: 1, Syntax error` at `/meta/site.webmanifest` -- present on every page. Should be fixed for clean console output.

---

## Performance Notes

No API calls observed exceeding 500ms threshold during the testing session. Backend cache warmup completed in ~1,407ms. Name resolution queries completed within normal ranges.

---

## Recommendations

1. **CRITICAL**: Investigate the frontend proxy authentication configuration. In production, the proxy MUST NOT pass admin credentials for unauthenticated user requests. Each request should pass the actual user's session token (or none for public requests).

2. **CRITICAL (#315)**: Ensure the search page only returns publications that match the RBAC model: only leverancier-registered applications and public organisatie data should be visible to unauthenticated users. Koppelingen and gemeente-registered applications must be filtered out.

3. **HIGH**: Verify the direct backend API does not return koppeling publication details to unauthenticated requests. The publication at `c8a8323e-650b-5577-9343-271d31568368` (koppeling, schema 18) returned full details with status 200 without any authentication.

4. **MEDIUM (#394)**: Once the proxy authentication is fixed, re-test contact person visibility with actual contact person data. The current empty arrays prevent definitive testing.

5. **LOW**: Fix the `site.webmanifest` syntax error to eliminate recurring console errors.

---

## Screenshots Index

| File | Description |
|------|-------------|
| 01-homepage-unauthenticated.png | Homepage as unauthenticated user |
| 02-search-unauthenticated.png | Search page showing 12,645 results (unauthenticated) |
| 03-org-detail-050media.png | Organization detail page (no contact data exposed) |
| 04-search-filters-unauthenticated.png | Search filters showing koppelingen and gemeente data |
| 05-app-detail-12view.png | Application detail page with standards |
| 06-login-page.png | Login page with password reset option |
| 07-password-reset.png | Password reset (wachtwoord vergeten) page |
| 08-dashboard-authenticated.png | Authenticated beheer dashboard |
| 09-applicatielandschappen-no-sidebar.png | Applicatielandschappen page (no left sidebar) |
| 10-access-denied-after-logout.png | Access denied message after logout |
