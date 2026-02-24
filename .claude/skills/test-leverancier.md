# Test Agent: Leverancier (Vendor)

## Persona

**Jan Pietersen** — Director of a small software company (8 employees), 15 years experience in municipal software.

## Role: Aanbod-beheerder

Jan manages his company's products in the Softwarecatalogus. He registers applications, services, connections, and standards. He also manages which municipalities use his products.

## Login Credentials

- **Username**: `{PERSONA_USERNAME}` (default: `jan.pietersen@test.nl`)
- **Password**: `{PERSONA_PASSWORD}` (default: `WelcomeToTest2026`)
- **Groups**: aanbod-beheerder, software-catalog-users

> These values are injected by the orchestrator. If not provided, use the defaults above (local dev only).

## Test Environment

- **Frontend**: `{FRONTEND}` (default: `{FRONTEND}`)
- **Backend**: `{BACKEND}` (default: `{BACKEND}`)
- **Browser**: Use Playwright MCP browser tools (prefixed `mcp__browser-N__`, where N is assigned by the orchestrator)
- **Login URL**: `{FRONTEND}/login`

## Test Scope

This agent tests the following steps from the test flow (`testen.md`):

### Primary Steps
- **Step 2**: Organization registration — Register as a new vendor
- **Step 3**: Organization activation — Activate vendor account via backend
- **Step 4**: First login — Log in as vendor, verify dashboard and wizards
- **Step 5**: Colleague invitations — Add team members, manage roles
- **Step 6**: Organization profile — Complete vendor profile
- **Step 7**: Product creation (single module) — Full product wizard
- **Step 8**: Product creation (multi module) — Complex modular products
- **Step 9**: Service wizard — Add services to products
- **Step 12**: Privacy and visibility — Verify vendor can see own product usage
- **Step 16**: Standards management — Register standards for products
- **Step 18**: Vendor usage management — "Applicatiegebruik melden" wizard, view customers, manage usage reports

### Secondary Steps (observe/verify)
- **Step 13**: Excel export — Export product data
- **Step 14**: Search and results — Verify products appear in search
- **Step 15**: AMEFF reference — Select GEMMA components

## Issues to Test

### Previously tested (re-verify with auth):
| Issue | Title | Previous Status |
|-------|-------|-----------------|
| #294 | Applicatie publiceren: uitlijning rechthoek | CANNOT_TEST → **re-test (see hint #12)** |
| #300 | Beheer: overzicht applicaties teveel applicaties | CANNOT_TEST |
| #302 | Beheer: applicatie bewerken (ophalen van gegevens is traag) | CANNOT_TEST |
| #370 | Applicatie: teveel kolommen worden getoond | PASS |
| #373 | Applicatie: Gekoppelde diensten worden niet getoond | FAIL → **re-test (bug fixed)** |
| #375 | Applicaties: versie voor SaaS applicaties? | PARTIAL → **re-test (bug fixed)** |
| #376 | Applicaties: labels wizard en tabel zijn anders | CANNOT_TEST → **re-test (see hint #18)** |
| #377 | Applicaties: tabel toont diensten niet | CANNOT_TEST |
| #379 | Applicatie: verschillende manier van tonen compliancy | PARTIAL |
| #380 | Applicatie: compliance aantallen komen niet overeen | CANNOT_TEST → **re-test (see hint #23)** |
| #381 | Applicaties: non-compliant vervangen door niet ondersteund | PASS |
| #382 | Applicatie: compliancy link werkt niet | PASS |
| #383 | Applicatie: selectie vakken werken niet | CANNOT_TEST |
| #384 | Applicaties: eenduidige manier van bewerken | CANNOT_TEST |
| #385 | Applicatie: Geen huidige versie in gebruik | PASS |
| #386 | Applicaties – Uw applicatie publiceren: andere labels | CANNOT_TEST → **re-test (see hint #19)** |
| #387 | Applicaties – Uw applicatie publiceren: i niet aanwezig | CANNOT_TEST → **re-test (see hint #20)** |
| #390 | Applicaties – Uw applicatie publiceren: labels komen niet overeen | CANNOT_TEST → **re-test (see hint #21)** |
| #399 | Versies: versie van andere leverancier geeft foutmelding | CANNOT_TEST → **re-test (bug fixed)** |
| #105 | Aanbieders zien applicatielandschappen en koppelingen niet | CANNOT_TEST (moved from security-officer — needs aanbod-beheerder role) |

### New issues (not previously tested):
| Issue | Title | Test Step |
|-------|-------|-----------|
| #185 | Detailpagina's | Step 7 |
| #248 | Titels van de tabs in orde maken | Step 7 |
| #263 | Niet ingelogd: onder een applicatie staat in het tabje gebruik de gemeenten | **MOVED → bezoeker** (unauthenticated test) |
| #274 | Wizard dienst: tekst dient nog aangepast te worden naar nieuwe benamingen | Step 9 |
| #306 | Dienst: Overzicht controleren verbeteren | Step 9 |
| #307 | Diensten overzicht: meer dienst bij organisatie dan er horen | Step 9 |
| #308 | Diensten overzicht: default kolommen + kolom verwijderen | Step 9 |
| #312 | Koppeling heeft verplicht een naam | Step 11 |
| #314 | Wizard Koppeling publiceren vind zelf aangemaakte applicaties niet | Step 11 |
| #345 | Zoeken: toegevoegde dienst verschijnt niet in filters | **MOVED → bezoeker** (public search page test) |
| #347 | Zoeken: Dienstkaartje toont array | **MOVED → bezoeker** (public search page test) |
| #348 | Het aantal standaarden komen niet overeen bij Centric Begraven | Step 7 |
| #351 | Het laden van de tabbladen gaat ongelijk | Step 7 |
| #352 | Mijn account - Contactpersoon bij applicatie publiceren niet veranderd | Step 7 |
| #354 | Diensten - incomplete lijst applicaties | Step 9 |
| #356 | Diensten: geen tussenvoegsel bij namen | Step 9 |
| #357 | Diensten: Diensttype en Type wordt door elkaar gebruikt | Step 9 |
| #358 | Diensten: De status "Concept" wordt nog op verschillende plekken getoond | Step 9 |
| #359 | Diensten wizard: Uw dienst publiceren - tekst aanpassen | Step 9 |
| #360 | Diensten wizard – Uw dienst publiceren: Meerdere i komen niet overeen met ppt | Step 9 |
| #361 | Diensten wizard – Uw dienst publiceren: inconsistentie in labels | Step 9 |
| #362 | Diensten wizard – Uw dienst publiceren: onlogische tekst bovenaan aanmeld-stap | Step 9 |
| #363 | Diensten wizard – Uw dienst publiceren: catalogus i.p.v. softwarecatalogus | Step 9 |
| #364 | Contactpersonen: e-mailadres is leeg | Step 5 |
| #365 | Contactpersonen: error bij het opslaan van een contactpersoon | Step 5 |
| #366 | Contactpersonen: veld Rollen niet consistent | Step 5 |
| #367 | Contactpersonen: Tussenvoegsel wordt niet getoond | Step 5 |
| #368 | Applicatie publiceren: Zonder een richting aan te geven is de koppeling op te voeren | Step 11 |
| #369 | Applicatie publiceren: de aangemaakte koppeling is niet zichtbaar | Step 11 |
| #371 | Applicatie: UUID onder compliance | Step 7 |
| #372 | Applicaties: Kolom Contactpersoon toont geen tussenvoegsel | Step 7 |
| #374 | Applicaties: Standaarden, Standaarden GEMMA en Standaardversies? | Step 7 |
| #378 | Applicatie: Standaarden na wijzigen veranderd | Step 7 |
| #391 | Testen met een gebruiker van een bestaande organisatie | Step 3 |
| #392 | Back-end: geimporteerde gebruiker geeft error bij omzetten naar user | **MOVED → functioneel-beheerder** |
| #400 | Koppeling - Opslaan van een koppeling geeft een foutmelding | Step 11 |
| #401 | Koppeling - geïmporteerde koppelingen kaartjes zijn leeg | Step 11 |
| #402 | Verschil tussen Edge en Chrome bij laden applicaties | Step 7 |
| #407 | Toegevoegde standaarden verwijzen naar id-id-.... | Step 16 |
| #408 | Tabblad beschrijving bij Dienst | Step 9 |

## Acceptance Criteria Reference

**IMPORTANT**: Before testing each issue, read its detailed acceptance criteria in `issues.md` (in the repository root). Each issue has specific, testable acceptance criteria with checkboxes. Use these criteria to determine PASS/FAIL/PARTIAL status:
- **PASS** = ALL acceptance criteria are met
- **PARTIAL** = Some criteria met, some not
- **FAIL** = Key criteria not met or feature is broken
- **CANNOT_TEST** = Feature not accessible or environment issue prevents testing

## Detail Page Testing — MANDATORY

**CRITICAL**: Many issues (20+) were CANNOT_TEST in the previous run because detail pages were never opened. You MUST open detail pages for applicaties, diensten, koppelingen, and organisaties.

### How to open a detail page

Detail pages are opened via the **publicatie URL pattern**:
```
{FRONTEND}/publicatie/{id}
```

**To find the ID of an object:**
1. Go to the beheer table (e.g., `/beheer/applicaties`)
2. Click on a row — the URL or page content will show the object ID (UUID)
3. Alternatively, use the API to find IDs:
   ```
   curl -s -u {ADMIN_USER}:{ADMIN_PASS} '{BACKEND}/index.php/apps/openregister/api/objects/3/25?_limit=5&_fields=naam,id'
   ```
   (register 3 = Voorzieningen, schema 25 = Applicatie, schema 26 = Dienst, schema 28 = Koppeling, schema 15 = Organisatie)

**After completing the wizard** (which creates "Test Wizard App"), find its ID in the beheer table or API, then navigate to:
```
{FRONTEND}/publicatie/{test-wizard-app-id}
```

For existing applications (e.g., well-known apps with many standards), search the API:
```
curl -s -u {ADMIN_USER}:{ADMIN_PASS} '{BACKEND}/index.php/apps/openregister/api/objects/3/25?_limit=5&_search=Begraven&_fields=naam,id'
```

### Applicatie Detail Page
- Navigate to `{FRONTEND}/publicatie/{applicatie-id}` for your wizard-created app AND at least one existing app
- **Tabs**: Verify all tabs load (Beschrijving, Diensten, Koppelingen, Standaarden, Gebruik, Versies)
- **Tab loading**: Check that tabs load consistently without delays (#351)
- **Tab titles**: Verify tab titles match the design specification (#248)
- **Diensten tab**: Verify linked services are shown (not empty) (#373)
- **Standaarden tab**: Check standards display correctly, no UUIDs (#371, #374)
- **Compliance**: Verify compliance display is consistent (#379), counts match (#380)
- **Contactpersoon**: Verify contact person shows full name including tussenvoegsel (#372)
- **Gebruik tab**: When NOT logged in, municipality names should NOT be visible (#263)
- **Versies**: Check version display, especially for SaaS applications (#375)
- **Standaarden na wijzigen**: After editing standards, verify they haven't changed unexpectedly (#378)
- **Compliancy link**: Click a compliancy link and verify it works (#382)
- Take screenshots of EACH tab

### Koppeling Detail Page
- Navigate to `{FRONTEND}/publicatie/{koppeling-id}` for your wizard-created koppeling
- **Card display**: Verify the card shows meaningful data, not empty (#401)
- **Direction**: Check that the connection direction (richting) is displayed
- **Linked applications**: Verify both source and target applications are shown
- **Name**: Verify the connection has a proper name (#312)

### Dienst Detail Page
- Navigate to `{FRONTEND}/publicatie/{dienst-id}` for your wizard-created dienst
- **Beschrijving tab**: Verify description tab exists and shows content (#408)
- **Labels**: Check that "Diensttype" vs "Type" is used consistently (#357)
- **Status**: Verify "Concept" status is not shown in unintended places (#358)
- **Contactpersoon**: Verify tussenvoegsel is shown in names (#356)
- **Array display**: Check that fields don't show raw arrays (#347)

### Organisatie Detail Page
- Navigate to `{FRONTEND}/publicatie/{organisatie-id}` for "Test Leverancier BV"
- **Profile fields**: Verify all profile fields are shown correctly
- **Contactpersonen**: Check that linked contact persons are displayed
- **Type**: Verify the organization type (Leverancier/Gemeente/Samenwerking) is shown
- **Status**: Check status display (Concept/Actief/Inactief)

## Wizard Walkthrough — MANDATORY

**CRITICAL**: You MUST execute all four wizard flows below BEFORE testing individual issues. Many issues depend on having wizard-created objects. Execute each wizard completely, documenting every step, every field, and every button click. Take a screenshot after each step.

### Wizard 1: Applicatie publiceren

**Route**: Click **"Applicatie publiceren"** on the dashboard (or navigate to `/forms/applicatie?type=eigen` — NOTE: do NOT use `/beheer/forms/...` as it causes a 500 error)

**Step 1 — Applicatie-informatie:**
1. Fill in field **naam**: `Test Wizard App`
2. Fill in field **website**: `https://test-leverancier.nl/app`
3. Fill in field **beschrijvingKort**: `Applicatie aangemaakt via wizard test`
4. Fill in field **beschrijvingLang**: `Dit is een uitgebreide beschrijving van de test applicatie, aangemaakt door de geautomatiseerde leverancier test.`
5. Skip **logo** (optional)
6. If a **contactpersoon** dropdown is visible, select "Jan Pietersen" if available
7. Click **"Volgende"** to advance
8. Take screenshot: `wizard-app-step1.png`

**Step 2 — Licentie & Hosting:**
1. Select **licentietype**: "Open source"
2. If a **licentie** dropdown appears, select any option (e.g., "EUPL-1.2")
3. Select **cloudDienstverleningsmodel**: check "Software-as-a-Service"
4. If **hostingLocatie** appears, select any option
5. Click **"Volgende"**
6. Take screenshot: `wizard-app-step2.png`

**Step 3 — Referentiecomponenten:**
1. In the multi-select dropdown, search for and select 1-2 GEMMA referentiecomponenten (e.g., type "Zaak" and select the first result)
2. Click **"Volgende"**
3. Take screenshot: `wizard-app-step4.png`

**Step 4 — Standaarden:**
1. Observe the standards table that loaded from referentiecomponenten
2. If standards are listed, check the **"Compliant"** checkbox on the first one
3. Note whether the "Bewijs" upload is enabled when compliant is checked
4. Click **"Volgende"**
5. Take screenshot: `wizard-app-step5.png`

**Step 5 — Koppelingen:**
1. Click **"+ Koppeling toevoegen"** to add a connection
2. In the **Applicatie B** dropdown, search for and select any application
3. Select **Richting**: "Bi-directioneel" (options are "A -> B", "B -> A", "Bi-directioneel")
4. Fill in **Naam**: `Test koppeling`
5. Click **"Volgende"**
6. Take screenshot: `wizard-app-step6.png`

**Step 6 — Controleren (Review):**
1. Verify ALL entered data is shown correctly:
   - Application name, website, descriptions
   - License type and hosting model
   - Referentiecomponenten selection
   - Standards compliance
   - Koppelingen
2. Take screenshot: `wizard-app-step6-review.png`
3. Click **"Applicatie aanmelden"** to submit (button label varies per wizard)
4. Verify success notification appears: "Applicatie succesvol aangemeld!"
5. Take screenshot: `wizard-app-success.png`

### Wizard 2: Dienst publiceren

**Route**: Click **"Dienst publiceren"** on the dashboard (or navigate to `/forms/dienst?type=eigen`)

**Step 1 — Applicaties:**
1. In the dropdown, search for and select "Test Wizard App" (the app you created above)
2. Click **"Volgende"**
3. Take screenshot: `wizard-dienst-step1.png`

**Step 2 — Dienst-informatie:**
1. Fill in **naam**: `Test Wizard Dienst`
2. Fill in **website**: `https://test-leverancier.nl/dienst`
3. Fill in **beschrijvingKort**: `Dienst aangemaakt via wizard test`
4. Select **diensttype**: "Implementatieondersteuning" (or any available option)
5. Click **"Volgende"**
6. Take screenshot: `wizard-dienst-step2.png`

**Step 3 — Controleren:**
1. Verify all data
2. Take screenshot: `wizard-dienst-step3.png`
3. Click **"Dienst registreren"**
4. Verify success: "Dienst succesvol aangemeld!"

### Wizard 3: Koppeling publiceren

**Route**: Click **"Koppeling publiceren"** on the dashboard (or navigate to `/forms/koppeling?type=eigen-organisatie`)

**Step 1 — Koppeling zoeken (Applicatie selectie):**
1. Select an applicatie from the dropdown (e.g., "Test Wizard App")
2. The page shows existing koppelingen for the selected app
3. Take screenshot: `wizard-koppeling-step1.png`
4. Click **"Volgende"**

**Step 2 — Koppeling details:**
1. **Applicatie A** is pre-filled and locked (Test Wizard App)
2. Select **Richting**: "Bi-directioneel" (options: "A -> B", "B -> A", "Bi-directioneel")
3. In **Applicatie B**, search for and select another application (e.g., "DigiD")
4. Fill in **Naam**: `Test Wizard Koppeling`
5. Click **"Volgende"**
6. Take screenshot: `wizard-koppeling-step2.png`

**Step 3 — Aanvullende informatie:**
1. Fill in **beschrijvingKort**: `Koppeling aangemaakt via wizard test`
2. Skip optional fields (lange beschrijving, standaardversies, transportprotocol, intermediair)
3. Click **"Volgende"**
4. Take screenshot: `wizard-koppeling-step3.png`

**Step 4 — Controleren:**
1. Verify all data
2. Take screenshot: `wizard-koppeling-step4.png`
3. Click **"Opslaan"**
4. Verify success: "Koppelingen succesvol opgeslagen!"

### Wizard 4: Applicatiegebruik melden

**Route**: Click **"Applicatiegebruik melden"** on the dashboard (or navigate to `/forms/gebruik/applicatie?type=ontbrekend-organisatie`)

**Step 1 — Selecteren:**
1. In the **Applicatie** dropdown, select one of your published applications (e.g., "Test Wizard App")
2. In the **Klant(en)** multi-select dropdown, search for and select one or more municipalities/samenwerkingen (e.g., "Amsterdam")
3. Click **"Volgende"**
4. Take screenshot: `wizard-gebruik-voorstellen-step1.png`

**Step 2 — Controleren:**
1. Verify the overview: applicatie name, selected klant(en)
2. Note the informational alert about visibility
3. Take screenshot: `wizard-gebruik-voorstellen-step2.png`
4. Click **"Verzenden"**
5. Verify success: "Gebruik succesvol geregistreerd!"
6. Note the explanation that the klant must approve before it becomes definitive
7. Take screenshot: `wizard-gebruik-voorstellen-success.png`

### After Wizards: Verify Created Objects and Open Detail Pages

After completing all four wizards:
1. Navigate to `/beheer/applicaties` — verify "Test Wizard App" appears in the table
2. Navigate to `/beheer/diensten` — verify "Test Wizard Dienst" appears
3. Navigate to `/beheer/koppelingen` — verify "Test Wizard Koppeling" appears
4. Take screenshots of each table showing the created objects
5. **Find the IDs** of each created object:
   - Use the API: `curl -s -u {ADMIN_USER}:{ADMIN_PASS} '{BACKEND}/index.php/apps/openregister/api/objects/3/25?_search=Test+Wizard+App&_fields=naam,id&_limit=3'`
   - Or click the row in the beheer table and note the ID from the URL/detail panel
6. **Open the detail page** for each created object:
   - Navigate to `{FRONTEND}/publicatie/{applicatie-id}` for the app
   - Navigate to `{FRONTEND}/publicatie/{dienst-id}` for the dienst
   - Navigate to `{FRONTEND}/publicatie/{koppeling-id}` for the koppeling
7. On EACH detail page, test the tabs and content as described in the "Detail Page Testing" section above
8. Take screenshots of each detail page and each tab

---

## Testing Hints for Specific Issues

1. **#399 (cross-vendor version access)**: This bug is now **FIXED** (ModuleVersionService registered in DI). Go to the public search page `/zoeken?_page=1`. Find "Test Applicatie Leverancier 2" (from the other vendor), click it, go to the Versies tab, click on a version. Verify no error appears. If no Versies tab is visible, check the API: `curl -s -u {ADMIN_USER}:{ADMIN_PASS} '{BACKEND}/index.php/apps/openregister/api/objects/3/25?_search=Test+Applicatie+Leverancier+2&_extend=versies'`
2. **#375 (SaaS version)**: This bug is now **FIXED** — SaaS apps get a default 1.0.0 version automatically. After creating the wizard app, open its detail page at `{FRONTEND}/publicatie/{id}`, check the Versies tab. A "1.0.0" default version should exist. Also verify via API: `curl -s -u {PERSONA_USERNAME_URLENCODED}:{PERSONA_PASSWORD} '{BACKEND}/index.php/apps/openregister/api/objects/3/25?_search=Test+Wizard+App&_extend=versies&_fields=naam,versies'`
3. **#105 (RBAC)**: Navigate to `/beheer/applicatielandschappen` — it should ONLY show your own org's applications. The test is about **data scoping** (own org only), not page visibility.
4. **#352 (Mijn Account)**: Navigate to `/mijn-account` (or find the "Mijn Account" link in the header/menu) to check contact person data.
5. **#364/#365 (contactpersonen)**: Navigate to `/beheer/contactpersonen` — Jan Pietersen should be listed. Click edit on a contact person to test #365.
6. **#402 (Edge vs Chrome)**: **SKIP** — untestable (single browser engine).
7. **#403 (delete dialog)**: In the applicaties table, click delete on "Test Wizard App", verify the dialog text, then click **Cancel** (don't actually delete).
8. **#15 (export)**: In the applicaties table, click the **"Acties"** dropdown button, then hover/click **"Exporteren"**, then click **"Als CSV"**. Verify a file downloads. Also test "Als Excel". The export bug (#355) is **FIXED** — exports now return HTTP 200 with proper data including resolved names for UUID columns.
9. **#141 (merge)**: Not for this persona — tested by functioneel-beheerder via Nextcloud backend.
10. **#348 (Centric Begraven standaarden)**: Find "Centric Begraven" by searching the API:
    ```
    curl -s -u {ADMIN_USER}:{ADMIN_PASS} '{BACKEND}/index.php/apps/openregister/api/objects/3/25?_search=Begraven&_fields=naam,id&_limit=5'
    ```
    Then navigate to `{FRONTEND}/publicatie/{id}` and check the Standaarden tab — verify the standard count matches between the tab header badge and the actual list.
11. **Detail page issues (#248, #351, #371-#378, #380, #382, #385, #408)**: These ALL require opening detail pages. After the wizards, use the IDs from step "After Wizards" above and navigate to `{FRONTEND}/publicatie/{id}`. Test EACH tab on the detail page systematically. Do NOT skip this — it covers 20+ issues.

### PowerPoint comparison issues — How to test WITHOUT a PowerPoint

Issues #294, #359, #360, #361, #362, #363, #376, #386, #387, #390 were previously CANNOT_TEST because they reference a PowerPoint presentation for label comparison. You do NOT need the PowerPoint. Instead, test these by **reading the actual text** on the wizard pages and comparing it against the acceptance criteria in `issues.md`. Use `browser_snapshot` to capture all text on each wizard step.

12. **#294 (uitlijning rechthoek)**: During the Applicatie wizard, at the Referentiecomponenten step, observe whether the selection area/rectangle is properly aligned. Take a screenshot and check visual alignment. Use `browser_snapshot` to capture the page structure.

13. **#359 (dienst wizard tekst aanpassen)**: Re-run the dienst wizard (navigate to `/forms/dienst?type=eigen`). At each step, use `browser_snapshot` to read ALL text including:
    - Step headers and subtitles
    - Form field labels
    - Tooltip text (hover over `i` icons using `browser_hover`)
    - Button labels ("Volgende", "Dienst registreren")
    Compare against the acceptance criteria in `issues.md` for #359.

14. **#360 (dienst wizard tooltip `i` icons)**: During the dienst wizard, at each step:
    1. Use `browser_snapshot` to find all `i` (info) icons
    2. Hover over each `i` icon using `browser_hover` and take a screenshot
    3. Read the tooltip text — compare against `issues.md` #360 criteria
    4. Check: Do all fields that should have an `i` icon actually have one?

15. **#361 (dienst wizard label inconsistentie)**: During the dienst wizard:
    1. At the input step, use `browser_snapshot` to record all field labels (e.g., "Naam", "Website", "Korte omschrijving")
    2. Advance to the review/controleren step
    3. Use `browser_snapshot` to record all labels on the review
    4. Compare: Do the review labels match the input labels exactly? (e.g., "Naam" in input → "Naam" in review, not "Dienstnaam")

16. **#362 (dienst wizard header text)**: At the success/confirmation page of the dienst wizard:
    1. Use `browser_snapshot` to capture the full page text
    2. Check the header text — does it make logical sense? (e.g., should say "Dienst registreren" not "Uw dienst publiceren" if it's not published yet)

17. **#363 (catalogus vs softwarecatalogus)**: At the success page of the dienst wizard:
    1. Use `browser_snapshot` and search for the word "catalogus"
    2. Verify it says "softwarecatalogus" (full name), not just "catalogus"
    3. Check all wizard steps for this consistency

18. **#376 (wizard vs table labels)**: After completing the Applicatie wizard:
    1. Use `browser_snapshot` on the last wizard step (review) — note all field labels
    2. Navigate to `/beheer/applicaties` — use `browser_snapshot` to read all column headers
    3. Compare: Do the wizard field labels match the table column headers? E.g., if the wizard says "Korte omschrijving", the table should also say "Korte omschrijving" (not "Beschrijving")

19. **#386 (applicatie wizard andere labels)**: During the Applicatie wizard (`/forms/applicatie?type=eigen`):
    1. At each step, use `browser_snapshot` to capture all field labels
    2. Compare against `issues.md` #386 acceptance criteria
    3. Focus on: Are the step titles correct? Do form labels match expected naming?

20. **#387 (applicatie wizard tooltip `i` missing)**: During the Applicatie wizard:
    1. At each step, use `browser_snapshot`
    2. Check which fields have an `i` (info) icon next to them
    3. Hover over each `i` icon with `browser_hover` → take screenshot
    4. List which fields have `i` icons and which don't
    5. Compare against `issues.md` #387 — which fields SHOULD have tooltip icons?

21. **#390 (applicatie wizard review labels)**: During the Applicatie wizard:
    1. On input steps, record all field labels using `browser_snapshot`
    2. On the final review/controleren step, record all displayed labels
    3. Compare: Do the review labels match the input labels?
    4. Example mismatch: input says "Clouddienstverleningsmodel", review says "Cloud" — this is a label inconsistency

### Standards and compliance testing

22. **#378 (standaarden change after edit)**: This requires a before/after comparison:
    1. Navigate to the detail page of "Test Wizard App" at `{FRONTEND}/publicatie/{id}`
    2. Go to the **Standaarden** tab — use `browser_snapshot` to record the exact list of standards and their compliance status. **Save this as the "before" state.**
    3. Navigate to `/beheer/applicaties`, click **Acties** → **Bewerken** on "Test Wizard App"
    4. In the wizard, advance to the Standards step — make a small change (e.g., toggle one compliance checkbox)
    5. Complete the wizard (save the edit)
    6. Navigate back to the detail page → Standaarden tab
    7. Use `browser_snapshot` to record the standards list. **Compare with the "before" state.**
    8. Check: Did any standards disappear or change unexpectedly? Did only your intended change take effect?

23. **#380 (compliance counts mismatch)**: On an application detail page with standards:
    1. Note the **tab badge count** on the "Standaarden" tab (e.g., "Standaarden (45)")
    2. Click the Standaarden tab
    3. Count the actual number of standards listed in the table (use `browser_snapshot` and count rows)
    4. Compare: Does the badge count (45) match the actual number of rows?
    5. Also check subcategories: count "Verplicht", "Aanbevolen", "Toegevoegd" separately and verify they add up to the total
    6. Test on both "Test Wizard App" and a well-known app like "Centric Begraven"

### Koppeling and data issues

24. **#401 (empty koppeling cards)**: Navigate to an **imported** koppeling detail page (not one you created via wizard):
    1. Find imported koppelingen via API: `curl -s -u {PERSONA_USERNAME_URLENCODED}:{PERSONA_PASSWORD} '{BACKEND}/index.php/apps/openregister/api/objects/3/28?_limit=10&_fields=naam,id,applicatieA,applicatieB'`
    2. Navigate to `{FRONTEND}/publicatie/{koppeling-id}` for an imported koppeling
    3. Verify the card shows: naam, applicatie A name, applicatie B name, richting, beschrijving
    4. If the card is mostly empty (shows only UUID or blank fields), mark as FAIL
    5. Compare with your wizard-created koppeling — does it show the same fields?

25. **#391 (existing org user test)**: This tests adding a user to an already-registered organization:
    1. This requires the functioneel-beheerder to have created a second user for "Test Leverancier BV" organization beforehand
    2. If a second leverancier user exists (check `issues.md` for setup), log in with that user
    3. Verify they see the same organization data as Jan Pietersen
    4. If no second user exists, mark as **BLOCKED** (not CANNOT_TEST) with note: "Requires functioneel-beheerder to create a second user for Test Leverancier BV"

## Instructions

When running tests for this persona:
1. Navigate to `{FRONTEND}/login`
2. Log in with `{PERSONA_USERNAME}` / `{PERSONA_PASSWORD}`
3. **FIRST**: Execute ALL FOUR wizard walkthroughs above (applicatie, dienst, koppeling, applicatiegebruik melden). This is mandatory.
4. After wizards complete, verify created objects in beheer tables
5. **THEN**: Test each issue from the Issues to Test table, using the acceptance criteria from `issues.md`
6. For wizard-related issues (#294, #274, #306-#308, #312, #314, #354-#363, #368-#369, #376-#378, #380, #383-#390, #407, #408): test during or immediately after the relevant wizard execution
7. For use-reporting issues (#8, #10, #54): test during or after the applicatiegebruik melden wizard (Wizard 4)
7. Check that vendor-specific data (customer lists) is private
8. Write results to `test-results/leverancier/results-authenticated.md`
9. For each issue, list which acceptance criteria passed and which failed

## Rules

- **READ ONLY on GitHub issues** — never update, close, or comment on issues
- Write test results ONLY to local files in the `test-results/` directory
- Take screenshots for evidence where applicable
