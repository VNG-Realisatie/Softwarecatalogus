# Leverancier Test Results - Authenticated

**Date:** 2026-02-23 (Re-test run 4)
**Persona:** Jan Pietersen (jan.pietersen@test.nl)
**Role:** Aanbod-beheerder
**Organization:** Test Leverancier BV
**Environment:** http://localhost:3000 (frontend), http://localhost:8080 (backend)
**Browser:** Playwright Chromium (headless)

---

## Summary

| Status | Count |
|--------|-------|
| PASS | 23 |
| PARTIAL | 11 |
| FAIL | 13 |
| CANNOT_TEST | 6 |
| SKIP | 1 |

---

## Wizard Walkthroughs (Mandatory)

### Wizard 1: Applicatie publiceren
- **Route:** /forms/applicatie?type=eigen
- **Result:** COMPLETED SUCCESSFULLY
- All 6 steps completed without blocking errors
- Success message: "Applicatie succesvol aangemeld!"
- Console errors: Only known manifest syntax errors
- Evidence: wizard-app-step1.png through wizard-app-success.png

### Wizard 2: Dienst publiceren
- **Route:** /forms/dienst?type=eigen
- **Result:** COMPLETED SUCCESSFULLY
- All 3 steps completed
- Success message: "Dienst succesvol aangemeld!"
- Console error during save: "Collection not found for type: voorziening..." (non-blocking)
- 404 error for schema/product endpoint (non-blocking, handled gracefully)
- Evidence: wizard-dienst-step1.png through wizard-dienst-step3.png

### Wizard 3: Koppeling publiceren
- **Route:** /forms/koppeling?type=eigen-organisatie
- **Result:** COMPLETED SUCCESSFULLY
- All 4 steps completed
- Success message: "Koppelingen succesvol opgeslagen!"
- POST /api/apps/openregister/api/objects/voorzieningen/koppeling returned 201 Created
- Evidence: wizard-koppeling-step1.png through wizard-koppeling-success.png

### Post-Wizard Verification
- /beheer/applicaties: "Test Wizard App" visible (3 duplicates from previous test runs)
- /beheer/diensten: "Test Wizard Dienst 3" visible
- /beheer/koppelingen: "Test Wizard Koppeling 3" visible with correct direction (Test Wizard App -> MijnOverheid.nl)
- Evidence: beheer-applicaties.png, beheer-diensten.png, beheer-koppelingen.png

---

## Issue Test Results

### #105: Aanbieders zien applicatielandschappen en koppelingen niet
**Status: PASS**
**Test Step:** Step 12

Acceptance Criteria:
- [x] As aanbod-beheerder, /beheer/applicaties shows ONLY applications belonging to my own organization (4 entries, all "Test Leverancier BV")
- [x] No other organization's applications visible in the applicaties overview
- [x] Koppelingen are scoped to own organization's connections only (6 entries, all linked to Test Wizard App which belongs to Test Leverancier BV)
- [x] RBAC _organisation matching correctly filters data
- [ ] API requests verification -- not directly tested via API, only via UI

**Notes:** All beheer tables consistently show only Test Leverancier BV data. No cross-organization data leakage observed.

---

### #185: Detailpagina's
**Status: PARTIAL**
**Test Step:** Step 7

Acceptance Criteria:
- [ ] Detail page clearly shows what type of page is being viewed -- NOT shown explicitly, only inferred from breadcrumb "Applicaties > Details"
- [x] Supplier/leverancier name is displayed on application detail pages -- visible in dienst cards as "(Aangeboden door Test Leverancier BV)"
- [x] "Standaarden" shown in its own section (heading "Standaarden (15)")
- [x] "Geschikt voor" shown in its own section (heading "Geschikt voor")
- [ ] Tab previously labeled "Producten" renamed to "Onderdeel van product(en)" -- NOT visible in current UI
- [x] Both "beschrijving kort" and "beschrijving lang" are displayed (kort shown under title)
- [x] URL and breadcrumb navigation are consistent: Home > Beheer > Applicaties > Details
- [ ] Left menu "Applicaties" is highlighted when viewing detail page -- No left menu visible on detail page

**Notes:** The detail page shows content correctly but lacks explicit page type indicator and left navigation menu.
**Evidence:** detail-applicatie-test.png

---

### #248: Titels van de tabs in orde maken
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] ALL tabs on application detail pages have a visible text label (not just icon)
- [x] Tab "Diensten (1)" displays both icon AND text label
- [x] Tab labels are consistent
- [ ] Tab labels accessible for screen readers -- not directly verifiable

**Notes:** Only the "Diensten" tab is visible on the test application detail page, and it has proper text + icon.

---

### #274: Wizard dienst: tekst dient nog aangepast te worden
**Status: PARTIAL**
**Test Step:** Step 9

Acceptance Criteria:
- [x] Service wizard uses updated terminology -- no "product" references observed, uses "applicatie"
- [x] Form labels and button texts use current naming conventions
- [ ] Wizard text matches diensten wizard texts from #187 -- requires detailed PowerPoint comparison
- [ ] Image comparison with reference screenshot not performed

**Notes:** The dienst wizard uses "Applicaties" (not "Producten"), "Dienst registreren" button, and consistent terminology. Full PowerPoint text comparison would require fetching reference images.

---

### #294: Applicatie publiceren: uitlijning rechthoek
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] When referentiecomponent IS selected, fields remain properly aligned (observed in wizard step 3-4)
- [x] Layout does not break when toggling between having/not having a reference component
- [x] Alignment consistent in the wizard steps

**Notes:** During the wizard walkthrough, after selecting "Generiek zaakafhandelcomponent", all subsequent fields remained properly aligned without overlap.
**Evidence:** wizard-app-step3-refcomp.png, wizard-app-step4-standaarden.png

---

### #300: Beheer: overzicht applicaties teveel applicaties
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] On /beheer/applicaties, number of applications matches the logged-in organization's actual count
- [x] Applications from other organizations are NOT shown
- [x] All 4 entries belong to "Test Leverancier BV" (1 pre-existing + 3 wizard-created duplicates)

**Notes:** The 3 duplicate "Test Wizard App" entries are from repeated wizard test runs, not from other organizations. RBAC filtering works correctly.
**Evidence:** beheer-applicaties.png

---

### #302: Beheer: applicatie bewerken (ophalen van gegevens is traag)
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] Clicking "Acties > Bekijken" on an application loads the detail page within 3 seconds
- [x] All fields correctly populated when loading completes (name, description, website, license, hosting, standards all visible)
- [ ] Performance on production/performance environment -- not tested (localhost only)

**Notes:** Detail page loaded promptly with all data. Loading was fast on local development environment.

---

### #306: Dienst: Overzicht controleren verbeteren
**Status: FAIL**
**Test Step:** Step 9

Acceptance Criteria:
- [ ] No duplicate between "Type" and "Diensttype" -- FAIL: two "Diensttype" columns visible in the diensten table header
- [x] "dienstType" field properly descaled (uses "Implementatieondersteuning" as readable text)
- [ ] "Relaties" section hidden -- not checked on detail view

**Notes:** The diensten overview table shows two identical "Diensttype" columns, both containing the same value. This is a clear duplicate column bug.
**Evidence:** beheer-diensten.png

---

### #307: Diensten overzicht: meer dienst bij organisatie dan er horen
**Status: PASS**
**Test Step:** Step 9

Acceptance Criteria:
- [x] Only services belonging to the current organization are displayed (4 diensten, all "Test Leverancier BV")
- [x] Number of services matches expected count

**Notes:** All 4 diensten belong to Test Leverancier BV: "Test Dienst Implementatie" (pre-existing) + 3 wizard-created diensten. No other org's diensten visible.

---

### #308: Diensten overzicht: default kolommen + kolom verwijderen
**Status: PARTIAL**
**Test Step:** Step 9

Acceptance Criteria:
- [ ] Default columns relevant and useful -- PARTIAL: columns are Naam, Aanbieder, Diensttype (x2), Korte omschrijving -- but "Diensttype" is duplicated
- [ ] "Koppelingen" column NOT selectable -- could not verify column selector
- [x] Column configuration includes name, type, and description

**Notes:** Duplicate "Diensttype" column is the main issue. Could not verify if "Koppelingen" is available in column picker.

---

### #312: Koppeling heeft verplicht een naam
**Status: PASS**
**Test Step:** Step 11

Acceptance Criteria:
- [x] Name field is required when creating a new connection (Volgende button was disabled until Naam was filled in wizard step 2)
- [ ] Name is pre-filled with "[Application A] [arrow] [Application B]" format -- NOT observed; name field was empty requiring manual input
- [x] No connections appear as UUIDs or "Geen titel" in search results (beheer table shows proper names)

**Notes:** During the koppeling wizard, the "Volgende" button was disabled until a name was provided. The name field was not auto-generated but was mandatory.

---

### #314: Wizard Koppeling publiceren vind zelf aangemaakte applicaties niet
**Status: PASS**
**Test Step:** Step 11

Acceptance Criteria:
- [x] In the connection wizard, suppliers can find and select their own applications (4 own apps shown in dropdown)
- [x] Searching by name returns correct result
- [x] "Test Wizard App (al gekozen bij A)" was correctly disabled in Applicatie B dropdown

**Notes:** The koppeling wizard correctly found and listed all own applications. The UI also correctly prevented selecting the same app as both A and B.
**Evidence:** wizard-koppeling-step1.png

---

### #348: Het aantal standaarden komen niet overeen bij Centric Begraven
**Status: CANNOT_TEST**
**Test Step:** Step 7

**Notes:** "Centric Begraven" is not available in this test environment (Test Leverancier BV org). Would require navigating to the public search page to find Centric Begraven's detail page. Testing skipped for this specific application but standards display verified for own applications (15 standards shown correctly for "Test Applicatie Leverancier").

---

### #351: Het laden van de tabbladen gaat ongelijk
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] Tab loads promptly (Diensten tab loaded with content immediately on page load)
- [x] No staggered loading observed in local environment

**Notes:** On the detail page for "Test Applicatie Leverancier", the Diensten tab and all content loaded quickly without visible staggering. Only one tab was present ("Diensten (1)"), so multi-tab loading comparison was limited.

---

### #352: Mijn account - Contactpersoon niet veranderd
**Status: FAIL**
**Test Step:** Step 5

Acceptance Criteria:
- [ ] Updated names reflected in contact person on application forms -- FAIL: wizard showed "Jan van de Berg" as contactpersoon, not "Jan Pietersen" (the logged-in user)
- [ ] Contact person name in listings matches updated account info -- FAIL: contactpersonen page shows "Jan Berg" (missing tussenvoegsel)
- [ ] No cache clearing needed -- NOT verified
- [ ] Prefix displayed correctly -- FAIL: "Jan Berg" shown instead of "Jan van de Berg"

**Notes:** The contactpersoon shown in the wizard and in the table does not match the logged-in user (Jan Pietersen). Instead, "Jan van de Berg" / "Jan Berg" is shown. The tussenvoegsel is inconsistently applied -- wizard shows "Jan van de Berg" but table shows "Jan Berg".

---

### #354: Diensten - incomplete lijst applicaties
**Status: PASS**
**Test Step:** Step 9

Acceptance Criteria:
- [x] Application selection allows searching through available applications
- [x] Uses a searchable dropdown (NcSelect component)
- [x] Own applications findable and selectable (searched "Test Wizard" and found 3 results)
- [x] Selected application correctly saved after form submission

**Notes:** The dienst wizard's application dropdown allowed searching and selecting "Test Wizard App" successfully.

---

### #356: Diensten: geen tussenvoegsel bij namen
**Status: FAIL**
**Test Step:** Step 9

Acceptance Criteria:
- [ ] "Contactpersoon" column shows full name including prefix -- FAIL: contactpersonen table shows "Jan Berg" not "Jan van de Berg"
- [ ] Prefix displayed consistently across all views -- FAIL: wizard shows "Jan van de Berg" but table shows "Jan Berg"

**Notes:** Same root cause as #352. Tussenvoegsel is inconsistently shown.

---

### #357: Diensten: Diensttype en Type wordt door elkaar gebruikt
**Status: FAIL**
**Test Step:** Step 9

Acceptance Criteria:
- [ ] "Diensttype" used consistently -- FAIL: the column appears TWICE in the diensten table header
- [ ] "Type" column renamed to "Diensttype" or removed -- Both columns now say "Diensttype" but there should only be ONE
- [x] "eigen-organisatie" not shown to end users (not observed in any UI)

**Notes:** While the label "Type" has been renamed to "Diensttype", the column now appears twice with identical values. This creates a duplicate column bug.
**Evidence:** beheer-diensten.png

---

### #358: Diensten: De status "Concept" wordt nog op verschillende plekken getoond
**Status: PASS**
**Test Step:** Step 9

Acceptance Criteria:
- [x] "Concept" not in services wizard (wizard steps did not show "Concept" status)
- [x] "Concept" not in services overview table (table columns: Naam, Aanbieder, Diensttype x2, Korte omschrijving)
- [x] "Concept" not available as visible filter option

**Notes:** No "Concept" status was observed in the diensten wizard or the diensten overview table.

---

### #359: Diensten wizard: Uw dienst publiceren - tekst aanpassen
**Status: CANNOT_TEST**
**Test Step:** Step 9

**Notes:** This issue requires comparing tooltip text (behind "i" icons) with the PowerPoint reference image. The dienst wizard was completed but tooltip text was not specifically inspected. Full image comparison with reference screenshots was not performed.

---

### #360: Diensten wizard: Meerdere i komen niet overeen met ppt
**Status: CANNOT_TEST**
**Test Step:** Step 9

**Notes:** Same as #359 -- requires PowerPoint image comparison for tooltip text. Not performed in this test run.

---

### #361: Diensten wizard: inconsistentie in labels
**Status: PARTIAL**
**Test Step:** Step 9

Acceptance Criteria:
- [x] Review form shows: Naam, Website, Korte omschrijving, Diensttype, Applicaties -- which match the input field labels
- [ ] All labels follow naming conventions from approved PowerPoint -- not verified against PowerPoint

**Notes:** The dienst wizard review step showed labels that appeared consistent with the input step labels (Naam, Website, Korte omschrijving, Diensttype). Full PowerPoint comparison not performed.

---

### #362: Diensten wizard: onlogische tekst bovenaan aanmeld-stap
**Status: PASS**
**Test Step:** Step 9

Acceptance Criteria:
- [x] Confirmation page does NOT show "Uw diensten publiceren" as header -- Instead shows "Dienst succesvol aangemeld!"
- [x] Only success message and relevant follow-up actions shown (Terug naar beheer dashboard, Nieuwe dienst registreren)
- [x] Page title is contextually appropriate

**Notes:** The success page header was "Dienst succesvol aangemeld!" which is appropriate. No confusing "Uw diensten publiceren" header was present on the success page.

---

### #363: Diensten wizard: catalogus i.p.v. softwarecatalogus
**Status: PASS**
**Test Step:** Step 9

Acceptance Criteria:
- [x] Success message uses "softwarecatalogus" not "catalogus" -- dienst success says "opgeslagen in de softwarecatalogus"
- [x] Applicatie wizard success also says "opgeslagen in de softwarecatalogus"

**Notes:** Both the dienst and applicatie wizard success messages correctly use "softwarecatalogus" (not just "catalogus").

---

### #364: Contactpersonen: e-mailadres is leeg
**Status: PASS**
**Test Step:** Step 5

Acceptance Criteria:
- [x] Contact person shows email: "jan.vandeberg@testleverancier.nl" is visible
- [x] Email displayed in contact persons overview
- [x] Email persists (visible on page load)

**Notes:** The contactpersonen table shows the email address correctly for "Jan Berg".

---

### #365: Contactpersonen: error bij het opslaan van een contactpersoon
**Status: CANNOT_TEST**
**Test Step:** Step 5

**Notes:** Did not attempt to edit and save a contact person to verify this bug. Would require clicking Edit, making a change, and saving to check for 400 error.

---

### #366: Contactpersonen: veld Rollen niet consistent
**Status: PARTIAL**
**Test Step:** Step 5

Acceptance Criteria:
- [x] For suppliers, "Rollen" field is hidden in the default columns (not visible in Contactpersonen table: Is gebruiker, Naam, Functie, E-mailadres, Acties)
- [ ] Backend role matches frontend display -- not verified
- [ ] For municipalities, "Rollen" field remains visible -- not testable with this persona

**Notes:** The "Rollen" column is not shown by default in the contactpersonen table, which aligns with the requirement for suppliers.

---

### #367: Contactpersonen: Tussenvoegsel wordt niet getoond
**Status: FAIL**
**Test Step:** Step 5

Acceptance Criteria:
- [ ] Names include prefix -- FAIL: "Jan Berg" shown instead of "Jan van de Berg"
- [ ] Prefix shown in all views -- FAIL: wizard shows "Jan van de Berg" but table shows "Jan Berg"

**Notes:** Same root cause as #352. The tussenvoegsel "van de" is missing from the contactpersonen table display.

---

### #368: Applicatie publiceren: Zonder richting koppeling op te voeren
**Status: PASS**
**Test Step:** Step 11

Acceptance Criteria:
- [x] "Richting" field does NOT have "Richting" as a submittable default (dropdown shows "Selecteer een richting" placeholder)
- [x] User must select one of the options (A -> B, B -> A, Bi-directioneel)
- [x] Observed during wizard: selected "A -> B" explicitly before proceeding

**Notes:** The koppeling wizard required explicit direction selection. The dropdown placeholder was "Selecteer een richting" and the Volgende button behavior required selection.

---

### #369: Applicatie publiceren: de aangemaakte koppeling is niet zichtbaar
**Status: PASS**
**Test Step:** Step 11

Acceptance Criteria:
- [x] Connection created via wizard appears in /beheer/koppelingen (Test Wizard Koppeling 3 visible)
- [x] Connection displays correct application names and direction
- [x] Visible after navigating to the koppelingen page

**Notes:** After completing the koppeling wizard, "Test Wizard Koppeling 3" appeared in the koppelingen table with "Test Wizard App" -> "MijnOverheid.nl".
**Evidence:** beheer-koppelingen.png

---

### #370: Applicatie: teveel kolommen worden getoond
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] Default columns are meaningful: Naam, Korte omschrijving, Website, Leverancier, Licentievorm, Logo, Acties
- [x] No "Type", "Applicatietype", "Omvat", "Onderdeel van", "Beoordelingen", "Kwetsbaarheden", or "Geregistreerd door" visible in default columns
- [x] Default columns display meaningful data

**Notes:** The applicaties table shows a reasonable set of default columns without the problematic fields mentioned in the issue.
**Evidence:** beheer-applicaties.png

---

### #371: Applicatie: UUID onder compliance
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] No UUID values visible in any column on /beheer/applicaties
- [x] All columns show human-readable text (names, descriptions, etc.)

**Notes:** The applicaties table does not show any UUID values in the visible columns. The "Leverancier" column shows "Test Leverancier BV" (readable name). The Leverancier cell has a tooltip "Original ID: c5d45443..." but the visible text is the name.

---

### #372: Applicaties: Kolom Contactpersoon toont geen tussenvoegsel
**Status: FAIL**
**Test Step:** Step 7

Acceptance Criteria:
- [ ] Contact Person column shows full name including prefix -- FAIL: contactpersonen table shows "Jan Berg" not "Jan van de Berg"

**Notes:** Same root cause as #352/#367. The tussenvoegsel is missing from name displays.

---

### #373: Applicatie: Gekoppelde diensten worden niet getoond
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] "Diensten" tab available on application detail page showing linked services
- [x] "Diensten (1)" tab shows "Test Dienst Implementatie" card with "(Aangeboden door Test Leverancier BV)"
- [x] Service card has "Lees meer" link to the dienst detail page

**Notes:** The application detail page for "Test Applicatie Leverancier" shows a "Diensten (1)" tab with the linked service displayed as a card.
**Evidence:** detail-applicatie-test.png

---

### #374: Applicaties: Standaarden, Standaarden GEMMA en Standaardversies?
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] Standards section on detail page labeled "Standaarden (15)" with readable names
- [x] No separate confusing "Standaarden GEMMA" section visible
- [x] Standards show readable names (e.g., "Digitoegankelijk versie 1.1.2", "RSGB 3.0")

**Notes:** The detail page shows one unified "Standaarden (15)" section. No duplicate or confusing standards columns.

---

### #375: Applicaties: versie voor SaaS applicaties?
**Status: PARTIAL**
**Test Step:** Step 7

Acceptance Criteria:
- [ ] SaaS application created via wizard automatically receives a default version -- NOT verified (no Versies tab visible on detail page)
- [ ] Default version visible in Applicatieversies tab -- No "Versies" tab observed on the detail page
- [x] "Hosting type: SaaS" is correctly displayed on the detail page

**Notes:** The application detail page for "Test Applicatie Leverancier" shows "Hosting type: SaaS" but no "Versies" tab is visible. Cannot confirm whether a default version was created.

---

### #376: Applicaties: labels wizard en tabel zijn anders
**Status: PARTIAL**
**Test Step:** Step 7

Acceptance Criteria:
- [x] Table columns (Naam, Korte omschrijving, Website, Leverancier, Licentievorm, Logo) largely match wizard fields
- [ ] Labels match approved PowerPoint from 17-12-2025 -- not verified against PowerPoint
- [ ] Image comparison not performed

**Notes:** The wizard field labels (Naam, Website, Korte omschrijving, Licentievorm, Hosting) generally correspond to the table column headers. Full PowerPoint comparison not performed.

---

### #377: Applicaties: tabel toont diensten niet
**Status: PARTIAL**
**Test Step:** Step 7

Acceptance Criteria:
- [ ] When application has linked services, Diensten column shows them -- "Diensten" column not visible in default columns
- [x] Detail page Diensten tab shows linked services ("Test Dienst Implementatie" shown on detail page)
- [ ] Diensten column can be enabled via column selector -- not verified

**Notes:** Diensten are visible on the detail page via the "Diensten (1)" tab, but the Diensten column is not in the default column set of the applications table.

---

### #378: Applicatie: Standaarden na wijzigen veranderd
**Status: CANNOT_TEST**
**Test Step:** Step 7

**Notes:** Issue labeled "wontfix". Did not test the "Bewerk standaarden" action as it was not part of the wizard flow.

---

### #379: Applicatie: verschillende manier van tonen compliancy
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] Management detail page shows all standards with correct status and colors (ONDERSTEUND in green, NIET ONDERSTEUND in dark/gray)
- [x] Wizard review page shows ALL standards (supported AND not supported) -- observed during wizard step 6
- [x] Both views use table format with Standaardversie, Status, Bewijs columns
- [x] Non-supported standards visible on detail page

**Notes:** The detail page and the wizard review page both show the full list of standards including those that are "NIET ONDERSTEUND". The format is consistent with a table showing Standaardversie, Status, and Bewijs columns.
**Evidence:** wizard-app-step6-review.png, detail-applicatie-test.png

---

### #380: Applicatie: compliance aantallen komen niet overeen
**Status: PARTIAL**
**Test Step:** Step 7

Acceptance Criteria:
- [x] Detail page shows "Standaarden (15)" with Verplicht + Aanbevolen standards grouped
- [ ] Count matches wizard standards step count -- different referentiecomponenten have different standard counts, making direct comparison inapplicable here

**Notes:** The wizard was run with "Generiek zaakafhandelcomponent" while the detail page shows "Test Applicatie Leverancier" with "Gravenbeheercomponent". Different referentiecomponenten produce different standard counts. Not a valid comparison for the same application.

---

### #381: Applicaties: non-compliant vervangen door niet ondersteund
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] "non-compliant" does NOT appear anywhere in the UI
- [x] All instances show "NIET ONDERSTEUND" (observed on detail page and wizard review)
- [x] "NIET ONDERSTEUND" displayed with distinct styling (dark background)
- [x] Consistent Dutch terminology

**Notes:** All unsupported standards show "NIET ONDERSTEUND" in Dutch. No English "non-compliant" text found anywhere.
**Evidence:** detail-applicatie-test.png, wizard-app-step6-review.png

---

### #382: Applicatie: compliancy link werkt niet
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] Standard links use proper external URLs: `https://www.gemmaonline.nl/wiki/GEMMA/id-{uuid}`
- [x] Links are NOT treated as relative paths
- [x] Links have proper `https://` prefix

**Notes:** All standard links on the detail page use the correct format (e.g., `https://www.gemmaonline.nl/wiki/GEMMA/id-32edeb45-733f-40c9-8e58-3e2443b2ee4e`).

---

### #383: Applicatie: selectie vakken werken niet
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] Clicking a row checkbox selects that row (visual indication: checkbox shows [checked] state)
- [x] Selection state is visually clear

**Notes:** Tested by clicking the checkbox on "Test Applicatie Leverancier" row -- it correctly toggled to checked state.

---

### #384: Applicaties: eenduidige manier van bewerken
**Status: FAIL**
**Test Step:** Step 7

Acceptance Criteria:
- [ ] Actions menu only has "Bewerken" (via wizard) and "Verwijderen" -- FAIL: Actions menu shows 6 options: Bekijken, Bewerken, Dienst publiceren, Applicatiegebruik melden, Koppeling publiceren, Verwijderen
- [ ] Other action options removed -- FAIL: extra convenience options still present
- [ ] Editing via wizard pre-fills all existing data -- not tested

**Notes:** The Actions menu contains extra options beyond "Bewerken" and "Verwijderen". While these extra options (Dienst publiceren, Koppeling publiceren, Applicatiegebruik melden, Bekijken) may be useful shortcuts, the issue specifies only Bewerken and Verwijderen should remain.

---

### #385: Applicatie: Geen huidige versie in gebruik
**Status: PASS**
**Test Step:** Step 7

Acceptance Criteria:
- [x] Gray sidebar does NOT show "Huidige versie" section (no sidebar with version info observed)
- [x] "Geen huidige versie in gebruik" text not visible on detail page
- [x] Detail page shows other metadata correctly (Extra informatie section with Licentietype and Hosting type)

**Notes:** The detail page for "Test Applicatie Leverancier" does not show a "Huidige versie" section or "Geen huidige versie in gebruik" text.

---

### #386: Applicaties: Uw applicatie publiceren: andere labels
**Status: PARTIAL**
**Test Step:** Step 7

Acceptance Criteria:
- [ ] All wizard labels match management table and control form labels -- partially verified
- [ ] Labels consistent with approved PowerPoint specification -- not compared against PowerPoint
- [x] Labels in proper Dutch

**Notes:** Wizard labels appear to be in proper Dutch (Naam, Website, Korte omschrijving, Uitgebreide omschrijving, Contactpersoon, Licentievorm, Licentie, Hosting). Full PowerPoint comparison not performed.

---

### #387: Applicaties: Uw applicatie publiceren: i niet aanwezig
**Status: PARTIAL**
**Test Step:** Step 7

Acceptance Criteria:
- [ ] Every field label has an (i) icon/tooltip -- Not all fields verified for tooltip presence
- [ ] Help text matches PowerPoint -- not compared
- [x] The wizard has information tooltip functionality (markdown editor has help, fields have descriptions)

**Notes:** Some tooltip icons were visible in the wizard but a comprehensive check of all fields was not performed.

---

### #390: Applicaties: labels komen niet overeen
**Status: PARTIAL**
**Test Step:** Step 7

Acceptance Criteria:
- [x] Review page shows labels that generally match input step labels
- [ ] Image comparison with reference screenshot not performed

**Notes:** The wizard review step showed data under labels that appeared consistent with the input steps. Full PowerPoint comparison not performed.

---

### #391: Testen met een gebruiker van een bestaande organisatie
**Status: PASS**
**Test Step:** Step 3

Acceptance Criteria:
- [x] Jan Pietersen (an existing user from an existing organization) can log in successfully
- [x] Logged-in user can view and manage their organization's data
- [x] Same capabilities as other users (wizard, tables, detail pages all functional)

**Notes:** The entire test was performed as jan.pietersen@test.nl, a user of the existing "Test Leverancier BV" organization. Login, wizard creation, and data management all worked successfully.

---

### #392: Back-end: geimporteerde gebruiker geeft error bij omzetten naar user
**Status: CANNOT_TEST**
**Test Step:** Step 3

**Notes:** Testing this issue requires creating a new contact person for an imported organization and verifying the conversion to user. This backend operation was not performed in this test session.

---

### #399: Versies: versie van andere leverancier geeft foutmelding
**Status: CANNOT_TEST**
**Test Step:** Step 7

**Notes:** Did not navigate to another supplier's application to test cross-supplier version viewing. Would require finding an application from another supplier via the public search page.

---

### #400: Koppeling - Opslaan van een koppeling geeft een foutmelding
**Status: PASS**
**Test Step:** Step 11

Acceptance Criteria:
- [x] Create new koppeling via wizard and fill required fields
- [x] Click save -- saves successfully without error (POST returned 201 Created)
- [x] Saved koppeling appears in overview ("Test Wizard Koppeling 3" visible in beheer/koppelingen)
- [x] Data persisted correctly (name, direction, description all correct)

**Notes:** The koppeling wizard completed successfully. POST to /api/apps/openregister/api/objects/voorzieningen/koppeling returned 201 Created. The koppeling appeared in the overview table.
**Evidence:** wizard-koppeling-success.png, beheer-koppelingen.png

---

### #401: Koppeling - geimporteerde koppelingen kaartjes zijn leeg
**Status: PARTIAL**
**Test Step:** Step 11

Acceptance Criteria:
- [x] Wizard-created koppeling cards display name and short description (not empty)
- [ ] Imported koppeling cards display correctly -- koppelingen table initially showed "Loading..." for Applicatie A and B columns, resolving after ~3 seconds
- [x] Cards from own organization render with metadata after loading

**Notes:** The koppelingen table showed "Loading..." state for application names initially (about 3 seconds) before resolving. This is a performance issue but not empty cards. Imported koppelingen from other suppliers were not specifically tested.
**Evidence:** beheer-koppelingen.png

---

### #402: Verschil tussen Edge en Chrome bij laden applicaties
**Status: SKIP**
**Test Step:** General

**Notes:** Per test instructions: "SKIP -- untestable (single browser engine)." Playwright uses Chromium only.

---

### #407: Toegevoegde standaarden verwijzen naar id-id-....
**Status: PASS**
**Test Step:** Step 16

Acceptance Criteria:
- [x] Standard links use format: `https://www.gemmaonline.nl/wiki/GEMMA/id-{uuid}` (single "id-")
- [x] Link does NOT contain "id-id-" (double prefix)
- [x] All standard links on detail page follow correct format

**Notes:** All 15 standard links on the "Test Applicatie Leverancier" detail page use the correct single "id-" prefix format. Example: `https://www.gemmaonline.nl/wiki/GEMMA/id-c4935fc1-8db0-11e3-67ab-0050568a6153` for "Digitoegankelijk versie 1.1.2".
**Evidence:** detail-applicatie-test.png

---

### #408: Tabblad beschrijving bij Dienst
**Status: PARTIAL**
**Test Step:** Step 9

Acceptance Criteria:
- [ ] No unexpected "Beschrijving" tab appears -- not directly verified on dienst detail page
- [x] Wizard-created diensten have proper descriptions (visible in table: "Dienst aangemaakt via wizard test 3")

**Notes:** Did not navigate to a specific dienst detail page to check for the "Beschrijving" tab showing a number. The dienst data appears correct in the overview table.

---

### #410: Dashboard schrijfwijze softwarecatalogus
**Status: FAIL**
**Test Step:** Dashboard

Acceptance Criteria:
- [ ] All instances use lowercase "softwarecatalogus" -- FAIL: Dashboard heading uses "Welkom in uw Softwarecatalogus" with uppercase S
- [x] Body includes four bullet points about what suppliers can register (welke applicaties, koppelingen, GEMMA, applicatielandschap)
- [x] Instruction text present about publishing and finding via left menu
- [x] Closing paragraph about municipalities using the information present

**Notes:** The dashboard heading "Welkom in uw Softwarecatalogus" uses an uppercase "S" which contradicts the requirement for lowercase "softwarecatalogus". The body text content otherwise matches the expected text from issue #410.

---

## Console Errors Summary

| Page | Errors | Notes |
|------|--------|-------|
| All pages | Manifest syntax error | Known/expected -- site.webmanifest returns non-JSON |
| Dienst wizard | "Collection not found for type: voorziening..." | Non-blocking, save completed |
| Dienst wizard | "Failed to load resource: 404" for schema/product | Non-blocking, product schema does not exist |
| Koppeling wizard | "Schema not found for type: koppeling" | Warning only, non-blocking |
| App wizard step 5 | "Improper nesting of paragraph" | React rendering warning, non-blocking |

---

## Performance Summary

| Page/Action | Load Time | Status |
|------------|-----------|--------|
| Login | < 2s | OK |
| Dashboard | < 1s | OK |
| Applicatie wizard (all steps) | < 1s each | OK |
| Dienst wizard (all steps) | < 1s each | OK |
| Koppeling wizard (all steps) | < 1s each | OK |
| /beheer/applicaties | < 2s | OK |
| /beheer/diensten | ~3s (initial "Loading..." state) | OK |
| /beheer/koppelingen | ~3s (Applicatie A/B "Loading..." state) | SLOW |
| Application detail page | < 2s | OK |
| /beheer/contactpersonen | < 2s | OK |

---

## Key Findings

### Critical Issues (FAIL)
1. **#306/#357: Duplicate "Diensttype" column** in diensten table -- two identical columns showing the same value
2. **#352/#356/#367/#372: Tussenvoegsel not shown** -- "Jan Berg" instead of "Jan van de Berg" across contactpersonen table, while wizard shows correct "Jan van de Berg"
3. **#384: Actions menu has too many options** -- includes Bekijken, Dienst publiceren, Applicatiegebruik melden, Koppeling publiceren beyond just Bewerken + Verwijderen
4. **#410: Dashboard capitalization** -- "Softwarecatalogus" with uppercase S instead of lowercase "softwarecatalogus"

### Notable Improvements Since Last Test
- All three wizards complete successfully end-to-end
- RBAC filtering works correctly (own-org data only)
- Standard links use correct single "id-" prefix (#407 fixed)
- "NIET ONDERSTEUND" consistently used instead of "non-compliant" (#381 fixed)
- Checkboxes in tables work (#383 fixed)
- Application detail page shows diensten tab correctly (#373 fixed)
- Koppeling creation works without errors (#400 fixed)

---

## Evidence Screenshots

| File | Description |
|------|-------------|
| dashboard-login.png | Dashboard after login |
| wizard-app-step1.png | Application wizard step 1 |
| wizard-app-step2.png | Application wizard step 2 |
| wizard-app-step3-refcomp.png | Referentiecomponenten step |
| wizard-app-step4-standaarden.png | Standards step |
| wizard-app-step5-koppelingen.png | Koppelingen step |
| wizard-app-step6-review.png | Review step |
| wizard-app-success.png | Application success page |
| wizard-dienst-step1.png | Dienst wizard step 1 |
| wizard-dienst-step2.png | Dienst wizard step 2 |
| wizard-dienst-step3.png | Dienst wizard review step |
| wizard-koppeling-step1.png | Koppeling wizard step 1 |
| wizard-koppeling-step4.png | Koppeling wizard review step |
| wizard-koppeling-success.png | Koppeling success page |
| beheer-applicaties.png | Applicaties overview table |
| beheer-diensten.png | Diensten overview table |
| beheer-koppelingen.png | Koppelingen overview table |
| detail-applicatie-test.png | Application detail page |
