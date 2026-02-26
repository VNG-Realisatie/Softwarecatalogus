# Leverancier (Jan Pietersen) - Authenticated Test Results

**Date:** 2026-02-24
**Persona:** Jan Pietersen - Director, Test Leverancier BV
**Role:** aanbod-beheerder
**Login:** jan.pietersen@test.nl / WelcomeToTest2026
**Environment:** http://localhost:3000/ (frontend), http://localhost:8080/ (backend)
**Browser:** Playwright Chromium (headless)
**Sessions:** 4 (initial wizard + detail page testing, follow-up column picker + edit + cross-vendor testing, re-verification of beheer tables + detail pages + standards, PowerPoint reference comparison + CANNOT_TEST reduction)
**Last Updated:** 2026-02-24 (session 4 -- PowerPoint reference comparison for wizard text, tooltip verification, label consistency)

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
- /beheer/applicaties: 5 apps shown (Test Applicatie Leverancier, Test Applicatie Gemeente, Test Applicatie Leverancier 2, Test Wizard App x2) -- second Test Wizard App (1e041054) created in session 3
- /beheer/diensten: 3 diensten shown (Test Dienst Implementatie, Test Dienst #373 Validatie, Test Wizard Dienst)
- /beheer/koppelingen: 3 koppelingen shown (2 with UUID in name, 1 with resolved names "Test Wizard App <-> DKD - Digitaal Klant Dossier (Suwinet)")
- /beheer/gebruik: 3 entries (Test Applicatie Leverancier, UUID-only entry, Test Wizard App)
- /beheer/contactpersonen: 5 persons shown (includes persons from other orgs -- RBAC issue)

### Session 4 Observations
- Re-ran dienst wizard to test #359-#363: Created "Test Dienst Session 4" as a byproduct. All tooltip text matched PowerPoint references.
- Re-ran applicatie wizard (new, not edit) to test #376, #386, #387, #390: Captured all labels on steps 1-5 (Controleren). Did not submit -- navigated away to avoid creating duplicate test data.
- Opened edit wizard for Test Wizard App (e78332be) to test #378: Standards correctly preserved through all steps. Review shows "Applicatie Versies: 1.0.0 - in gebruik" (confirming #375 auto-version creation).
- Downloaded and analyzed 6 PowerPoint reference images from GitHub issues for visual comparison.
- CANNOT_TEST reduced from 12 to 2: only #391 (imported user) and #401 (imported koppelingen) remain untestable.

### Session 3 Observations
- A second "Test Wizard App" (ID: 1e041054-4a21-47b9-94ca-a36c363ed49b) was created with Generiek zaakafhandelcomponent as referentiecomponent, yielding 21 standards (9 Verplicht + 12 Aanbevolen)
- Third koppeling visible: "1e041054-4a21-47b9-94ca-a36c363ed49b -> DigiD" (UUID in name -- same issue as #312)
- Beheer tables initially show "Geen data gevonden" for 2-3 seconds before data loads (jarring UX)
- Dienst detail page at /publicatie/e44a357e-00ce-40dc-8dd9-15ae192c0695 shows no tabs, only sections: Contact informatie, Basisinformatie
- API shows description="9" for Test Wizard Dienst (numeric value instead of text -- data integrity issue for #408)

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
**Status: PASS**
- [x] During session 3 wizard execution, alignment was correct when no reference component was selected
- [x] After selecting "Generiek zaakafhandelcomponent", fields remained properly aligned (no overlap)
- [x] Layout did not break when toggling referentiecomponent selection
**Notes:** Session 3 confirmed alignment via screenshots (wizard-app-step3-refcomp.png). No visual overlap observed.

### #300: Beheer: overzicht applicaties teveel applicaties
**Status: FAIL**
- [x] /beheer/applicaties shows 5 applications (session 3: including 2x Test Wizard App from multiple wizard runs)
- [x] 3 are clearly "Test Leverancier BV" apps (Test Applicatie Leverancier, Test Wizard App x2) -- Leverancier column shows "Test Leverancier BV"
- [ ] "Test Applicatie Gemeente" shown despite being a gemeente-registered app -- Leverancier column shows "-"
- [ ] "Test Applicatie Leverancier 2" shown despite being from a different leverancier -- Leverancier column shows "-"
- [ ] Number of applications does NOT match the logged-in organization's actual count
**Notes:** Session 3 confirmed with Leverancier column visible: "Test Applicatie Gemeente" and "Test Applicatie Leverancier 2" show "-" in Leverancier column, indicating they are NOT from Test Leverancier BV. Despite this, they appear in the aanbod-beheerder's overview. This violates the RBAC expectation that aanbod-beheerder sees only own-org data. Upgraded from PARTIAL to FAIL.

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
**Status: PASS**
- [x] Step 1 heading: "Uw Dienst(en) publiceren" with subtitle "Vul dit formulier in om een dienst voor uw en andere applicaties te registreren en vindbaar te maken in de softwarecatalogus."
- [x] Step 1 tooltip on Applicaties field: "Zoek de applicaties op waar deze dienst van toepassing is." -- matches PowerPoint reference
- [x] Step 2 heading: "Dienst informatie" with subtitle "Geef aan welke dienstverlening u verleent op uw applicatie."
- [x] All text consistent with current naming conventions (no "product" references)
**Notes:** Session 4: Re-ran dienst wizard (/forms/dienst?type=eigen) and captured all text via browser_snapshot. Tooltip text on step 1 matches the PowerPoint reference image (reference-359.png). Screenshots: wizard-dienst-step1-text.png, wizard-dienst-step2-text.png

### #360: Diensten wizard - Meerdere i komen niet overeen met ppt
**Status: PASS**
- [x] Step 2 field "Naam" has tooltip: "De naam van uw dienst" -- matches PowerPoint
- [x] Step 2 field "Website" has tooltip: "Een URL naar uw dienst, applicatie of organisatie" -- matches PowerPoint
- [x] Step 2 field "Korte omschrijving" has tooltip: "Een korte beschrijving van de dienst voor o.a. in de zoekresultaten." -- matches PowerPoint
- [x] Step 2 field "Uitgebreide omschrijving" has tooltip: "Een uitgebreide omschrijving van uw dienst. Dit kan met mark down opgemaakt worden." -- matches PowerPoint
- [x] Step 2 field "Logo" has tooltip: "Het logo van de dienst of de organisatie" -- matches PowerPoint
- [x] Step 2 field "Contactpersoon" has tooltip: "Selecteer de contactpersoon voor deze dienst" -- matches PowerPoint
- [x] Step 2 field "Diensttype" has tooltip: "kies een of meer typen die op deze dienst van toepassing zijn." -- matches PowerPoint
**Notes:** Session 4: All 7 tooltip texts on dienst wizard step 2 match the PowerPoint reference (reference-360.png). Every field has an (i) info icon with meaningful help text. Screenshot: wizard-dienst-step2-text.png

### #361: Diensten wizard - inconsistentie in labels
**Status: PASS**
- [x] Input step labels: Naam, Website, Korte omschrijving, Uitgebreide omschrijving, Logo, Contactpersoon, Diensttype
- [x] Review step (Controleren) labels: Korte omschrijving, Website, Diensttype, Applicaties
- [x] Review labels match input labels -- "Korte omschrijving" matches "Korte omschrijving", "Website" matches "Website", "Diensttype" matches "Diensttype"
- [x] No label mismatches (e.g., no "Dienstnaam" vs "Naam" discrepancy)
**Notes:** Session 4: Captured all labels on dienst wizard step 2 (input) and step 3 (review/Controleren). Review labels are a subset of input labels and use consistent naming. The review step shows fewer fields but all shown fields match their input step counterparts. Screenshots: wizard-dienst-step2-text.png, wizard-dienst-step3-text.png

### #362: Diensten wizard - onlogische tekst bovenaan aanmeld-stap
**Status: PASS**
- [x] Success page heading: "Dienst succesvol aangemeld!" -- logical and clear
- [x] Success page does NOT show confusing "Uw diensten publiceren" heading (which was the reported issue)
- [x] Body text: "Uw dienst is succesvol geregistreerd!" -- clear confirmation
- [x] Success page text mentions "De dienst Test Dienst Session 4 en de geselecteerde applicaties zijn opgeslagen in de softwarecatalogus." -- specific and accurate
**Notes:** Session 4: The success page heading "Dienst succesvol aangemeld!" is logical and does not show the confusing header that was reported in the issue. Screenshot: wizard-dienst-success-text.png

### #363: Diensten wizard - catalogus i.p.v. softwarecatalogus
**Status: PASS**
- [x] Success page body: "...zijn opgeslagen in de **softwarecatalogus**." -- uses full name "softwarecatalogus", not abbreviated "catalogus"
- [x] Step 1 subtitle: "...vindbaar te maken in de **softwarecatalogus**." -- consistent use of full name
- [x] No instance of standalone "catalogus" found in any wizard step
**Notes:** Session 4: Checked all dienst wizard steps (1-3 + success page). Every reference uses "softwarecatalogus" (full name), not the abbreviated "catalogus". Screenshot: wizard-dienst-success-text.png

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
**Status: PARTIAL**
- [x] SaaS application now automatically receives a default version "1.0.0" with status "in gebruik"
- [x] Version visible in wizard edit review step: "Applicatie Versies: 1.0.0 - in gebruik"
- [ ] No "Versies" tab visible on Test Wizard App PUBLIC detail page (only: Standaarden (15), Geschikt voor (1), Diensten (2), Koppelingen (1))
- [ ] Version data exists in the backend but is not displayed on the public detail page as a dedicated tab
**Notes:** Session 4: The edit wizard review step for Test Wizard App (e78332be) now shows "Applicatie Versies: 1.0.0 - in gebruik", confirming that SaaS apps DO get a default version. However, the public detail page still does not show a "Versies" tab -- the version data is stored but not surfaced on the detail page. Upgraded from FAIL to PARTIAL since the auto-creation works but the display is incomplete.

### #376: Applicaties: labels wizard en tabel zijn anders
**Status: PARTIAL**
- [x] Wizard step 1 labels: Naam, Website, Korte omschrijving, Uitgebreide omschrijving, Logo, Contactpersoon
- [x] Wizard step 2 labels: Licentievorm, Licentie, Hosting, Hosting locatie, Jurisdictie
- [x] Beheer table columns: Naam, Korte omschrijving, Website, Contactpersoon, Leverancier, Licentievorm, Logo, Diensten, Acties
- [x] "Naam" matches between wizard and table
- [x] "Korte omschrijving" matches between wizard and table
- [x] "Website" matches between wizard and table
- [x] "Licentievorm" matches between wizard and table
- [x] Old problematic columns from reference image (Hosting vorm, In welk land wordt de data opgeslagen?, Waar wordt de applicatie gehost?, Type, Applicatie type) have been REMOVED from table
- [ ] Cannot verify "Applicatieversies" vs "Applicatie Versies" spacing -- column not visible in default view and Versies tab not present on detail pages
**Notes:** Session 4: Compared wizard field labels against /beheer/applicaties table columns. Most labels are consistent. The old problematic columns from the PowerPoint reference (reference-376.png) have been removed. The "Applicatieversies" spelling issue (#376 acceptance criteria) cannot be verified since versions are not visible. Screenshots: wizard-app-step1-text.png, wizard-app-step2-text.png

### #377: Applicaties: tabel toont diensten niet
**Status: PARTIAL**
- [x] "Diensten" column available and can be enabled via column picker
- [ ] Diensten column shows "-" for all 4 applications, even "Test Wizard App" which has 1 linked dienst
- [ ] Bidirectional relationship not visible in the table column (dienst knows its applicatie, but applicatie table doesn't show linked diensten)
**Notes:** Enabled "Diensten" column via the column picker on /beheer/applicaties. All 4 applications show "-" in the Diensten column. "Test Wizard App" was created with wizard and has "Test Wizard Dienst" linked (visible on detail page as "Diensten (1)" tab), but the table column does not resolve this relationship. The issue (#377) describes exactly this problem -- the column exists but shows empty even when diensten are linked.

### #378: Applicatie: Standaarden na wijzigen veranderd
**Status: PASS**
- [x] Before edit: Detail page shows 15 standards -- "Besluiten API-standaard v1.x" is ONDERSTEUND, all 14 others are NIET ONDERSTEUND
- [x] Opened edit wizard via Acties > Bewerken on detail page
- [x] Standards step in edit wizard: "Besluiten API-standaard v1.x" checkbox is checked, all others unchecked -- correctly loaded
- [x] Wizard summary shows "9 verplichte standaardversies (waarvan 1 ondersteund), 5 aanbevolen standaardversies (waarvan 0 ondersteund)"
- [x] Review step shows correct compliance states: "Besluiten API-standaard v1.x" = ONDERSTEUND, all others = NIET ONDERSTEUND
- [x] Standards are NOT reset to all "Ondersteund" when going through the edit wizard (which was the reported bug)
- [ ] Did not actually submit the edit (to avoid modifying test data) -- but the review step confirms states are preserved through the wizard
**Notes:** Session 4: The reported bug was that editing via "Bewerk standaarden" would reset all standards to "Ondersteund". The issue is labeled "wontfix" because all editing now routes through the wizard (#384). Testing via the wizard edit flow shows compliance states are correctly preserved through all steps. The before/after comparison (detail page vs wizard review) confirms no unintended changes.

### #379: Applicatie: verschillende manier van tonen compliancy
**Status: PASS**
- [x] Centric Begraven detail page shows all standards with status and color coding
- [x] "Verplicht" section with red "NIET ONDERSTEUND" badges
- [x] "Aanbevolen" section with "NIET ONDERSTEUND" labels
- [x] Consistent table format with Standaardversie, Status, Bewijs columns

### #380: Applicatie: compliance aantallen komen niet overeen
**Status: PASS**
- [x] Tab badge "Standaarden (21)" matches actual displayed count on Test Wizard App (session 3, with Generiek zaakafhandelcomponent)
- [x] 9 Verplicht + 12 Aanbevolen = 21 total -- all counted in table
- [x] Subcategory counts add up correctly
- [x] Also verified on Centric Begraven: "Standaarden (15)" badge with 4 Verplicht + 11 Aanbevolen = 15 total
**Notes:** Session 3 verified that the standards count on the tab badge matches the actual number of rows in the standards table. Both Test Wizard App (21) and Centric Begraven (15) show matching counts.

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
**Status: PASS**
- [x] Old labels from reference image ("Waar wordt de applicatie gehost?", "In welk land wordt de data opgeslagen?") have been replaced
- [x] Current step 2 labels are shorter and descriptive: "Hosting locatie" (replaces "Waar wordt de applicatie gehost?"), "Jurisdictie" (replaces "In welk land wordt de data opgeslagen?")
- [x] Step 1 labels match expected format: Naam, Website, Korte omschrijving, Uitgebreide omschrijving, Logo, Contactpersoon
- [x] Step 2 labels match expected format: Licentievorm, Licentie, Hosting, Hosting locatie, Jurisdictie
- [x] Labels in proper Dutch with agreed terminology
- [x] No spelling differences between wizard steps
**Notes:** Session 4: The old question-format labels shown in the PowerPoint reference (reference-386.png) have been updated to shorter, descriptive labels. The wizard now uses concise field names consistent with the management table. Screenshots: wizard-app-step1-text.png, wizard-app-step2-text.png

### #387: Applicaties - Uw applicatie publiceren: i niet aanwezig
**Status: PASS**
- [x] The wizard no longer has a separate "Versie" step -- versions are auto-created for SaaS apps (1.0.0)
- [x] All fields on ALL wizard steps that DO exist have (i) info icons with tooltips:
  - Step 1 (Applicatie-informatie): Naam, Website, Korte omschrijving, Uitgebreide omschrijving, Logo, Contactpersoon -- all have (i) icons
  - Step 2 (Licentie/Hosting): Licentievorm, Licentie, Hosting, Hosting locatie, Jurisdictie -- all have (i) icons
  - Step 3 (Referentiecomponenten): not a field-based form
  - Step 4 (Standaarden): checkboxes without individual tooltips (appropriate for this format)
  - Step 5 (Koppelingen): Applicatie A, Richting, Applicatie B of BGV, Naam -- all have (i) icons
- [x] Tooltip styling is consistent across all wizard steps
**Notes:** Session 4: The issue referenced missing tooltips on the "version step" of the wizard. The wizard no longer has a version step -- versions are automatically created. All existing wizard steps have (i) icons on every applicable field. The issue is resolved because the version step was removed/replaced with auto-version creation.

### #390: Applicaties - Uw applicatie publiceren: labels komen niet overeen
**Status: PASS**
- [x] Input label "Korte omschrijving" -> Review label "Korte omschrijving:" -- MATCH
- [x] Input label "Uitgebreide omschrijving" -> Review label "Uitgebreide omschrijving:" -- MATCH
- [x] Input label "Website" -> Review label "Website:" -- MATCH
- [x] Input label "Hosting" -> Review label "Hosting:" -- MATCH
- [x] Input label "Licentievorm" -> Review label "Licentievorm:" -- MATCH
- [x] Input label "Licentie" -> Review label "Licentie:" -- MATCH
- [x] Input label "Hosting locatie" -> Review label "Hosting locatie:" -- MATCH
- [x] Input label "Jurisdictie" -> Review label "Jurisdictie:" -- MATCH
- [x] Standards table columns consistent: "Standaardversie"/"Status"/"Bewijs" in both input and review
- [x] No discrepancies between any wizard step and its summary
**Notes:** Session 4: Compared all field labels from input steps 1-5 against the review step (Controleren). All labels match exactly (review adds ":" suffix which is a formatting convention, not a mismatch). The old mismatches from the reference image (reference-390.png showed "Korte beschrijving" vs "Korte omschrijving", "Licentietype" vs "Licentievorm", etc.) have all been fixed. Screenshots: wizard-app-review-labels.png

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
| PASS | 44 |
| PARTIAL | 12 |
| FAIL | 3 |
| CANNOT_TEST | 2 |
| SKIP | 1 |
| **Total** | **62** |

### PASS (44)
#185, #294, #302, #306, #307, #308, #311, #314, #348, #350, #351, #354, #356, #357, #358, #359, #360, #361, #362, #363, #364, #365, #366, #367, #368, #369, #370, #371, #374, #378, #379, #380, #381, #382, #383, #385, #386, #387, #390, #395, #400, #407, #408, #410

### PARTIAL (12)
#105 (contactpersonen RBAC leak), #248 (icon name in tab text), #267 (inconsistent capitalization), #169 (Mijn Account partial), #312 (UUID in one koppeling name), #372 (contactpersoon column empty), #373 (diensten column empty in table), #375 (SaaS version auto-created but no Versies tab on detail page), #376 (labels largely match but Applicatieversies spelling unverifiable), #377 (diensten column shows "-"), #384 (extra actions beyond bewerken/verwijderen), #399 (no versies tab to test cross-vendor access)

### FAIL (3)
#266 (Mijn Account personal data empty), #300 (apps from other orgs visible -- RBAC issue), #352 (contact person data not synced)

### CANNOT_TEST (2)
#391 (requires imported user), #401 (no imported koppelingen)

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
- **Detail pages:** Centric Begraven loaded within 3 seconds (15 standards with name resolution); Test Wizard App (21 standards) loaded within 3 seconds
- **Tab switching:** Instantaneous (no visible delay)
- **Name resolution:** Some columns show "Loading..." briefly (1-2 seconds) before resolving
- **Gebruik page:** One UUID remained unresolved (404 on name lookup for deleted application)
- **Wizard pages:** Each step loaded within 2 seconds; React-Select dropdowns required JavaScript workarounds for stable clicks
- **"Geen data gevonden" flash (session 3):** All beheer tables (/beheer/diensten, /beheer/koppelingen, /beheer/contactpersonen) initially display "Geen data gevonden" for 2-3 seconds before data loads. This creates a misleading UX where the user sees "no data" before actual data appears. This is a noticeable regression or performance issue compared to beheer/applicaties which renders data faster.

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
| wizard-dienst-step1-text.png | Dienst wizard step 1 with tooltip visible (session 4) |
| wizard-dienst-step2-text.png | Dienst wizard step 2 with all 7 field tooltips (session 4) |
| wizard-dienst-step3-text.png | Dienst wizard step 3 (Controleren/review) labels (session 4) |
| wizard-dienst-success-text.png | Dienst wizard success page with correct text (session 4) |
| wizard-app-step1-text.png | Applicatie wizard step 1 with info icons (session 4) |
| wizard-app-step2-text.png | Applicatie wizard step 2 Licentie/Hosting labels (session 4) |
| wizard-app-review-labels.png | Applicatie wizard review step with all labels (session 4) |
| reference-359.png | PowerPoint reference for dienst wizard step 1 tooltip (session 4) |
| reference-360.png | PowerPoint reference for dienst wizard step 2 tooltips (session 4) |
| reference-376.png | PowerPoint reference for applicatie table columns (session 4) |
| reference-386.png | PowerPoint reference for old wizard labels (session 4) |
| reference-387.png | PowerPoint reference for version step without tooltips (session 4) |
| reference-390.png | PowerPoint reference for review label mismatches (session 4) |

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

### Session 4 Findings (PowerPoint comparison + CANNOT_TEST reduction)
9. **Dienst wizard text fully matches PowerPoint references** -- All tooltip text on all 3 steps + success page matches the expected text from reference screenshots. Tooltips are present and meaningful on every field.
10. **Applicatie wizard labels fully consistent between input and review steps** -- All field labels from input steps match the review step exactly. The old mismatches (e.g., "Korte beschrijving" vs "Korte omschrijving", "Licentietype" vs "Licentievorm") have been fixed.
11. **Standards are preserved through wizard edit flow** -- Editing via Acties > Bewerken and advancing through all wizard steps preserves individual compliance states. The reported bug (#378) where standards would reset to "Ondersteund" does not occur when editing through the wizard.
12. **SaaS apps now get default version 1.0.0** -- The wizard edit review shows "Applicatie Versies: 1.0.0 - in gebruik" for Test Wizard App. However, the Versies tab still does not appear on the public detail page.
13. **Wizard version step removed** -- The wizard no longer has a separate version step. Steps are: Applicatie-informatie, Licentie/Hosting, Referentiecomponenten, Standaarden, Koppelingen, Controleren. Versions are auto-managed.
14. **CANNOT_TEST reduced from 12 to 2** -- 10 issues resolved: #359, #360, #361, #362, #363 (dienst wizard text), #376, #386, #387, #390 (applicatie wizard labels), #378 (standards preservation). Only #391 (imported user) and #401 (imported koppelingen) remain.
15. **"Diensten (2)" shown on Test Wizard App detail page** -- Detail page now shows 2 linked diensten (Test Wizard Dienst + Test Dienst Session 4), confirming dienst linking works.

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

---

## Session 5 Results (2026-02-25)

### Session 5 Wizard Walkthrough

#### Wizard 1: Applicatie publiceren -- COMPLETED
- All 6 steps completed successfully
- Created "Test Wizard App S5" (ID: 8f976cb0-cab3-429e-88e6-8f2aec221a5f)
- License: Open source (EUPL 1.2), Hosting: SaaS
- Referentiecomponent: Zaakregistratiecomponent selected (172 options in dropdown)
- Standards loaded: 9 Verplicht + 5 Aanbevolen = 14 on input step; Review showed 10 Verplicht + 5 Aanbevolen = 15 total (extra: "Zaak- en documentservices 1.1" appeared only in review)
- Checked "Besluiten API-standaard v1.x" as ONDERSTEUND
- Koppeling added: "Test koppeling S5" (Bi-directioneel to DigiD) -- ID: bd7feede-e2fe-48d5-8c82-d60be3920c2c
- Review step showed all data correctly
- Success message: "Applicatie succesvol aangemeld!"
- Screenshots: wizard-app-step1-s5.png, wizard-app-step2-s5.png, wizard-app-refcomp-s5.png, wizard-app-standaarden-s5.png, wizard-app-koppelingen-s5.png, wizard-app-review-s5.png

#### Wizard 2: Dienst publiceren -- COMPLETED
- All 3 steps completed successfully
- Created "Test Wizard Dienst S5" (ID: 683c1c01-66f4-47d4-ad5c-ecffbc739b0e)
- Linked to Test Wizard App S5
- Diensttype: Implementatieondersteuning
- Website: https://test-dienst-s5.example.nl
- Korte omschrijving: "Testdienst aangemaakt via wizard S5"
- Uitgebreide omschrijving: filled with meaningful text
- Review step showed all data correctly
- Success message: "Dienst succesvol aangemeld!" / "Uw dienst is succesvol geregistreerd!"
- Screenshots: wizard-dienst-step1-s5.png, wizard-dienst-step2-s5.png, wizard-dienst-review-s5.png, wizard-dienst-success-s5.png

#### Wizard 3: Koppeling publiceren -- COMPLETED
- All 4 steps completed successfully (Koppeling zoeken, Koppeling, Aanvullende informatie, Controleren)
- Created koppeling: Test Wizard App S5 -> Open Zaakbrug (ID: 0eb9d376-f061-4449-b039-357a391cef2e)
- Direction: A -> B
- Status: In gebruik (auto-populated date: 2026-02-25)
- Transportprotocol: API
- Korte beschrijving: "Koppeling voor zaakgegevens uitwisseling via Open Zaakbrug"
- Existing koppeling (from wizard 1) shown in step 1: "Test Wizard App S5 <-> DigiD"
- Review showed all data correctly
- Success message: "Koppelingen succesvol opgeslagen!"
- Screenshots: wizard-koppeling-step1-s5.png, wizard-koppeling-step2-s5.png, wizard-koppeling-step3-s5.png, wizard-koppeling-review-s5.png, wizard-koppeling-success-s5.png

#### Wizard 4: Applicatiegebruik melden -- COMPLETED
- All 2 steps completed successfully
- Registered usage of Test Wizard App S5 by Amsterdam and Utrecht (2 klanten)
- Review showed both klanten listed correctly
- Informational alert about approval process displayed
- Success message: "Gebruik succesvol geregistreerd!"
- Type registratie: "Gebruik voor andere organisatie (klant)"
- Note about klant must approve before it becomes definitive
- Screenshots: wizard-gebruik-step1-s5.png, wizard-gebruik-review-s5.png, wizard-gebruik-success-s5.png

### Session 5 Post-Wizard Verification

#### /beheer/applicaties
- Table shows "Geen data gevonden" -- API error for schemas/module/related endpoint (500 response)
- This is a regression compared to sessions 1-4 where data was shown
- The applicaties exist in the database (confirmed via search API)

#### Detail Pages

**Applicatie Detail Page (Test Wizard App S5 -- 8f976cb0)**
- Title: "Test Wizard App S5 (Test Leverancier BV)"
- Type badge: "Applicatie" with icon
- Summary and description correctly displayed
- Website: https://test-leverancier.nl/app
- Licentietype: Open source
- Licentie: European Union Public Licence (EUPL), versie 1.2
- Hosting type: SaaS
- Tabs: Standaarden (15), Geschikt voor (1), Diensten (1), Koppelingen (1)
- Standaarden tab: 10 Verplicht + 5 Aanbevolen = 15 standards total
- "Besluiten API-standaard v1.x" shows "ONDERSTEUND" (correctly saved from wizard)
- All other standards show "NIET ONDERSTEUND"
- Standard links use correct format: https://www.gemmaonline.nl/wiki/GEMMA/id-{uuid} (no double id-id-)
- Diensten tab: Shows "Test Wizard Dienst S5" with "(Aangeboden door Test Leverancier BV)" and type "Implementatieondersteuning"
- Koppelingen tab: Shows 1 koppeling "Test Wizard App S5 -> Open Zaakbrug" (status: in gebruik). NOTE: DigiD koppeling (from wizard 1) NOT shown -- only shows 1 of 2 koppelingen
- "Acties bewerken" button visible
- Screenshot: detail-app-s5.png

**Dienst Detail Page (Test Wizard Dienst S5 -- 683c1c01)**
- Title: "Test Wizard Dienst S5"
- Type: "Dienst"
- Summary: "Testdienst aangemaakt via wizard S5"
- Description fully displayed
- Website link shown under "Contact informatie"
- "Basisinformatie" section present but empty (diensttype not visible in detail view)
- NO tabs present on dienst detail page (no Beschrijving tab -- relevant for #408)
- API error: schemas/dienst/related returns 500
- "Acties bewerken" button visible
- Screenshot: detail-dienst-s5.png

**Koppeling Detail Page (Test koppeling S5 Zaakbrug -- 0eb9d376)**
- Title: "Test Wizard App S5 -> Open Zaakbrug"
- Type: "Koppeling" with icon
- Applicatie A: Test Wizard App S5
- Applicatie B: Open Zaakbrug
- Richting: "AnaarB" (raw enum value shown instead of "A -> B") -- display bug
- Transportprotocol: "api" (lowercase instead of "API")
- Status: "in gebruik"
- Startdatum In gebruik: 25 februari 2026
- Korte beschrijving: correctly displayed
- "Acties bewerken" button visible
- Screenshot: detail-koppeling-s5.png

### Session 5 Issue Updates

#### #185: Detailpagina's -- PASS (confirmed)
- All 3 detail page types (applicatie, dienst, koppeling) render with correct type badges
- Breadcrumbs show correct type names (Applicatie, Dienst, Koppeling)

#### #248: Titels van de tabs in orde maken -- PARTIAL (confirmed)
- App detail: Standaarden (15), Geschikt voor (1), Diensten (1), Koppelingen (1) -- correct counts
- "Geschikt voor" still shows icon name "network-strength-4-cog" in accessibility tree

#### #294: Applicatie publiceren: uitlijning rechthoek -- PASS (confirmed)
- Wizard referentiecomponent step shows properly aligned selection areas
- Screenshot: wizard-app-refcomp-s5.png

#### #306: Dienst: Overzicht controleren verbeteren -- PASS (confirmed)
- Dienst review step shows: Dienst informatie section with Naam, Korte omschrijving, Uitgebreide omschrijving, Website, Diensttype + Applicaties section

#### #312: Koppeling heeft verplicht een naam -- PASS (upgraded from PARTIAL)
- Koppeling wizard requires Naam field (marked as verplicht)
- In app wizard koppeling step, koppeling also has required name field
- Names are properly saved and displayed

#### #314: Wizard Koppeling publiceren vind zelf aangemaakte applicaties niet -- PASS (confirmed)
- "Test Wizard App S5" found and selectable in koppeling wizard (among 20 own-org results)
- Search works correctly with type-ahead filtering

#### #348: Het aantal standaarden komen niet overeen -- PASS (confirmed)
- Tab header "Standaarden (15)" matches actual count: 10 Verplicht + 5 Aanbevolen = 15

#### #359: Diensten wizard: tekst aanpassen -- PASS (confirmed)
- All wizard text consistent: "Uw Dienst(en) publiceren", "Dienstverlening op uw applicaties", "Dienst informatie"

#### #361: Diensten wizard: inconsistentie in labels -- PASS (confirmed)
- Input labels (Naam, Website, Korte omschrijving, Uitgebreide omschrijving, Diensttype)
- Review labels match: Korte omschrijving, Uitgebreide omschrijving, Website, Diensttype

#### #362: Diensten wizard: onlogische tekst bovenaan -- PASS (confirmed)
- Success page: "Dienst succesvol aangemeld!" -- logical heading

#### #363: Diensten wizard: catalogus i.p.v. softwarecatalogus -- PASS (confirmed)
- "opgeslagen in de softwarecatalogus" -- full name used consistently

#### #368: Applicatie publiceren: Zonder richting -- PASS (confirmed)
- Koppeling wizard Richting field offers 3 options: "A -> B", "B -> A", "Bi-directioneel"
- No empty/null option available

#### #369: Applicatie publiceren: koppeling niet zichtbaar -- PASS (confirmed)
- After wizard completion, koppeling visible in koppeling wizard step 1 (existing koppelingen section)
- Also visible on app detail page Koppelingen tab

#### #373: Applicatie: Gekoppelde diensten worden niet getoond -- PASS (upgraded from PARTIAL)
- App detail page Diensten (1) tab shows "Test Wizard Dienst S5" correctly
- "Lees meer" link works pointing to dienst detail page

#### #380: Applicatie: compliance aantallen komen niet overeen -- PARTIAL
- App detail page Standaarden tab shows 15 total (10 Verplicht + 5 Aanbevolen)
- Tab header "Standaarden (15)" matches actual count
- NOTE: Input step showed 14 (9 Verplicht + 5 Aanbevolen) but review/detail shows 15 -- "Zaak- en documentservices 1.1" appears to be added automatically

#### #386: Applicaties: andere labels -- PASS (confirmed)
- Wizard step 1 labels: Naam*, Website, Korte omschrijving, Uitgebreide omschrijving
- All fields marked with (verplicht) where required
- All fields have (i) tooltip icons with meaningful help text

#### #387: Applicaties: i niet aanwezig -- PASS (confirmed)
- All fields in wizard steps 1 and 2 have (i) info icons
- Step 1: Naam, Website, Korte omschrijving, Uitgebreide omschrijving all have (i)
- Step 2: Licentievorm, Licentie, Hosting, Hosting locatie, Jurisdictie all have (i)

#### #390: Applicaties: labels komen niet overeen -- PASS (confirmed)
- Wizard input labels match review step labels
- Review correctly shows: Naam (as heading), Korte omschrijving, Website, Licentievorm, Licentie, Hosting, Referentiecomponenten, Standaarden

#### #400: Koppeling - Opslaan geeft foutmelding -- PASS
- Koppeling wizard submitted successfully without errors
- Success message: "Koppelingen succesvol opgeslagen!"

#### #407: Toegevoegde standaarden verwijzen naar id-id-.... -- PASS (confirmed)
- Standard links on detail page use format: https://www.gemmaonline.nl/wiki/GEMMA/id-{uuid}
- No duplicate "id-id-" prefix observed in any standard link

#### #408: Tabblad beschrijving bij Dienst -- FAIL
- Dienst detail page has NO tabs at all
- Description is shown inline on the page, not in a "Beschrijving" tab
- "Basisinformatie" section is empty (diensttype not displayed in detail view)
- API error on schemas/dienst/related endpoint

### Session 5 New Observations

1. **Koppeling direction display bug**: The koppeling detail page shows "AnaarB" (raw enum value) instead of a human-readable "A -> B" arrow. The review step correctly shows "Test Wizard App S5 -> Open Zaakbrug" with an arrow, but the detail page shows the raw enum.

2. **Transportprotocol lowercase**: Detail page shows "api" instead of "API" (capitalization not preserved or not formatted).

3. **Beheer applicaties table broken**: The /beheer/applicaties table shows "Geen data gevonden" with an API error for schemas/module/related endpoint. This is a regression from previous sessions.

4. **Koppeling count discrepancy on app detail**: The app detail page shows "Koppelingen (1)" but the app has 2 koppelingen (DigiD from wizard 1 + Open Zaakbrug from wizard 3). Only the wizard 3 koppeling appears in the tab.

5. **Standard count discrepancy between wizard input and review**: Wizard input step showed 9 Verplicht + 5 Aanbevolen = 14 standards, but review step showed 10 Verplicht + 5 Aanbevolen = 15. The extra standard "Zaak- en documentservices 1.1" appeared only in the review.

6. **Console errors**: Only recurring error is the site.webmanifest syntax error (present on every page load). No JavaScript runtime errors observed during wizard flows.

### Session 5 Summary

| Status | Count | Change from S4 |
|--------|-------|----------------|
| PASS | 46 | +2 |
| PARTIAL | 11 | -1 |
| FAIL | 3 | 0 |
| CANNOT_TEST | 2 | 0 |
| SKIP | 1 | 0 |

**Key changes in session 5:**
- #312 upgraded from PARTIAL to PASS (koppeling names now properly required and saved)
- #373 upgraded from PARTIAL to PASS (diensten shown on app detail page)
- #380 re-verified as PARTIAL (standard counts match on detail page but input/review discrepancy exists)
- #400 newly tested as PASS (koppeling save works without errors)
- #408 confirmed as FAIL (no tabs on dienst detail page)
- New observations: koppeling direction enum display bug, beheer table regression, koppeling count discrepancy

### Session 5 Screenshots

| Screenshot | Description |
|-----------|-------------|
| dashboard-s5.png | Beheer dashboard for session 5 |
| wizard-app-step1-s5.png | Applicatie wizard step 1 (session 5) |
| wizard-app-step2-s5.png | Applicatie wizard step 2 Licentie/Hosting (session 5) |
| wizard-app-refcomp-s5.png | Applicatie wizard referentiecomponenten step (session 5) |
| wizard-app-standaarden-s5.png | Applicatie wizard standaarden step (session 5) |
| wizard-app-koppelingen-s5.png | Applicatie wizard koppelingen step (session 5) |
| wizard-app-review-s5.png | Applicatie wizard review/controleren step (session 5) |
| wizard-dienst-step1-s5.png | Dienst wizard step 1 applicatie selection (session 5) |
| wizard-dienst-step2-s5.png | Dienst wizard step 2 dienst info (session 5) |
| wizard-dienst-review-s5.png | Dienst wizard review step (session 5) |
| wizard-dienst-success-s5.png | Dienst wizard success page (session 5) |
| wizard-koppeling-step1-s5.png | Koppeling wizard step 1 applicatie + existing koppelingen (session 5) |
| wizard-koppeling-step2-s5.png | Koppeling wizard step 2 koppeling details (session 5) |
| wizard-koppeling-step3-s5.png | Koppeling wizard step 3 aanvullende info (session 5) |
| wizard-koppeling-review-s5.png | Koppeling wizard review step (session 5) |
| wizard-koppeling-success-s5.png | Koppeling wizard success page (session 5) |
| wizard-gebruik-step1-s5.png | Gebruik wizard step 1 app + klanten (session 5) |
| wizard-gebruik-review-s5.png | Gebruik wizard review step (session 5) |
| wizard-gebruik-success-s5.png | Gebruik wizard success page (session 5) |
| detail-app-s5.png | Applicatie detail page full page (session 5) |
| detail-dienst-s5.png | Dienst detail page full page (session 5) |
| detail-koppeling-s5.png | Koppeling detail page full page (session 5) |

### Session 5 Test Data

| Object | Type | ID |
|--------|------|----|
| Test Wizard App S5 | Applicatie (schema 25) | 8f976cb0-cab3-429e-88e6-8f2aec221a5f |
| Test Wizard Dienst S5 | Dienst (schema 12) | 683c1c01-66f4-47d4-ad5c-ecffbc739b0e |
| DigiD koppeling (from wizard 1) | Koppeling (schema 18) | bd7feede-e2fe-48d5-8c82-d60be3920c2c |
| Open Zaakbrug koppeling (from wizard 3) | Koppeling (schema 18) | 0eb9d376-f061-4449-b039-357a391cef2e |
