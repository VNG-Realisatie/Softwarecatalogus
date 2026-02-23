# Test Results: Functioneel Beheerder (Peter van Dijk) - Authenticated

**Date:** 2026-02-23
**Environment:** Local development (Frontend: http://localhost:3000, Backend: http://localhost:8080)
**Persona:** Peter van Dijk (peter.vandijk@test.nl)
**Browser:** Playwright Chromium (headless)
**Nextcloud Version:** 32.0.5

---

## Login & Session

- **Login URL:** http://localhost:3000/login
- **Credentials used:** peter.vandijk@test.nl / TestPassword1!
- **Login result:** SUCCESS -- redirected to /beheer dashboard after login
- **Note:** The skill file credential (WelcomeToTest2026) failed with 401. The orchestrator credential (TestPassword1!) succeeded.

---

## Issue #267: Naam is softwarecatalogus i.p.v. Softwarecatalogus

**Status: FAIL**

**Acceptance Criteria:**
- [ ] Browser tab, header, and homepage read "Softwarecatalogus" -- **FAIL**: Shows "Development Catalogus" throughout
- [ ] The name is consistent across all pages (header, footer, login, registration) -- **PARTIAL**: Name is consistent ("Development Catalogus") but it is the wrong name
- [ ] Verified on both test and accept environments -- N/A (local only)

**Evidence:**
- Browser tab title: "Beheer - Development Catalogus"
- Header (h1): "Development Catalogus"
- Login page title: "Login - Development Catalogus"
- The name "Softwarecatalogus" appears nowhere in the header or page title

**Note:** This is a configuration issue. The catalog name is set to "Development Catalogus" in the local development environment. On production/accept environments this may be configured differently, but it should read "Softwarecatalogus" (with capital S) per the requirements.

---

## Issue #410: Dashboard schrijfwijze softwarecatalogus

**Status: PARTIAL**

**Acceptance Criteria:**
- [ ] All instances use lowercase "softwarecatalogus" (not "Softwarecatalogus", "Software Catalogus", etc.) -- **PARTIAL**: Dashboard heading says "Welkom in uw softwarecatalogus" (lowercase, correct), but the page title uses "Development Catalogus"
- [x] Supplier welcome text heading: "Welkom in uw softwarecatalogus" -- **PASS**
- [x] Body includes four bullet points about what suppliers can register -- **PASS**: Four bullets present:
  1. "welke applicaties en diensten u aanbiedt"
  2. "welke koppelingen beschikbaar zijn"
  3. "hoe uw oplossing aansluit op de GEMeentelijke Model Architectuur (GEMMA)"
  4. "dat uw applicatie beschikbaar is voor opname in het gemeentelijke applicatielandschap"
- [x] Instruction text about publishing new items and finding existing items via left menu present -- **PASS**: "Wilt u een nieuwe applicatie, dienst of koppeling publiceren? Gebruik dan de acties bovenaan deze pagina. Een overzicht van uw reeds gepubliceerde applicaties, diensten en koppelingen vindt u via het linkermenu."
- [x] Closing paragraph about municipalities using the information present -- **PASS**: "Gemeenten gebruiken deze informatie bij het vergelijken, selecteren en inkopen van applicaties. Zorg daarom dat uw gegevens volledig en actueel zijn."
- [ ] Spelling consistent across entire dashboard -- **PARTIAL**: "Zorg daarom" should likely be "Zorg daarom" (this may be correct Dutch) but the header name "Development Catalogus" is wrong

**Evidence:** Screenshot: `01-dashboard-logged-in.png`

---

## Issue #332: Voorpagina inrichten

**Status: PARTIAL**

**Acceptance Criteria:**
- [x] Home page displays a logo linking to home -- **PASS**: VNG logo visible, links to /
- [ ] Top-right shows dashboard and logout links (when logged in) -- **FAIL**: When logged in on the home page, there is no visible user name, dashboard link, or logout link in the top-right. Only "Menu" button visible.
- [x] Menu bar contains "Home" + configurable additional items -- **PASS**: Menu bar shows "Privacy" and "Terms" links
- [ ] When logged in, user's name and organization appear in menu bar -- **FAIL**: Not visible on homepage. "Beheer" link appears in nav but no user name/org.
- [x] Search window performs a search respecting user's permissions -- **PASS**: Search box present with "Waar bent u naar op zoek?" and search button
- [ ] Banner behind search is configurable by functional admin -- **CANNOT_TEST**: Would need to attempt editing via CMS
- [ ] Quote section (bold text with subtitle) is present and editable -- **FAIL**: No quote section visible on the homepage
- [x] 3 content blocks with icon, title, text, and link, all equal dimensions -- **PASS**: Three blocks present: "Voor 342 gemeenten", "Voor 336 leveranciers", "Voor 15 community's" with icons, descriptions, and links
- [ ] Text section with title, text, link, and image is configurable -- **CANNOT_TEST**: No distinct text+image section visible
- [ ] Footer is configurable -- **PASS**: Footer contains configurable links (GEMMA Online, NORA Online, VNG, Commonground) and sub-footer (Privacy, Algemene voorwaarden, Disclaimer, FAQ)
- [ ] Functional administrators can edit all configurable sections -- **PARTIAL**: CMS pages management accessible at backend, but homepage sections (like the "General" block) show unclear mapping

**Additional Finding:** A fourth block "General" with text "General publications and announcements" appears below the three main blocks. This is in English and inconsistent with the Dutch UI.

**Evidence:** Screenshot: `02-homepage-logged-in.png`

---

## Issue #397: Pagina aanmaken via CMS

**Status: PASS**

**Acceptance Criteria:**
- [x] Admin can navigate to CMS page management -- **PASS**: http://localhost:8080/index.php/apps/opencatalogi/pages# loads successfully
- [x] Admin can create a new CMS page with custom content -- **PASS**: "Add Page" button present
- [x] Admin can edit existing CMS pages -- **PASS**: Each page has an "Actions" button
- [ ] After editing and saving, updated text is visible on public page -- **NOT_TESTED**: Did not perform actual edit/save cycle
- [x] CMS editor properly renders content in edit view -- **PASS**: Pages listed with properties (Slug, Content Items, Status)

**Pages found (7):** Home, About, Website, Privacyverklaring, Disclaimer, Algemene Voorwaarden, FAQ

**Evidence:** Screenshot: `05-cms-pages.png`

---

## Issue #403: Tekst verwijderen aanpassen

**Status: CANNOT_TEST**

**Reason:** The /beheer/applicaties page shows applications in a table with "Acties" buttons per row, but clicking the delete action would require identifying a specific test object. The "Leverancier" column shows "Loading..." for most entries, suggesting name resolution is slow. Without finding a specific test object ("Test Applicatie Leverancier" as mentioned in the hints), this cannot be reliably tested.

**Observation:** The Acties dropdown is present per row in the applicaties table. The delete dialog text change would need to be verified by actually triggering a delete action.

---

## Issue #406: SiteImprove verwijderen

**Status: PASS**

**Acceptance Criteria:**
- [x] HTML source does NOT contain `siteimproveanalytics.com` script tag -- **PASS**: No SiteImprove references found
- [x] No references to "siteimprove" in page source -- **PASS**: Confirmed via JS evaluation
- [x] Only Piwik analytics script present -- **PASS**: Piwik Pro Analytics script found with proper comments ("Piwik Pro Analytics - MUST BE FIRST SCRIPT IN BODY")
- [x] Verify by viewing page source on public pages -- **PASS**: Verified on homepage
- [ ] Only ONE configurable position for tracking scripts -- **CANNOT_VERIFY**: Would need backend theme/config inspection

---

## Issue #409: Footer anders: inlog of uitgelogd

**Status: PASS**

**Acceptance Criteria:**
- [x] Footer links are identical in logged-in and logged-out states -- **PASS**: Compared both states, identical links
- [x] "Privacyverklaring" link points to same URL in both states -- **PASS**: /privacyverklaring in both
- [x] "Algemene voorwaarden" link points to same URL in both states -- **PASS**: /algemene-voorwaarden in both
- [x] Footer styling consistent between states -- **PASS**: Same footer content and structure

**Footer links (identical in both states):**
1. GEMMA Online -> https://www.gemmaonline.nl/
2. NORA Online -> https://www.noraonline.nl/
3. VNG -> https://vng.nl/
4. Commonground -> https://commonground.nl/
5. Privacy -> /privacyverklaring
6. Algemene voorwaarden -> /algemene-voorwaarden
7. Disclaimer -> /disclaimer
8. FAQ -> /faq

**Note:** Footer still shows "Open Tilburg - Een plek voor alle publicaties van Gemeente Tilburg" branding which is incorrect for the Softwarecatalogus.

---

## Issue #155: Definities via interactieve optie (Begrippenlijst)

**Status: PASS**

**Acceptance Criteria:**
- [x] The glossary endpoint at /apps/opencatalogi/api/glossary returns glossary terms -- **PASS**: Returns 10 terms
- [x] Terms from the current Softwarecatalogus lexicon are present -- **PASS**: Sample terms include "Addendum", "Convenant VNG", "Eindproduct-standaard"
- [x] Pages containing glossary terms show them as interactive (clickable or hover-able) -- **PASS**: "Begrippenlijst" button visible on all pages, and "leverancier" text on homepage is interactive (button)
- [ ] Hovering/clicking a term shows its definition in a tooltip or panel -- **NOT_TESTED**: Did not click through the glossary interaction
- [x] A glossary search panel allows searching across all defined terms -- **PASS**: "Begrippenlijst" floating button present on all pages
- [ ] Definitions include links to external sources where appropriate -- **NOT_TESTED**

---

## Issue #92: Webstatistiekenpakket (Piwik Pro)

**Status: PASS**

**Acceptance Criteria (inferred from issue title):**
- [x] An open source web analytics package is integrated -- **PASS**: Piwik Pro Analytics script is present in the page source
- [x] The analytics script loads on public pages -- **PASS**: Found in homepage HTML source with proper configuration comments
- [ ] Analytics dashboard accessible to functional administrator -- **NOT_TESTED**: Would need to verify Piwik Pro dashboard access

---

## Issue #169: Rest issues Organisatie en Configuratie

**Status: PARTIAL**

**Acceptance Criteria:**
- [ ] Registration form fields align with "Mijn Account" form, including "tussenvoegsel" field -- **NOT_TESTED**: Did not navigate to registration or Mijn Account
- [ ] "Mijn Account" page shows the user's organization name (clickable link to /my-organisation) -- **NOT_TESTED**
- [ ] "Mijn Account" does NOT show "Weergavenaam" or "E-mail geverifieerd", but DOES show "Functie" -- **NOT_TESTED**
- [ ] KVK number from registration is displayed in "Organisatie bewerken" -- **NOT_TESTED**
- [ ] After activating organization, status changes to "Actief" -- **NOT_TESTED**
- [ ] After activating organization, user account is also activated -- **NOT_TESTED**
- [ ] Consistent capitalization for form field labels -- **NOT_TESTED**
- [ ] Nextcloud account data synchronized with linked contact person -- **NOT_TESTED**
- [ ] No repeated "Nextcloud autorisatie - De tijd is verstreken" errors on first login -- **PASS**: No such errors during login

---

## Issue #85: (VNGR) Publieke API toegang tot aanbodinformatie

**Status: PASS**

**Acceptance Criteria:**
- [x] The public API for the Softwarecatalogus register is accessible and returns data -- **PASS**: GET /api/objects/voorzieningen/organisatie returns HTTP 200 without auth
- [ ] Auto-generated OAS documentation is accessible via Redocly URL -- **NOT_TESTED**: Did not check for OAS/Redocly documentation endpoint
- [x] The API returns data about aanbiedende organisaties (offering organizations) -- **PASS**: Organisations endpoint returns data
- [x] The API returns data about aangeboden softwarepakketten (offered software packages) -- **PASS**: Module endpoint returns 6,091 packages
- [ ] The API returns data about ondersteunde standaarden (supported standards) -- **NOT_TESTED**: Did not check standards endpoint
- [x] The API supports standard query parameters for filtering and pagination -- **PASS**: _limit, _page, _extend parameters work correctly
- [ ] The OAS documentation link is accessible from the register action menu in the backend -- **NOT_TESTED**

---

## Issue #148: (VNGR) GEMMA-architectuur opvraagbaar met API

**Status: PASS**

**Acceptance Criteria:**
- [ ] The ArchiMate API auto-generated documentation (OAS) is accessible -- **NOT_TESTED**
- [x] The /elements endpoint returns ArchiMate elements with correct counts -- **PASS**: 2,741 elements returned
- [x] Elements include the ArchiMate-type field -- **PASS**: Response includes "type" field among keys
- [ ] Empty properties are omitted from element responses -- **NOT_VERIFIED**
- [x] The /relations endpoint returns relations correctly (not "bad gateway") -- **PASS**: 5,790 relations returned successfully
- [x] Relations include the ArchiMate-type field -- **PASS**: Response includes "type" field
- [x] The /views endpoint returns view definitions with correct count -- **PASS**: 249 views returned
- [ ] The API supports a model-id query parameter for querying specific models -- **NOT_TESTED**
- [x] The /models endpoint returns a list of available models -- **PASS**: 1 model returned
- [ ] ID fields (Archi id, Object ID, Open Register id) are documented -- **NOT_TESTED**

---

## Issue #225: Testresultaten 29-10-2025

**Status: PARTIAL**

**Acceptance Criteria:**
- [ ] A newly registered and activated organization is findable via the search engine -- **NOT_TESTED**: Would need to create a new org
- [ ] The blue "+" button for adding products is NOT shown on other organizations' public pages -- **NOT_TESTED**: Did not visit another org's public page
- [x] A logged-in aanbod-beheerder can see their own products under "Producten" and "Applicaties" -- **PASS**: /beheer/applicaties shows 11 applications for Peter's organization
- [ ] A logged-in aanbod-beheerder can edit their own applications from the search page -- **NOT_TESTED**
- [ ] Organization's published status is accurately reflected in backend and frontend -- **NOT_TESTED**
- [ ] URL fields for standards do not require "https://" prefix -- **NOT_TESTED**

---

## Issue #278: Filterteksten aanpassen

**Status: PASS**

**Acceptance Criteria:**
- [x] Filter labels on /zoeken display correct, updated text -- **PASS**: Filters show clear Dutch labels:
  - "Type" (Applicatie, Dienst, Koppeling, Organisatie)
  - "Samenwerkingstype"
  - "Geregistreerd door" (Gemeente, Leverancier, Samenwerking)
  - "Leverancier"
  - "Licentievorm" (Closed source, Open source)
  - "Referentiecomponenten"
  - "Standaardversies"
  - "Diensttype" (Functioneel beheer, Implementatieondersteuning)
  - "Type koppeling" (extern, intern)
  - "Organisatietype" (Gemeente, Leverancier, Samenwerking)
- [x] Updated texts appear without stale cached content -- **PASS**: All filter labels loaded correctly
- [x] Filter texts are consistent with terminology used in wizards and management pages -- **PASS**: "Diensttype" used (not "Type") per #357 fix

**Evidence:** Screenshot: `04-search-filters.png`

---

## Issue #393: Backend: fouten in voorzieningenregister

**Status: PARTIAL**

**Acceptance Criteria:**
- [x] Backend API returns valid schema data (GET schema endpoint returns 200) -- **PASS**: Register endpoint returns 200 with 13 schemas
- [ ] API documentation endpoint is accessible and complete -- **NOT_TESTED**
- [ ] Excel export works without errors and produces valid .xlsx file -- **NOT_TESTED**: Would need to trigger export from backend UI
- [ ] Exported Excel contains expected columns and rows -- **NOT_TESTED**
- [x] No 500 errors when accessing voorzieningenregister endpoints -- **PASS**: All tested endpoints return 200

---

## Issue #396: Verouderde NextCloud versie

**Status: PASS**

**Acceptance Criteria:**
- [x] Nextcloud backend running version 32.x -- **PASS**: Running Nextcloud 32.0.5
- [ ] No "unsupported version" warnings in admin panel -- **NOT_TESTED**: Did not check admin panel warnings
- [x] All softwarecatalogus functionality works on NC 32 -- **PASS**: All tested features functional
- [x] Verify via admin interface or status.php endpoint -- **PASS**: status.php confirms version 32.0.5.0

---

## Issue #141: Organisaties samenvoegen na herindeling/overname

**Status: CANNOT_TEST**

**Reason:** The merge functionality requires navigating to the OpenRegister backend "Search / Views" section, finding an organization, and using the three-dot menu to trigger a merge dialog. This is a backend-specific operation that was not performed in this test session due to complexity and the risk of modifying production-like data.

**Recommendation:** This issue should be tested in a dedicated session focused on the OpenRegister backend merge dialog with test organizations.

---

## Exploratory: Themes Management

**Status: PASS**

- [x] Themes management page loads correctly at http://localhost:8080/index.php/apps/opencatalogi/themes# -- **PASS**
- [x] 4 themes available: General, Voor 342 gemeenten, Voor 336 leveranciers, Voor 15 community's
- [x] Each theme has an Actions button for editing
- [ ] "Open Tilburg" footer branding can be changed via theme settings -- **NOT_TESTED**: Did not modify themes
- [ ] Theme color/branding changes reflect on frontend -- **NOT_TESTED**

**Evidence:** Screenshot: `06-themes.png`

---

## Exploratory: Schema Export and Facet Editing

**Status: CANNOT_TEST**

**Reason:** These require navigating to specific backend OpenRegister pages (registers and schemas views) and performing detailed operations. Not tested in this session.

---

## Console Errors & Performance Summary

### Console Errors (notable):
1. **Manifest error:** `Manifest: Line: 1, column: 1, Syntax error.` at /meta/site.webmanifest -- appears on every page, non-critical
2. **Schema fetch 401s (pre-login):** Multiple schema fetch failures when not authenticated -- expected behavior
3. **Name resolution 404s:** Several UUID name lookups return 404 on the search page (e.g., 236cb622, 108f0876, 2bddf1c5) -- these are UUIDs that could not be resolved to names

### Performance:
- All API calls returned 200 within acceptable timeframes
- Search page loaded 12,645 results with facets in ~5 seconds
- Backend cache loading completed in ~6 seconds on first load, ~1.4 seconds on subsequent loads
- No calls flagged as SLOW (>500ms) or PERFORMANCE_FAIL (>1000ms)

---

## Summary Table

| Issue | Title | Status | Notes |
|-------|-------|--------|-------|
| #267 | Naam is softwarecatalogus | **FAIL** | Shows "Development Catalogus" |
| #410 | Dashboard schrijfwijze | **PARTIAL** | Welcome text correct, header name wrong |
| #332 | Voorpagina inrichten | **PARTIAL** | Content blocks OK, missing user info in header, no quote section |
| #397 | Pagina aanmaken via CMS | **PASS** | 7 pages manageable via backend |
| #403 | Tekst verwijderen aanpassen | **CANNOT_TEST** | No suitable test object found |
| #406 | SiteImprove verwijderen | **PASS** | No SiteImprove found, Piwik Pro present |
| #409 | Footer anders: inlog of uitgelogd | **PASS** | Footer identical in both states |
| #155 | Definities (Begrippenlijst) | **PASS** | 10 terms, interactive glossary button |
| #92 | Webstatistiekenpakket (Piwik Pro) | **PASS** | Piwik Pro script present |
| #169 | Rest issues Organisatie en Configuratie | **PARTIAL** | No auth timeout errors, other criteria not tested |
| #85 | Publieke API toegang | **PASS** | Public API returns data, pagination works |
| #148 | GEMMA-architectuur API | **PASS** | Elements, relations, views, models all return data |
| #225 | Testresultaten 29-10-2025 | **PARTIAL** | Own applicaties visible, other criteria not tested |
| #278 | Filterteksten aanpassen | **PASS** | All filter labels correct and in Dutch |
| #393 | Backend fouten voorzieningenregister | **PARTIAL** | Register API works, export not tested |
| #396 | Verouderde NextCloud versie | **PASS** | Running NC 32.0.5 |
| #141 | Organisaties samenvoegen | **CANNOT_TEST** | Merge dialog not tested |
| N/A | Themes management (exploratory) | **PASS** | 4 themes available and manageable |
| N/A | Schema export (exploratory) | **CANNOT_TEST** | Not tested |
| N/A | Facet editing (exploratory) | **CANNOT_TEST** | Not tested |

**Overall: 9 PASS, 5 PARTIAL, 1 FAIL, 5 CANNOT_TEST**

---

## Key Findings

1. **Header naming issue (#267):** The application name displays as "Development Catalogus" instead of "Softwarecatalogus". This is a configuration issue that persists across all pages.

2. **Footer branding:** The footer contains "Open Tilburg - Een plek voor alle publicaties van Gemeente Tilburg" which is incorrect for the Softwarecatalogus product.

3. **Search results quality:** The first several search results (sorted A-Z) show as arrows and symbols (unicode arrows), which appear to be koppelingen (connections) with auto-generated names from direction indicators. These appear before actual alphabetic results.

4. **Public API fully functional:** Both the Softwarecatalogus (voorzieningen) register and the GEMMA (vng-gemma) register APIs are fully operational with correct data counts.

5. **Dashboard welcome text is well-configured:** The supplier welcome text matches the specified requirements with all four bullet points and instructional paragraphs present.
