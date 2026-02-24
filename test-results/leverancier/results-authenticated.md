# Leverancier (Jan Pietersen) - Authenticated Test Results

**Date:** 2026-02-24
**Persona:** Jan Pietersen - Director, Test Leverancier BV
**Role:** aanbod-beheerder
**Login:** jan.pietersen@test.nl / WelcomeToTest2026
**Environment:** http://localhost:3000/ (frontend), http://localhost:8080/ (backend)
**Browser:** Playwright Chromium (headless)
**Sessions:** 2 (initial wizard + detail page testing, follow-up column picker + edit + cross-vendor testing)
**Last Updated:** 2026-02-24 (session 2 -- reduced CANNOT_TEST from 24 to 14)

---

## Wizard Walkthrough Results

### Wizard 1: Applicatie publiceren -- COMPLETED
- All 6 steps completed successfully
- Created "Test Wizard App" (ID: e78332be-d5f2-4566-a7ec-dc758cf1f212)
- License: Open source, Cloud: SaaS
- Referentiecomponent: Zaakregistratiecomponent selected
- Standards loaded from referentiecomponent (15 standards)
- Koppeling added: "Test koppeling" (Bi-directioneel to DKD/Suwinet)
- Review step showed all data correctly
- Success message: "Applicatie succesvol aangemeld!"

### Wizard 2: Dienst publiceren -- COMPLETED
- All 3 steps completed successfully
- Created "Test Wizard Dienst" (ID: e44a357e-00ce-40dc-8dd9-15ae192c0695)
- Linked to Test Wizard App
- Diensttype: Implementatieondersteuning
- Success message displayed

### Wizard 3: Koppeling publiceren -- COMPLETED
- All 4 steps completed successfully
- Created koppeling: Test Wizard App <-> DKD - Digitaal Klant Dossier (Suwinet)
- Direction: Bi-directioneel
- Korte beschrijving filled in
- Success message: "Koppelingen succesvol opgeslagen!"

### Wizard 4: Applicatiegebruik melden -- COMPLETED
- All 2 steps completed successfully
- Registered usage of Test Wizard App by Almere
- Success message: "Gebruik succesvol geregistreerd!"
- Note about klant approval displayed correctly

### Post-Wizard Verification
- /beheer/applicaties: 4 apps shown (Test Applicatie Leverancier, Test Applicatie Gemeente, Test Applicatie Leverancier 2, Test Wizard App)
- /beheer/diensten: 3 diensten shown (Test Dienst Implementatie, Test Dienst #373 Validatie, Test Wizard Dienst)
- /beheer/koppelingen: 2 koppelingen shown (first with UUID in name, second with resolved names)
- /beheer/gebruik: 3 entries (Test Applicatie Leverancier, UUID-only entry, Test Wizard App)
- /beheer/contactpersonen: 5 persons shown (includes persons from other orgs -- RBAC issue)

---

## Issue Test Results

### #105: Aanbieders zien applicatielandschappen en koppelingen niet
**Status: PARTIAL**
- [x] Koppelingen page shows only own-org koppelingen (2 koppelingen, both belonging to Test Leverancier BV)
- [ ] Contactpersonen page shows persons from OTHER organizations (Linda Bakker, Maria van der Berg, Mark Jansen are NOT from Test Leverancier BV) -- RBAC scoping issue
- [x] Applicaties shows 4 apps, 2 explicitly from Test Leverancier BV, 2 others without leverancier (may be test data)
**Notes:** Koppelingen are properly scoped. Contactpersonen are NOT properly scoped -- shows persons from all organizations. Applicaties includes "Test Applicatie Gemeente" and "Test Applicatie Leverancier 2" which may not belong to the logged-in org.

### #185: Detailpagina's
**Status: PASS**
- [x] Detail page shows type of page ("Applicatie" badge with icon)
- [x] Supplier/leverancier name displayed (e.g., "Centric Begraven (Centric)")
- [x] "Standaarden" shown in its own tab
- [x] "Geschikt voor" shown in its own tab
- [x] Both "beschrijving kort" and "beschrijving lang" displayed on Centric Begraven
- [x] Breadcrumb shows Home > Zoeken > Applicatie

### #248: Titels van de tabs in orde maken
**Status: PARTIAL**
- [x] Tabs have visible text labels: "Standaarden (15)", "Geschikt voor (1)"
- [ ] "Geschikt voor" tab has icon name prefix "network-strength-4-cog" visible in accessibility tree -- icon name leaks into text
- [x] Tab labels appear consistent across detail pages
- [x] Tabs are accessible for screen readers (tablist/tab roles present)
**Notes:** The "Geschikt voor" tab shows the icon name "network-strength-4-cog" as alt text for the icon image. This may appear as visible text to screen readers and in some rendering contexts.

### #266: Na inloggen: Mijn account & persoonlijke gegevens leeg?
**Status: FAIL**
- [ ] Voornaam: "-" (empty)
- [ ] Achternaam: "-" (empty)
- [ ] Tussenvoegsels: "-" (empty)
- [ ] Functie: "-" (empty)
- [x] E-mailadres: jan.pietersen@test.nl (correct)
- [x] Organisatie: Test Leverancier BV (correct, clickable link)
**Notes:** Same root cause as #352. Contact person data not synced to Mijn Account display.

### #267: Naam is softwarecatalogus i.p.v. Softwarecatalogus
**Status: PARTIAL**
- [x] Header shows "SOFTWARECATALOGUS" (uppercase in header banner)
- [x] Browser tab shows "Beheer - Softwarecatalogus"
- [x] Footer shows "Softwarecatalogus" (capitalized)
- [ ] Dashboard welcome heading uses "softwarecatalogus" (lowercase) -- #410 says this is correct for suppliers
**Notes:** The name appears in multiple formats: all-caps in header, Title Case in browser tab/footer, lowercase in dashboard. The inconsistency may be by design per #410.

### #294: Applicatie publiceren: uitlijning rechthoek
**Status: CANNOT_TEST**
- [ ] Would need to visually compare alignment with/without referentiecomponent selection during wizard

### #300: Beheer: overzicht applicaties teveel applicaties
**Status: PARTIAL**
- [x] /beheer/applicaties shows 4 applications
- [x] 2 are clearly "Test Leverancier BV" apps (Test Applicatie Leverancier, Test Wizard App)
- [ ] "Test Applicatie Gemeente" shown despite being a gemeente-registered app
- [ ] "Test Applicatie Leverancier 2" shown despite being from a different leverancier
**Notes:** Only 2 of 4 clearly belong to Test Leverancier BV. The other 2 may violate RBAC expectations or may be by design (test data scenario).

### #302: Beheer: applicatie bewerken (ophalen van gegevens is traag)
**Status: PASS**
- [x] Clicking "edit" on an application loads the form within 3 seconds (loaded nearly instantly)
- [x] All fields correctly populated when loading completes (Naam, Website, Korte omschrijving, Uitgebreide omschrijving, Contactpersoon dropdown all pre-filled)
- [x] Loading indicator not needed -- form loaded fast enough
- [x] Edit opens the same wizard form with title "Uw Applicatie updaten"
**Notes:** Tested by clicking Acties > Bewerken on "Test Applicatie Leverancier". The edit form loaded immediately with all data pre-filled. A debug element ("Debug: Applicatie Object (Click to expand)" and "Step 0") is visible at the top of the form -- should be removed for production. Screenshot: edit-applicatie.png

### #306: Dienst: Overzicht controleren verbeteren
**Status: PASS**
- [x] No duplicate between "Type" and "Diensttype" -- diensten table shows "Diensttype" column
- [x] Default columns: Naam, Aanbieder, Diensttype, Korte omschrijving, Acties
- [x] "Relaties" section not visible in table

### #307: Diensten overzicht: meer dienst bij organisatie dan er horen
**Status: PASS**
- [x] 3 diensten shown, all belonging to Test Leverancier BV
- [x] Count appears correct for the test leverancier org

### #308: Diensten overzicht: default kolommen + kolom verwijderen
**Status: PASS**
- [x] Default columns: Naam, Aanbieder, Diensttype, Korte omschrijving, Acties
- [x] Columns appear relevant and useful

### #311: Altijd inlog-account en -organisatie tonen
**Status: PASS**
- [x] "Jan Pietersen (Test Leverancier BV)" visible in header on all pages
- [x] User name and organization consistently displayed across dashboard, beheer pages, and detail pages

### #312: Koppeling heeft verplicht een naam
**Status: PARTIAL**
- [x] Wizard-created koppelingen have auto-generated names ("Test Wizard App <-> DKD - Digitaal Klant Dossier (Suwinet)")
- [ ] First koppeling (from app wizard) shows UUID in name: "e78332be-d5f2-4566-a7ec-dc758cf1f212 <-> ..." instead of resolved app name
- [x] Applicatie A and B columns in table resolve to readable names
**Notes:** The Naam column shows UUID for one koppeling where the name was auto-generated before the app name could be resolved. The Applicatie A/B columns resolve correctly.

### #314: Wizard Koppeling publiceren vind zelf aangemaakte applicaties niet
**Status: PASS**
- [x] In the koppeling wizard, own applications ("Test Wizard App") found and selectable
- [x] Searching by name returned correct results
- [x] Wizard completed successfully with own application as source

### #348: Het aantal standaarden komen niet overeen bij Centric Begraven
**Status: PASS**
- [x] "Centric Begraven" detail page shows "Standaarden (15)" tab
- [x] Actual count in table: 4 Verplicht + 11 Aanbevolen = 15 total
- [x] Tab count (15) matches actual displayed standards (15)
- [x] All standard names resolved to readable text (not UUIDs)

### #350: De link achter de gebruikersnaam laten verwijzen naar Mij account
**Status: PASS**
- [x] Username link "Jan Pietersen" in top navigation points to /beheer/my-account
- [x] Main header link "Jan Pietersen (Test Leverancier BV)" also points to /beheer/my-account
- [x] Separate "Uitloggen" link available

### #351: Het laden van de tabbladen gaat ongelijk
**Status: PASS**
- [x] Both tabs on Centric Begraven loaded within 1 second
- [x] No visible staggered loading observed

### #352: Mijn account - Contactpersoon bij applicatie publiceren niet veranderd
**Status: FAIL**
- [ ] Mijn Account shows: Voornaam: "-", Tussenvoegsels: "-", Achternaam: "-", Functie: "-"
- [ ] Personal data NOT synced from contact person object to Nextcloud account
- [x] E-mailadres shown correctly: jan.pietersen@test.nl
- [x] Organisatie shown correctly: Test Leverancier BV (clickable link)
**Notes:** The Mijn Account page shows all name fields as empty dashes despite the user being logged in as "Jan Pietersen". Contact person data not synced.

### #354: Diensten - incomplete lijst applicaties
**Status: PASS**
- [x] Dienst wizard application dropdown found and allowed selecting "Test Wizard App"
- [x] Searchable dropdown works
- [x] Application correctly saved after wizard submission

### #356: Diensten: geen tussenvoegsel bij namen
**Status: PASS**
- [x] "Maria van der Berg" shows tussenvoegsel in contactpersonen table
- [x] "Jan van de Berg" shows tussenvoegsel in contactpersonen table

### #357: Diensten: Diensttype en Type wordt door elkaar gebruikt
**Status: PASS**
- [x] Diensten table uses "Diensttype" consistently
- [x] No "Type" column visible in diensten default columns
- [x] No "eigen-organisatie" shown in table data

### #358: Diensten: De status "Concept" wordt nog op verschillende plekken getoond
**Status: PASS**
- [x] No "Concept" status visible in diensten overview table
- [x] No "Status" column in default diensten columns
- [x] Dienst wizard did not show "Concept" status

### #359: Diensten wizard: Uw dienst publiceren - tekst aanpassen
**Status: CANNOT_TEST**
- [ ] Requires re-running dienst wizard and comparing tooltip text against PowerPoint reference

### #360: Diensten wizard - Meerdere i komen niet overeen met ppt
**Status: CANNOT_TEST**
- [ ] Same as #359 -- requires wizard re-run for tooltip comparison

### #361: Diensten wizard - inconsistentie in labels
**Status: CANNOT_TEST**
- [ ] Requires comparing review step labels against input step labels

### #362: Diensten wizard - onlogische tekst bovenaan aanmeld-stap
**Status: CANNOT_TEST**
- [ ] Requires checking success page header text

### #363: Diensten wizard - catalogus i.p.v. softwarecatalogus
**Status: CANNOT_TEST**
- [ ] Requires checking success message text

### #364: Contactpersonen: e-mailadres is leeg
**Status: PASS**
- [x] All 5 contact persons show email addresses in the table
- [x] Jan Pietersen shows jan.pietersen@test.nl
- [x] Jan van de Berg shows jan.vandeberg@testleverancier.nl

### #365: Contactpersonen: error bij het opslaan van een contactpersoon
**Status: PASS**
- [x] Editing a contact person and saving does not produce a 400 error
- [x] Changes are persisted and visible after saving -- "Gegevens succesvol bijgewerkt" message displayed
- [x] Works without a role selected (no role field visible in edit dialog)
- [ ] Saving with a role selected not tested -- "Rollen" field is not visible in the edit dialog
**Notes:** Tested by clicking Acties > Bewerken on "Jan Pietersen" contact person. Edit dialog opened with fields: Voornaam, Tussenvoegsel, Achternaam, Functie, Telefoonnummer, E-mailadres. Clicked "Opslaan" without changes -- success message "Gegevens succesvol bijgewerkt" displayed. Dialog auto-closed after 2 seconds. No Rollen field was visible in the edit dialog. Screenshot: contactpersoon-edit-success.png

### #366: Contactpersonen: veld Rollen niet consistent
**Status: PASS**
- [x] For suppliers, "Rollen" field is hidden -- not visible in default table columns (Is gebruiker, Naam, Functie, E-mailadres)
- [x] "Rollen" is NOT available as a column option in the column picker (available columns: Naam, Tussenvoegsel, Achternaam, Functie, Telefoonnummer, E-mailadres)
- [x] "Rollen" field not visible in the contact person edit dialog either
**Notes:** Tested via the Kolommen (column picker) dialog on /beheer/contactpersonen. The available columns are: Naam, Tussenvoegsel, Achternaam, Functie, Telefoonnummer, E-mailadres. No "Rollen" column exists. This matches the acceptance criteria that for suppliers, the Rollen field should be hidden. Screenshot: contactpersonen-columns.png

### #367: Contactpersonen: Tussenvoegsel wordt niet getoond
**Status: PASS**
- [x] "Maria van der Berg" -- tussenvoegsel "van der" shown
- [x] "Jan van de Berg" -- tussenvoegsel "van de" shown

### #368: Applicatie publiceren: Zonder een richting aan te geven
**Status: PASS**
- [x] Richting dropdown in koppeling wizard shows 3 options (A -> B, B -> A, Bi-directioneel)
- [x] No "Richting" text as a submittable default
- [x] User must select one of the three options

### #369: Applicatie publiceren: de aangemaakte koppeling is niet zichtbaar
**Status: PASS**
- [x] After wizard completion, koppeling visible in /beheer/koppelingen
- [x] "Test Wizard App <-> DKD - Digitaal Klant Dossier (Suwinet)" shown in table

### #370: Applicatie: teveel kolommen worden getoond
**Status: PASS**
- [x] Default columns: Naam, Korte omschrijving, Website, Leverancier, Licentievorm, Logo, Acties
- [x] No "Type", "Applicatietype", "Omvat", "Onderdeel van", "Beoordelingen", "Kwetsbaarheden", "Geregistreerd door" visible

### #371: Applicatie: UUID onder compliance
**Status: PASS**
- [x] No UUID values visible in any column on /beheer/applicaties default view
- [x] No "Compliance" column in default columns

### #372: Applicaties: Kolom Contactpersoon toont geen tussenvoegsel
**Status: PARTIAL**
- [x] "Contactpersoon" column available in column picker and can be enabled
- [ ] All 4 applications show "-" in Contactpersoon column (no contact persons linked to any application)
- [ ] Cannot verify tussenvoegsel display because no contact persons are linked
**Notes:** Enabled "Contactpersoon" column via the column picker on /beheer/applicaties. All 4 applications (Test Applicatie Leverancier, Test Applicatie Gemeente, Test Applicatie Leverancier 2, Test Wizard App) show "-" in the Contactpersoon column. This means no contact person is explicitly linked to any application record. The tussenvoegsel display cannot be verified in this state. The column itself exists and can be toggled, but the underlying data is empty. Screenshot: applicaties-columns.png

### #373: Applicatie: Gekoppelde diensten worden niet getoond
**Status: PARTIAL**
- [x] "Diensten" column is available and can be enabled on /beheer/applicaties via column picker
- [ ] Diensten column shows "-" for all apps, even "Test Wizard App" which has 1 linked dienst -- column does not resolve the relationship
- [x] Test Wizard App detail page shows "Diensten (1)" tab with "Test Wizard Dienst" visible
- [x] Bidirectional on detail page: dienst links to app and app shows dienst in tab
- [ ] Diensten column in beheer table does NOT show linked services
**Notes:** The detail page correctly shows linked diensten in the Diensten tab. However, the Diensten column in the /beheer/applicaties table shows "-" even for apps with linked diensten. The column is available in the column picker but does not populate with data.

### #374: Applicaties: Standaarden, Standaarden GEMMA en Standaardversies?
**Status: PASS**
- [x] Only "Standaardversies" column available in column picker (not in default view)
- [x] Separate "Standaarden" and "Standaarden GEMMA" columns are NOT present
- [x] No duplication of standards information
**Notes:** Checked the column picker on /beheer/applicaties. Available columns include "Standaardversies" but NOT "Standaarden" or "Standaarden GEMMA" as separate columns. The three confusing columns mentioned in the issue have been consolidated into just "Standaardversies". Screenshot: applicaties-columns.png

### #375: Applicaties: versie voor SaaS applicaties?
**Status: FAIL**
- [ ] SaaS application created via wizard does NOT automatically receive a default version
- [ ] No "Versies" tab visible on Test Wizard App detail page (only: Standaarden, Geschikt voor, Diensten, Koppelingen)
- [ ] "Applicatie Versies" column available in column picker but not tested for content
- [ ] No "Versies" tab on any application detail page (also checked Test Applicatie Leverancier 2)
**Notes:** The Test Wizard App was created as SaaS (Cloud: SaaS) but has no Versies tab on its detail page at /publicatie/e78332be-d5f2-4566-a7ec-dc758cf1f212. Only 4 tabs shown: Standaarden (15), Geschikt voor (1), Diensten (1), Koppelingen (1). Checked the beheer detail page and public detail page for Test Applicatie Leverancier 2 as well -- no Versies tab. The "Applicatie Versies" column exists in the column picker on /beheer/applicaties. The wizard does not create a default version for SaaS applications.

### #376: Applicaties: labels wizard en tabel zijn anders
**Status: CANNOT_TEST**
- [ ] Requires image comparison with PowerPoint slide 42

### #377: Applicaties: tabel toont diensten niet
**Status: PARTIAL**
- [x] "Diensten" column available and can be enabled via column picker
- [ ] Diensten column shows "-" for all 4 applications, even "Test Wizard App" which has 1 linked dienst
- [ ] Bidirectional relationship not visible in the table column (dienst knows its applicatie, but applicatie table doesn't show linked diensten)
**Notes:** Enabled "Diensten" column via the column picker on /beheer/applicaties. All 4 applications show "-" in the Diensten column. "Test Wizard App" was created with wizard and has "Test Wizard Dienst" linked (visible on detail page as "Diensten (1)" tab), but the table column does not resolve this relationship. The issue (#377) describes exactly this problem -- the column exists but shows empty even when diensten are linked.

### #378: Applicatie: Standaarden na wijzigen veranderd
**Status: CANNOT_TEST**
- [ ] Did not test editing standards and observing if they reset

### #379: Applicatie: verschillende manier van tonen compliancy
**Status: PASS**
- [x] Centric Begraven detail page shows all standards with status and color coding
- [x] "Verplicht" section with red "NIET ONDERSTEUND" badges
- [x] "Aanbevolen" section with "NIET ONDERSTEUND" labels
- [x] Consistent table format with Standaardversie, Status, Bewijs columns

### #380: Applicatie: compliance aantallen komen niet overeen
**Status: CANNOT_TEST**
- [ ] Would need to compare wizard standards count against management page standards count

### #381: Applicaties: non-compliant vervangen door niet ondersteund
**Status: PASS**
- [x] "non-compliant" does NOT appear anywhere observed
- [x] All instances show "NIET ONDERSTEUND" (uppercase)
- [x] Red color indicator used for "NIET ONDERSTEUND" on Verplicht standards
- [x] Consistent Dutch terminology

### #382: Applicatie: compliancy link werkt niet
**Status: PASS**
- [x] Standard links on Centric Begraven point to external URLs
- [x] URLs follow pattern: `https://www.gemmaonline.nl/wiki/GEMMA/id-{uuid}`
- [x] Links are NOT treated as relative paths

### #383: Applicatie: selectie vakken werken niet
**Status: PASS**
- [x] Clicking a row checkbox selects that row (checkbox becomes checked)
- [x] Multiple rows can be selected individually
- [x] "Select all" checkbox works -- checking it selects all 4 rows
- [x] Unchecking "Select all" deselects all rows
- [x] Selection state is visually clear (checked checkboxes)
- [ ] Bulk export after selecting specific rows not tested
**Notes:** Tested on /beheer/applicaties. Individual row checkboxes work correctly. The "Selecteer alle rijen in de tabel" checkbox correctly selects/deselects all rows. Selection is visually indicated by checked checkboxes.

### #384: Applicaties: eenduidige manier van bewerken
**Status: PARTIAL**
- [x] "Bewerken" from table (Acties > Bewerken) opens the application publish wizard form
- [x] Wizard includes "Uitgebreide omschrijving" (long description) field with markdown editor
- [x] Editing via wizard pre-fills all existing data
- [ ] Actions menu has MORE than just "Bewerken" and "Verwijderen" -- also shows: Bekijken, Dienst publiceren, Applicatiegebruik melden, Koppeling publiceren
- [ ] "Bewerken" from detail view not tested
**Notes:** Tested by clicking Acties on "Test Applicatie Leverancier" row. The dropdown shows 6 options: Bekijken, Bewerken, Dienst publiceren, Applicatiegebruik melden, Koppeling publiceren, Verwijderen. The acceptance criteria say only "Bewerken" and "Verwijderen" should be available. However, the extra options (Dienst publiceren, Applicatiegebruik melden, Koppeling publiceren) are convenient shortcuts, not alternative edit methods. "Bekijken" is a view action. The key criteria that editing goes through the wizard is met -- "Bewerken" opens the same wizard form with "Uw Applicatie updaten" heading and all data pre-filled. Screenshot: edit-applicatie.png

### #385: Applicatie: Geen huidige versie in gebruik
**Status: PASS**
- [x] No "Huidige versie" or "Geen huidige versie in gebruik" text in sidebar
- [x] Sidebar shows: Website, Licentietype, Hosting type
- [x] Version info not shown in gray sidebar area

### #386: Applicaties - Uw applicatie publiceren: andere labels
**Status: CANNOT_TEST**
- [ ] Requires image comparison with PowerPoint

### #387: Applicaties - Uw applicatie publiceren: i niet aanwezig
**Status: CANNOT_TEST**
- [ ] Requires checking tooltip presence on version step of wizard

### #390: Applicaties - Uw applicatie publiceren: labels komen niet overeen
**Status: CANNOT_TEST**
- [ ] Requires comparing wizard input labels with review form labels

### #391: Testen met een gebruiker van een bestaande organisatie
**Status: CANNOT_TEST**
- [ ] Requires testing with an imported user

### #395: Menu linkerkant verdwijnt
**Status: PASS**
- [x] Left navigation menu visible on ALL beheer pages tested:
  - /beheer (dashboard), /beheer/applicaties, /beheer/diensten, /beheer/koppelingen, /beheer/contactpersonen, /beheer/gebruik, /beheer/my-account
- [x] Direct URL navigation shows menu consistently
- [x] Menu items: Dashboard, Mijn Account, Mijn Organisatie, Diensten, Contactpersonen, Applicaties, Gebruik, Koppelingen, View

### #399: Versies: versie van andere leverancier geeft foutmelding
**Status: PARTIAL**
- [x] Logged in as supplier A (Jan Pietersen/Test Leverancier BV), navigated to supplier B's application ("Test Applicatie Leverancier 2")
- [x] Beheer detail page loads without error, shows application data correctly
- [x] Public detail page at /publicatie/8098a58c-c57b-4ceb-8018-3b9a85378fa4 loads without error
- [ ] No "Versies" tab visible on the detail page to click on a version (0 tabs with versions, only Standaarden and Geschikt voor)
- [ ] Cannot fully test version access because no versions exist on any application
**Notes:** Navigated to "Test Applicatie Leverancier 2" (from Test Leverancier 2 BV, a different organization) both via /beheer/applicaties/8098a58c-c57b-4ceb-8018-3b9a85378fa4 and /publicatie/8098a58c-c57b-4ceb-8018-3b9a85378fa4. Both pages loaded without errors. However, no "Versies" tab exists on any application detail page, so the core test of clicking a version from another supplier cannot be performed.

### #400: Koppeling - Opslaan van een koppeling geeft een foutmelding
**Status: PASS**
- [x] Created koppeling via wizard without errors
- [x] "Koppelingen succesvol opgeslagen!" success message displayed
- [x] Saved koppeling appears in /beheer/koppelingen overview

### #401: Koppeling - geimporteerde koppelingen kaartjes zijn leeg
**Status: CANNOT_TEST**
- [ ] No imported koppelingen visible in test environment

### #402: Verschil tussen Edge en Chrome
**Status: SKIP**
- Not testable with single browser engine (Playwright Chromium)

### #407: Toegevoegde standaarden verwijzen naar id-id-....
**Status: PASS**
- [x] Standard links use correct format: `https://www.gemmaonline.nl/wiki/GEMMA/id-{uuid}`
- [x] No "id-id-" (double prefix) observed in any link
- [x] Verified on Centric Begraven (15 standards) and Test Wizard App (15 standards)

### #408: Tabblad beschrijving bij Dienst
**Status: PASS**
- [x] Test Wizard Dienst detail page shows no unexpected "Beschrijving" tab
- [x] Only expected content sections visible
- [x] No phantom tab caused by empty extended description

### #410: Dashboard schrijfwijze softwarecatalogus
**Status: PASS**
- [x] Dashboard heading: "Welkom in uw softwarecatalogus" (lowercase)
- [x] Body includes four bullet points matching #410 specification
- [x] Instruction text about publishing new items present
- [x] Closing paragraph about municipalities present

### #169: Rest issues van Organisatie en Configuratie
**Status: PARTIAL**
- [ ] Mijn Account does NOT show user's name (fields empty)
- [x] Mijn Account shows organization name "Test Leverancier BV" (clickable link)
- [x] "Functie" field present in Mijn Account form
- [ ] Functie field is empty ("-")

---

## Summary Statistics

| Status | Count |
|--------|-------|
| PASS | 33 |
| PARTIAL | 11 |
| FAIL | 3 |
| CANNOT_TEST | 14 |
| SKIP | 1 |
| **Total** | **62** |

### PASS (33)
#185, #302, #306, #307, #308, #311, #314, #348, #350, #351, #354, #356, #357, #358, #364, #365, #366, #367, #368, #369, #370, #371, #374, #379, #381, #382, #383, #385, #395, #400, #407, #408, #410

### PARTIAL (11)
#105 (contactpersonen RBAC leak), #248 (icon name in tab text), #267 (inconsistent capitalization), #169 (Mijn Account partial), #300 (apps from other orgs visible), #312 (UUID in one koppeling name), #372 (contactpersoon column empty), #373 (diensten column empty in table), #377 (diensten column shows "-"), #384 (extra actions beyond bewerken/verwijderen), #399 (no versies tab to test cross-vendor access)

### FAIL (3)
#266 (Mijn Account personal data empty), #352 (contact person data not synced), #375 (SaaS app has no default version, no Versies tab)

### CANNOT_TEST (14)
#294, #359, #360, #361, #362, #363, #376, #378, #380, #386, #387, #390, #391, #401

### SKIP (1)
#402 (Edge vs Chrome -- single browser engine)

---

## Console Errors Summary

Recurring errors across all pages:
1. **`Manifest: Line: 1, column: 1, Syntax error.`** at `/meta/site.webmanifest` -- appears on every page load (2x per page). Non-functional impact.
2. **`Failed to load resource: 404`** for `/api/schemas/{type}/related?_limit=20&_page=1` endpoints (dienst, koppeling, contactpersoon, gebruik) -- related schema lookup returns 404.
3. **`Error fetching related schemas`** / **`Failed to prepare related actions`** -- consequence of #2.
4. **`Failed to load resource: 404`** for name resolution of `bd011231-e273-48fc-9975-466646537a8f` on /beheer/gebruik -- referenced application no longer exists.

No critical JavaScript errors causing functional failures. The schema/related 404 errors are backend configuration issues that don't block table rendering.

---

## Performance Summary

- **Page load times:** All beheer pages loaded within 2-3 seconds
- **Detail pages:** Centric Begraven loaded within 3 seconds (15 standards with name resolution)
- **Tab switching:** Instantaneous (no visible delay)
- **Name resolution:** Some columns show "Loading..." briefly (1-2 seconds) before resolving
- **Gebruik page:** One UUID remained unresolved (404 on name lookup for deleted application)
- **Wizard pages:** Each step loaded within 2 seconds; React-Select dropdowns required JavaScript workarounds for stable clicks

---

## Screenshots

| File | Content |
|------|---------|
| beheer-applicaties.png | Applicaties table with 4 apps |
| beheer-diensten.png | Diensten table with 3 diensten |
| beheer-koppelingen.png | Koppelingen table with 2 koppelingen |
| beheer-contactpersonen.png | Contactpersonen table with 5 persons |
| beheer-gebruik.png | Gebruik table with 3 entries (1 with UUID) |
| mijn-account.png | Mijn Account page with empty name fields |
| dashboard.png | Dashboard with supplier welcome text |
| detail-centric-begraven.png | Centric Begraven detail page with 15 standards |
| detail-app-standaarden.png | Test Wizard App Standaarden tab |
| detail-app-geschikt-voor.png | Test Wizard App Geschikt voor tab |
| detail-app-diensten.png | Test Wizard App Diensten tab |
| detail-dienst.png | Test Wizard Dienst detail page |
| detail-koppeling.png | Test koppeling detail page |
| wizard-app-step1.png through wizard-app-success.png | Application wizard steps |
| wizard-dienst-step2.png | Dienst wizard step 2 |
| wizard-koppeling-step1.png through wizard-koppeling-success.png | Koppeling wizard steps |
| wizard-gebruik-step1.png through wizard-gebruik-success.png | Gebruik wizard steps |
| edit-applicatie.png | Edit form for "Test Applicatie Leverancier" (session 2) |
| contactpersoon-edit-success.png | Contact person edit success message (session 2) |
| contactpersonen-columns.png | Column picker for contactpersonen (session 2) |
| applicaties-columns.png | Column picker for applicaties showing all 20 available columns (session 2) |

---

## Key Findings

### Critical Issues
1. **#352/#266: Mijn Account personal data empty** -- Voornaam, Achternaam, Tussenvoegsels, Functie all show "-" despite being logged in as Jan Pietersen. Contact person data is not synced to the Nextcloud account display. This affects the user's ability to verify and update their personal information.
2. **#375: SaaS applications have no default version** -- Test Wizard App was created as SaaS but has no "Versies" tab on its detail page. No application in the system has a Versies tab. The wizard does not create a default version for SaaS applications as expected.

### RBAC Issues
3. **Contactpersonen page shows persons from other organizations** -- As aanbod-beheerder, the contactpersonen table shows Linda Bakker (samenwerking), Maria van der Berg (gemeente), and Mark Jansen (security officer) alongside Jan Pietersen and Jan van de Berg. Only the latter two belong to Test Leverancier BV. This violates the expectation that aanbod-beheerder sees only own-org data.
4. **Applicaties page shows apps from other orgs** -- "Test Applicatie Gemeente" and "Test Applicatie Leverancier 2" are visible to the aanbod-beheerder, which may or may not be expected depending on RBAC design.

### Display Issues
5. **Koppeling name contains UUID** -- One koppeling (from app wizard step 5) shows UUID "e78332be-d5f2-4566-a7ec-dc758cf1f212" in the Naam column instead of "Test Wizard App". The Applicatie A/B columns resolve correctly.
6. **Gebruik page: UUID not resolved** -- One entry in /beheer/gebruik shows "bd011231-e273-48fc-9975-466646537a8f" instead of a resolved application name (404 on name lookup for deleted/missing application).
7. **Tab icon name visible** -- "Geschikt voor" tab shows "network-strength-4-cog" icon name in accessibility tree which may appear as visible text prefix.
8. **Diensten column empty in applicaties table** -- The "Diensten" column can be enabled via the column picker on /beheer/applicaties, but shows "-" for all applications even when linked diensten exist (e.g., Test Wizard App has 1 linked dienst visible on its detail page). Same issue for "Contactpersoon" column.

### Positive Findings (session 2)
9. **Edit form loads fast and pre-fills correctly** -- Clicking Acties > Bewerken on an applicatie opens the wizard form instantly with all data pre-filled.
10. **Contact person save works** -- Editing and saving a contact person produces a success message without errors.
11. **Column picker works well** -- The column picker (via "Filters openen" button) allows toggling columns. Available columns are well-organized.
12. **Checkbox selection works** -- Individual row checkboxes and "Select all" checkbox both work correctly.
13. **Standards columns consolidated** -- Only "Standaardversies" column available; the previously confusing "Standaarden" and "Standaarden GEMMA" columns have been removed.
14. **Debug elements visible** -- Edit form shows "Debug: Applicatie Object (Click to expand)" and "Step 0" debug elements that should be removed for production.

---

## Test Data Cleanup

The following wizard-created objects should be deleted after testing. Use the API with admin credentials:

```bash
# Delete Test Wizard App (applicatie)
curl -X DELETE -u admin:admin 'http://localhost:8080/index.php/apps/openregister/api/objects/3/25/e78332be-d5f2-4566-a7ec-dc758cf1f212'

# Delete Test Wizard Dienst
curl -X DELETE -u admin:admin 'http://localhost:8080/index.php/apps/openregister/api/objects/3/12/e44a357e-00ce-40dc-8dd9-15ae192c0695'

# Delete koppelingen (find IDs first)
curl -s -u admin:admin 'http://localhost:8080/index.php/apps/openregister/api/objects/3/18?_limit=10&_fields=naam,id'

# Delete gebruik entries (find IDs first)
curl -s -u admin:admin 'http://localhost:8080/index.php/apps/openregister/api/objects/3/16?_limit=10&_fields=id,applicatie'
```

**Note:** Cleanup was not performed automatically due to permission restrictions. Manual cleanup recommended before next test run.
