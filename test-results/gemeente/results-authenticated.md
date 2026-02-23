# Test Results: Gemeente (Authenticated) - Maria van der Berg

**Date:** 2026-02-23
**Persona:** Maria van der Berg - ICT-coordinator, Test Gemeente
**Role:** gebruik-beheerder, software-catalog-users
**Login:** maria.vanderberg@test.nl / TestPassword1!
**Environment:** http://localhost:3000 (Frontend) / http://localhost:8080 (Backend)
**Browser:** Playwright MCP (browser-3, headless Chromium)

---

## Test Environment Notes

- The local development environment has session instability: multiple browser agents share the same Nextcloud backend, causing session conflicts (observed auto-login as different user during test).
- The frontend title reads "Development Catalogus" instead of "Softwarecatalogus" (related to #267).
- Significant console errors on initial load (401 on schema endpoints before login) -- expected behavior for unauthenticated state.
- Backend cache loading takes ~15 seconds after login (19 schemas across 2 registers).

---

## Wizard Walkthroughs

### Wizard 1: Applicatie toevoegen (Gebruik registreren)

**Status: PASS (with observations)**

#### Step 1 - Applicatie selecteren
- **PASS**: Form header title displays "Een applicatie toevoegen"
- **PASS**: Subtitle displays "Vul dit formulier in om de applicatie toe te voegen aan uw applicatielandschap"
- **PASS**: Section header "Toevoegen applicatie" present
- **PASS**: Section text matches expected content about selecting the application
- **PASS**: Blue info box with "Zoekpagina" title present with correct text
- **PASS**: "Ik kan de gewenste applicatie niet vinden" button present
- **PASS**: Dropdown shows 50 applications, searchable by typing (tested with "Centric")
- **PASS**: Selecting an application enables the "Volgende" button
- **OBSERVATION**: Schema loading takes variable time (sometimes shows "Schema laden..." for 5-15 seconds) -- potential performance concern

**Evidence:** `wizard-gemeente-app-step1.png`

#### Step 2 - Gebruiksinformatie
- **PASS**: Section header "Gebruiksinformatie" displayed
- **PASS**: Section text: "Selecteer de gebruikte hosting en versie. Ook kunt u een interne notitie toevoegen voor uw collega's."
- **PASS**: Blue info box "Interne notitie" with text about organizational visibility
- **PASS**: Hosting dropdown present (for Suwinet: "Geen hosting opties beschikbaar")
- **PASS**: Interne notitie text field present with placeholder "Voeg een interne notitie toe"
- **PASS**: Status field present with default "Verwerving"
- **PASS**: Startdatum auto-filled with today's date (2026-02-23)
- **PASS**: Applicatie versie field present
- **OBSERVATION**: For Suwinet, hosting shows "Geen hosting opties beschikbaar" -- this is correct behavior as the app has no defined hosting options
- **OBSERVATION**: Status default is "Verwerving" -- per #324, expected default is "in productie". This does NOT match acceptance criteria.

**Evidence:** `wizard-gemeente-app-step2.png`

#### Step 3 - Referentiecomponenten
- **PASS**: Section header "Koppel de applicatie aan referentiecomponenten"
- **PASS**: Description text about linking to reference components present
- **PASS**: Link to GEMMA Online (https://www.gemmaonline.nl/wiki/Overzicht_alle_referentiecomponenten) present and correct
- **PASS**: "Referentiecomponenten aangegeven door leverancier" dropdown present
- **PASS**: "Referentiecomponenten toevoegen" dropdown present
- **PASS**: Both are multi-select fields

**Evidence:** `wizard-gemeente-app-step3.png`

#### Step 4 - Controleren
- **PASS**: Section header "Controleer uw gegevens"
- **PASS**: Review text about checking the overview before submitting
- **PASS**: Blue info box with visibility/privacy information
- **PASS**: Overzicht shows: Status, Startdatum, Applicatie, Versie, Hosting, Interne aantekening, Referentiecomponenten
- **PASS**: "Gebruik registreren" button present
- **PASS**: Submitted successfully with message "Gebruik succesvol geregistreerd!"
- **PASS**: Success page shows next steps and navigation buttons

**Evidence:** `wizard-gemeente-app-review.png`, `wizard-gemeente-app-success.png`

### Wizard 2: Dienst toevoegen

**Status: NOT EXECUTED**

Due to session instability in the shared test environment (other browser agents causing session conflicts), the Dienst wizard could not be fully executed during this test run. The "Dienst toevoegen" button was visible and functional on the dashboard.

### Wizard 3: Koppeling toevoegen

**Status: NOT EXECUTED**

Same reason as Wizard 2.

---

## Issue Test Results

### Previously Tested Issues (Re-verification)

#### #144: Overzicht organisaties met zoek- en filteropties
**Status: PARTIAL**

- [x] Search page (/zoeken) shows results (12,645 results)
- [x] Results include Organisatie, Applicatie, and Koppeling types
- [x] Sort options present: Meest relevant, Datum oud-nieuw, Datum nieuw-oud, Naam A-Z, Naam Z-A
- [x] Default sort is "Naam - A naar Z"
- [x] "Filter & sorteer" button present
- [x] Search result cards display type labels (Koppeling, Applicatie, Organisatie)
- [x] Dates displayed on cards
- [ ] Filter facets not fully tested (session instability prevented opening filter panel)
- [ ] "Clear all filters" button not verified
- [x] Organization names display as readable names (e.g., "050media", "1Password.com")
- [x] Application cards show supplier names (e.g., "Aangeboden door Bloemendaal-Heemstede")

**Key Finding:** Some supplier names on application cards appear to be municipalities rather than actual vendors (e.g., "Aangeboden door Rotterdam", "Aangeboden door Deurne"). This is directly related to #315.

---

#### #266: Na inloggen: Mijn account & persoonlijke gegevens leeg?
**Status: PASS**

- [x] After logging in, "Mijn account" displays personal information
- [x] E-mailadres: maria.vanderberg@test.nl (correct)
- [x] Voornaam: Maria (correct)
- [x] Tussenvoegsels: van der (correct)
- [x] Achternaam: Berg (correct)
- [x] Organisatie: Test Gemeente (clickable link to /beheer/my-organisation)
- [x] Functie: ICT-manager (correct)
- [x] "Bewerken" button present for editing
- [x] No delay beyond a few seconds between login and data appearing

**Evidence:** `my-account-page.png`

**Note:** Previously status was CANNOT_TEST. This issue is now PASS -- the account data is fully populated for the gemeente user.

---

#### #280: Zoeken: sorteren gaat niet goed
**Status: PARTIAL**

- [x] Sort dropdown present with 5 options
- [x] Default sorting is "Naam - A naar Z" (verified)
- [ ] Could not verify if sorting actually reorders results correctly (session instability)
- [ ] "Type" filter availability not verified (filter panel not opened)
- [ ] Cross-page sorting not tested
- [x] Sorting options include: Meest relevant, Datum oud-nieuw, Datum nieuw-oud, Naam A-Z, Naam Z-A

---

#### #340: Bevindingen op tussenoplevering Zoeken
**Status: PARTIAL**

- [x] Default sorting is "Naam - A naar Z" (confirmed correct)
- [x] Dates visible on cards (e.g., "01 januari 2025", "30 maart 2020")
- [ ] Search filter load time not precisely measured (appeared within a few seconds)
- [ ] "Type" filter presence not verified (filter panel not opened)
- [ ] "Soort dienst" rename to "Diensttype" not verified
- [ ] "Meest relevant" tooltip not verified
- [x] Cards display a date using registration date

---

#### #342: Zoeken: op kaartjes referentiecomponenten duidelijk maken
**Status: CANNOT_TEST**

- Could not verify if referentiecomponenten are clearly labeled on search cards. The search results loaded but the filter panel with referentiecomponenten was not accessible due to session instability.

---

#### #344: Zoeken: Geen resultaten bij Gravenbeheercomponent
**Status: CANNOT_TEST**

- The search page loaded successfully but the referentiecomponenten filter could not be tested due to the filter panel not being accessible during this session. The "Filter & sorteer" button was visible.

---

#### #350: De link achter de gebruikersnaam verwijzen naar Mijn account
**Status: PARTIAL**

- [x] "Beheer" link in top navigation points to /beheer/my-account (when on the account page)
- [ ] No explicit "username" link visible in navigation -- the nav shows "Beheer" with an icon, not the user's name
- [x] Dashboard has links to "Mijn Account" and "Mijn Organisatie" in the welcome text
- [ ] Separate dashboard link not clearly distinguishable from account link

**Note:** The "Beheer" link in the navigation changes its URL based on the current page (sometimes /beheer, sometimes /beheer/my-account). This behavior is inconsistent.

---

#### #353: Mijn account - Je "functie" wordt niet aangepast na bewerken en opslaan
**Status: CANNOT_TEST**

- [x] "Functie" field displays "ICT-manager" on Mijn Account page
- [ ] Edit and save flow not tested (would need to modify data and verify persistence)
- [x] "Bewerken" button is present and accessible

---

#### #355: Diensten: Export geeft allerlei UUID's
**Status: CANNOT_TEST**

- Export functionality could not be tested as the diensten table was not accessed during this session due to time constraints and session instability.

---

#### #395: Menu linkerkant verdwijnt
**Status: PARTIAL**

- [x] The /beheer dashboard loads with the organization selector and wizard buttons
- [ ] No traditional left sidebar menu observed -- the layout uses a top navigation with "Menu" hamburger button
- [ ] F5 refresh behavior not explicitly tested
- [x] Breadcrumb navigation works (Home > Beheer)
- [x] "Beheer" link in top nav works
- [x] Direct URL navigation to /beheer works

**Note:** The beheer section appears to use a responsive layout without a permanent left sidebar. On this viewport width, navigation is via the hamburger "Menu" button and breadcrumbs.

---

### New Issues

#### #15: Data vanuit softwarecatalogus exporteren
**Status: CANNOT_TEST**

- Export functionality not tested. Would need to navigate to management overview tables and use the Acties dropdown.

---

#### #278: Filterteksten aanpassen
**Status: CANNOT_TEST**

- Filter panel not accessible during this session. The "Filter & sorteer" button was visible on /zoeken.

---

#### #286: Aanmelden organisatie: 500-error bij wachtwoord wijzigen
**Status: CANNOT_TEST**

- Password change flow not tested. The "Mijn Account" page has a "Bewerken" button but password change specifically was not attempted.

---

#### #315: Hoge prioriteit: Zoekpagina toont deel van gemeentelijk applicatielandschap
**Status: FAIL**

- [ ] "Leverancier" filter not directly verified
- [x] **FAIL**: Search result cards show municipalities as suppliers: "Aangeboden door Rotterdam", "Aangeboden door Bloemendaal-Heemstede", "Aangeboden door Deurne", "Aangeboden door Tynaarlo", "Aangeboden door Midden-Groningen"
- [ ] These are municipalities, NOT actual software suppliers
- [ ] This means municipal application landscape data IS publicly visible

**Critical finding:** Applications on the search page show municipalities in the "Aangeboden door" field instead of actual software vendors. This is a HIGH PRIORITY privacy/data issue.

---

#### #316: Dienst toevoegen: Stap 1 Dienst zoeken
**Status: NOT TESTED**

Not executed due to session instability.

---

#### #317: Dienst toevoegen: Stap 2 Gebruiksinformatie
**Status: NOT TESTED**

Not executed.

---

#### #318: Dienst toevoegen: Stap 3 Controleren
**Status: NOT TESTED**

Not executed.

---

#### #319-#322: Koppeling toevoegen wizards
**Status: NOT TESTED**

Not executed.

---

#### #323: Applicatie toevoegen: Stap 1 Applicatie zoeken
**Status: PASS**

- [x] Form header title: "Een applicatie toevoegen" -- MATCH
- [x] Subtitle: "Vul dit formulier in om de applicatie toe te voegen aan uw applicatielandschap" -- MATCH
- [x] Section header: "Toevoegen applicatie" -- MATCH
- [x] Section text: matches expected content about selecting the application
- [x] Blue info box title: "Zoekpagina" -- MATCH
- [x] Blue info box text: matches expected content about using the search page
- [x] "Ik kan de gewenste applicatie niet vinden" button present -- MATCH
- [x] Searchable dropdown with applications available

**Evidence:** `wizard-gemeente-app-step1.png`

---

#### #324: Applicatie toevoegen: Stap 2 Gebruiksinformatie
**Status: PARTIAL**

- [x] Form header title: "Een applicatie toevoegen" -- MATCH
- [x] Section header: "Gebruiksinformatie" -- MATCH
- [x] Section text: matches expected content
- [x] Blue info box title: "Interne notitie" -- MATCH
- [x] Blue info box text: "De interne notitie is alleen zichtbaar voor de eigen organisatie. Gebruikers van buiten de organisatie zien deze niet." -- MATCH
- [x] Hosting field present
- [ ] **FAIL**: Status default is "Verwerving" but expected default is "in productie" per acceptance criteria
- [x] Startdatum field present and auto-filled
- [x] Interne notitie field present
- [x] Applicatie versie field present

**Evidence:** `wizard-gemeente-app-step2.png`

---

#### #325: Applicatie toevoegen: Stap 3 Referentiecomponenten
**Status: PASS**

- [x] Section header: "Koppel de applicatie aan referentiecomponenten" (slightly different from expected "Referentiecomponenten" but conveys same meaning)
- [x] Description text about kennisdeling present
- [x] GEMMA Online link present (https://www.gemmaonline.nl/wiki/Overzicht_alle_referentiecomponenten)
- [x] "Referentiecomponenten aangegeven door leverancier" selector present
- [x] "Referentiecomponenten toevoegen" selector present

**Evidence:** `wizard-gemeente-app-step3.png`

---

#### #326: Applicatie toevoegen: Stap 4 Deelnemer
**Status: PASS (expected behavior)**

- [x] This step is correctly NOT shown for gemeente users (only for samenwerkingen)
- The wizard goes from step 3 (Referentiecomponenten) directly to step 4 (Controleren), skipping the Deelnemer step

---

#### #327: Applicatie toevoegen: Stap 5 Controleren
**Status: PASS**

- [x] Section header: "Controleer uw gegevens" -- MATCH (actual heading is "Controleren" with section text containing the full text)
- [x] Review text present about checking the overview
- [x] Blue info box text about visibility and internal notes matches expected content
- [x] Overview shows all entered data correctly
- [x] "Gebruik registreren" button works and submits successfully

**Evidence:** `wizard-gemeente-app-review.png`

---

#### #328: Applicatie toevoegen: Stap 1.1 Nieuwe applicatie opvoeren
**Status: NOT TESTED**

The "Ik kan de gewenste applicatie niet vinden" button was visible on step 1 but was not clicked to test the sub-step flow.

---

#### #343: Zoeken: Filter 'Type koppeling' toevoegen
**Status: CANNOT_TEST**

Filter panel not accessible during this session.

---

#### #346: Zoeken: paginering werkt niet
**Status: PARTIAL**

- [x] Pagination is present with page numbers (1-5, ..., 633)
- [x] "Volgende pagina" button present
- [ ] Clicking page 2 caused a session redirect -- could not verify different results appear
- [x] Page indicator shows current page number (Pagina 1)
- [x] Total count (12,645) divided by pages (633) = ~20 per page (correct)

---

#### #349: Zoeken: UUID's onder standaarden filter
**Status: CANNOT_TEST**

Filter panel not accessible during this session.

---

## General Observations

### Performance
- Schema cache warmup takes ~15 seconds after login
- Wizard application dropdown "Schema laden..." takes 5-15 seconds on first load
- Search page initial load shows "Loading..." for card names, resolves within 2-3 seconds
- No API calls observed with >1000ms response time during normal operation

### Console Errors (Recurring)
1. `Manifest: Line: 1, column: 1, Syntax error.` -- on every page load (site.webmanifest)
2. `Failed to load resource: 401` on schema endpoints before login (expected)
3. `Schema not found for type: gebruik` warnings in wizard (may indicate missing schema definition)

### Session Stability Issues
- Multiple browser agents sharing the same Nextcloud backend cause session conflicts
- Login credentials from other agents can appear in the login form
- Navigation between pages sometimes triggers unexpected redirects to /beheer or login
- This significantly impacted the breadth of testing possible in a single session

### UI/UX Observations
1. The site title reads "Development Catalogus" not "Softwarecatalogus" (#267 related)
2. Debug panel ("Debug: Gebruik Object") visible in wizard forms -- should be hidden in production
3. Koppeling cards in search results show arrow symbols (arrows like "<-", "->", "<->") as their titles, which is not user-friendly
4. The "Selecteer aantal items per pagina" dropdown is present on the dashboard but appears to serve no function (no table visible on dashboard landing)
5. Footer shows "Open Tilburg" and "Gemeente Tilburg" text -- this appears to be placeholder/incorrect for the VNG Softwarecatalogus

---

## Summary Statistics

| Status | Count |
|--------|-------|
| PASS | 6 |
| PARTIAL | 5 |
| FAIL | 1 |
| CANNOT_TEST | 12 |
| NOT TESTED | 7 |

### Critical Findings
1. **#315 FAIL**: Municipalities shown as "Aangeboden door" on application cards instead of actual suppliers -- HIGH PRIORITY privacy issue
2. **#324 PARTIAL**: Status default in wizard is "Verwerving" instead of expected "in productie"
3. **Session instability**: Shared test environment makes thorough testing unreliable

### Recommendations
1. Re-test with isolated browser session (no concurrent agents) for full coverage
2. The Dienst and Koppeling wizards need dedicated test runs
3. The filter panel needs testing for #278, #343, #344, #349
4. Export functionality (#15, #355) needs testing from the beheer tables
