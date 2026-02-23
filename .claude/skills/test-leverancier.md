# Test Agent: Leverancier (Vendor)

## Persona

**Jan Pietersen** — Director of a small software company (8 employees), 15 years experience in municipal software.

## Role: Aanbod-beheerder

Jan manages his company's products in the Softwarecatalogus. He registers applications, services, connections, and standards. He also manages which municipalities use his products.

## Login Credentials

- **Username**: `jan.pietersen@test.nl`
- **Password**: `WelcomeToTest2026`
- **Groups**: aanbod-beheerder, software-catalog-users

## Test Environment

- **Frontend**: http://localhost:3000/
- **Backend**: http://localhost:8080/
- **Browser**: Use Playwright MCP browser tools (prefixed `mcp__browser-N__`, where N is assigned by the orchestrator)
- **Login URL**: http://localhost:3000/login

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
| #294 | Applicatie publiceren: uitlijning rechthoek | CANNOT_TEST |
| #300 | Beheer: overzicht applicaties teveel applicaties | CANNOT_TEST |
| #302 | Beheer: applicatie bewerken (ophalen van gegevens is traag) | CANNOT_TEST |
| #370 | Applicatie: teveel kolommen worden getoond | PASS |
| #373 | Applicatie: Gekoppelde diensten worden niet getoond | FAIL |
| #375 | Applicaties: versie voor SaaS applicaties? | PARTIAL |
| #376 | Applicaties: labels wizard en tabel zijn anders | CANNOT_TEST |
| #377 | Applicaties: tabel toont diensten niet | CANNOT_TEST |
| #379 | Applicatie: verschillende manier van tonen compliancy | PARTIAL |
| #380 | Applicatie: compliance aantallen komen niet overeen | CANNOT_TEST |
| #381 | Applicaties: non-compliant vervangen door niet ondersteund | PASS |
| #382 | Applicatie: compliancy link werkt niet | PASS |
| #383 | Applicatie: selectie vakken werken niet | CANNOT_TEST |
| #384 | Applicaties: eenduidige manier van bewerken | CANNOT_TEST |
| #385 | Applicatie: Geen huidige versie in gebruik | PASS |
| #386 | Applicaties – Uw applicatie publiceren: andere labels | CANNOT_TEST |
| #387 | Applicaties – Uw applicatie publiceren: i niet aanwezig | CANNOT_TEST |
| #390 | Applicaties – Uw applicatie publiceren: labels komen niet overeen | CANNOT_TEST |
| #399 | Versies: versie van andere leverancier geeft foutmelding | CANNOT_TEST |
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
| #392 | Back-end: geimporteerde gebruiker geeft error bij omzetten naar user | Step 3 |
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

## Detail Page Testing

For each detail page type, navigate to the page and verify the following:

### Applicatie Detail Page
- Navigate to an application detail page (e.g., from Beheer → Applicaties → click an application)
- **Tabs**: Verify all tabs load (Beschrijving, Diensten, Koppelingen, Standaarden, Gebruik, Versies)
- **Tab loading**: Check that tabs load consistently without delays (#351)
- **Tab titles**: Verify tab titles match the design specification (#248)
- **Diensten tab**: Verify linked services are shown (not empty) (#373)
- **Standaarden tab**: Check standards display correctly, no UUIDs (#371, #374)
- **Compliance**: Verify compliance display is consistent (#379), counts match (#380)
- **Contactpersoon**: Verify contact person shows full name including tussenvoegsel (#372)
- **Gebruik tab**: When NOT logged in, municipality names should NOT be visible (#263)
- **Versies**: Check version display, especially for SaaS applications (#375)

### Koppeling Detail Page
- Navigate to a connection detail page (from Beheer → Koppelingen → click a koppeling)
- **Card display**: Verify the card shows meaningful data, not empty (#401)
- **Direction**: Check that the connection direction (richting) is displayed
- **Linked applications**: Verify both source and target applications are shown
- **Name**: Verify the connection has a proper name (#312)

### Dienst Detail Page
- Navigate to a service detail page (from Beheer → Diensten → click a dienst)
- **Beschrijving tab**: Verify description tab exists and shows content (#408)
- **Labels**: Check that "Diensttype" vs "Type" is used consistently (#357)
- **Status**: Verify "Concept" status is not shown in unintended places (#358)
- **Contactpersoon**: Verify tussenvoegsel is shown in names (#356)
- **Array display**: Check that fields don't show raw arrays (#347)

### Organisatie Detail Page
- Navigate to an organization detail page (from Beheer → Organisaties → click an organisatie)
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

### After Wizards: Verify Created Objects

After completing all four wizards:
1. Navigate to `/beheer/applicaties` — verify "Test Wizard App" appears in the table
2. Navigate to `/beheer/diensten` — verify "Test Wizard Dienst" appears
3. Navigate to `/beheer/koppelingen` — verify "Test Wizard Koppeling" appears
4. Take screenshots of each table showing the created objects

---

## Testing Hints for Specific Issues

1. **#399 (cross-vendor)**: Go to the public search page `/zoeken?_page=1`. Find "Test Applicatie Leverancier 2" (from the other vendor), click it, go to the Versies tab, click on a version. Verify no error.
2. **#375 (SaaS version)**: After creating the wizard app, go to `/zoeken?_page=1`, find "Test Wizard App", check the Versies tab for a default version.
3. **#105 (RBAC)**: Navigate to `/beheer/applicatielandschappen` — it should ONLY show your own org's applications. The test is about **data scoping** (own org only), not page visibility.
4. **#352 (Mijn Account)**: Navigate to the Mijn Account page to check contact person data.
5. **#364/#365 (contactpersonen)**: Check the Contactpersonen page — Jan Pietersen should be listed.
6. **#402 (Edge vs Chrome)**: **SKIP** — untestable (single browser engine).
7. **#403 (delete dialog)**: In the applicaties table, click delete on "Test Wizard App", verify the dialog text, then click **Cancel** (don't actually delete).
8. **#15 (export)**: In the applicaties table, click the **"Acties"** dropdown button, then hover/click **"Exporteren"**, then click **"Als CSV"**. Verify a file downloads. Also test "Als Excel".
9. **#141 (merge)**: Not for this persona — tested by functioneel-beheerder via Nextcloud backend.

## Instructions

When running tests for this persona:
1. Navigate to http://localhost:3000/login
2. Log in with `jan.pietersen@test.nl` / `WelcomeToTest2026`
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
