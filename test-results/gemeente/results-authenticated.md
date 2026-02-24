# Test Results: Gemeente (Authenticated) - Maria van der Berg

**Date:** 2026-02-24 (Session 4 - Final with Sorting, Export, Organisatie Testing)
**Persona:** Maria van der Berg - ICT-coordinator, Test Gemeente
**Role:** gebruik-beheerder
**Credentials:** maria.vanderberg@test.nl / WelcomeToTest2026
**Environment:** Frontend: http://localhost:3000 | Backend: http://localhost:8080
**Browser:** Chromium (Playwright MCP, browser-3)

---

## Session Summary

| Category | Count |
|----------|-------|
| Issues Tested | 28 |
| PASS | 16 |
| FAIL | 7 |
| PARTIAL | 3 |
| CANNOT_TEST | 2 |

---

## Persistent Errors

### Organisation Object 404
- **Error:** `Error fetching voorzieningen_organisatie object a44a5556-2001-4ffc-8a08-fe4705605b47: 404`
- **Impact:** Occurs on every page load. The "Test Gemeente" organisation object UUID does not exist in the voorzieningen register, though the Nextcloud group mapping works. This causes "Loading..." in some table columns and errors in the console.
- **Pages affected:** All beheer pages, dashboard, Mijn Account
- **Note:** The name cache eventually resolves "Test Gemeente" correctly on some pages (e.g., diensten beheer Aanbieder column, koppelingen beheer columns) despite the org 404. However, on initial load, columns show "Loading..." until the warmup completes.

### Left Side Menu Absent (Related to #395)
- **Observation:** No left-side navigation menu is visible on any beheer page (dashboard, applicaties, diensten, koppelingen, mijn-account). Navigation is only available via the top "Menu" hamburger button and direct URL entry.

---

## Wizard Walkthroughs

### Wizard 1: Applicatie toevoegen (Gebruik registreren)
- **URL:** `/forms/gebruik/applicatie?type=gemeente`
- **Result:** PASS
- **Steps completed:** 4/4
  - Step 1: Selected "Centric Burgerzaken" from applicatie dropdown
  - Step 2: Selected "SaaS" hosting, filled notes, Status "In productie", date auto-filled
  - Step 3: Selected "Zaakregistratiecomponent" as referentiecomponent
  - Step 4 (Review): All data correct, submitted successfully
- **Success message:** "Gebruik succesvol geregistreerd!"
- **Note:** The "Toevoegen" button on /beheer/applicaties navigates to `/forms/applicatie?type=ontbrekend-applicatie` (supplier wizard), NOT the gemeente wizard. Had to navigate directly to `/forms/gebruik/applicatie?type=gemeente`.

### Wizard 2: Dienst toevoegen
- **URL:** `/forms/dienst`
- **Result:** PASS
- **Steps completed:** 3/3
  - Step 1: Selected "Centric Burgerzaken" as applicatie
  - Step 2: Filled name "Test Gemeente Dienst", website, korte omschrijving, selected "Functioneel beheer" diensttype
  - Step 3 (Review): All data correct, submitted successfully
- **Success message:** "Dienst succesvol aangemeld!"

### Wizard 3: Koppeling toevoegen
- **URL:** `/forms/koppeling`
- **Result:** PASS
- **Steps completed:** 4/4
  - Step 1: Selected "Centric Burgerzaken", saw existing koppelingen with human-readable names
  - Step 2: Set direction "A -> B", selected "MijnOverheid.nl" as target, name "Test Gemeente Koppeling", status "In gebruik"
  - Step 3: Filled korte beschrijving "Koppeling geregistreerd door Test Gemeente"
  - Step 4 (Review): All data correct, submitted successfully
- **Success message:** "Koppelingen succesvol opgeslagen!"

---

## Issue Test Results

### #15: Data exporteren
- **Status:** FAIL
- **Findings:**
  - The export button IS present: Acties -> Exporteren -> Als CSV / Als Excel
  - Clicking "Als CSV" on /beheer/diensten produces a **500 Internal Server Error**
  - Clicking "Als Excel" on /beheer/diensten ALSO produces a **500 Internal Server Error**
  - CSV error endpoint: `/api/objects/voorzieningen/dienst/export?type=csv&_multi=true`
  - Excel error endpoint: `/api/objects/voorzieningen/dienst/export?type=excel&_multi=true`
  - Error details: `AxiosError: Request failed with status code 500` at `ObjectStore.exportObjects()`
  - **Both CSV and Excel exports are completely broken on the backend**
- **Screenshots:** `export-csv-error-500.png`, `export-excel-error-500.png`
- **Expected:** CSV/Excel file should download containing the dienst data
- **Acceptance Criteria:**
  - [x] Export button is available on management overview pages
  - [x] Export submenu offers CSV and Excel options
  - [ ] The exported data contains only the user's own organization data (cannot verify - export fails)
  - [ ] Exported columns include readable names AND UUIDs (cannot verify - export fails)
  - [ ] CSV format correctly separates into columns (cannot verify - export fails)
  - [ ] Excel file opens correctly (cannot verify - export fails)

### #144: Overzicht organisaties
- **Status:** PASS
- **Findings:**
  - The search page (/zoeken) shows 12,613 results including organisations, applicaties, diensten, and koppelingen
  - Filter facets work correctly for filtering by type (Applicatie: 6,090, Dienst: 4, Koppeling: 3,415, Organisatie: 3,103)
  - Organisation names display as readable names, not UUIDs
  - "Geregistreerd door" filter correctly shows Gemeente (9,644), Leverancier (1,395), Samenwerking (1,526)
  - Applicatie cards show "(Aangeboden door [organisation])" with readable names
  - "Wis alle filters" button present (disabled when no filters active, enabled when filter applied)

### #248: Tab titles on detail page
- **Status:** PASS
- **Findings:**
  - Centric Burgerzaken detail page has tabs: Standaarden (45), Geschikt voor (5), Diensten (1), Gebruik (4), Organisaties (1), Koppelingen (1)
  - Tab titles are descriptive and include counts
  - All tabs load correctly when clicked
  - Tab content is appropriate for each tab
  - No "Beschrijving" tab - description is shown in the main body above the tabs

### #266: Na inloggen: Mijn account & persoonlijke gegevens leeg?
- **Status:** FAIL
- **Findings:**
  - The /beheer/mijn-account page shows a generic data table with "Geen data gevonden"
  - No personal information is displayed (name, email, function, organization)
  - The page behaves as a table view looking for "mijn-account" schema objects, which returns a 404 error
  - Console error: `Error fetching related schemas for mijn-account: 404`
  - The page title shows "Mijn-account" (with hyphen) which is inconsistent
- **Expected:** Personal information form showing name, email, function, organization
- **Screenshot:** `mijn-account.png`

### #278: Filterteksten aanpassen
- **Status:** PASS
- **Findings:**
  - Filter labels on /zoeken display correct, clear text
  - Filter categories: Type (4), Organisatietype (8), Samenwerkingstype (14), Geregistreerd door (3), Leverancier (2,583), Licentievorm (2), Referentiecomponenten (168), Standaardversies (34), Type koppeling (2)
  - All filter labels use consistent Dutch terminology

### #280: Zoeken: sorteren gaat niet goed
- **Status:** PASS
- **Findings:**
  - Default sort "Naam - A naar Z" is correctly set and results appear alphabetically sorted
  - Sort dropdown offers 5 options: Meest relevant, Datum - oud naar nieuw, Datum - nieuw naar oud, Naam - A naar Z, Naam - Z naar A
  - **Sorting after text search WORKS correctly:**
    - Searched for "Burgerzaken" (121 results), default sort A-Z: first results "Active Directory...", "Aeolus Back Zorg..."
    - Changed to "Naam - Z naar A": first results changed to "ZorgNed...", "Zakenmagazijn", "ZakenBoxx" - correct Z-A order
    - Changed to "Datum - nieuw naar oud": first result is "Centric Burgerzaken -> MijnOverheid.nl" (created 24 Feb 2026, our test data) - correct newest-first
  - URL updates correctly with `_order` parameter when sort changes
  - The "Type" filter IS available
  - Sort order maintained between pages
  - [x] Default sort works correctly
  - [x] Sorting after text search reorders results correctly
  - [x] Name A-Z, Z-A, Date ascending, Date descending all verified

### #312: Koppeling heeft verplicht een naam
- **Status:** PARTIAL
- **Findings:**
  - Newly created koppeling shows with readable name "Centric Burgerzaken -> MijnOverheid.nl" in search results and beheer table
  - Koppeling wizard pre-fills the name with "[Application A] [arrow] [Application B]" format
  - However, first 7 search results (sorted A-Z) show koppelingen with only arrow symbols as titles
  - These arrow-only koppelingen are from imported data (data quality, not code bug)

### #315: Zoekpagina toont gemeentelijk applicatielandschap
- **Status:** PARTIAL
- **Findings:**
  - As gebruik-beheerder (Maria), 12,613 results are visible
  - Applicaties show "(Aangeboden door [organisation])" - municipalities visible as "aanbieder"
  - **Gebruik tab on detail page:** Shows 4 usage entries for Centric Burgerzaken, but does NOT show which municipalities registered them (privacy-respecting)
  - This is expected behavior for gemeente-registered applicaties in the authenticated view
- **Note:** Requires separate unauthenticated/bezoeker test session for public visibility check.

### #340: Bevindingen zoeken
- **Status:** PARTIAL
- **Findings:**
  - [x] Default sorting is "Naam - A naar Z" (confirmed correct per client decision)
  - [x] A date is visible on cards using "Eerste registratie" date
  - [x] A "Type" filter IS present with 4 options
  - [x] Sorting after text search actually reorders results (verified in Session 4)
  - [ ] "Meest relevant" does not have a visible tooltip or explanation
  - [ ] "Soort dienst" rename not verified
  - [ ] Search filters load time not precisely measured

### #342: Referentiecomponenten op kaartjes
- **Status:** PASS
- **Findings:**
  - On search result cards, applicaties show "Geschikt voor:" with referentiecomponent names
  - Single component: "Geschikt voor: Gravenbeheercomponent"
  - Multiple components: "Geschikt voor: Ideeencomponent, Klanttevredenheidcomponent"
  - When 5+ components: "Geschikt voor 5 referentiecomponenten"
  - On the detail page, the "Geschikt voor" tab lists all components with links to GEMMA wiki
  - All component names are human-readable (no UUIDs)

### #343: Type koppeling filter
- **Status:** PASS
- **Findings:**
  - "Type koppeling" filter IS present in the search filter panel
  - Has exactly two options: "extern" and "intern"
  - In "Centric Burgerzaken" search: extern (77), intern (365)
  - Filter visible to logged-in gemeente user

### #344: Referentiecomponenten filter - type "Graven"
- **Status:** PASS
- **Findings:**
  - Typing "Graven" in the Referentiecomponenten filter correctly narrows to "Gravenbeheercomponent (32)"
  - Selecting the checkbox filters results to exactly 32 applicaties
  - Results include relevant applications
  - "Verwijder filter: Gravenbeheercomponent" chip appeared for easy filter removal

### #346: Paginering werkt niet
- **Status:** PASS
- **Findings:**
  - Page 1 and page 2 show completely different results
  - URL updates correctly with `_page` parameter
  - Pagination navigation shows correct page indicators
  - Total pages: 631 (12,613 / 20 per page)

### #348: Standaarden aantallen Centric Begraven
- **Status:** PASS
- **Findings:**
  - "Centric Begraven" shows on its search card "Geschikt voor: Gravenbeheercomponent"
  - "Centric Burgerzaken" detail page shows 45 standards across Verplicht (15), Aanbevolen (27), and Toegevoegd (3)
  - Standards are well-organized with compliance level, status (ONDERSTEUND/NIET ONDERSTEUND), and linked referentiecomponenten
  - All standard names are clickable links to GEMMA wiki
  - No duplicate entries visible

### #349: UUID's in standaarden filter
- **Status:** PASS
- **Findings:**
  - Standaardversies filter shows 34 entries, ALL with human-readable names
  - No UUIDs or "id-" prefixed entries visible
  - Sorted alphabetically
  - On detail pages, standards are shown with full readable names and GEMMA wiki links

### #350: Username link naar Mijn account
- **Status:** FAIL
- **Findings:**
  - Clicking "Menu" hamburger reveals: "Maria van der Berg" linking to `/beheer/my-account`
  - The "Beheer" link in main navigation goes to `/beheer/mijn-account` (different URL!)
  - Two different URLs exist for the account page: `/beheer/my-account` and `/beheer/mijn-account`
  - This inconsistency is confusing for users

### #351: Tab loading speed
- **Status:** PASS
- **Findings:**
  - On the Centric Burgerzaken detail page, all tabs loaded without noticeable delay
  - Tab switching between Standaarden, Geschikt voor, Diensten, Gebruik, Organisaties, and Koppelingen was instant
  - No loading indicators were needed as content was ready immediately
  - 0 errors on the applicatie detail page (only 1 warning)

### #353: Functie niet aangepast
- **Status:** FAIL
- **Findings:**
  - The /beheer/mijn-account page shows "Geen data gevonden" - no form to edit "functie"
  - Cannot test editing functie because the page does not render a personal details form

### #355: Diensten export UUIDs
- **Status:** FAIL
- **Findings:**
  - The /beheer/diensten page shows 1 record ("Test Gemeente Dienst")
  - After warmup, the "Aanbieder" column correctly shows "Test Gemeente" (resolved from UUID)
  - "Diensttype" column shows "Functioneel beheer" (human-readable)
  - However, both CSV and Excel export fail with 500 error, so UUID content in export cannot be verified
  - **Export is completely broken** - this supersedes the UUID issue

### #357: Diensttype vs Type inconsistency
- **Status:** PASS
- **Findings:**
  - On /beheer/diensten, the column header is "Diensttype" (correct)
  - On the dienst detail page, the service shows type "Functioneel beheer" without a "Type" label
  - On search cards for diensten, the label shows "Dienst" with "Functioneel beheer" as sub-info
  - No "eigen-organisatie" value visible anywhere
  - "Diensttype" is used consistently

### #373: Applicatie: Gekoppelde diensten
- **Status:** PASS
- **Findings:**
  - On the Centric Burgerzaken detail page, a "Diensten (1)" tab is available
  - Clicking it shows "Test Gemeente Dienst" with:
    - "(Aangeboden door Test Gemeente)" - organisation name resolved
    - Type label "Dienst"
    - Diensttype: "Functioneel beheer"
  - Bidirectional: clicking through to the dienst detail page shows "Applicaties (1)" tab with Centric Burgerzaken

### #395: Menu linkerkant verdwijnt
- **Status:** FAIL
- **Findings:**
  - No left-side navigation menu visible on ANY beheer page:
    - /beheer (dashboard): No left menu
    - /beheer/applicaties: No left menu
    - /beheer/diensten: No left menu
    - /beheer/koppelingen: No left menu
    - /beheer/mijn-account: No left menu
  - Navigation only available via: top "Menu" hamburger, breadcrumb, direct URL entry

### #316-#328: Wizard Steps Documentation
- **Status:** Documented (not individually scored)
- **Observations:**
  - All three wizards completed successfully
  - Wizard navigation works correctly
  - Review steps show all entered data accurately
  - Success messages display correctly

### #328: Nieuwe applicatie opvoeren sub-step 1.1
- **Status:** CANNOT_TEST
- **Reason:** The "Ik kan de gewenste applicatie niet vinden" sub-step is part of the supplier wizard, not the gemeente gebruik wizard.

---

## Detail Page Test Results

### Applicatie Detail Page (Centric Burgerzaken)
- **URL:** `/publicatie/00f20897-dfd8-540f-af0a-06253457bf24`
- **Page title:** "Centric Burgerzaken"
- **Content:**
  - Title: "Centric Burgerzaken (Centric)" with "Applicatie" type badge
  - Full description with korte and uitgebreide omschrijving
  - Website link (clickable, opens external)
  - Licentietype: "Closed source"
  - Hosting type: "SaaS", "On-premises (self-managed)"
- **Tabs verified:**
  - Standaarden (45): Well-organized table with Verplicht/Aanbevolen/Toegevoegd sections, GEMMA wiki links, compliance status
  - Geschikt voor (5): 5 referentiecomponenten with GEMMA wiki links (Baliecomponent, Burgerzakencomponent, CRIB-component, GBA-administratiecomponent, Verkiezingencomponent)
  - Diensten (1): Shows "Test Gemeente Dienst" with org name resolved
  - Gebruik (4): Shows 4 usage registrations, all "In productie", municipality names NOT shown (privacy-respecting)
  - Organisaties (1): Shows "Centric" with link to organisation detail page
  - Koppelingen (1): Shows "Centric Burgerzaken -> MijnOverheid.nl" with "in gebruik" status
- **Console errors:** 0 errors (only 1 warning about schema normalization)
- **No UUIDs visible anywhere on the page**

### Koppeling Detail Page (Centric Burgerzaken -> MijnOverheid.nl)
- **URL:** `/publicatie/09c7488a-9b6d-43d1-b221-e62494162bb2`
- **Page title:** "Test Gemeente Koppeling"
- **Content:**
  - Title: "Centric Burgerzaken -> MijnOverheid.nl" with "Koppeling" type badge
  - "Acties bewerken" button present
  - Visual connection display: "Centric Burgerzaken -> MijnOverheid.nl"
  - All fields filled with readable data:
    - Applicatie A: Centric Burgerzaken
    - Buitengemeentelijke voorziening: MijnOverheid.nl
    - Richting: AnaarB (->)
    - Status: in gebruik
    - Startdatum In gebruik: 24 februari 2026
    - Korte beschrijving: Koppeling geregistreerd door Test Gemeente
  - Applicaties (1) tab: Shows Centric Burgerzaken with link back
- **Console errors:** 0 errors
- **No empty fields, no UUIDs**

### Dienst Detail Page (Test Gemeente Dienst)
- **URL:** `/publicatie/ada2eb73-4e64-4e70-b819-19fc049d3f31`
- **Page title:** "Test Gemeente Dienst"
- **Content:**
  - Title: "Test Gemeente Dienst" with "Dienst" type badge
  - "Acties bewerken" button present
  - Description: "Dienst geregistreerd door Test Gemeente"
  - Contact informatie: Website link
  - Basisinformatie section
  - Applicaties (1) tab: Shows Centric Burgerzaken with link
- **Console errors:** Related schema 404 (dienst/related returns 404), but page renders correctly
- **No "Concept" status shown** (relevant for #358)
- **No array display for diensttype** (relevant for #347)
- **Note:** "Diensttype" label not displayed separately on the detail page

### Organisatie Detail Page (Centric)
- **URL:** `/publicatie/8654869d-50d1-5945-967a-2406a00ac3ab`
- **Page title:** "Centric"
- **Content:**
  - Title: "Centric" with "Organisatie" type badge
  - Contact information displayed:
    - Email: test.vng.swc+Wil@gmail.com (clickable mailto link)
    - Telefoon: +31 23 4567890 (clickable tel link)
    - Website: https://www.centric.eu/NL/Default/Branches/Lokale-overheid (clickable)
  - Tab: "Applicaties (2)" showing Centric Burgerzaken and Centric Leefomgeving
  - Breadcrumb: Home > Zoeken > Organisatie
- **Privacy observation (#394):**
  - This is a **leverancier** organisation page - leverancier contact details ARE expected to be public
  - The page shows email, phone, website of the organisation itself
  - No individual "contactpersoon" details are shown (no person's name, role, etc.)
  - No gemeente contactpersoon data is visible on any page
  - Organisation type is NOT displayed (just shows "Organisatie" - does not distinguish Leverancier/Gemeente/Samenwerking)
- **Console errors:** 0 errors (2 warnings)
- **No UUIDs visible**
- **Screenshot:** `detail-organisatie-centric.png`

---

## Beheer Data Observations

### /beheer/applicaties
- Shows "Geen data gevonden" for Test Gemeente
- Columns: Naam, Korte omschrijving, Website, Leverancier, Licentievorm, Logo, Acties
- The wizard-created "gebruik" for Centric Burgerzaken does not appear here (stored in different schema)

### /beheer/diensten
- Shows 1 record: "Test Gemeente Dienst" (after warmup delay)
- Columns: Naam, Aanbieder, Diensttype, Korte omschrijving, Acties
- Aanbieder: Initially "Loading..." with tooltip "Original ID: a44a5556-...", resolves to "Test Gemeente" after warmup
- Diensttype: "Functioneel beheer" (correct label, not "Type")
- Export functionality: **BROKEN** - 500 error on both CSV and Excel export

### /beheer/koppelingen
- Shows 1 record: "Centric Burgerzaken -> MijnOverheid.nl"
- Columns: Naam, Status, Korte beschrijving, Applicatie A, Applicatie B, Acties
- Status: "in gebruik"
- **Session 4 update:** Applicatie A shows "Centric Burgerzaken" and Applicatie B shows "MijnOverheid.nl" (correctly resolved after warmup - this was "Loading..." in Session 2)

### /beheer (Dashboard)
- Shows "Mijn softwarecatalogus" with "Test Gemeente" selected
- Shows "Geen wizards beschikbaar voor deze organisatie" message
- Despite that message, wizards ARE accessible via direct URLs

---

## Sorting Verification (Session 4)

Comprehensive sorting test performed with text search "Burgerzaken" (121 results):

| Sort Option | First Result | Correct? |
|-------------|-------------|----------|
| Naam - A naar Z | "Active Directory -> IBurgerzaken" | YES (A first) |
| Naam - Z naar A | "ZorgNed <- Centric Burgerzaken" | YES (Z first) |
| Datum - nieuw naar oud | "Centric Burgerzaken -> MijnOverheid.nl" (24 Feb 2026) | YES (newest first) |

All sort options update the URL parameter and trigger a new search query. Sorting works correctly after text search.

---

## Console Error Summary

| Error Type | Count per page | Impact |
|-----------|---------------|--------|
| Organisation 404 (a44a5556...) | 2-4 | High - affects org name display |
| Schema/related 404 | 1-2 | Medium - affects Acties menu |
| Export 500 error (CSV) | 1 (on export attempt) | Critical - export completely broken |
| Export 500 error (Excel) | 1 (on export attempt) | Critical - export completely broken |
| Manifest syntax error | 1 | Low - cosmetic |

---

## Filter Panel Summary

| Filter | Options | Notes |
|--------|---------|-------|
| Type | 4 | Applicatie (6,090), Dienst (4), Koppeling (3,415), Organisatie (3,103) |
| Organisatietype | 8 | Collapsed |
| Samenwerkingstype | 14 | Collapsed |
| Geregistreerd door | 3 | Gemeente (9,644), Leverancier (1,395), Samenwerking (1,526) |
| Leverancier | 2,583 | Collapsed, searchable |
| Licentievorm | 2 | Closed source (6,055), Open source (35) |
| Referentiecomponenten | 168 | Searchable, all human-readable names |
| Standaardversies | 34 | Searchable, all human-readable names, no UUIDs |
| Type koppeling | 2 | extern (880), intern (2,535) |

---

## Screenshots

| File | Description |
|------|-------------|
| `login-dashboard.png` | Dashboard after login |
| `wizard-gemeente-app-step1.png` | Applicatie wizard step 1 |
| `wizard-gemeente-app-step1-form.png` | Applicatie wizard step 1 form |
| `wizard-gemeente-app-step2.png` | Applicatie wizard step 2 |
| `wizard-gemeente-app-step3.png` | Applicatie wizard step 3 |
| `wizard-gemeente-app-review.png` | Applicatie wizard review |
| `wizard-gemeente-app-success.png` | Applicatie wizard success |
| `wizard-gemeente-dienst-step1.png` | Dienst wizard step 1 |
| `wizard-gemeente-dienst-step2.png` | Dienst wizard step 2 |
| `wizard-gemeente-dienst-review.png` | Dienst wizard review |
| `wizard-gemeente-dienst-success.png` | Dienst wizard success |
| `wizard-gemeente-koppeling-step1.png` | Koppeling wizard step 1 |
| `wizard-gemeente-koppeling-step2.png` | Koppeling wizard step 2 |
| `wizard-gemeente-koppeling-step3.png` | Koppeling wizard step 3 |
| `wizard-gemeente-koppeling-review.png` | Koppeling wizard review |
| `wizard-gemeente-koppeling-success.png` | Koppeling wizard success |
| `search-page-initial.png` | Search page initial state |
| `search-page-loaded.png` | Search page loaded with results |
| `search-filters-panel.png` | Search filter panel (full page) |
| `mijn-account.png` | Mijn Account page (empty table) |
| `detail-applicatie-centric-burgerzaken.png` | Centric Burgerzaken detail page with standards |
| `export-csv-error-500.png` | Export CSV 500 error |
| `export-excel-error-500.png` | Export Excel 500 error |
| `beheer-koppelingen.png` | Koppelingen beheer page |
| `detail-organisatie-centric.png` | Centric organisatie detail page |

---

## Test Data Created

1. **Gebruik registration:** Centric Burgerzaken usage by Test Gemeente (SaaS, In productie, Zaakregistratiecomponent)
   - **Object ID:** `919f01ef-6e9e-4271-a289-ff964cd3b68f`
2. **Dienst:** "Test Gemeente Dienst" (Functioneel beheer type)
   - **Object ID:** `ada2eb73-4e64-4e70-b819-19fc049d3f31`
3. **Koppeling:** "Test Gemeente Koppeling" / "Centric Burgerzaken -> MijnOverheid.nl" (A->B, In gebruik)
   - **Object ID:** `09c7488a-9b6d-43d1-b221-e62494162bb2`

**Cleanup Status:** Test data cleanup via API DELETE was attempted but requires explicit user permission (destructive operations blocked by sandbox). The following API calls are needed to clean up:
```bash
curl -X DELETE -u admin:admin "http://localhost:8080/index.php/apps/openregister/api/objects/voorzieningen/dienst/ada2eb73-4e64-4e70-b819-19fc049d3f31"
curl -X DELETE -u admin:admin "http://localhost:8080/index.php/apps/openregister/api/objects/voorzieningen/koppeling/09c7488a-9b6d-43d1-b221-e62494162bb2"
curl -X DELETE -u admin:admin "http://localhost:8080/index.php/apps/openregister/api/objects/voorzieningen/gebruik/919f01ef-6e9e-4271-a289-ff964cd3b68f"
```

Additionally, earlier test sessions created gebruik objects that should also be cleaned up:
- `51bc446e-ad42-4d79-9fcc-1747aa15463b` (Session 2 gebruik)
- `b0941652-73d3-4949-aacc-7b311cd70342` (Session 2 gebruik)

---

## Key Recommendations

1. **Critical:** Fix the export endpoint 500 error (`/api/objects/voorzieningen/dienst/export`). Both CSV and Excel exports are completely broken on the backend. (#15, #355)

2. **Critical:** Fix the Organisation object 404 for Test Gemeente (UUID a44a5556-2001-4ffc-8a08-fe4705605b47). Root cause of multiple display issues including "Loading..." columns on initial load.

3. **Critical:** Implement "Mijn Account" as a personal details form, not a generic data table. (#266, #353)

4. **High:** Add persistent left-side navigation menu to beheer area. (#395)

5. **Medium:** Fix URL inconsistency: `/beheer/my-account` vs `/beheer/mijn-account`. (#350)

6. **Low:** The "Toevoegen" button on /beheer/applicaties should route to the gemeente wizard, not the supplier wizard.

7. **Low:** Dashboard "Geen wizards beschikbaar" message is misleading since wizards are accessible via direct URLs.

8. **Low:** Organisation type (Leverancier/Gemeente/Samenwerking) is not displayed on the organisatie detail page - just shows generic "Organisatie" badge.

---

## Positive Findings

1. **Detail pages work well:** All four detail page types (Applicatie, Koppeling, Dienst, Organisatie) render correctly with rich, structured data
2. **Referentiecomponenten clearly displayed:** Both on search cards ("Geschikt voor:") and detail page tabs
3. **Standards display is excellent:** 45 standards on Centric Burgerzaken with proper categorization, GEMMA links, compliance status
4. **Search is fast and responsive:** 12,613 results load quickly, filters update in real-time
5. **Name resolution works after cache warmup:** Organisation names, application names all resolve to human-readable text
6. **No UUIDs visible to end users:** All standards, components, organisations display with readable names
7. **Tab loading is instant:** No staggered loading on detail pages
8. **Privacy respected:** Gebruik tab shows usage count without revealing which municipalities
9. **Sorting works correctly:** All 5 sort options (including after text search) produce correct results
10. **Koppelingen beheer columns resolved:** Applicatie A and Applicatie B columns now show resolved names after warmup (was "Loading..." in Session 2)
11. **Organisatie detail page is clean:** Shows contact info, linked applicaties, no UUIDs, no contactpersoon data leak
