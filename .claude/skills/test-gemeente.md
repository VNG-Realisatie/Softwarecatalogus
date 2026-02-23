# Test Agent: Gemeente (Municipality)

## Persona

**Maria van der Berg** — ICT-coördinator at a medium-sized Dutch municipality, 8 years experience.

## Role: Gebruik-beheerder

Maria manages her municipality's software landscape in the Softwarecatalogus. She registers which applications her municipality uses, manages connections between systems, and uses benchmarking to compare with similar municipalities.

## Login Credentials

- **Username**: `maria.vanderberg@test.nl`
- **Password**: `WelcomeToTest2026`
- **Groups**: gebruik-beheerder, software-catalog-users

## Test Environment

- **Frontend**: http://localhost:3000/
- **Backend**: http://localhost:8080/
- **Browser**: Use Playwright MCP browser tools (prefixed `mcp__browser-N__`, where N is assigned by the orchestrator)
- **Login URL**: http://localhost:3000/login

## Test Scope

### Primary Steps
- **Step 4**: First login — Log in as gemeente user, verify dashboard
- **Step 6**: Organization profile — Complete municipality profile, join samenwerkingen
- **Step 9**: Dienst wizard — Register diensten for municipality applications (gemeente perspective)
- **Step 10**: Usage reporting — Register application usage, create usage reports
- **Step 11**: Connection wizard — Register connections between applications (gemeente perspective)
- **Step 12**: Privacy and visibility — Verify gemeente can only see own usage/connections
- **Step 13**: Excel export — Export municipality data
- **Step 14**: Search and results — Search for applications, filter results
- **Step 17**: "Gluren bij de buren" — Compare with other municipalities

### Secondary Steps (observe/verify)
- **Step 7/8**: Product pages — Verify product detail pages show correct info
- **Step 16**: Standards — Filter on standards support
- **Step 22**: Advanced search — Complex filter combinations

## Issues to Test

### Previously tested (re-verify with auth):
| Issue | Title | Previous Status |
|-------|-------|-----------------|
| #144 | Overzicht organisaties met zoek- en filteropties | PASS |
| #266 | Na inloggen: Mijn account & persoonlijke gegevens leeg? | CANNOT_TEST |
| #280 | Zoeken: sorteren gaat niet goed | PARTIAL |
| #340 | Bevindingen op tussenoplevering Zoeken | PARTIAL |
| #342 | Zoeken: op kaartjes referentiecomponenten duidelijk maken | FAIL |
| #344 | Zoeken: Geen resultaten bij Gravenbeheercomponent | PASS |
| #350 | De link achter de gebruikersnaam verwijzen naar Mijn account | CANNOT_TEST |
| #353 | Mijn account – Je "functie" wordt niet aangepast na bewerken en opslaan | CANNOT_TEST |
| #355 | Diensten: Export geeft allerlei UUID's | CANNOT_TEST |
| #395 | Menu linkerkant verdwijnt | PARTIAL |

### New issues (not previously tested):
| Issue | Title | Test Step |
|-------|-------|-----------|
| #15 | Data vanuit softwarecatalogus exporteren | Step 13 |
| #278 | Filterteksten aanpassen | Step 14 |
| #286 | Aanmelden organisatie: 500-error bij wachtwoord wijzigen | Step 4 |
| #315 | Hoge prioriteit: Zoekpagina toont deel van gemeentelijk applicatielandschap | Step 14 |
| #316 | Dienst toevoegen: Stap 1 Dienst zoeken | Step 9 (gemeente dienst wizard) |
| #317 | Dienst toevoegen: Stap 2 Gebruiksinformatie | Step 9 (gemeente dienst wizard) |
| #318 | Dienst toevoegen: Stap 3 Controleren | Step 9 (gemeente dienst wizard) |
| #319 | Koppeling toevoegen: Stap 1 Koppeling zoeken | Step 11 (gemeente koppeling wizard) |
| #320 | Koppeling toevoegen: Stap 2 Gebruiksinformatie | Step 11 (gemeente koppeling wizard) |
| #321 | Koppeling toevoegen: Stap 3 Deelnemer | Step 11 (gemeente koppeling wizard) |
| #322 | Koppeling toevoegen: Stap 4 Controleren | Step 11 (gemeente koppeling wizard) |
| #323 | Applicatie toevoegen: Stap 1 Applicatie zoeken | Step 10 (gemeente app wizard) |
| #324 | Applicatie toevoegen: Stap 2 Gebruiksinformatie | Step 10 (gemeente app wizard) |
| #325 | Applicatie toevoegen: Stap 3 Referentiecomponenten | Step 10 (gemeente app wizard) |
| #326 | Applicatie toevoegen: Stap 4 Deelnemer | Step 10 (gemeente app wizard) |
| #327 | Applicatie toevoegen: Stap 5 Controleren | Step 10 (gemeente app wizard) |
| #328 | Applicatie toevoegen: Stap 1.1 Nieuwe applicatie opvoeren | Step 10 (gemeente app wizard) |
| #343 | Zoeken: Filter 'Type koppeling' toevoegen | Step 14 |
| #345 | Zoeken: toegevoegde dienst verschijnt niet in filters | **MOVED → bezoeker** (public search page) |
| #346 | Zoeken: paginering werkt niet | Step 14 |
| #347 | Zoeken: Dienstkaartje toont array | **MOVED → bezoeker** (public search page) |
| #349 | Zoeken: UUID's onder standaarden filter | Step 14 |

## Acceptance Criteria Reference

**IMPORTANT**: Before testing each issue, read its detailed acceptance criteria in `issues.md` (in the repository root). Each issue has specific, testable acceptance criteria with checkboxes. Use these criteria to determine PASS/FAIL/PARTIAL status:
- **PASS** = ALL acceptance criteria are met
- **PARTIAL** = Some criteria met, some not
- **FAIL** = Key criteria not met or feature is broken
- **CANNOT_TEST** = Feature not accessible or environment issue prevents testing

## Detail Page Testing

For each detail page type, navigate to the public detail page and verify the following:

### Applicatie Detail Page
- Navigate to an application detail page (e.g., from search results → click an application)
- **Tabs**: Verify all tabs load (Beschrijving, Diensten, Koppelingen, Standaarden, Gebruik, Versies)
- **Tab loading**: Check that tabs load consistently without excessive delays (#351)
- **Tab titles**: Verify tab titles match the design specification (#248)
- **Diensten tab**: Verify linked services are shown (#373)
- **Standaarden tab**: Check standards display correctly, no UUIDs visible (#371, #374)
- **Compliance**: Verify compliance display is consistent and counts match
- **Gebruik tab**: As logged-in gemeente user, verify you can see usage data for your own municipality
- **Gebruik tab privacy**: Verify you canNOT see other municipalities' detailed usage (#315)
- **Referentiecomponenten**: Check that reference components are clearly labeled on the card (#342)
- **Versies**: Check version display

### Koppeling Detail Page
- Navigate to a connection detail page (from search or from an application's Koppelingen tab)
- **Card display**: Verify the card shows meaningful data, not empty fields (#401)
- **Direction**: Check that the connection direction (richting) is displayed
- **Linked applications**: Verify both source and target applications are shown with names (not UUIDs)
- **Filter "Type koppeling"**: Verify the connection type filter exists and works (#343)

### Dienst Detail Page
- Navigate to a service detail page (from search results or from an application's Diensten tab)
- **Beschrijving tab**: Verify description tab exists and shows content (#408)
- **Labels**: Check that labels are consistent (no mix of "Diensttype" and "Type") (#357)
- **Array display**: Check that fields don't show raw arrays like `["value1","value2"]` (#347)
- **Search filter**: After viewing a dienst, verify it appears in the search filters (#345)

### Organisatie Detail Page
- Navigate to an organization detail page (e.g., from search or organization overview)
- **Profile fields**: Verify all profile fields are shown correctly
- **Type**: Verify the organization type (Leverancier/Gemeente/Samenwerking) is displayed
- **Privacy**: As gemeente user, verify **gemeente** contactpersonen are NOT publicly visible (#394). Note: leverancier contactpersonen ARE expected to be public via publications.
- **Applications**: If the org is a leverancier, verify their published applications are listed

## Wizard Walkthroughs — MANDATORY

**CRITICAL**: As gebruik-beheerder, you have access to "toevoegen" (add) wizards. You MUST execute ALL THREE wizards below before testing search/filter issues. This creates test data for your municipality.

### Wizard 1: Applicatie toevoegen (gebruik registreren)

**Route**: Navigate to `/beheer` dashboard and click **"Applicatie toevoegen"** button (or go to `/forms/gebruik/applicatie?type=gemeente`)

**Step 1 — Applicatie selecteren:**
1. In the dropdown, search for and select an existing application (e.g., "Centric Burgerzaken")
2. If the desired application is not listed, click **"Ik kan de gewenste applicatie niet vinden"** and fill in naam: `Test Gemeente App`
3. Click **"Volgende"**
4. Take screenshot: `wizard-gemeente-app-step1.png`

**Step 2 — Gebruiksinformatie:**
1. Select **Hosting**: any option (SaaS/on-premise/hybrid)
2. Fill in **Interne notitie**: `Testregistratie via wizard`
3. **Status**: Leave default (Verwerving)
4. **Startdatum**: Auto-filled with today's date
5. Select **Applicatieversie** if available
6. Click **"Volgende"**
7. Take screenshot: `wizard-gemeente-app-step2.png`

**Step 3 — Referentiecomponenten:**
1. Review "Referentiecomponenten aangegeven door leverancier" (read-only)
2. In the **Referentiecomponenten toevoegen** dropdown, search for and select a component (e.g., "Zaakregistratiecomponent")
3. Click **"Volgende"**
4. Take screenshot: `wizard-gemeente-app-step3.png`

**Step 4 — Controleren:**
1. Verify all data: status, startdatum, applicatie, referentiecomponenten
2. Take screenshot: `wizard-gemeente-app-review.png`
3. Click **"Gebruik registreren"**
4. Verify success: "Gebruik succesvol geregistreerd!"
5. Take screenshot: `wizard-gemeente-app-success.png`

### Wizard 2: Dienst toevoegen

**Route**: Navigate to `/beheer/diensten` and click **"Toevoegen"** button

**Step 1 — Applicaties:**
1. In the dropdown, search for and select an applicatie (e.g., an app from your municipality's landscape)
2. Click **"Volgende"**
3. Take screenshot: `wizard-gemeente-dienst-step1.png`

**Step 2 — Dienst informatie:**
1. Fill in **naam**: `Test Gemeente Dienst`
2. Fill in **website**: `https://test-gemeente.nl/dienst` (optional)
3. Fill in **beschrijvingKort**: `Dienst geregistreerd door Test Gemeente`
4. Select **diensttype**: "Functioneel beheer" (multi-select, options: Functioneel beheer, Applicatiebeheer, Technisch beheer, Implementatieondersteuning, Opleidingen, Licentiereseller)
5. Skip optional fields (logo, uitgebreide omschrijving, contactpersoon)
6. Click **"Volgende"**
7. Take screenshot: `wizard-gemeente-dienst-step2.png`

**Step 3 — Controleren:**
1. Verify all data: naam, diensttype, linked applicatie
2. Take screenshot: `wizard-gemeente-dienst-review.png`
3. Click **"Dienst registreren"**
4. Verify success: "Dienst succesvol aangemeld!"
5. Take screenshot: `wizard-gemeente-dienst-success.png`

### Wizard 3: Koppeling toevoegen

**Route**: Navigate to `/beheer/koppelingen` and click **"Toevoegen"** button

**Step 1 — Koppeling zoeken:**
1. Select an **Applicatie** from the dropdown (e.g., one from your municipality's landscape)
2. Review "Bestaande koppelingen" section (may be empty)
3. Click **"Volgende"**
4. Take screenshot: `wizard-gemeente-koppeling-step1.png`

**Step 2 — Koppeling definiëren:**
1. **Applicatie A** is pre-filled and locked
2. Select **Richting**: "A -> B" (options: "A -> B", "B -> A", "Bi-directioneel")
3. In **Applicatie B of BGV**, search for and select a target (e.g., "MijnOverheid.nl" or another app)
4. Fill in **Naam**: `Test Gemeente Koppeling`
5. Select **Status**: any option
6. Click **"Volgende"**
7. Take screenshot: `wizard-gemeente-koppeling-step2.png`

**Step 3 — Aanvullende informatie:**
1. Fill in **beschrijvingKort**: `Koppeling geregistreerd door Test Gemeente` (max 255 chars)
2. Skip optional fields (lange beschrijving, standaardversies, transportprotocol, intermediair)
3. Click **"Volgende"**
4. Take screenshot: `wizard-gemeente-koppeling-step3.png`

**Step 4 — Controleren:**
1. Verify koppeling naam and direction (e.g., "Applicatie A -> Applicatie B")
2. Take screenshot: `wizard-gemeente-koppeling-review.png`
3. Click **"Opslaan"**
4. Verify success: "Koppelingen succesvol opgeslagen!"
5. Take screenshot: `wizard-gemeente-koppeling-success.png`

### After Wizards: Verify Created Objects

After completing all three wizards:
1. Navigate to `/beheer/applicaties` — verify the registered applicatie appears in the table
2. Navigate to `/beheer/diensten` — verify "Test Gemeente Dienst" appears
3. Navigate to `/beheer/koppelingen` — verify "Test Gemeente Koppeling" appears
4. Take screenshots of each table showing the created objects

---

## Testing Hints for Specific Issues

1. **#344 (Referentiecomponenten filter)**: Click the Referentiecomponenten filter dropdown on the search page and TYPE "Graven" — NcSelect supports type-to-filter search.
2. **#286 (password change 500 error)**: Test via Contactpersonen list — click password change on a contact person, verify no 500 error.
3. **#15 (export)**: In the applicaties table, click **"Acties"** dropdown → **"Exporteren"** → **"Als CSV"**. Verify download. Also test "Als Excel".
4. **#355 (diensten export UUIDs)**: Same as #15 but for the diensten table — check that exported columns use readable names, not UUIDs.

## Instructions

When running tests for this persona:
1. Navigate to http://localhost:3000/login
2. Log in with `maria.vanderberg@test.nl` / `WelcomeToTest2026`
3. **FIRST**: Execute ALL THREE wizard walkthroughs above (applicatie, dienst, koppeling). This is mandatory.
4. After wizards complete, verify created objects in beheer tables
5. **THEN**: Test each issue from the Issues to Test table, using acceptance criteria from `issues.md`
6. For wizard-related issues (#316-#328): test during or immediately after the relevant wizard execution
7. Test all search and filter functionality
8. Pay special attention to privacy — gemeente should NOT see other organizations' private data
9. Write results to `test-results/gemeente/results-authenticated.md`
10. For each issue, list which acceptance criteria passed and which failed

## Rules

- **READ ONLY on GitHub issues** — never update, close, or comment on issues
- Write test results ONLY to local files in the `test-results/` directory
- Take screenshots for evidence where applicable
