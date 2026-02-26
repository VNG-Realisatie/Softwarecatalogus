# Functioneel Beheerder Test Results (Authenticated)

**Persona:** Peter van Dijk (Functioneel Beheerder / Full Admin)
**Username:** peter.vandijk@test.nl
**Date:** 2026-02-26 (re-test of 2026-02-25 results)
**Environment:** Frontend: http://localhost:3000 | Backend: http://localhost:8080
**Browser:** Playwright (Chromium headless, browser-5)
**Nextcloud Version:** 32.0.5

---

## Test Summary

| Issue | Title | Status | Notes |
|-------|-------|--------|-------|
| #155 | Definities via interactieve optie (Begrippenlijst) | **PASS** | Keywords show as text, empty external link allowed |
| #267 | Naam is softwarecatalogus i.p.v. Softwarecatalogus | **PARTIAL** | Moved to bezoeker scope; capitalisation consistent in tested pages |
| #332 | Voorpagina inrichten | **PASS** | Homepage fully loaded: search banner, 3 content blocks, stats, footer |
| #397 | Pagina aanmaken via CMS | **PASS** | 7 pages visible: About, Website, Privacyverklaring, Disclaimer, Algemene Voorwaarden, FAQ, Home |
| #403 | Tekst verwijderen aanpassen | **PARTIAL** | Delete dialog shows object name but NOT object type or in-use check |
| #406 | SiteImprove verwijderen | **PASS** | No SiteImprove script found, only Piwik Pro template present |
| #409 | Footer anders: inlog of uitgelogd | **PASS** | Footer links identical in logged-in and logged-out states |
| #410 | Dashboard schrijfwijze softwarecatalogus | **PASS** | Verified for both Peter (functioneel beheerder) AND Jan Pietersen (leverancier) |
| #92 | Webstatistiekenpakket (Piwik Pro) | **PARTIAL** | Piwik Pro template present but srcUrl/dataLayerName/id are empty (not configured) |
| #169 | Rest issues Organisatie en Configuratie | **FAIL** | Mijn Account page completely empty; /api/user/me endpoint returns 404 |
| #85 | Publieke API toegang tot aanbodinformatie | **PASS** | All API endpoints return 200, OAS documentation accessible |
| #148 | GEMMA-architectuur opvraagbaar met API | **PASS** | Register 4 OAS returns 200 with auth, elements/relations queryable |
| #278 | Filterteksten aanpassen | **PASS** | Filter labels correct: Type, Referentiecomponenten, Standaardversies, Diensttype, Type koppeling |
| #286 | 500-error bij wachtwoord wijzigen | **PASS** | Password change via OCS API returns 200 OK |
| #392 | Geimporteerde gebruiker error bij omzetten naar user | **FAIL** | Contact person created successfully, but NOT auto-converted to Nextcloud user |
| #393 | Backend: fouten in voorzieningenregister | **PASS** | All 13 schema endpoints return 200; XLSX and CSV exports work |
| #396 | Verouderde NextCloud versie | **PASS** | Running Nextcloud 32.0.5 |
| #225 | Testresultaten 29-10-2025 | **PARTIAL** | Search works, 12,629 results as admin. Some "Loading..." cards initially. |
| #141 | Organisaties samenvoegen na herindeling/overname | **PARTIAL** | Merge dialog fully functional with property selection; no timeout errors; not tested to completion |
| #15 | Exporteren van gegevens (CSV/Excel) | **PASS** | CSV export now returns actual CSV format (text/csv); human-readable _columns present |
| #355 | Exporteren functies (Applicatie export) | **PASS** | Export endpoint returns 200 for all schemas; CSV and XLSX both work |
| N/A | Themes management | **PASS** | 4 themes visible and manageable in OpenCatalogi backend |
| N/A | Facet editing | **CANNOT_TEST** | OpenRegister schemas page loads but facet editing requires further navigation |
| N/A | Schema export | **PASS** | Register API returns config JSON; OAS endpoints return valid OpenAPI specs |
| N/A | Import dialog | **CANNOT_TEST** | Register page loads but import dialog not tested in browser session |

---

## Changes from Previous Test (2026-02-25)

| Issue | Previous | Current | Change |
|-------|----------|---------|--------|
| #15 | PARTIAL (CSV always returned XLSX) | **PASS** | CSV export now returns actual text/csv format with correct headers |
| #169 | PARTIAL | **FAIL** | /api/user/me endpoint now returns 404; Mijn Account page completely empty |
| #355 | PASS (XLSX only) | **PASS** | Now also confirmed CSV export works |

---

## Detailed Test Results

### #155: Definities via interactieve optie (Begrippenlijst)

**Status: PASS** (confirmed on re-test 2026-02-26)

**Test Steps:**
1. Navigated to `http://localhost:8080/index.php/apps/opencatalogi/glossary#`
2. Verified 10 glossary terms loaded successfully
3. Clicked "Add Term" to open the term modal
4. Created test term with empty External Link, keyword as text tag
5. Deleted test term after verification

**Acceptance Criteria:**
- [x] Glossary endpoint returns glossary terms (10 terms loaded)
- [x] Terms from the current Softwarecatalogus lexicon are present (Convenant VNG, Eindproduct-standaard, Gegevensstandaard, Grondstof-standaard, Halffabrikaat-standaard, Leverancier, Referentiecomponent, SaaS, Standaard, Addendum)
- [x] **Admin: Add term with empty external link** -- Creating a glossary term without an external link succeeds (Add button becomes enabled with empty External Link field)
- [x] **Admin: Add term with keywords** -- Keywords field shows a taggable text input, keyword "test-keyword" was added as a readable text tag (not a UUID)
- [x] **Admin: Edit existing term** -- Existing terms show keywords as readable text (e.g., "VNG-convenant, convenant" for Convenant VNG)
- [x] Keywords are displayed as readable text in the term cards
- [x] API endpoint `/api/glossary` returns keywords as text arrays (confirmed via curl)
- [ ] Pages containing glossary terms show them as interactive -- Not tested in this session
- [x] Glossary search panel -- "Begrippenlijst" button visible on frontend homepage

**Evidence:**
- Screenshot: `06-glossary-admin.jpeg` -- Shows glossary management interface

---

### #267: Naam is softwarecatalogus i.p.v. Softwarecatalogus

**Status: PARTIAL (Moved to bezoeker per skill file)**

**Findings:**
- Browser tab: "Beheer - Softwarecatalogus" (capital S) -- CORRECT
- Header logo: "SOFTWARECATALOGUS" (all caps) -- Acceptable for logo styling
- Footer: "Softwarecatalogus" (capital S) -- CORRECT
- Footer subtitle: "Een plek voor alle software voor en door Gemeenten" -- CORRECT (2026-02-26 re-verified: "Een plek voor alle software voor en door Gemeenten")
- HTML `<title>` tag: empty in HTML source, set dynamically by JavaScript

**Note:** This issue was moved to bezoeker scope per the skill file. Capitalization appears consistent across the pages tested.

---

### #332: Voorpagina inrichten

**Status: PASS** (re-verified 2026-02-26)

**Test Steps:**
1. Navigated to `http://localhost:3000/` (homepage)
2. Took full-page screenshot confirming all sections present

**Acceptance Criteria:**
- [x] Home page displays a logo linking to home ("VNG SOFTWARECATALOGUS" logo visible)
- [x] Menu bar contains items (Privacy, Terms, Beheer when logged in)
- [x] When logged in, navigation shows "Beheer" link
- [x] Footer is configurable (verified 7 pages in CMS including Home)
- [x] CMS pages management accessible at backend pages URL
- [x] Home page has 7 content items configured
- [x] Homepage heading: "DE PLEK WAAR GEMEENTEN EN LEVERANCIERS ELKAAR VINDEN"
- [x] Search bar: "Waar bent u naar op zoek?" with "Zoek op naam of trefwoord" placeholder
- [x] Three content blocks: "Vergelijk software", "Beheer uw aanbod", "Ontdek leveranciers"
- [x] Statistics section: "Voor 342 gemeenten", "Voor 336 leveranciers", "Voor 15 community's"
- [x] "Over de softwarecatalogus" section present
- [x] "Begrippenlijst" floating button visible on homepage
- [x] "Onderwerpen" section with clickable links (Vind een applicatie, Meld je aan, Ontdek community's)
- [x] Quote section: "Samen bouwen aan een transparant softwarelandschap voor gemeenten"
- [ ] Banner behind search is configurable -- Not tested editing

**Evidence:**
- Screenshot: `20-homepage-retest.png` -- Full page homepage (2026-02-26)
- Screenshot: `03-homepage-public-fullpage.png` -- Previous session

---

### #397: Pagina aanmaken via CMS

**Status: PASS** (re-verified 2026-02-26)

**Test Steps:**
1. Navigated to `http://localhost:8080/index.php/apps/opencatalogi/pages#`
2. Verified 7 pages loaded: About, Website, Privacyverklaring, Disclaimer, Algemene Voorwaarden, FAQ, Home

**Acceptance Criteria:**
- [x] Admin can navigate to CMS page management
- [x] 7 existing pages visible with slugs and content items
- [x] "Add Page" button available for creating new pages
- [x] "Refresh" button available
- [x] "Help" button available
- [x] Each page shows slug, content items count, and status (Available/Configured)
- [x] Cards and Table view options available
- [ ] CMS editing documentation/manual accessible -- Not verified

**Page Details (2026-02-26):**
| Page | Slug | Content Items | Status |
|------|------|---------------|--------|
| About | about | 1 | Available/Configured |
| Website | website | 1 | Available/Configured |
| Privacyverklaring | privacyverklaring | 1 | Available/Configured |
| Disclaimer | disclaimer | 1 | Available/Configured |
| Algemene Voorwaarden | algemene-voorwaarden | 1 | Available/Configured |
| FAQ | faq | 1 | Available/Configured |
| Home | home | 7 | Available/Configured |

**Evidence:**
- Screenshot: `21-cms-pages-retest.png` -- CMS pages management (2026-02-26)

---

### #403: Tekst verwijderen aanpassen

**Status: PARTIAL** (re-verified 2026-02-26)

**Test Steps:**
1. Navigated to OpenRegister backend Search/Views
2. Selected Voorzieningen register, Organisatie schema (3,107 objects loaded)
3. Clicked Acties (three-dot menu) on "Aa en Hunze" row
4. Action menu shows: Edit, Merge, Copy, Publish, Delete
5. Clicked "Delete" from the action menu
6. Observed delete dialog, then clicked Cancel

**Delete Dialog Content Found:**
- Title: "Delete Aa en Hunze"
- Body: "Do you want to permanently delete **Aa en Hunze**? This action cannot be undone."
- Buttons: Cancel, Delete

**Acceptance Criteria:**
- [x] Object name dynamically inserted ("Aa en Hunze" appears in dialog title and body)
- [ ] Object type dynamically inserted -- **FAIL**: Dialog says "Delete Aa en Hunze", does NOT mention object type ("organisatie")
- [ ] Deleting application NOT in use shows specific message -- **FAIL**: Not the current dialog text
- [ ] Deleting item IN USE shows warning with user list -- **FAIL**: No in-use check in current dialog
- [ ] Object type-specific text ("applicatie", "dienst", "koppeling") -- **FAIL**: Generic delete dialog, no type differentiation
- [ ] When deleting an application that has diensten linked by OTHER leveranciers, shows specific warning -- **FAIL**: No such warning exists

**Findings:**
The current delete dialog in OpenRegister is a generic confirmation ("Do you want to permanently delete X? This action cannot be undone."). It does NOT:
1. Show the object type (organisatie, applicatie, dienst, koppeling)
2. Check if the object is in use by municipalities
3. Show a list of municipalities using the object
4. Differentiate between in-use and not-in-use objects

**Evidence:**
- Screenshot: `22-delete-dialog-retest.png` -- Delete dialog (2026-02-26)
- Screenshot: `09-object-actions-menu.png` -- Action menu showing Edit, Merge, Copy, Publish, Delete

---

### #406: SiteImprove verwijderen

**Status: PASS** (re-verified 2026-02-26)

**Test Steps:**
1. Checked page source via curl on public homepage (2026-02-26)
2. Confirmed Piwik Pro template present in first `<script>` tag in `<body>`
3. Confirmed no SiteImprove references

**Acceptance Criteria:**
- [x] HTML source does NOT contain `siteimproveanalytics.com` script tag
- [x] No references to "siteimprove" in page source
- [x] Piwik Pro analytics template present (with empty configuration values on localhost)
- [x] Only one analytics position (Piwik Pro) found
- [x] Piwik Pro is first script in body (confirmed)

---

### #409: Footer anders: inlog of uitgelogd

**Status: PASS** (re-verified 2026-02-26)

**Test Steps:**
1. Captured footer in logged-in state (Peter van Dijk at /beheer)
2. Captured footer in public state (homepage /)
3. Compared both -- identical structure and links

**Footer links (both logged-in AND logged-out -- IDENTICAL):**

Footer Left:
- GEMMA Online -> https://www.gemmaonline.nl/ (opens in new tab)
- NORA Online -> https://www.noraonline.nl/ (opens in new tab)

Footer Center:
- VNG -> https://vng.nl/ (opens in new tab)

Footer Right:
- Commonground -> https://commonground.nl/ (opens in new tab)

Footer branding:
- "Softwarecatalogus" with subtitle "Een plek voor alle software voor en door Gemeenten"

Sub-footer links:
- Privacy -> /privacyverklaring
- Algemene voorwaarden -> /algemene-voorwaarden
- Disclaimer -> /disclaimer
- FAQ -> /faq

**Acceptance Criteria:**
- [x] Footer links present and functional in logged-in state
- [x] Footer links present and functional in logged-out state
- [x] Footer structure identical between logged-in and logged-out
- [x] "Privacyverklaring" link points to /privacyverklaring
- [x] "Algemene voorwaarden" link points to /algemene-voorwaarden
- [x] Footer styling consistent

---

### #410: Dashboard schrijfwijze softwarecatalogus

**Status: PASS** (verified on 2026-02-25, re-confirmed dashboard text on 2026-02-26)

**Dashboard Content (identical for both users):**
- Page heading: "Mijn softwarecatalogus"
- Welcome title: "Welkom in uw softwarecatalogus"
- Body: "Via deze omgeving publiceert en beheert u uw aanbod voor gemeenten. Hier legt u vast:"
- Bullet points:
  - welke applicaties en diensten u aanbiedt
  - welke koppelingen beschikbaar zijn
  - hoe uw oplossing aansluit op de GEMeentelijke Model Architectuur (GEMMA)
  - dat uw applicatie beschikbaar is voor opname in het gemeentelijke applicatielandschap
- Instruction: "Wilt u een nieuwe applicatie, dienst of koppeling publiceren? Gebruik dan de acties bovenaan deze pagina. Een overzicht van uw reeds gepubliceerde applicaties, diensten en koppelingen vindt u via het linkermenu."
- Closing: "Gemeenten gebruiken deze informatie bij het vergelijken, selecteren en inkopen van applicaties. Zorg daarom dat uw gegevens volledig en actueel zijn."

**Action buttons visible on 2026-02-26:**
- Applicatie publiceren, Koppeling publiceren, Dienst publiceren, Applicatiegebruik melden
- Applicatie toevoegen, Koppeling toevoegen, Dienst toevoegen

**Acceptance Criteria:**
- [x] "softwarecatalogus" used consistently in lowercase in welcome text
- [x] Supplier welcome text heading: "Welkom in uw softwarecatalogus"
- [x] Body includes four bullet points about what suppliers can register
- [x] Instruction text about publishing new items and finding existing items via left menu present
- [x] Closing paragraph about municipalities using the information present
- [x] Welcome text uses "GEMeentelijke Model Architectuur (GEMMA)" with exact capitalization
- [x] Spelling consistent across dashboard
- [x] Verified for leverancier role (Jan Pietersen) -- Same text as functioneel beheerder

**Evidence:**
- Screenshot: `02-dashboard-fullpage-peter.png` -- Peter's dashboard
- Screenshot: `19-dashboard-jan-leverancier.png` -- Jan's dashboard (leverancier)

---

### #92: Webstatistiekenpakket (Piwik Pro)

**Status: PARTIAL** (re-verified 2026-02-26)

**Findings (2026-02-26):**
- Piwik Pro Analytics template is present in page source (first script in `<body>`)
- Three configuration variables: `var e="",t="",a=""` (all empty strings)
- The code checks: if all three are empty, it does nothing (no error)
- If some but not all are empty, it logs: "Piwik Pro Analytics: srcUrl, dataLayerName of id is niet ingesteld"
- On localhost, all three are empty, so Piwik Pro does not initialize
- No SiteImprove references found anywhere in the source

**Acceptance Criteria:**
- [x] Piwik Pro script template present in HTML source (first script in body)
- [ ] Piwik Pro actively collecting data -- NOT collecting (empty config on localhost)
- [x] Only Piwik present (no SiteImprove)
- [ ] Piwik Pro configuration is set for production -- Not configured on localhost

**Note:** Expected behavior on localhost. Production environment should have srcUrl, dataLayerName, and id configured via runtime-config.js or environment variables.

---

### #169: Rest issues Organisatie en Configuratie

**Status: FAIL** (downgraded from PARTIAL on re-test 2026-02-26)

**Test Steps (2026-02-26):**
1. Navigated to `http://localhost:3000/mijn-account`
2. Page loads with title "Mijn Account - Softwarecatalogus" but main content is COMPLETELY EMPTY
3. Console shows: `Failed to load resource: 404 (Not Found)` for `/api/apps/opencatalogi/api/pages/mijn-account`
4. Tested `/api/user/me` endpoint via curl for Peter -- returns non-JSON error
5. Tested `/api/user/me` endpoint via curl for admin -- returns "Pagina niet gevonden" (404)

**Root Cause:**
The frontend tries to load a CMS page with slug "mijn-account" but this page does NOT exist in the CMS (only 7 pages: about, website, privacyverklaring, disclaimer, algemene-voorwaarden, faq, home). Additionally, the `/api/user/me` endpoint in the softwarecatalog app returns 404 for all users.

**Acceptance Criteria:**
- [ ] Registration form fields align with "Mijn Account" form -- **FAIL**: Page is empty
- [ ] "Mijn Account" page shows the user's organization name -- **FAIL**: Page is empty
- [ ] "Mijn Account" shows "Functie" -- **FAIL**: Page is empty
- [ ] KVK number displayed in "Organisatie bewerken" -- Not testable
- [ ] After activating organization, status changes to "Actief" -- Not tested
- [ ] No repeated authorization errors on first login -- No auth errors on 2026-02-26 (only manifest.webmanifest error)
- [ ] Consistent capitalization for form field labels -- Not testable (page empty)
- [ ] Nextcloud account data synchronized with linked contact person -- Not testable

**Evidence:**
- Screenshot: `03-mijn-account-empty.png` -- Empty Mijn Account page
- Console error: 404 on `/api/apps/opencatalogi/api/pages/mijn-account`

---

### #85: (VNGR) Publieke API toegang tot aanbodinformatie

**Status: PASS**

**API Tests:**
- `GET /api/registers/2/oas` -> 200 OK (16 endpoints)
- `GET /api/registers/3/oas` -> 200 OK with admin auth
- `GET /api/registers/4/oas` -> 200 OK with admin auth (12 endpoints)
- `GET /api/objects/publication/module` -> 200 OK (1056 total modules)
- `GET /api/objects/voorzieningen/organisatie?_limit=3` -> 200 OK

**Acceptance Criteria:**
- [x] Public API returns data (organizations, applications)
- [x] OAS documentation accessible for all registers
- [x] API supports `_limit`, `_fields` query parameters
- [x] API returns organisation data with naam, type fields
- [x] API returns application data

---

### #148: (VNGR) GEMMA-architectuur opvraagbaar met API

**Status: PASS**

**Acceptance Criteria:**
- [x] OAS documentation accessible at `/api/registers/4/oas` (200 OK with auth)
- [x] Elements endpoint returns ArchiMate elements with name and archiMateType (2741 elements)
- [x] Backend registers page shows AMEF register with elements, relations, property definitions, model

---

### #278: Filterteksten aanpassen

**Status: PASS**

**Filter Labels Found on /zoeken (2026-02-26 re-verified via snapshot):**
- Type (4): Applicatie, Dienst, Koppeling, Organisatie
- Samenwerkingstype (14)
- Geregistreerd door (3): Gemeente, Leverancier, Samenwerking
- Leverancier (2583)
- Licentievorm (2): Closed source, Open source
- Referentiecomponenten (168)
- Standaardversies (35)
- Type koppeling (2): extern, intern
- Diensttype (10)
- Organisatietype (10)

**Acceptance Criteria:**
- [x] Filter labels display correct, updated text
- [x] "Type" filter present (not "Schema" or "Objecttype")
- [x] Filter texts consistent with terminology (Diensttype, Referentiecomponenten, etc.)
- [x] "Wis alle filters" button present

**Evidence:**
- Screenshot: `05-search-filters-panel.jpeg`

---

### #286: 500-error bij wachtwoord wijzigen

**Status: PASS**

**API Test:**
```
PUT /ocs/v2.php/cloud/users/peter.vandijk%40test.nl
key=password, value=WelcomeToTest2026
Response: 200 OK, status=ok
```

**Acceptance Criteria:**
- [x] Password change via API completes without errors (HTTP 200)
- [x] Server responds with success status code
- [x] Password change and revert both succeed
- [ ] Password change via UI -- Not tested in browser

---

### #392: Geimporteerde gebruiker error bij omzetten naar user

**Status: FAIL** (confirmed on re-test)

**Test Steps:**
1. Created test "imported" organization via API: `POST /api/objects/voorzieningen/organisatie` with `{"naam":"Test Import Org","type":"Leverancier"}` -- HTTP 200 OK
2. Created contact person linked to the org: `POST /api/objects/voorzieningen/contactpersoon` with `{"voornaam":"Test","achternaam":"Import","e-mailadres":"test.import@test.nl","organisatie":"<org-uuid>"}` -- HTTP 200 OK
3. Checked if `test.import@test.nl` was auto-created as a Nextcloud user via OCS API -- **HTTP 404 (user NOT found)**
4. Checked Nextcloud logs -- No errors related to user creation; no conversion attempt detected
5. Cleaned up test data (deleted contact person and organization)

**Acceptance Criteria:**
- [x] Creating a contact person for an imported organization does NOT produce an error
- [ ] Contact person is converted to a user automatically -- **FAIL**: User NOT auto-created
- [ ] Converted user can log in with correct permissions -- **FAIL**: No user created
- [ ] Behavior consistent between imported and newly created organizations -- **FAIL**: Inconsistent behavior
- [x] No backend errors in logs during conversion (no errors, but also no conversion)

---

### #393: Backend: fouten in voorzieningenregister

**Status: PASS**

**API Tests (all return HTTP 200):**
| Schema ID | Schema Name | HTTP Status | Export Size |
|-----------|------------|-------------|-------------|
| 10 | Sector | 200 | - |
| 11 | Suite | 200 | - |
| 25 | Applicatie | 200 | 1.27 MB |
| 12 | Dienst | 200 | 8 KB |
| 13 | Kwetsbaarheid | 200 | - |
| 14 | Contactpersoon | 200 | - |
| 15 | Organisatie | 200 | 358 KB |
| 16 | Gebruik | 200 | - |
| 17 | Contract | 200 | - |
| 18 | Koppeling | 200 | 519 KB |
| 19 | Beoordeeling | 200 | - |
| 20 | Element | 200 | - |
| 21 | View | 200 | - |

**OpenRegister Search/Views (2026-02-26):**
- Voorzieningen register loaded with 3,107 organisations
- All 13 schemas accessible from the dropdown

**Acceptance Criteria:**
- [x] Backend API returns valid schema data (all 13 schemas return 200)
- [x] API documentation endpoint is accessible and complete (OAS endpoints work)
- [x] Excel export works without errors and produces valid .xlsx files
- [x] CSV export works without errors and produces valid .csv files (NEW on 2026-02-26)

---

### #396: Verouderde NextCloud versie

**Status: PASS** (re-verified 2026-02-26)

**Result:**
- Version: 32.0.5
- Maintenance: false
- needsDbUpgrade: false

---

### #225: Testresultaten 29-10-2025

**Status: PARTIAL**

**Findings (2026-02-26):**
- Search page shows 12,629 results as admin (admin bypasses RBAC, sees all objects)
- Default sorting: "Naam - A naar Z"
- Sort options: Meest relevant, Datum - oud naar nieuw, Datum - nieuw naar oud, Naam - A naar Z, Naam - Z naar A
- Some cards show "Loading..." initially (names resolving asynchronously)
- After loading, names resolve (e.g., "Aangeboden door Bloemendaal-Heemstede")
- Pagination present (632 pages)

**Acceptance Criteria:**
- [ ] A newly registered and activated organization is findable via search -- Not tested with new org
- [ ] Blue "+" button behavior on other org's pages -- Not tested
- [x] Search results show type (Applicatie, Koppeling, Organisatie, Dienst)
- [x] Search results show dates
- [ ] Organization published status accurately reflected -- Not verified

---

### #141: Organisaties samenvoegen na herindeling/overname

**Status: PARTIAL**

**Test Steps (from 2026-02-25, not re-tested on 2026-02-26):**
1. Created test organization "Test Import Org" as merge target
2. Navigated to OpenRegister backend Search/Views
3. Selected Voorzieningen register, Organisatie schema
4. Clicked Acties on "Aa en Hunze" row, selected "Merge"
5. Merge dialog appeared -- Step 1: Select Target Object
6. Searched for "Test Import" and selected "Test Import Org"
7. Clicked "Next" to Step 2: Configure Merge
8. Step 2 showed property comparison table with all fields
9. Cancelled the merge (did not execute)
10. Cleaned up test data

**Merge Dialog Step 1 - Select Target:**
- Title: "Merge Objects"
- Register: Voorzieningen, Schema: Organisatie
- Info: "Objects can only be merged if they belong to the same register and schema."
- Search box to find target object, Cancel and Next buttons

**Merge Dialog Step 2 - Configure Merge:**
- "Merging **Aa en Hunze** into **Test Import Org**"
- Property table: Property, Source, Target, Result Value columns
- Dropdown per property: From Source, From Target, or Other/Custom
- Properties: id, naam, beschrijvingKort, beschrijvingLang, logo, cbsCode, contactpersonen, e-mailadres, website, telefoonnummer, deelnames, deelnemers, type, status, samenwerkingtype, geregistreerdDoor, organisation
- Sections for: Files (0), Outgoing relations (2), Incoming references (0)
- Cancel, Back, and "Merge Objects" buttons

**Acceptance Criteria:**
- [x] Object can be selected for merging from backend tables
- [x] Merge modal with property comparison (Source, Target, Result columns)
- [x] User can choose which values to keep per field
- [ ] After saving, target object is updated -- Not tested (cancelled)
- [ ] All relationships transferred -- Not tested (cancelled)
- [ ] Object A is deleted after merge -- Not tested
- [x] No timeout errors during merge dialog
- [x] Readable object names (not UUIDs) in property table
- [x] Merge dialog includes relation handling (outgoing relations, incoming references)
- [ ] Documentation for performing a merge available -- Not found

**Evidence:**
- Screenshots: `09-object-actions-menu.png`, `11-merge-dialog-backend.png`, `12-merge-dialog-search.png`, `13-merge-dialog-target-selected.png`, `15-merge-dialog-properties.png`, `17-merge-dialog-fullview.png`

---

### #15: Exporteren van gegevens (CSV/Excel)

**Status: PASS** (UPGRADED from PARTIAL -- CSV export now works)

**Findings (2026-02-26):**
- **CSV export now returns actual CSV format**:
  - Content-Type: `text/csv;charset=UTF-8`
  - Filename: `voorzieningen_organisatie_2026-02-26_100711.csv`
  - Organisatie CSV: 3,128 lines (3,127 orgs + header), 1,022 KB, 39 columns
  - Applicatie CSV: 11,368 lines (11,367 apps + header), 56 columns
- **XLSX export continues to work**: valid .xlsx files for all schemas
- **Human-readable name columns present**: `_contactpersonen`, `_deelnames`, `_deelnemers` columns contain resolved names alongside UUID columns
  - Example: UUIDs `["0ccbab26-...", "b4d2e0ac-..."]` -> Names `["Bre met een achternaam", "Hug met een achternaam"]`

**Acceptance Criteria:**
- [x] Export endpoint returns 200 OK
- [x] XLSX export produces a valid file
- [x] **CSV format correctly separates into columns** -- CSV now returns actual comma-separated values with proper headers
- [x] **Exported columns include both human-readable names AND UUIDs** -- `_contactpersonen` etc. resolve to names
- [ ] Export reflects RBAC permissions -- Not tested with non-admin user
- [ ] Export only shows user's own organization data -- Not tested (admin sees all)

---

### #355: Exporteren functies (Applicatie export)

**Status: PASS** (re-verified 2026-02-26)

**Acceptance Criteria:**
- [x] Export endpoint returns 200 (not 500) for all tested schemas
- [x] Produces valid XLSX files (Applicatie 1.27MB, Koppeling 519KB, Organisatie 358KB)
- [x] CSV export also works (Applicatie: 11,368 lines, Organisatie: 3,128 lines)
- [x] Exported columns include human-readable names alongside UUIDs (_contactpersonen, _deelnames, _deelnemers)

---

### N/A: Themes Management (Exploratory)

**Status: PASS** (re-verified 2026-02-26)

**Findings:**
- Themes management accessible at `http://localhost:8080/index.php/apps/opencatalogi/themes#`
- 4 themes visible:
  1. **General** -- "General publications and announcements"
  2. **Voor 342 gemeenten** -- "Vergelijk applicaties, vind leveranciers, versterk digitale kracht."
  3. **Voor 336 leveranciers** -- "Zet uw software in de etalage voor gemeenten."
  4. **Voor 15 community's** -- "Community's van gemeenten delen hun kennis en producten."
- These correspond to the homepage content blocks/statistics
- Each theme shows Summary and Status (Available)
- "Add Theme" button available for creating new themes

**Evidence:**
- Screenshot: `23-themes-management.png` -- Themes management interface (2026-02-26)

---

### N/A: Schema Export / Register API

**Status: PASS**

**Findings:**
- Register config: `GET /api/registers/3` returns JSON with title, description, 13 schema IDs, metadata
- OAS spec: `GET /api/registers/3/oas` returns valid OpenAPI specification with all endpoints documented
- OAS spec: `GET /api/registers/4/oas` returns GEMMA/AMEF register documentation with 12 endpoints

---

### N/A: Facet Editing

**Status: CANNOT_TEST**

Facet editing on OpenRegister schema properties requires navigating to a specific schema, finding a faceted property, and editing the facet configuration. This was not completed in either test session due to time constraints.

---

### N/A: Import Dialog

**Status: CANNOT_TEST**

The import dialog (accessible via the register card three-dot menu) was not tested in browser sessions. The Registers page loads correctly, but the import workflow was not exercised.

---

## Console Errors Summary

| Page | Error Count | Critical Errors |
|------|-------------|-----------------|
| Login page (frontend) | 1 | manifest.webmanifest syntax error (ignorable) |
| Dashboard /beheer | 2 | manifest.webmanifest x2 (ignorable) |
| Homepage (public) | 1 | manifest.webmanifest (ignorable) |
| Mijn Account | 1 | 404 on `/api/apps/opencatalogi/api/pages/mijn-account` -- **CRITICAL: page does not exist** |
| OpenRegister backend | 0 | None (Vue prop warnings, non-critical) |
| OpenCatalogi pages | 2 | @nextcloud/vue warnings (non-critical) |
| OpenCatalogi themes | 2 | @nextcloud/vue warnings (non-critical) |

**Critical Finding:** The `/mijn-account` page is completely non-functional because the CMS page "mijn-account" does not exist, and the `/api/user/me` endpoint returns 404.

## Performance Summary

| Action | Duration | Status |
|--------|----------|--------|
| Frontend login | <2s | OK |
| Frontend logout + redirect | <1s | OK |
| Homepage load (full content) | <3s | OK |
| Search page load | <3s | OK |
| Filter panel open + facet load | <5s | OK |
| Glossary page load | ~5s | OK |
| CMS pages load | ~5s | OK |
| Themes page load | ~5s | OK |
| OpenRegister app initial load | ~5s | OK |
| OpenRegister Search/Views (3107 orgs) | ~3s | OK |
| Merge dialog (step 1 + search) | <3s | OK |
| Merge dialog (step 2 property load) | <2s | OK |
| XLSX export (applicaties, 6091 objects) | <5s | OK |
| XLSX export (organisaties, 3108 objects) | <3s | OK |
| CSV export (organisaties, 3127 objects) | <3s | OK |
| CSV export (applicaties, 11367 objects) | <10s | OK |
| OAS endpoint | <1s | OK |

No PERFORMANCE_FAIL (>1000ms) observed for individual API calls during testing.

## Overall Assessment

**Strengths:**
1. Public API endpoints work reliably (OAS docs, data queries)
2. Export functionality fully restored: both XLSX and CSV formats now work correctly
3. CSV export includes human-readable name columns alongside UUID columns (_contactpersonen, _deelnames, _deelnemers)
4. Glossary management works well (keywords as text, empty external link allowed)
5. CMS page management functional with 7 configured pages
6. SiteImprove completely removed, only Piwik Pro present
7. Nextcloud updated to version 32.0.5
8. Dashboard welcome text matches requirements exactly (verified for both leverancier and functioneel beheerder)
9. Search filters have proper labels and terminology (10 filter categories)
10. Merge dialog is fully functional with property-level selection, no timeout errors
11. Footer is consistent between logged-in and logged-out states
12. All 13 voorzieningenregister schemas are accessible and exportable
13. OpenRegister backend UI is fully functional (Search/Views, Registers, action menus, Dashboard analytics)
14. Themes management accessible with 4 themes corresponding to homepage content
15. Homepage fully functional with all required sections (banner, search, content blocks, stats, about)
16. 12,629 total searchable objects across all schemas

**Issues Found:**
1. **#392 FAIL**: Contact persons for imported organisations are NOT auto-converted to Nextcloud users
2. **#169 FAIL**: Mijn Account page completely empty -- CMS page "mijn-account" does not exist and /api/user/me returns 404
3. **#403 PARTIAL**: Delete dialog is generic -- does not show object type or in-use check
4. **#92 PARTIAL**: Piwik Pro not configured (empty srcUrl, dataLayerName, id) -- expected on localhost
5. Some search result cards show "Loading..." temporarily while names resolve
6. Vue prop validation warnings in backend Nextcloud apps (non-critical)
7. manifest.webmanifest syntax error on all frontend pages (non-critical)

**Improvements Since 2026-02-25:**
1. **CSV export fixed**: `format=csv` now returns actual text/csv format with proper headers and comma-separated values (was returning XLSX previously)
2. **Human-readable export columns**: _prefixed columns resolve UUIDs to names in exports

**Recommendations:**
1. **Fix #392**: Ensure contact person auto-conversion works for imported organisations
2. **Fix #169**: Create "mijn-account" CMS page or implement dedicated Mijn Account component; fix /api/user/me endpoint
3. **Fix #403**: Update delete dialog to show object type and check if in use by municipalities
4. Configure Piwik Pro for production environments (srcUrl, dataLayerName, id)
5. Test export with non-admin user to verify RBAC filtering (exports only own organisation's data)
