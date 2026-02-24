# Security Officer Test Results - Authenticated Session

**Test Date:** 2026-02-24 (Retest #2)
**Previous Test Dates:** 2026-02-23, 2026-02-24
**Tester:** Mark Jansen (Security Officer persona)
**Credentials:** mark.jansen@test.nl / WelcomeToTest2026
**Organization:** Test Gemeente (gebruik-beheerder, software-catalog-users)
**Browser:** Playwright Chromium (headless, browser-4), 1920x1080
**Frontend:** http://localhost:3000
**Backend:** http://localhost:8080

---

## Executive Summary

| Severity | Count |
|----------|-------|
| CRITICAL | 1 |
| HIGH | 0 |
| MEDIUM | 1 |
| LOW | 2 |

**Overall Security Assessment: CRITICAL issue persists.** The public API and frontend expose personal data (names, emails, phone numbers) of municipality contact persons without authentication. This confirms findings from previous test sessions.

**Changes from previous test (2026-02-24 retest #1):**
- **#395 (Menu linkerkant verdwijnt)**: Previously CANNOT_TEST. Now **PASS** -- left sidebar navigation IS present and persists through F5 refresh at 1920x1080 viewport. The previous session tested at a different URL (/beheer/applicatielandschappen) or smaller viewport where sidebar was not visible.
- **#315**: Downgraded from FAIL to PARTIAL. Applications show correct leverancier attribution ("Aangeboden door [Leverancier]"). The "Geregistreerd door" filter correctly separates Gemeente/Leverancier/Samenwerking. Municipality organisation records appear in search (acceptable) but application landscape data does not.
- **#406**: Now detects Piwik/Matomo reference (`hasPiwik: true`).

---

## Issue Test Results

---

### #394: Contactpersonen van gemeenten publiekelijk zichtbaar

**Status: FAIL**
**Severity: CRITICAL**
**Test Step: 12**

**Acceptance Criteria Results:**
- [x] Contact persons of **leveranciers** ARE visible on public pages (expected/correct)
  - Verified: Leverancier contacts with "Aanbod-beheerder" role returned via `_extend[]=contactpersonen` for organisations with `type=Leverancier`
- [ ] Contact persons of **gemeenten** are NOT visible to unauthenticated users on frontend -- **FAIL**
  - On the public detail page for gemeente "Aa en Hunze" (`/publicatie/f7db0bc8-...`), email `test.vng.swc+Emu@gmail.com` and phone `+31 23 4567890` are displayed without authentication
- [ ] Contact persons of **samenwerkingen** are NOT visible to unauthenticated users -- **LIKELY FAIL** (same publication mechanism used)
- [ ] Public API correctly distinguishes leverancier vs gemeente/samenwerking contacts -- **FAIL**
  - API call `publications?_schema=organisatie&type=Gemeente&_extend[]=contactpersonen` returns full contact details for gemeente contacts without authentication
  - 6 gemeente contacts found in a sample of 5 organisations, including PII
- [ ] No personal contact information of gemeente users on public pages -- **FAIL**
  - Detail page for Aa en Hunze shows Email and Telefoon publicly
- [ ] API endpoint enforces RBAC -- **NOT FULLY TESTED** (requires aanbod-beheerder login)

**Evidence -- Public UI exposure:**
The detail page at `/publicatie/f7db0bc8-ec7a-4aa9-902e-51a23f7bce51` (Aa en Hunze, a Gemeente) shows:
- **Email:** test.vng.swc+Emu@gmail.com (clickable mailto link)
- **Telefoon:** +31 23 4567890 (clickable tel link)
- **Website:** https://www.aaenhunze.nl

**Evidence -- API exposure (unauthenticated):**
```
GET /api/publications?_schema=organisatie&type=Gemeente&_extend[]=contactpersonen&_limit=5

Gemeente: Aa en Hunze
  - Edw met een achternaam, email: test.vng.swc+Emu@gmail.com, roles: [Gebruik-beheerder]
  - Joh met een achternaam, email: test.vng.swc+Jbr@gmail.com, roles: [Gebruik-beheerder]

Gemeente: Aalsmeer
  - Con met een achternaam, email: test.vng.swc+Con@gmail.com, roles: [Gebruik-beheerder, Gebruik-raadpleger]

Gemeente: Aalten
  - E. met een achternaam, email: test.vng.swc+E@gmail.com, roles: [Gebruik-beheerder]
  - M met een achternaam, email: test.vng.swc+M@gmail.com, roles: [Gebruik-beheerder, Gebruik-raadpleger]
  - Ssc met een achternaam, email: test.vng.swc+S@gmail.com, roles: [Gebruik-beheerder]
```

**Security Assessment:** CRITICAL privacy violation. Personal data of municipal employees is publicly accessible without authentication. This violates the RBAC model (contactpersoon is NOT public read in `softwarecatalogus_register.json`), GDPR Article 5 (data minimization), and the documented requirement.

**Screenshots:** `02-gemeente-contact-public.png`

---

### #315: Hoge prioriteit: Zoekpagina toont deel van gemeentelijk applicatielandschap

**Status: PARTIAL**
**Severity: MEDIUM**
**Test Step: 14**

**Acceptance Criteria Results:**
- [ ] "Leverancier" filter on /zoeken contains ONLY actual suppliers, NOT municipalities -- **PARTIAL**
  - The "Geregistreerd door" filter shows: Gemeente (345), Leverancier (1394), Samenwerking (91)
  - Municipalities ARE listed as a filter option, but this is the "Geregistreerd door" facet, not the "Leverancier" facet
  - The "Leverancier" facet (280 items) appears to contain only actual suppliers
  - When filtered by `geregistreerdDoor=Leverancier`, results correctly show only leverancier-registered items
- [x] Search result cards show the actual supplier as "aangeboden door", NOT a municipality
  - Applications correctly show "(Aangeboden door [Leverancier Name])" -- e.g., "Future Insight Group", "Nelen & Schuurmans", "Xxllnc", "Igor Pavlov", "Bentis B.V."
  - No municipalities observed as "Aangeboden door" in this test session
- [ ] Filtering by municipality name is not possible -- **FAIL**
  - `geregistreerdDoor[]=Gemeente` filter returns 345 municipality organisation records
  - However, these are only organisation records, not application landscape data
- [x] Application detail page shows the correct supplier
- [ ] Municipal application landscape data is not publicly visible to unauthenticated users -- **PARTIAL**
  - Municipality organisation records ARE public (expected/acceptable)
  - Private application landscape data (koppelingen, gebruik) does NOT appear in public search results
  - However, gemeente contact persons ARE publicly visible (see #394)
- [x] Supplier on search card matches supplier on detail page

**Notes:** Compared to the previous test session, the search page now correctly attributes applications to leveranciers. The "Aangeboden door" labels show actual supplier names. The filter system correctly separates organisation types. The main remaining concern is the gemeente contact person visibility (covered by #394).

**Screenshots:** `03-search-page-filters.png`

---

### #85: (VNGR) Publieke API toegang tot aanbodinformatie

**Status: PARTIAL**
**Severity: LOW**
**Test Step: 12**

**Acceptance Criteria Results:**
- [x] The public API for the Softwarecatalogus register is accessible and returns data
  - `GET /index.php/apps/opencatalogi/api/publications` returns 1,837 total results
- [x] Auto-generated OAS documentation is accessible per register
  - Register 2 (Publications): HTTP 200, valid OAS specification returned (large document)
  - Registers 3 and 4: Not tested individually (known 500 issue documented)
- [x] The API returns data about aanbiedende organisaties
  - Organisations with type, naam, and details returned correctly
- [x] The API returns data about aangeboden softwarepakketten
  - Application publications returned with supplier info
- [ ] The API returns data about ondersteunde standaarden -- **NOT VERIFIED**
- [x] The API supports standard query parameters for filtering and pagination
  - `_limit`, `_page`, `_schema`, `_schemas`, `_extend[]`, `type` parameters functional
- [ ] The OAS documentation link is accessible from the register action menu in the backend -- **NOT VERIFIED**

---

### #183: Wachtwoord vergeten optie

**Status: PASS**
**Test Step: 4**

**Acceptance Criteria:**
- [x] "Wachtwoord vergeten?" button is visible on the login page
  - Button labeled "Wachtwoord vergeten?" present at the bottom of the login form
- [x] The option is accessible without being logged in

**Notes:** End-to-end email delivery not tested (no mail server in local dev). UI button is present and functional.

**Screenshots:** Previous session screenshots remain valid.

---

### #404: Regelmatig witte schermen

**Status: PASS (appears resolved)**
**Test Step: General**

**Acceptance Criteria Results:**
- [x] Navigate through all major pages -- No white screens
  - Tested: `/`, `/zoeken`, `/beheer`, `/beheer/applicaties`, `/beheer/diensten`, `/beheer/koppelingen`, `/beheer/contactpersonen`, `/publicatie/[id]`
- [x] Refreshing pages (F5) does not produce white screens
  - Tested F5 on `/beheer/applicaties` -- page reloaded correctly
- [x] JavaScript console shows no critical errors causing blank rendering
  - Console errors limited to: manifest syntax errors, 404 for organisation data, 404 for schema related endpoints

**Caveat:** Testing in Chromium (Playwright), not Edge as originally reported.

---

### #395: Menu linkerkant verdwijnt

**Status: PASS**
**Test Step: 4**

**Acceptance Criteria Results:**
- [x] Navigate to "Applicaties" overview while logged in -- left sidebar visible
  - Sidebar contains: Dashboard, Mijn Account, Mijn Organisatie, Diensten, Contactpersonen, Applicaties, Gebruik, Koppelingen, View
- [x] Press F5 or Ctrl+R to refresh -- left navigation menu remains visible after refresh
  - Before F5: sidebar visible (screenshot `05-applicaties-before-f5.png`)
  - After F5: sidebar still visible (screenshot `06-applicaties-after-f5.png`)
- [x] Menu present when directly navigating to URL (not just SPA navigation)
  - Direct navigation to `/beheer/applicaties`, `/beheer/diensten`, `/beheer/koppelingen` all show sidebar
- [x] Menu persists across refreshes on other pages
  - Verified on `/beheer/diensten` and `/beheer/koppelingen`

**Change from previous test:** Previous session reported CANNOT_TEST because no left sidebar was found. This session at 1920x1080 viewport confirmed the sidebar IS present and persists through refresh. The previous test may have used a smaller viewport where the sidebar collapses, or tested the wrong URL.

**Screenshots:** `05-applicaties-before-f5.png`, `06-applicaties-after-f5.png`

---

### #409: Footer anders: inlog of uitgelogd

**Status: PASS**
**Test Step: 21**

**Acceptance Criteria Results:**
- [x] Footer links are identical in logged-in and logged-out states
- [x] "Privacyverklaring" link points to same URL in both states (`/privacyverklaring`)
- [x] "Algemene voorwaarden" link points to same URL in both states (`/algemene-voorwaarden`)
- [x] Footer styling consistent between states

**Footer Link Comparison (Logged Out vs Logged In):**

| Link | Logged Out | Logged In | Match |
|------|-----------|-----------|-------|
| GEMMA Online | https://www.gemmaonline.nl/ | https://www.gemmaonline.nl/ | YES |
| NORA Online | https://www.noraonline.nl/ | https://www.noraonline.nl/ | YES |
| VNG | https://vng.nl/ | https://vng.nl/ | YES |
| Commonground | https://commonground.nl/ | https://commonground.nl/ | YES |
| Privacy | /privacyverklaring | /privacyverklaring | YES |
| Algemene voorwaarden | /algemene-voorwaarden | /algemene-voorwaarden | YES |
| Disclaimer | /disclaimer | /disclaimer | YES |
| FAQ | /faq | /faq | YES |

---

### #406: SiteImprove verwijderen

**Status: PASS**
**Test Step: 21**

**Acceptance Criteria Results:**
- [x] HTML source does NOT contain `siteimproveanalytics.com` script tag
  - Verified: `hasSiteimprove: false`
- [x] No references to "siteimprove" in page source
- [x] Only Piwik analytics script present
  - `hasPiwik: true` (Piwik/Matomo reference detected in page)
  - No external tracking script tags found (`trackingScripts: []`)
- [x] Verify by viewing page source on public pages
- [ ] Only ONE configurable position for tracking scripts -- **NOT VERIFIED** (requires admin config)

---

### #105: Aanbieders zien applicatielandschappen en koppelingen niet

**Status: CANNOT_TEST**
**Reason:** Requires aanbod-beheerder role. Mark Jansen is gebruik-beheerder. Assigned to leverancier test agent.

---

## RBAC Security Verification Summary

| Check | Result | Details |
|-------|--------|---------|
| Unauthenticated: gemeente contacts NOT visible | **FAIL** | PII (name, email, phone) exposed via API and UI |
| Unauthenticated: leverancier contacts ARE visible | PASS | Expected behavior via publications |
| Unauthenticated: admin endpoints inaccessible | PASS | /beheer requires login |
| Gebruik-beheerder: sees own org data | PASS | Beheer pages scoped to "Test Gemeente" |
| Gebruik-beheerder: contactpersonen scoped to own org | PASS | Table shows "Geen data gevonden" (correct for test org) |
| Session management: logout works | PASS | Clicking "Uitloggen" redirects to logged-out home |

---

## Console Errors Summary

| Page | Error Count | Notable Errors |
|------|------------|----------------|
| Home (logged out) | 2 | Manifest syntax error (non-critical) |
| /zoeken | 2-9 | Manifest error + 404s for orphaned UUID name resolution |
| /publicatie/[id] | 2 | Manifest error |
| /login | 2 | Manifest error |
| /beheer | 10 | Manifest + 404 for org `a44a5556-...` (not in voorzieningen register) |
| /beheer/applicaties | 14 | Same org 404 + schema related 404 |
| /beheer/diensten | 14 | Same pattern |
| /beheer/koppelingen | 14 | Same pattern |
| /beheer/contactpersonen | 14 | Same pattern |

**Recurring error:** `404 Not Found` for organisation `a44a5556-2001-4ffc-8a08-fe4705605b47`. This is the Test Gemeente's Nextcloud organisation ID which does not exist in the voorzieningen register. This causes 8+ errors per beheer page load but does not block functionality.

---

## Performance Summary

No API calls exceeded the 500ms SLOW threshold during this test session. All pages loaded within acceptable timeframes. The `_limit=10000` requests for beheer data warmup completed successfully.

---

## Overall Security Assessment

### CRITICAL Issues
1. **#394 - Contact person PII leak**: Municipality employee personal data (names, email addresses, phone numbers, roles) is publicly accessible without authentication via both the publications API (`_extend[]=contactpersonen`) and the frontend detail pages. This violates the application's RBAC model and GDPR requirements.

### MEDIUM Issues
1. **#315 - Search filters expose gemeente records**: While the search page no longer shows municipalities as application suppliers, the "Geregistreerd door" filter still allows filtering to see 345 gemeente organisation records. These are public organisation records (acceptable), but combined with #394 this creates a browseable directory of municipality employees.

### LOW Issues
1. **Manifest syntax error**: `site.webmanifest` returns invalid content on every page load (2 errors per page).
2. **Organisation not found**: Test Gemeente organisation `a44a5556-...` not in voorzieningen register, causing 8+ console errors per beheer page.

### Resolved Issues (PASS)
- **#395**: Left sidebar persists through F5 refresh at 1920x1080 -- FIXED
- **#409**: Footer identical between logged-in and logged-out states -- FIXED/NOT REPRODUCIBLE
- **#406**: SiteImprove removed, only Piwik present -- FIXED
- **#404**: No white screens encountered -- FIXED/NOT REPRODUCIBLE
- **#183**: "Wachtwoord vergeten?" option present on login page -- IMPLEMENTED

---

## Screenshots Index

| File | Description |
|------|-------------|
| 01-home-logged-out.png | Homepage as unauthenticated user (1920x1080) |
| 02-gemeente-contact-public.png | Gemeente Aa en Hunze detail page showing email/phone publicly |
| 03-search-page-filters.png | Search page with filters showing Gemeente/Leverancier/Samenwerking |
| 04-dashboard-logged-in.png | Authenticated beheer dashboard as Mark Jansen |
| 05-applicaties-before-f5.png | Applicaties page with left sidebar visible (before F5) |
| 06-applicaties-after-f5.png | Applicaties page with left sidebar visible (after F5) |

---

## Recommendations

1. **CRITICAL (#394)**: Immediately restrict the `_extend=contactpersonen` mechanism to not expose gemeente/samenwerking contact persons publicly. The RBAC rules in `softwarecatalogus_register.json` already specify contactpersoon is NOT public read -- this needs to be enforced on the publications extension endpoint. Additionally, the organisation detail pages should not display email/phone from contact persons for non-leverancier organisations.

2. **MEDIUM**: Fix the `site.webmanifest` file to eliminate the recurring manifest syntax errors.

3. **LOW**: Investigate why Test Gemeente's Nextcloud organisation ID (`a44a5556-...`) does not map to a record in the voorzieningen register, causing repeated 404 errors.
