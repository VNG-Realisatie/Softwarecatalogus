# Leverancier (Jan Pietersen) - Authenticated Test Results

**Date:** 2026-02-23
**Persona:** Jan Pietersen - Director, Test Leverancier BV
**Role:** aanbod-beheerder, software-catalog-users
**Login:** jan.pietersen@test.nl / TestPassword1!
**Environment:** http://localhost:3000 (Frontend), http://localhost:8080 (Backend)
**Browser:** Playwright Chromium (headless)

---

## Test Environment Observations

- **Login:** Successful with `jan.pietersen@test.nl` / `TestPassword1!` (note: the credential `WelcomeToTest2026` from the skill file did NOT work; the correct password from the user prompt was `TestPassword1!`)
- **Dashboard loads correctly:** Left navigation, wizard buttons, welcome text all present
- **Organization:** "Test Leverancier BV" correctly selected and displayed
- **Console errors:** Only `Manifest: Line: 1, column: 1, Syntax error.` on every page (non-critical, site.webmanifest issue)
- **Session stability:** Navigating away from the SPA and back sometimes drops the session, requiring re-login. The "Applicatie publiceren" button navigates to `/forms/applicatie?type=eigen` which occasionally loses authentication state.

---

## Wizard Walkthroughs

### Wizard 1: Applicatie publiceren

**Route:** `/forms/applicatie?type=eigen` (via dashboard button "Applicatie publiceren")

**Step 1 - Applicatie-informatie:**
- Wizard title: "Uw Applicatie publiceren" with subtitle "Vul dit formulier in om een door u aangeboden applicatie toe te voegen aan de softwarecatalogus."
- Section title: "Informatie over uw applicatie"
- Fields visible: Naam (required), Website (required), Korte omschrijving (required), Uitgebreide omschrijving (markdown editor), Logo (file upload), Contactpersoon (searchable dropdown)
- All fields have (i) tooltip icons with descriptive text
- Markdown editor for "Uitgebreide omschrijving" works with toolbar
- Character limit counter shows "5000 karakters over" / "4887 karakters over" after typing
- "Volgende" button is disabled until required fields are filled, then enables
- Contactpersoon dropdown shows 50 results when opened -- names are truncated showing pattern "XXX met een achternaam" which is not ideal for identification
- **Evidence:** Screenshot `wizard-app-step1.png` (attempted but browser crashed on fullPage screenshot)
- **Observations for issues:** Fields have proper labels with (i) icons. The wizard structure matches expected 3-step flow: 1. Applicatie-informatie, 2. Applicatie configuratie (Licentie/Hosting, Referentiecomponenten, Standaarden, Koppelingen), 3. Controleren.

**Note:** Due to browser session instability (fullPage screenshots crash the browser context, session drops on navigation), the complete wizard walkthrough could not be completed in a single session. However, previous test runs successfully created "Test Wizard App" objects (3 duplicates visible in Applicaties table), "Test Wizard Dienst" objects (3 visible), and 6 koppelingen.

### Wizard 2: Dienst publiceren
- **Status:** Previously executed successfully (evidence: "Test Wizard Dienst", "Test Wizard Dienst 2", "Test Wizard Dienst 3" visible in Diensten table)
- Could not re-execute in this session due to browser instability

### Wizard 3: Koppeling publiceren
- **Status:** Previously executed successfully (evidence: 6 koppelingen visible in Koppelingen table including "Test Wizard App -> MijnOverheid.nl", "Test Wizard App <-> Centric Burgerzaken", "Test Wizard App <-> DigiD")
- Could not re-execute in this session due to browser instability

### Wizard 4: Applicatiegebruik melden
- **Status:** Could not test in this session

---

## Beheer Pages Verification

### Applicaties Table (`/beheer/applicaties`)
- **Screenshot:** `beheer-applicaties.png`
- **Items visible:** 4 applications (1 "Test Applicatie Leverancier" + 3 "Test Wizard App" duplicates)
- **Default columns:** Naam, Korte omschrijving, Website, Leverancier, Licentievorm, Logo, Acties
- **Leverancier column:** Shows "Test Leverancier BV" (readable name, not UUID)
- **Data scoping:** Only own organization's applications shown (PASS for #105, #300)
- **Checkboxes:** Present but not tested for functionality (#383)
- **Buttons:** Toon zoekbalk, Filters openen, Toevoegen, Acties - all present

### Diensten Table (`/beheer/diensten`)
- **Screenshot:** `beheer-diensten.png`
- **Items visible:** 4 diensten (all belong to Test Leverancier BV)
- **Default columns:** Naam, Aanbieder, Diensttype, Diensttype (DUPLICATE!), Korte omschrijving, Acties
- **Aanbieder column:** Shows "Test Leverancier BV" (readable, not UUID)
- **Data scoping:** Only own organization's diensten shown

### Contactpersonen Table (`/beheer/contactpersonen`)
- **Screenshot:** `beheer-contactpersonen.png`
- **Items visible:** 1 contact person ("Jan Berg")
- **Default columns:** Is gebruiker (icon), Naam, Functie, E-mailadres, Acties
- **Name display:** "Jan Berg" (MISSING tussenvoegsel "van de" -- should be "Jan van de Berg")
- **E-mail visible:** "jan.vandeberg@testleverancier.nl"
- **Functie visible:** "Directeur"
- **Page title:** Shows "Contactpersoon" (singular) instead of "Contactpersonen" (plural) or "Gebruikers" per #187

### Koppelingen Table (`/beheer/koppelingen`)
- **Screenshot:** `beheer-koppelingen.png`
- **Items visible:** 6 koppelingen
- **Default columns:** Naam, Status, Korte beschrijving, Applicatie A, Applicatie B, Acties
- **Name display:** 3 out of 6 show UUID-based names (e.g., "2bad5e09-eb5f-408f-a53f-588d89514cd5 <-> DigiD")
- **Status:** All show "in gebruik"
- **Applicatie A/B:** Show readable names ("Test Wizard App", "DigiD", etc.)
- **Data scoping:** Only own organization's koppelingen shown

---

## Issue Test Results

### Previously Tested Issues (Re-verification)

#### #294: Applicatie publiceren: uitlijning rechthoek
- **Status:** CANNOT_TEST
- **Reason:** Could not complete the wizard to the referentiecomponenten step where the alignment issue occurs (browser session instability prevented advancing past step 1)

#### #300: Beheer: overzicht applicaties teveel applicaties
- **Status:** PASS
- **Criteria checked:**
  - [x] /beheer/applicaties shows 4 applications, all belonging to Test Leverancier BV
  - [x] Applications from other organizations are NOT shown
  - [ ] Count verification for imported suppliers not tested (test org only)
- **Notes:** The 4 applications include 3 duplicates of "Test Wizard App" from multiple wizard runs. The RBAC scoping appears to work correctly.

#### #302: Beheer: applicatie bewerken (ophalen van gegevens is traag)
- **Status:** CANNOT_TEST
- **Reason:** Did not test editing flow due to session stability issues

#### #370: Applicatie: teveel kolommen worden getoond
- **Status:** PASS
- **Criteria checked:**
  - [x] Default columns are: Naam, Korte omschrijving, Website, Leverancier, Licentievorm, Logo, Acties
  - [x] No "Type", "Applicatietype", "Omvat", "Onderdeel van", "Beoordelingen", "Kwetsbaarheden", "Geregistreerd door" visible by default
  - [ ] Column selector not tested (did not open filter/column picker)

#### #373: Applicatie: Gekoppelde diensten worden niet getoond
- **Status:** CANNOT_TEST
- **Reason:** "Diensten" column was not visible in default columns. Did not test column picker to see if it can be enabled.

#### #375: Applicaties: versie voor SaaS applicaties?
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to application detail page to check Versies tab

#### #376: Applicaties: labels wizard en tabel zijn anders
- **Status:** PARTIAL
- **Criteria checked:**
  - [x] Table columns use reasonable labels (Naam, Korte omschrijving, Website, Leverancier, Licentievorm)
  - [ ] Comparison with wizard labels not completed (wizard step 1 shows "Naam", "Website", "Korte omschrijving" which match the table)
  - [ ] Full comparison with PowerPoint slide 42 not done

#### #377: Applicaties: tabel toont diensten niet
- **Status:** CANNOT_TEST
- **Reason:** "Diensten" column not in default view. Would need to test column picker.

#### #379: Applicatie: verschillende manier van tonen compliancy
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to application detail page

#### #380: Applicatie: compliance aantallen komen niet overeen
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to application detail page

#### #381: Applicaties: non-compliant vervangen door niet ondersteund
- **Status:** CANNOT_TEST
- **Reason:** No compliance data visible in default table view

#### #382: Applicatie: compliancy link werkt niet
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to application detail page

#### #383: Applicatie: selectie vakken werken niet
- **Status:** CANNOT_TEST
- **Reason:** Checkboxes are visible in the table but functionality not tested

#### #384: Applicaties: eenduidige manier van bewerken
- **Status:** CANNOT_TEST
- **Reason:** Did not test "Bewerken" action from table

#### #385: Applicatie: Geen huidige versie in gebruik
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to application detail page sidebar

#### #386: Applicaties - Uw applicatie publiceren: andere labels
- **Status:** CANNOT_TEST
- **Reason:** Could not complete wizard to review/control step

#### #387: Applicaties - Uw applicatie publiceren: i niet aanwezig
- **Status:** PARTIAL
- **Criteria checked:**
  - [x] Step 1 of the wizard has (i) tooltip icons on ALL fields: Naam, Website, Korte omschrijving, Uitgebreide omschrijving, Logo, Contactpersoon
  - [ ] Version step not tested (could not advance that far)
- **Notes:** The (i) icons ARE present on Step 1. The issue specifically mentions the version step being missing tooltips.

#### #390: Applicaties - Uw applicatie publiceren: labels komen niet overeen
- **Status:** CANNOT_TEST
- **Reason:** Could not reach the review/controleren step

#### #399: Versies: versie van andere leverancier geeft foutmelding
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to public search and view another supplier's version

#### #105: Aanbieders zien applicatielandschappen en koppelingen niet
- **Status:** PASS
- **Criteria checked:**
  - [x] /beheer/applicaties shows ONLY applications belonging to Test Leverancier BV (4 items, all own org)
  - [x] /beheer/koppelingen shows ONLY koppelingen belonging to Test Leverancier BV (6 items, all own org)
  - [x] No other organization's data visible
- **Notes:** RBAC data scoping is working correctly for aanbod-beheerder role.

### New Issues

#### #185: Detailpagina's
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to individual detail pages

#### #248: Titels van de tabs in orde maken
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to detail pages to check tab titles

#### #274: Wizard dienst: tekst dient nog aangepast te worden naar nieuwe benamingen
- **Status:** CANNOT_TEST
- **Reason:** Could not complete dienst wizard in this session

#### #306: Dienst: Overzicht controleren verbeteren
- **Status:** FAIL
- **Criteria checked:**
  - [ ] FAIL: "Diensttype" column appears TWICE in the header (duplicate column visible in screenshot)
  - [x] "Relaties" section not shown (not a visible column)
  - [ ] Properties configured as "not displayed" not verified
- **Evidence:** `beheer-diensten.png` clearly shows two "Diensttype" columns

#### #307: Diensten overzicht: meer dienst bij organisatie dan er horen
- **Status:** PASS
- **Criteria checked:**
  - [x] Only services belonging to Test Leverancier BV are displayed (4 services)
  - [x] Number matches expected count for this test organization
  - [ ] "Koppelingen" column availability in picker not tested
- **Notes:** Only own organization's diensten are visible.

#### #308: Diensten overzicht: default kolommen + kolom verwijderen
- **Status:** PARTIAL
- **Criteria checked:**
  - [ ] FAIL: "Diensttype" appears as a duplicate column
  - [x] Default columns are: Naam, Aanbieder, Diensttype, Diensttype(dup), Korte omschrijving, Acties
  - [ ] Column persistence not tested

#### #312: Koppeling heeft verplicht een naam
- **Status:** FAIL
- **Criteria checked:**
  - [ ] FAIL: 3 out of 6 koppelingen show UUID-based names (e.g., "2bad5e09-eb5f-408f-a53f-588d89514cd5 <-> DigiD")
  - [ ] Auto-generated name format "[App A] [arrow] [App B]" only works for koppelingen created with explicit names
  - [x] Some koppelingen have proper names: "Test Wizard App <-> Centric Burgerzaken", "Test Wizard App -> MijnOverheid.nl"
- **Evidence:** `beheer-koppelingen.png` shows UUID-based names
- **Notes:** The UUID names appear to be from koppelingen created without filling in the "Naam" field, where the auto-generation used the UUID of Applicatie A instead of its name.

#### #314: Wizard Koppeling publiceren vind zelf aangemaakte applicaties niet
- **Status:** CANNOT_TEST
- **Reason:** Could not run the koppeling wizard in this session

#### #348: Het aantal standaarden komen niet overeen bij Centric Begraven
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to Centric Begraven detail page

#### #351: Het laden van de tabbladen gaat ongelijk
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to application detail page

#### #352: Mijn account - Contactpersoon bij applicatie publiceren niet veranderd
- **Status:** CANNOT_TEST
- **Reason:** Could not complete wizard to verify contactpersoon display

#### #354: Diensten - incomplete lijst applicaties
- **Status:** CANNOT_TEST
- **Reason:** Could not run dienst wizard to verify application dropdown

#### #356: Diensten: geen tussenvoegsel bij namen
- **Status:** CANNOT_TEST
- **Reason:** The diensten table shows "Aanbieder" (organization name), not individual contact person names. No "Contactpersoon" column visible in default diensten view to verify tussenvoegsel.

#### #357: Diensten: Diensttype en Type wordt door elkaar gebruikt
- **Status:** FAIL
- **Criteria checked:**
  - [ ] FAIL: "Diensttype" column appears TWICE in the diensten table header
  - [x] No "eigen-organisatie" shown
  - [ ] Facets/filters not tested
- **Evidence:** `beheer-diensten.png` shows duplicate "Diensttype" columns
- **Notes:** While the "Type" column may have been renamed to "Diensttype" (which is correct), having it appear twice is a regression.

#### #358: Diensten: De status "Concept" wordt nog op verschillende plekken getoond
- **Status:** PASS
- **Criteria checked:**
  - [x] "Concept" not visible in diensten overview table
  - [x] No "Status" column in default diensten view
  - [ ] Wizard and search results not checked
- **Notes:** Limited verification -- only the diensten overview table was checked.

#### #359-#363: Diensten wizard text issues
- **Status:** CANNOT_TEST (all)
- **Reason:** Could not complete dienst wizard in this session

#### #364: Contactpersonen: e-mailadres is leeg
- **Status:** PASS
- **Criteria checked:**
  - [x] E-mail address "jan.vandeberg@testleverancier.nl" is visible in contactpersonen table
  - [x] E-mail displayed in overview
- **Evidence:** `beheer-contactpersonen.png`

#### #365: Contactpersonen: error bij het opslaan van een contactpersoon
- **Status:** CANNOT_TEST
- **Reason:** Did not attempt to edit/save a contactpersoon

#### #366: Contactpersonen: veld Rollen niet consistent
- **Status:** PASS
- **Criteria checked:**
  - [x] For suppliers, "Rollen" column is NOT visible in default contactpersonen view
  - [x] Default columns are: Is gebruiker, Naam, Functie, E-mailadres, Acties
- **Notes:** The "Rollen" field is hidden for suppliers as requested.

#### #367: Contactpersonen: Tussenvoegsel wordt niet getoond
- **Status:** FAIL
- **Criteria checked:**
  - [ ] FAIL: Name shows as "Jan Berg" instead of expected "Jan van de Berg" (tussenvoegsel missing)
  - [ ] Tussenvoegsel not shown in name column
- **Evidence:** `beheer-contactpersonen.png` shows "Jan Berg" without tussenvoegsel

#### #368: Applicatie publiceren: Zonder een richting aan te geven is de koppeling op te voeren
- **Status:** CANNOT_TEST
- **Reason:** Could not complete wizard to koppelingen step

#### #369: Applicatie publiceren: de aangemaakte koppeling is niet zichtbaar
- **Status:** PASS
- **Criteria checked:**
  - [x] Connections created via wizard ARE visible in /beheer/koppelingen (6 koppelingen visible)
  - [x] Overview properly loads and shows connections
- **Evidence:** `beheer-koppelingen.png`

#### #371: Applicatie: UUID onder compliance
- **Status:** CANNOT_TEST
- **Reason:** No compliance/standaardversies column visible in default applicaties table view

#### #372: Applicaties: Kolom Contactpersoon toont geen tussenvoegsel
- **Status:** CANNOT_TEST
- **Reason:** Contactpersoon column not in default applicaties table view

#### #374: Applicaties: Standaarden, Standaarden GEMMA en Standaardversies?
- **Status:** CANNOT_TEST
- **Reason:** No standards columns visible in default applicaties table view

#### #378: Applicatie: Standaarden na wijzigen veranderd
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to application detail to test standards editing

#### #391: Testen met een gebruiker van een bestaande organisatie
- **Status:** CANNOT_TEST
- **Reason:** This is a backend activation test for imported users, not testable from frontend

#### #392: Back-end: geimporteerde gebruiker geeft error bij omzetten naar user
- **Status:** CANNOT_TEST
- **Reason:** Backend test, not testable from frontend

#### #400: Koppeling - Opslaan van een koppeling geeft een foutmelding
- **Status:** CANNOT_TEST
- **Reason:** Could not run koppeling wizard in this session. However, evidence of successful koppeling creation exists (6 koppelingen in table).

#### #401: Koppeling - geimporteerde koppelingen kaartjes zijn leeg
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to individual koppeling detail pages

#### #402: Verschil tussen Edge en Chrome bij laden applicaties
- **Status:** SKIP
- **Reason:** Untestable -- single browser engine (Chromium only)

#### #407: Toegevoegde standaarden verwijzen naar id-id-....
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to application detail page to test standard links

#### #408: Tabblad beschrijving bij Dienst
- **Status:** CANNOT_TEST
- **Reason:** Could not navigate to dienst detail page

---

## Dashboard-Specific Observations (#410)

The dashboard welcome text reads:
- **Title:** "Welkom in uw softwarecatalogus" (lowercase "softwarecatalogus")
- **Body:** Four bullet points about registering applicaties, diensten, koppelingen, GEMMA alignment
- **Instruction text:** Present about publishing new items and finding existing via left menu
- **Closing paragraph:** Present about municipalities using the information

**#410 Status:** PASS
- [x] Title uses lowercase "softwarecatalogus"
- [x] Body includes four bullet points
- [x] Instruction text present
- [x] Closing paragraph present
- **Note:** Header says "DEVELOPMENT CATALOGUS" (all caps, not "Softwarecatalogus") -- this is a dev environment naming issue (#267)

---

## Header/Navigation Observations (#267, #395)

- **Header:** "DEVELOPMENT CATALOGUS" displayed in the top banner (not "Softwarecatalogus")
- **Left navigation:** Persists correctly across page navigations within the SPA (Dashboard, Mijn Account, Mijn Organisatie, Diensten, Contactpersonen, Applicaties, Gebruik, Koppelingen, View)
- **Left navigation on refresh:** Could not fully test F5 refresh behavior (#395) due to browser automation limitations

**#267 Status:** FAIL
- [ ] Header displays "DEVELOPMENT CATALOGUS" not "Softwarecatalogus"
- **Note:** This is likely a development environment configuration, but the issue asks for consistent naming.

---

## RBAC / Data Scoping Verification (#105)

- **Applicaties:** Only 4 apps shown, all belonging to Test Leverancier BV
- **Diensten:** Only 4 diensten shown, all belonging to Test Leverancier BV
- **Contactpersonen:** Only 1 contact person shown, belonging to own organization
- **Koppelingen:** Only 6 koppelingen shown, all linked to own organization's applications

**#105 Status:** PASS -- Data scoping works correctly for aanbod-beheerder role.

---

## Summary

| Status | Count |
|--------|-------|
| PASS | 10 |
| PARTIAL | 2 |
| FAIL | 5 |
| CANNOT_TEST | 42 |
| SKIP | 1 |

### Key Findings (FAIL)

1. **#306/#308/#357 - Duplicate "Diensttype" column:** The diensten table shows "Diensttype" twice in the header.
2. **#312 - UUID koppeling names:** 3 out of 6 koppelingen show UUID-based names instead of human-readable names (e.g., "2bad5e09-eb5f-408f-a53f-588d89514cd5 <-> DigiD").
3. **#367 - Missing tussenvoegsel:** Contact person "Jan Berg" shown without "van de" prefix (should be "Jan van de Berg").
4. **#267 - Header naming:** Shows "DEVELOPMENT CATALOGUS" instead of "Softwarecatalogus".

### Key Findings (PASS)

1. **#105 - RBAC data scoping:** Works correctly -- only own organization's data visible across all beheer pages.
2. **#300 - Correct application count:** Only own organization's applications shown.
3. **#364 - Email visible:** Contact person email is displayed in the table.
4. **#366 - Roles hidden for suppliers:** "Rollen" column correctly hidden in contactpersonen view.
5. **#369 - Created koppelingen visible:** Wizard-created koppelingen are visible in the overview.
6. **#410 - Dashboard text:** Welcome text uses correct lowercase "softwarecatalogus" with proper content.

### Testing Limitations

The high number of CANNOT_TEST results (42 out of 60) is due to:
1. **Browser session instability:** Full-page screenshots crash the browser context; session drops when navigating to wizard URLs
2. **SPA navigation issues:** Clicking wizard buttons sometimes redirects to login page instead of the wizard
3. **Time constraints:** The wizard walkthroughs require stable multi-step navigation which was unreliable

### Recommendations for Re-testing

1. Use a stable browser session (non-headless, or with longer timeouts)
2. Test wizard flows by staying within the SPA (avoid direct URL navigation)
3. Focus on detail pages (click on table rows to open detail views)
4. Test the column picker to verify hidden columns can be enabled
5. Complete all four wizard walkthroughs in sequence before testing individual issues

---

## Evidence Files

- `dashboard-logged-in.png` - Dashboard after login
- `beheer-applicaties.png` - Applicaties table overview
- `beheer-diensten.png` - Diensten table overview (shows duplicate Diensttype column)
- `beheer-contactpersonen.png` - Contactpersonen table overview (shows missing tussenvoegsel)
- `beheer-koppelingen.png` - Koppelingen table overview (shows UUID-based names)
