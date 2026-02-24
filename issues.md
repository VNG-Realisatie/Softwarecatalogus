# Softwarecatalogus - Issues In Review

**Date:** 2026-02-22
**Source:** [VNG-Realisatie Project Board #17, View 22](https://github.com/orgs/VNG-Realisatie/projects/17/views/22)

## Summary

- **Total open issues on GitHub:** 244
- **IGS issues (detailed with acceptance criteria):** 135
- **Other issues (summary table):** 109
- **Issues with screenshot-based acceptance criteria:** See "Image Comparison" note below

### Image Comparison for Screenshot-Based Issues

Many issues (especially wizard text changes #359, #360, #274, #376, #386, #387, #390) reference PowerPoint screenshots as the source of truth for expected text. Testing agents should:
1. **Fetch the reference screenshot** from the GitHub issue image URL using `WebFetch`
2. **Navigate to the relevant wizard step** in the browser
3. **Take a screenshot** of the current UI using `browser_take_screenshot`
4. **Compare visually** — Claude is multimodal and can read text from both images to compare labels, titles, tooltips, field names, etc.
5. Mark individual text elements as matching or not matching

The authoritative PowerPoint source document is attached to issue #329.

---

## IGS Issues (In Review) — 114 issues

### #6: Als aanbod-beheerder wil ik kunnen registreren welke standaarden door mijn pakket worden ondersteund en eventueel testrapporten beschikbaar stellen

**Labels:** Aanbod, PvE eis, Bevinding
**Test Step:** Step 16

**Summary:** As a supply manager, I want to register which standards my package supports and optionally make test reports available, so that municipalities can see compliance information when selecting software.

**Acceptance Criteria:**
- [ ] On the application edit/wizard page, a standards section is available where the supplier can add supported standards
- [ ] The supplier can select standards from a dropdown that shows GEMMA and other recognized standards
- [ ] After selecting a standard, the compliance status can be set (e.g., "Ondersteund", "Niet ondersteund")
- [ ] An optional URL field for test reports/compliance proof is available per standard
- [ ] The compliance link opens correctly to the external URL (not treated as relative path — see #382)
- [ ] The registered standards are visible on the application's public detail page
- [ ] Standards persist correctly after saving
- [ ] When reference components are selected or changed in the wizard, the standards dropdown dynamically refreshes to show only standards linked to the selected reference components
- [ ] Standards are presented at the "standaardversie" (standard version) level, not just at the "standaard" level
- [ ] The total standards list equals the union of all standards linked to all selected reference components

**Key Context from Comments:** Related to #407 (standard links containing duplicate "id-" prefix), #382 (compliance links not working), and #378 (standards resetting after edit). The standards management has had multiple bugs affecting display and saving.

---

### #15: Als aanbod- en gebruik-beheerder wil ik data vanuit de softwarecatalogus kunnen exporteren

**Labels:** Aanbod, Gebruik, PvE eis, Bevinding, Wijziging
**Test Step:** Step 13

**Summary:** As a supply and usage manager, I want to export data from the Softwarecatalogus so I can use it in other systems or for reporting.

**Acceptance Criteria:**
- [ ] On the management overview pages (Applicaties, Diensten, Koppelingen), an export button is available
- [ ] The exported data contains ONLY the applications/products belonging to the user's own organization (not all products in the catalogue)
- [ ] Exported columns include both human-readable names AND UUIDs (extra column prefixed with "_" for ID columns alongside name columns)
- [ ] The CSV format correctly separates into columns when using "Text to Columns" in Excel (no columns being overwritten)
- [ ] The export works correctly for both aanbod-beheerder (supply manager) and gebruik-beheerder (usage manager) roles
- [ ] The export reflects RBAC permissions (users only see what they are authorized to see)

**Key Context from Comments:** A previous bug caused all products across the entire catalogue to be exported instead of just the user's own organization. The latest update adds an extra column prefixed with "_" for readable names alongside UUIDs. Related to #355 for UUID readability.

---

### #23: Als aanbod- en gebruik-beheerder van de huidige Softwarecatalogus wil ik mijn reeds geregistreerde gegevens weer zien in de nieuwe Softwarecatalogus

**Labels:** Organisatie en configuratie, Aanbod, Gebruik, PvE eis, Bevinding, Datamigratie
**Test Step:** Step 19

**Summary:** As a supply and usage manager of the current (old) Softwarecatalogus, I want to see my previously registered data in the new Softwarecatalogus after data migration.

**Acceptance Criteria:**
- [ ] Organizations (gemeenten, samenwerkingen, leveranciers) from the old Softwarecatalogus are present in the new system
- [ ] Applications/modules from the old catalogue are visible and searchable
- [ ] Module versions have been imported without duplicates (unique IDs only)
- [ ] Relationships between objects (e.g., samenwerkingen linked to their gemeenten) are correctly maintained
- [ ] A supplier logging in can see their own previously registered applications and products
- [ ] A municipality logging in can see their own previously registered usage data
- [ ] Koppelingen are imported correctly with readable names where both linked applications exist (UUIDs in names are expected when a referenced application no longer exists — see #312)
- [ ] References to GEMMA reference components and standards point to valid entries
- [ ] Organization names display correctly (not as UUIDs)

**Key Context from Comments:** Data migration CSVs at https://github.com/VNG-Realisatie/Softwarecatalogus-datamigratie/tree/main/data. Multiple corrections were made to the dataset. Related: #312, #315. The import tool is complete; final acceptance depends on verifying the complete imported dataset.

---

### #65: Als aanbod- en gebruik-beheerder van een organisatie wil ik mijn collega's toegang kunnen geven tot de softwarecatalogus

**Labels:** Aanbod, Gebruik, PvE eis, Bevinding
**Test Step:** Step 5

**Summary:** As an organization manager, I want to give my colleagues access to the Softwarecatalogus independently, including managing users/contact persons, assigning roles, and inviting new users.

**Acceptance Criteria:**
- [ ] On the /beheer/contactpersonen page, an organization admin can add a new user with: Voornaam, Tussenvoegsel, Achternaam, E-mailadres, Telefoonnummer, Functie
- [ ] After creating a new user, they appear in the contact persons overview without page refresh
- [ ] The "Organisatie" field is pre-filled (not manually entered)
- [ ] Username is automatically set to the email address
- [ ] Roles appropriate to the organization type are available for selection
- [ ] "Is aanspreekpunt" toggle works and persists after saving
- [ ] Editing a user and saving correctly updates the data
- [ ] Invite functionality sends an invitation granting access
- [ ] Deleting a contact person linked to an application shows a warning
- [ ] Only contact persons from the user's own organization are shown
- [ ] Roles available for selection are filtered by organization type (leverancier = only aanbod-beheerder; gemeente = multiple roles)
- [ ] A notification field (multi-select) allows configuring which system notifications the user receives
- [ ] A user can be linked to multiple organizations by being added as contact person in each
- [ ] "Uitnodigen" functionality sends an actual invitation email granting the user Softwarecatalogus access

**Key Context from Comments:** Known overlap with #365 (user creation not working). Multiple bugs reported: users not appearing after creation, editing not saving, duplicate entries, Conduction accounts appearing. The notification field should be multi-select.

---

### #73: Als aanbod-beheerder wil ik meerdere contactpersonen kunnen registreren en deze aan specifieke pakketten kunnen koppelen

**Labels:** question, Aanbod, PvE eis, Bevinding
**Test Step:** Step 5

**Summary:** As a supply manager, I want to register multiple contact persons and link them to specific software packages.

**Acceptance Criteria:**
- [ ] A supplier can add multiple contact persons for their organization
- [ ] Contact persons can be linked to specific applications from a dropdown showing only the organization's own applications
- [ ] Contact person form includes: Voornaam, Tussenvoegsel, Achternaam, E-mailadres, Telefoonnummer, Functie
- [ ] After saving, a success notification is shown
- [ ] Contact persons are not duplicated when clicking save multiple times
- [ ] "Is aanspreekpunt" toggle persists after save
- [ ] Contact persons display with readable names (not UUIDs) in the application overview
- [ ] Deleting a linked contact person shows a warning
- [ ] Publishing works in a single action (no double confirmation)
- [ ] List only shows persons from the current user's organization
- [ ] Creating a second contact person for the same organization succeeds without errors
- [ ] Pagination on the contact persons overview works correctly

**Key Context from Comments:** Multiple bugs fixed: duplicate saving, form not reopening after save, null for empty first names. Latest comment references #365 as blocking duplicate.

---

### #85: (VNGR) Als ontwikkelaar wil ik via een veilige, publieke API toegang hebben tot aanbodinformatie uit de Softwarecatalogus ID-104

**Labels:** Aanbod, PvE eis, Bevinding
**Test Step:** Step 12

**Summary:** As a developer, I want secure public API access to supply information (organizations, software packages, standards) for integration.

**Acceptance Criteria:**
- [ ] The public API for the Softwarecatalogus register is accessible and returns data
- [ ] Auto-generated OAS documentation is accessible per register at `/index.php/apps/openregister/api/registers/{id}/oas` (e.g., register 2 for Publications: `/index.php/apps/openregister/api/registers/2/oas`, register 3 for Voorzieningen: `/index.php/apps/openregister/api/registers/3/oas`). **Note:** Registers with an `organisation` field (registers 3 and 4) currently return 500 unless the requesting user is in that org — this is an OpenRegister bug where the OAS endpoint incorrectly filters by organisation.
- [ ] The API returns data about aanbiedende organisaties (offering organizations)
- [ ] The API returns data about aangeboden softwarepakketten (offered software packages)
- [ ] The API returns data about ondersteunde standaarden (supported standards)
- [ ] The API supports standard query parameters for filtering and pagination
- [ ] The OAS documentation link is accessible from the register action menu in the backend

**Key Context from Comments:** The GEMMA data is served by a separate register (#148). This issue covers the Softwarecatalogus (voorzieningen) data specifically. OAS documentation is generated per-register, NOT per-app — use `/api/registers/{id}/oas` endpoints.

---

### #105: Als gebruik-beheerder willen we dat aanbieders onze applicatielandschappen en koppelingen niet zien

**Labels:** Gebruik, PvE eis
**Test Step:** Step 12

**Summary:** As a gebruik-beheerder, we want suppliers (aanbod-beheerder) to not see our application landscapes and connections. The RBAC model scopes data visibility per organization — the page itself may be accessible, but aanbod-beheerder should only see their own organization's data.

**RBAC Reference:** See `softwarecatalog/lib/Settings/softwarecatalogus_register.json`:
- `module` (applicatie) schema → `authorization.read`: `{ "group": "aanbod-beheerder", "match": { "_organisation": "$organisation" } }` — own org only
- `koppeling` schema → `authorization.read`: `{ "group": "aanbod-beheerder", "match": { "_organisation": "$organisation" } }` — own org only

**Acceptance Criteria:**
- [ ] As aanbod-beheerder, the `/beheer/applicatielandschappen` page shows ONLY applications belonging to my own organization
- [ ] As aanbod-beheerder, no other organization's applications are visible in the applicatielandschappen overview
- [ ] As aanbod-beheerder, koppelingen are scoped to my own organization's connections only
- [ ] The RBAC `_organisation` matching correctly filters data per the register.json authorization rules
- [ ] API requests from aanbod-beheerder return only own-org module/koppeling objects

**Key Context from Comments:** The page itself being accessible to aanbod-beheerder is acceptable — the requirement is about **data scoping**, not page visibility. The RBAC model uses conditional matching (`{ "match": { "_organisation": "$organisation" } }`) to ensure aanbod-beheerder only sees their own org's data.

---

### #141: Als functioneel beheerder wil ik, naar aanleiding van gemeentelijke herindeling of een leveranciersovername, organisaties en al hun relaties (aanbod en/of gebruik) kunnen samenvoegen met een bestaande of nieuwe organisatie

**Labels:** Aanbod, PvE eis, nonblock, Bevinding
**Test Step:** Step 21

**Summary:** As a functional administrator, I want to merge organizations and their relationships following municipal redistricting or vendor acquisitions.

**Acceptance Criteria:**
- [ ] In the backend tables view, an object (organization) can be selected for merging
- [ ] A merge modal appears with three columns: Object A, Object B, and Result
- [ ] In the Result column, the user can choose which object's values to keep for each field
- [ ] After saving, the target object is updated with the chosen values
- [ ] All relationships (aanbod, gebruik, koppelingen) from Object A are transferred to Object B
- [ ] Object A is deleted after merge completion
- [ ] No timeout errors during merge (previously "timeout of 30000ms exceeded")
- [ ] Merge result displays readable object card titles (not UUIDs)
- [ ] Merge correctly handles the "group" field
- [ ] Merge functionality works correctly with imported/migrated data (not just manually created data)
- [ ] Documentation/handleiding for performing a merge is available
- [ ] The "group" field is correctly set based on the target organization's actual group name (not a generated name like "groningen_1")

**Key Context from Comments:** A test merging "Groningen" into "Almere" succeeded but the "group" field was incorrectly set. Timeouts were experienced. Documentation/instructions for merging not yet available.

---

### #144: Als gebruiker van de Softwarecatalogus wil ik een overzicht met zoek- en filteropties van alle organisaties die pakketten of diensten aanbieden

**Labels:** Aanbod, PvE eis, Bevinding, Restpunt, Zoeken
**Test Step:** Step 14

**Summary:** As a user, I want an overview with search and filter options for all organizations that offer packages or services.

**Acceptance Criteria:**
- [ ] The search page (/zoeken) shows results for organizations, applications, and services
- [ ] Filter facets allow filtering by organization type (gemeente, samenwerking, leverancier)
- [ ] A "clear all filters" button resets all applied filters
- [ ] Search results for applications show the supplier name (clickable)
- [ ] Search results show a short description (samenvatting)
- [ ] Search result cards display appropriate icons for applicatie, dienst, and aanbieders
- [ ] Entering a search term on the homepage and clicking search navigates to search results with the term preserved
- [ ] Organization names display as readable names (not UUIDs)
- [ ] Filter counts match the actual number of results
- [ ] Search result cards for applications show the top 2 most frequently registered reference components by gemeenten
- [ ] For logged-in gebruik-beheerder/raadpleger, search result cards show the number of gemeenten that have registered usage of the application
- [ ] Supplier name on search result cards is clickable and navigates to the supplier's detail page

**Key Context from Comments:** Extensive testing feedback. Previously auto-triggering while typing, search terms disappearing, org names showing as UUIDs. Related: #346, #315, #74.

**Testing Note (RBAC-aware result counts):** Result counts differ based on authentication status — this is by design. RBAC is group-based (Nextcloud groups). Key behaviors:
- **Unauthenticated (public):** Only sees Applicaties where `geregistreerdDoor = Leverancier`, only sees Organisaties of type Leverancier/Gemeente/Samenwerking. Cannot see Contactpersonen, Gebruik, or Koppelingen at all. (~1,853 results)
- **gebruik-beheerder (e.g., Maria):** Unrestricted read on Applicatie, Organisatie, Gebruik, Koppeling — sees ALL of these including municipality-registered applications. This is expected behavior, not a data leak.
- **aanbod-beheerder (e.g., Jan):** Sees own-org Applicaties + all public ones, own-org Gebruik/Koppelingen.
- **admin:** Bypasses ALL RBAC, sees everything (~12,645 results).
- Testers should compare against their role's expected visibility, not against public/unauthenticated counts.

---

### #148: (VNGR) De GEMMA-architectuur is opvraagbaar met een API

**Labels:** Referentiearchitectuur
**Test Step:** Step 12

**Summary:** The GEMMA architecture (ArchiMate model data) should be queryable via a public API, including elements, relations, views, and property definitions.

**Acceptance Criteria:**
- [ ] The ArchiMate API auto-generated documentation (OAS) is accessible at `/index.php/apps/openregister/api/registers/4/oas` (register 4 = GEMMA/AMEFF). **Note:** Currently returns 500 because register 4 has `organisation` set — the OAS endpoint incorrectly filters by org. This is an OpenRegister bug, not a Softwarecatalogus config issue.
- [ ] The /elements endpoint returns ArchiMate elements with correct counts matching the GEMMA model
- [ ] Elements include the ArchiMate-type field
- [ ] Empty properties are omitted from element responses
- [ ] The /relations endpoint returns relations correctly (not "bad gateway")
- [ ] Relations include the ArchiMate-type field
- [ ] The /views endpoint returns view definitions with correct count
- [ ] The API supports a model-id query parameter for querying specific models
- [ ] The /models endpoint returns a list of available models
- [ ] ID fields (Archi id, Object ID, Open Register id) are documented
- [ ] The GEMMA model can be downloaded via the "Gemma downloaden" button on the Mijn omgeving page
- [ ] The downloaded XML file can be successfully imported into Archi without errors
- [ ] The imported model in Archi matches the original GEMMA model (only label placement differences expected)

**Key Context from Comments:** Multiple endpoints were previously broken. The API needs to support multiple ArchiMate models. ID fields are confusing — Archi IDs, Object IDs, and Open Register IDs.

---

### #155: (VNGR) Definities worden weergegeven via een interactieve optie binnen de softwarecatalogus

**Labels:** Organisatie en configuratie, Cms
**Test Step:** Step 21

**Summary:** Definitions/glossary terms should be displayed interactively, with hover tooltips and a searchable glossary panel.

**Acceptance Criteria:**
- [ ] The glossary endpoint at /apps/opencatalogi/api/glossary returns glossary terms
- [ ] Terms from the current Softwarecatalogus lexicon are present
- [ ] Pages containing glossary terms show them as interactive (clickable or hover-able)
- [ ] Hovering/clicking a term shows its definition in a tooltip or panel
- [ ] A glossary search panel allows searching across all defined terms
- [ ] Definitions include links to external sources where appropriate
- [ ] **Admin: Add term with empty external link** — Creating a glossary term without an external link succeeds (no validation error)
- [ ] **Admin: Add term with keywords** — Keywords field shows a taggable text input, not collaborative tag UUIDs
- [ ] **Admin: Edit existing term** — Opening an existing term shows keywords as readable text tags, not UUIDs
- [ ] Glossary term detection works on all relevant page types (CMS pages, organization pages, application pages, dienst pages, koppeling pages)
- [ ] Keywords are not case-sensitive for term detection (e.g., "API" matches "api")
- [ ] The "description" field content is shown when a term is expanded/clicked (not just the "summary")

**Key Context from Comments:** The glossary was built for Dimpact with two parts: terms detected on current page, and search-in-terms. The lexicon terms were manually copied. The endpoint has been added. Fixed in opencatalogi@74e46927: NcSelectTags replaced with NcSelect for keywords, externalLink validation made optional.

---

### #160: (VNGR) Performance plotten views tbv ID-77

**Labels:** Referentiearchitectuur
**Test Step:** Step 22

**Summary:** ArchiMate views should load with acceptable performance. Benchmark: "Poster basisbeveiligingsniveau" view (388 nodes) under 11 seconds total.

**Acceptance Criteria:**
- [ ] The largest ArchiMate view (388 nodes) loads and becomes interactive within 11 seconds on Chromium (i5/16GB)
- [ ] Each loading phase completes in approximately 3 seconds average
- [ ] Smaller views load in under 7 seconds
- [ ] Views become interactive (tooltips, zoom) after rendering completes
- [ ] Backend API for a single view returns data within ~0.5 seconds
- [ ] Large views display a loading indicator
- [ ] Acceptable performance on Chrome, Edge, and Firefox without ad-blockers
- [ ] Benchmark view is specifically "Poster basisbeveiligingsniveau van referentiecomponenten" (388 nodes)
- [ ] Warning/loading indicator shown for large views that may take a moment to fully load

**Key Context from Comments:** Performance varies by browser (Firefox ~2x slower) and ad-blockers (uBlock can double render time). Benchmark: "Zeist" with 261 packages in 11 seconds. Hardware: i5, 16GB DDR4/DDR5, 512GB SSD.

---

### #169: Rest issues van Organisatie en Configuratie

**Labels:** Organisatie en configuratie, Restpunt
**Test Step:** Step 21

**Summary:** Remaining issues from Organization and Configuration: registration form alignment, account sync, organization activation, "My Account" improvements.

**Acceptance Criteria:**
- [ ] Registration form fields align with "Mijn Account" form, including "tussenvoegsel" field
- [ ] "Mijn Account" page shows the user's organization name (clickable link to /my-organisation)
- [ ] "Mijn Account" does NOT show "Weergavenaam" or "E-mail geverifieerd", but DOES show "Functie"
- [ ] KVK number from registration is displayed in "Organisatie bewerken"
- [ ] After activating organization, status changes to "Actief"
- [ ] After activating organization, user account is also activated
- [ ] Consistent capitalization for form field labels
- [ ] Nextcloud account data synchronized with linked contact person
- [ ] No repeated "Nextcloud autorisatie - De tijd is verstreken" errors on first login
- [ ] After clicking "Activeren" on an organization, the status column immediately changes from "Concept" to "Actief" (without needing to reload)
- [ ] The registration form asks for "tussenvoegsel" (prefix), consistent with the "Mijn Account" form fields

**Key Context from Comments:** Nextcloud account must sync with linked contact person. "Weergavenaam" should be removed, replaced with "Functie". Organization link to /my-organisation.

---

### #185: Detailpagina's

**Labels:** Aanbod, Bevinding, Restpunt
**Test Step:** Step 7

**Summary:** Various UI improvements needed on detail pages: showing page type, supplier names, reorganizing tabs, fixing navigation consistency.

**Acceptance Criteria:**
- [ ] Detail page clearly shows what type of page is being viewed (Organisatie, Product, Applicatie, etc.)
- [ ] Supplier/leverancier name is displayed on application detail pages
- [ ] "Standaarden" shown in its own tab
- [ ] "Geschikt voor" shown in its own tab
- [ ] Tab previously labeled "Producten" is renamed to "Onderdeel van product(en)"
- [ ] Both "beschrijving kort" and "beschrijving lang" are displayed
- [ ] URL and breadcrumb navigation are consistent regardless of navigation path
- [ ] Left menu "Applicaties" is highlighted when viewing an application detail page

**Key Context from Comments:** Discrepancy found: search navigation produces /beheer/module/{id} while Applicaties navigation produces /beheer/applicaties/{id}. Different layout between search and management side is by design (screen size).

---

### #186: Koppelingen

**Labels:** Aanbod, Bevinding, Restpunt, Koppeling
**Test Step:** Step 11

**Summary:** Multiple bugs in the "Koppelingen" (connections) feature: displaying titles, linked external services, handling non-existent applications, detail pages.

**Acceptance Criteria:**
- [ ] Koppelingen display in a table format with readable titles (not blank or UUID-only)
- [ ] Koppelingen linked to "buitengemeentelijke voorzieningen" correctly display the referenced external service
- [ ] Koppelingen do not reference non-existent applications (graceful handling)
- [ ] Detail page shows all relevant fields: name, type, transport protocol, linked applications, external service
- [ ] Koppeling detail page at /publicatie/{uuid} renders correctly

**Key Context from Comments:** All items in the body checklist are marked resolved ([x]) but the issue remains open, suggesting verification is needed.

**Testing Note (data quality):** UUID-only titles, "null" references, and arrow-only names in older koppelingen are caused by **bad client data** (koppelingen referencing applications that were deleted or never existed). This is not a code bug. Testers should focus on newly created koppelingen to verify the display logic is correct, and ignore legacy koppelingen with broken references.

---

### #225: Testresultaten 29-10-2025

**Labels:** Aanbod, Bevinding, Restpunt
**Test Step:** General

**Summary:** Collection of test findings from October 29, 2025: RBAC/permission issues, search visibility, organization discoverability, confusing cross-organization actions.

**Acceptance Criteria:**
- [ ] A newly registered and activated organization is findable via the search engine
- [ ] The blue "+" button for adding products is NOT shown on other organizations' public pages (or clearly adds to own organization)
- [ ] A logged-in aanbod-beheerder can see their own products under "Producten" and "Applicaties"
- [ ] A logged-in aanbod-beheerder can edit their own applications from the search page
- [ ] Organization's published status is accurately reflected in backend and frontend
- [ ] URL fields for standards do not require "https://" prefix
- [ ] On another organization's public page, the blue "+" button either does not appear OR is clearly labeled to indicate it adds to the current user's own organization

**Key Context from Comments:** Many issues expected to be resolved by RBAC replacing the "published" status approach. The organization "Baron" created during testing was not findable via search.

---

### #248: Titels van de tabs in orde maken

**Labels:** Aanbod, Afschalen Producten
**Test Step:** Step 7

**Summary:** Not all tabs on detail pages have proper text titles. Some tabs only show an icon without text.

**Acceptance Criteria:**
- [ ] ALL tabs on application/product detail pages have a visible text label (not just an icon)
- [ ] The "Overige" tab displays both its icon AND the text label "Overige"
- [ ] Tab labels are consistent across all detail page types
- [ ] Tab labels are accessible for screen readers

**Key Context from Comments:** Retesting on both test and accept environments was marked OK by WilcoLouwerse. Issue remains open despite retests being OK.

---

### #263: Niet ingelogd: onder een applicatie staat in het tabje gebruik de gemeenten

**Labels:** Organisatie en configuratie, Afschalen Producten
**Test Step:** Step 7

**Summary:** When not logged in, the "Gebruik" tab shows which municipalities use the application. This should not be visible to unauthenticated users.

**Acceptance Criteria:**
- [ ] When NOT logged in, the "Gebruik" tab is NOT visible or does not show municipality usage data
- [ ] When logged in as an authorized user, the "Gebruik" tab IS visible with correct data
- [ ] Verify on both test and accept environments

**Key Context from Comments:** Retesting on test environment confirmed "the usage tab is not visible when not logged in" (expected behavior). Issue remains open pending final sign-off.

---

### #266: Na inloggen: Mijn account & persoonlijke gegevens leeg?

**Labels:** Organisatie en configuratie, Afschalen Producten, Bevinding
**Test Step:** Step 4

**Summary:** After logging in, "Mijn account" page and personal details are empty, possibly caused by incorrect data synchronization between contact person and Nextcloud account.

**Acceptance Criteria:**
- [ ] After logging in, "Mijn account" displays personal information (name, email, function, organization)
- [ ] "Persoonlijke gegevens" section is populated from the linked contact person object
- [ ] When a contact person is converted to a Nextcloud account, data is correctly transferred
- [ ] The "me" endpoint returns correct user data including organization
- [ ] No delay beyond a few seconds between login and data appearing
- [ ] The `/api/me` endpoint returns correct personal data (name, email, function) and organization for the logged-in user

**Key Context from Comments:** Root cause: converting contact person to Nextcloud account doesn't correctly transfer data. Reproduced on both test and accept environments.

---

### #267: Naam is softwarecatalogus i.p.v. Softwarecatalogus

**Labels:** Organisatie en configuratie, Afschalen Producten, Tekstuele wijzigingen
**Test Step:** Step 21

**Summary:** The application name displays as "softwarecatalogus" or "Development Catalogus" instead of "Softwarecatalogus".

**Acceptance Criteria:**
- [ ] Browser tab, header, and homepage read "Softwarecatalogus"
- [ ] The name is consistent across all pages (header, footer, login, registration)
- [ ] Verified on both test and accept environments

**Key Context from Comments:** As of February 4, 2026, tester confirmed name is still incorrect. This is a configuration/text change.

---

### #274: Wizard dienst: tekst dient nog aangepast te worden naar nieuwe benamingen

**Labels:** Aanbod, Afschalen Producten, Tekstuele wijzigingen
**Test Step:** Step 9

**Summary:** The service wizard still uses old terminology that needs updating to the new naming conventions.

**Acceptance Criteria:**
- [ ] Service wizard uses updated terminology consistent with the rest of the application (no "product" references where "applicatie" should be used)
- [ ] All form labels, button texts, help texts, and confirmation messages use new naming
- [ ] Wizard title and step descriptions match current agreed terminology
- [ ] No references to deprecated terms remain in the dienst wizard flow
- [ ] Wizard text matches the diensten wizard texts from #187 (section 9: "Dienst registreren")
- [ ] **Image comparison**: Fetch the reference screenshot from the issue (`https://github.com/user-attachments/assets/77eb9be8-27d0-4c19-bac0-cf82eb12b343`) showing the old terminology, then verify in the live UI whether the terms have been updated

**Key Context from Comments:** Moved from "Afschalen Producten" to "Gebruik" scope. Texts need review after the product-to-application rename. Related to #187 (Tekstvoorstellen) for the exact replacement text.

---

### #278: Filterteksten aanpassen

**Labels:** Aanbod, Afschalen Producten, Tekstuele wijzigingen, Zoeken
**Test Step:** Step 14

**Summary:** Filter texts on the search page need adjustment. Suspected caching issue affecting display.

**Acceptance Criteria:**
- [ ] Filter labels on /zoeken display correct, updated text
- [ ] Updated texts appear without stale cached content
- [ ] Filter texts are consistent with terminology used in wizards and management pages
- [ ] Filter currently labeled "Schema" or "Objecttype" is renamed to "Type" (or agreed alternative)
- [ ] Documentation is available explaining how VNG can manage filter texts

**Key Context from Comments:** A caching issue was noted. Documentation on how VNG can manage filter texts still needs to be written.

---

### #280: Zoeken: sorteren gaat niet goed.

**Labels:** Aanbod, Afschalen Producten, Zoeken
**Test Step:** Step 14

**Summary:** Sorting on search results page does not work correctly. Also, the "Type" filter is missing.

**Acceptance Criteria:**
- [ ] Clicking a sort option (e.g., "Naam A-Z") correctly reorders results
- [ ] Sorting applies across ALL pages (full-dataset sorting, not just current page)
- [ ] Changing sort order after a text search correctly re-sorts results
- [ ] A "Type" filter is available in the search filters
- [ ] Sort order is maintained when navigating between pages

**Key Context from Comments:** As of Feb 3, sorting issues still not resolved and "Type" filter still missing. Expectation is full-dataset sorting.

---

### #286: Aanmelden organisatie: 500-error bij wachtwoord wijzigen

**Labels:** Organisatie en configuratie, Afschalen Producten
**Test Step:** Step 4

**Summary:** 500 server error when changing password during organization registration.

**Acceptance Criteria:**
- [ ] Changing the account password during registration/first login completes without errors
- [ ] After changing password, user can log in with new password
- [ ] Password change form provides appropriate validation feedback
- [ ] Server responds with success status code (2xx)

**Key Context from Comments:** Confirmed OK on both test and accept environments by WilcoLouwerse. Should be re-verified.

---

### #294: Applicatie publiceren: uitlijning rechthoek om op te voeren.

**Labels:** Aanbod, Afschalen Producten, Bevinding, Wizard
**Test Step:** Step 7

**Summary:** Alignment of input rectangle/box is incorrect in the application publishing wizard when a reference component is selected.

**Acceptance Criteria:**
- [ ] When NO reference component is selected, fields are properly aligned
- [ ] When a reference component IS selected, fields remain properly aligned (no overlap)
- [ ] Layout does not break when toggling between having/not having a reference component
- [ ] Alignment is consistent across different screen sizes

**Key Context from Comments:** Re-opened after being previously marked OK. Alignment breaks specifically when a reference component IS selected (confirmed Feb 4).

---

### #300: Beheer: overzicht applicaties teveel applicaties

**Labels:** Aanbod, Afschalen Producten, Bevinding, Beheer
**Test Step:** Step 7

**Summary:** Management overview shows too many applications — count doesn't match organization's actual applications.

**Acceptance Criteria:**
- [ ] On /beheer/applicaties, number of applications matches the logged-in organization's actual count
- [ ] Count is correct for newly created suppliers
- [ ] Count is correct for imported/migrated suppliers (e.g., Centric)
- [ ] Applications from other organizations are NOT shown
- [ ] Spot-check 5 imported suppliers against import CSV data

**Key Context from Comments:** Count correct for "new" suppliers, not yet verified for imported ones. Need to pick 5 from import files including Centric.

---

### #302: Beheer: applicatie bewerken (ophalen van gegevens is traag)

**Labels:** Aanbod, Afschalen Producten, Bevinding, Beheer
**Test Step:** Step 7

**Summary:** Loading application data for editing in the management section is slow.

**Acceptance Criteria:**
- [ ] Clicking "edit" on an application loads the form within 3 seconds
- [ ] Loading indicator is shown while data is fetching
- [ ] All fields are correctly populated when loading completes
- [ ] Performance is acceptable on the production/performance environment

**Key Context from Comments:** Need to verify on the "b omgeving performance" environment.

---

### #306: Dienst: Overzicht controleren verbeteren

**Labels:** help wanted, Aanbod, Afschalen Producten, Bevinding, Wizard, Wijziging
**Test Step:** Step 9

**Summary:** Service overview needs improvements: duplicate "Type"/"Diensttype" labels, redundant "Relaties" section, hidden properties still showing.

**Acceptance Criteria:**
- [ ] No duplicate between "Type" and "Diensttype" — only "Diensttype" shown
- [ ] "Relaties" section showing the provider is hidden (already in provider context)
- [ ] Properties configured as "not displayed" are NOT shown
- [ ] "dienstType" field properly descaled
- [ ] The "Relaties" section on the dienst overview page is hidden (provider context is already clear)

**Key Context from Comments:** Confirmed Feb 20: "de dubbelingen zijn verwijderd, dienstType is afgeschaald."

---

### #307: Diensten overzicht: meer dienst bij organisatie dan er horen

**Labels:** Aanbod, Afschalen Producten, Bevinding, Beheer, Wijziging
**Test Step:** Step 9

**Summary:** Services overview shows more services than belong to the organization. "Koppelingen" column shouldn't be selectable.

**Acceptance Criteria:**
- [ ] Only services belonging to the current organization are displayed
- [ ] Number of services matches expected count
- [ ] "Koppelingen" column is NOT available in the column picker
- [ ] Data model configuration excludes "koppelingen" from services table

**Key Context from Comments:** As of Feb 4, "koppelingen" column can still be selected. Should be hidden since connections can't be filled via service wizard.

---

### #308: Diensten overzicht: default kolommen + kolom verwijderen

**Labels:** Aanbod, Afschalen Producten, Bevinding, Beheer, Wijziging
**Test Step:** Step 9

**Summary:** Services overview needs correct default columns, "koppelingen" column should be removed.

**Acceptance Criteria:**
- [ ] Default columns are relevant and useful (without "koppelingen")
- [ ] "Koppelingen" column is NOT selectable
- [ ] Default columns shown are: name, type, status (or similar relevant set)
- [ ] Column configuration persists after page reload

**Key Context from Comments:** "Koppelingen" should be hidden since it can't be filled. Property definitions need adjusting.

---

### #312: Koppeling heeft verplicht een naam

**Labels:** Aanbod, Afschalen Producten, Restpunt, Datamigratie
**Test Step:** Step 11

**Summary:** Connections must have a mandatory name. Some appear as UUIDs or "Geen titel". Name should auto-generate from connected application names.

**Acceptance Criteria:**
- [ ] Name field is required when creating a new connection
- [ ] Name is pre-filled with "[Application A] [arrow] [Application B]" format
- [ ] Imported connections without a name receive the auto-generated default
- [ ] Imported connections with existing names retain them
- [ ] Newly created connections show readable names (not UUIDs) in search results
- [ ] Koppeling card highlights "Application A" explicitly in the card display
- [ ] The full connection description (A -> B) is shown in the description field of the card

**Note:** UUIDs in koppeling names are expected when one side references an application that no longer exists or was deleted. The name resolution uses application UUIDs as fallback when the referenced object cannot be found. This is not a bug — only koppelingen where both applications exist should show fully resolved names.

**Key Context from Comments:** Two test cases: creating connections and importing connections. Both must be verified.

---

### #314: Wizard Koppeling publiceren vind zelf aangemaakte applicaties niet

**Labels:** Aanbod, Bevinding, Koppeling
**Test Step:** Step 11

**Summary:** In the connection wizard, a supplier cannot find their own applications in the list. Shows applications from other suppliers instead.

**Acceptance Criteria:**
- [ ] In the connection wizard (/forms/koppeling), suppliers can find and select their own applications
- [ ] Searching by name returns the correct result
- [ ] Suppliers can only create connections where Application A is their own
- [ ] Municipalities can create connections for applications in their landscape
- [ ] Application list does not show unrelated organizations' applications
- [ ] Suppliers can ONLY set their own application as "Application A" in the connection wizard

**Key Context from Comments:** Supplier flow works on B environment. Municipality/collaboration flow (users creating connections for their landscape) does not yet work.

---

### #315: Hoge prioriteit: Zoekpagina toont deel van gemeentelijk applicatielandschap. Dit is géén publieke informatie

**Labels:** Aanbod, Afschalen Producten, Datamigratie, Zoeken
**Test Step:** Step 14

**Summary:** HIGH PRIORITY: Search page incorrectly shows municipalities as "suppliers" and displays private municipal application landscapes.

**Acceptance Criteria:**
- [ ] "Leverancier" filter on /zoeken contains ONLY actual suppliers, NOT municipalities
- [ ] Search result cards show the actual supplier as "aangeboden door", NOT a municipality
- [ ] Filtering by municipality name is not possible
- [ ] Application detail page shows the correct supplier
- [ ] Municipal application landscape data is not publicly visible to unauthenticated users
- [ ] Supplier on search card matches supplier on detail page
- [ ] RBAC-based filtering replaces the old "published" status approach for controlling visibility
- [ ] Import data no longer contains `@self.published` column (using RBAC instead)

**Key Context from Comments:** Root cause: municipalities were set as suppliers in import data. Fix involves RBAC and removing `@self.published` from import data. Test environment OK but "depubliceren" doesn't work.

---

### #332: Voorpagina inrichten

**Labels:** help wanted, Organisatie en configuratie, Cms
**Test Step:** Step 21

**Summary:** Home page needs configurable content: logo, menu bar, search window with banner, quote section, three content blocks, text+image section, footer.

**Acceptance Criteria:**
- [ ] Home page displays a logo linking to home
- [ ] Top-right shows dashboard and logout links (when logged in)
- [ ] Menu bar contains "Home" + configurable additional items
- [ ] When logged in, user's name and organization appear in menu bar
- [ ] Search window performs a search respecting user's permissions
- [ ] Banner behind search is configurable by functional admin
- [ ] Quote section (bold text with subtitle) is present and editable
- [ ] 3 content blocks with icon, title, text, and link, all equal dimensions
- [ ] Text section with title, text, link, and image is configurable
- [ ] Footer is configurable
- [ ] Functional administrators can edit all configurable sections
- [ ] VNG functional administrators can independently edit all home page content without developer intervention
- [ ] CMS documentation/instructions available at the Softwarecatalogus docs site

**Key Context from Comments:** Delivery should allow VNG to customize content. Duplicates with #397.

---

### #340: Bevindingen op tussenoplevering Zoeken

**Labels:** Zoeken, Wijziging
**Test Step:** Step 14

**Summary:** Collection of findings from search interim delivery: performance, sorting, missing filters, text changes.

**Acceptance Criteria:**
- [ ] Search filters load within 3 seconds (not 7-10 seconds)
- [ ] Text search results appear within 2 seconds, filters update within 3 seconds
- [x] Default sorting is "Naam - A naar Z" (client confirmed this is correct in meeting)
- [ ] Sorting after text search actually reorders results
- [ ] A date is visible on cards, using "Eerste registratie" (@self.created) date
- [ ] "Meest relevant" has a tooltip or explanation
- [ ] A "Type" filter is present (replacing removed "Schema" filter)
- [ ] Active filter indicator remains visible when text search is performed
- [ ] "Soort dienst" renamed to "Diensttype"

**Key Context from Comments:** Most fixes live on performance.accept.opencatalogi.nl/zoeken except "Soort dienst" rename. Date on cards uses @self.created.

---

### #343: Zoeken: Filter 'Type koppeling' toevoegen.

**Labels:** Aanbod, Gebruik, Zoeken, Koppeling, Wijziging
**Test Step:** Step 14

**Summary:** "Type koppeling" filter needed on search page with "extern" and "intern" values.

**Acceptance Criteria:**
- [ ] On /zoeken, a "Type koppeling" filter is available for connections
- [ ] Filter has exactly two options: "extern" and "intern"
- [ ] "extern" filters to external connections only
- [ ] "intern" filters to internal connections only
- [ ] Filter reflects the `koppelingType` attribute
- [ ] Filter visible only to logged-in users (RBAC on connections)

**Key Context from Comments:** "koppelingType" is derived: external = connection with external app. RBAC: must be logged in to see connections. Gebruik-beheerder sees all; aanbod-beheerder only their own.

---

### #344: Zoeken: Geen resultaten bij het selecteren van het Gravenbeheercomponent. Niet ingelogd.

**Labels:** Aanbod, Wijziging
**Test Step:** Step 14

**Summary:** Filtering by "Gravenbeheercomponent" reference component returns zero results despite applications existing.

**Acceptance Criteria:**
- [ ] Filtering by "Gravenbeheercomponent" returns matching applications
- [ ] The Type/schema filter is active and working
- [ ] This works for unauthenticated users
- [ ] Other reference component filters also return correct results

**Key Context from Comments:** Root cause: schema filter was disabled. Re-enabled on B environment.

---

### #345: Zoeken: toegevoegde dienst verschijnt niet in filters

**Labels:** Aanbod, Zoeken
**Test Step:** Step 14

**Summary:** Newly added service doesn't appear in search filters. "Diensttype" filter values not populated. Unknown "eigen-organisatie" value appears.

**Acceptance Criteria:**
- [ ] After adding a new service, it appears in search results
- [ ] "Diensttype" filter is populated with correct service type values
- [ ] "Type=Dienst" is available as a filter option
- [ ] No test configuration values like "eigen-organisatie" appear in production
- [ ] Filtering by "Dienst" shows only services

**Key Context from Comments:** "eigen-organisatie" was a test config value accidentally deployed. Service discoverability fixed on B environment.

---

### #346: Zoeken: paginering werkt niet

**Labels:** Aanbod, Zoeken
**Test Step:** Step 14

**Summary:** Pagination doesn't work — same results shown on every page when filtering (e.g., WCAG standard, 78 results).

**Acceptance Criteria:**
- [ ] Navigating to page 2 shows DIFFERENT results than page 1
- [ ] Pages 1, 2, 3, 4 each show unique, non-overlapping results
- [ ] Pagination works with filters applied
- [ ] Pagination works with different sort orders
- [ ] Total result count matches sum across all pages
- [ ] Page indicator reflects current page number

**Key Context from Comments:** Genuine bug introduced during performance refactor. Fixed on B environment. Needs verification on accept.

---

### #347: Zoeken: Dienstkaartje toont array

**Labels:** Aanbod, Wijziging
**Test Step:** Step 14

**Summary:** Service cards show raw array (e.g., `["type1", "type2"]`) instead of readable text. "Concept" status is unclear.

**Acceptance Criteria:**
- [ ] Service types displayed as readable comma-separated list (NOT raw JSON array)
- [ ] Service type values are human-readable labels
- [ ] "Concept" status either has a tooltip or is replaced with a clearer term
- [ ] Service card layout is consistent with application cards

**Key Context from Comments:** Graphical bug fixed on B environment. "Concept" status comes from data model.

---

### #348: Het aantal standaarden komen niet overeen bij Centric Begraven tussen de huidige softwarecatalogus en de nieuwe

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** Standards count for "Centric Begraven" differs between old and new softwarecatalogus.

**Acceptance Criteria:**
- [ ] "Centric Begraven" shows same number of standards as old softwarecatalogus
- [ ] Standards list is complete and matches imported data
- [ ] Compare 3-5 other applications to check for systemic issues
- [ ] Standards visible to unauthenticated users
- [ ] Display bug (identified as root cause) is fixed

**Key Context from Comments:** Turned out to be a display bug, not data migration issue. Sample checks on other apps looked correct.

---

### #349: Zoeken: UUID's onder standaarden filter.

**Labels:** Referentiearchitectuur, Aanbod
**Test Step:** Step 14

**Summary:** Standards filter displays raw UUIDs instead of human-readable names. Some apps reference non-existent standard version UUID.

**Acceptance Criteria:**
- [ ] Standards filter shows human-readable names (no UUIDs or "id-" prefixed entries)
- [ ] Sorting of filter list is alphabetical
- [ ] Apps referencing non-existent UUID handle it gracefully
- [ ] Reference components filter also contains no UUID entries

**Key Context from Comments:** No longer occurring on B environment for reference components. 4 apps (Geoboxx, Gouw6 BAG, GT-BAG, UDS BAG) still reference non-existent standard version UUID from older GEMMA version.

---

### #350: De link achter de gebruikersnaam laten verwijzen naar Mij account

**Labels:** Aanbod, Wijziging
**Test Step:** Step 4

**Summary:** Username link in navigation should point to "My Account" instead of dashboard.

**Acceptance Criteria:**
- [ ] Clicking username in top navigation navigates to "Mijn account" page
- [ ] Separate dashboard link still navigates to dashboard
- [ ] Username is displayed correctly

**Key Context from Comments:** Agreed as a good change but planned for after "afschalen producten" is complete.

**Testing Note:** This issue was not replicatable in manual testing. The "Beheer" link URL inconsistency reported by the test agent may be caused by MCP browser session state or navigation timing. Leave as-is until confirmed by a human tester.

---

### #351: Het laden van de tabbladen gaat ongelijk

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** Application detail page tabs load at noticeably different speeds, causing a jarring experience.

**Acceptance Criteria:**
- [ ] All tabs load within 1 second of page load (no staggered loading)
- [ ] If tabs can't load simultaneously, loading indicators are shown
- [ ] Performance meets acceptable thresholds on test environment

**Key Context from Comments:** Attributed to configuration error on accept environment. On B environment, tabs load within half a second.

---

### #352: Mijn account - Contactpersoon bij applicatie publiceren is niet veranderd ondanks aanpassing zojuist.

**Labels:** Aanbod
**Test Step:** Step 5

**Summary:** After editing account info (name, prefix), changes are not reflected in the contact person shown during application publishing. Nextcloud account updates but contact person object doesn't.

**Acceptance Criteria:**
- [ ] Updated first name, last name, or prefix on "Mijn Account" is immediately reflected in contact person on application forms
- [ ] Contact person name in listings matches updated account info
- [ ] No cache clearing needed for updated name to appear
- [ ] Prefix (tussenvoegsel) displayed correctly between first and last name

**Key Context from Comments:** Root cause: updating Nextcloud user doesn't update contact person object. Fix deployed to B environment. Root cause for #353, #356, #364, #367.

---

### #353: Mijn account – Je "functie" wordt niet aangepast na bewerken en opslaan. Cache legen werkt ook niet

**Labels:** Aanbod
**Test Step:** Step 6

**Summary:** After saving "functie" (job title) on My Account, the change is not reflected anywhere. Cache clearing doesn't help.

**Acceptance Criteria:**
- [ ] Editing "functie" on "Mijn Account" and saving immediately shows the update
- [ ] Updated function reflected everywhere the contact person's function appears
- [ ] No cache clearing needed

**Key Context from Comments:** Same root cause as #352 — contact person object not updated when Nextcloud account is modified.

---

### #354: Diensten - incomplete lijst applicaties

**Labels:** Aanbod, Wijziging
**Test Step:** Step 9

**Summary:** Application dropdown in service wizard shows incomplete/random subset instead of full list. Should use search-based selection like reference components.

**Acceptance Criteria:**
- [ ] Application selection allows searching through ALL available applications
- [ ] Uses a searchable dropdown (like reference components selector)
- [ ] All applications in the system are findable and selectable
- [ ] Selected application correctly saved after form submission

**Key Context from Comments:** Dropdown works and supports searching, but UX can be improved. Planned for after "afschalen producten."

---

### #355: Diensten: Export geeft allerlei UUID's

**Labels:** Aanbod, Wijziging
**Test Step:** Step 13

**Summary:** Services export contains raw UUIDs instead of human-readable text.

**Acceptance Criteria:**
- [ ] CSV export shows human-readable names for all reference fields
- [ ] Export combines readable text with UUIDs for re-import compatibility
- [ ] Application names, contact persons, service types exported with display names
- [ ] Export can be re-imported without data loss

**Key Context from Comments:** Confirmed Feb 19: "Export has been adjusted as requested." Duplicates #15.

---

### #356: Diensten: geen tussenvoegsel bij namen

**Labels:** Aanbod
**Test Step:** Step 9

**Summary:** Contact person column in services overview doesn't show prefix/tussenvoegsel.

**Acceptance Criteria:**
- [ ] "Contactpersoon" column shows full name including prefix (e.g., "Peter de Steam")
- [ ] Prefix displayed consistently across all views

**Key Context from Comments:** Same root cause as #352.

---

### #357: Diensten: Diensttype en Type wordt door elkaar gebruikt

**Labels:** Aanbod
**Test Step:** Step 9

**Summary:** "Diensttype" and "Type" used inconsistently. "eigen-organisatie" should be hidden.

**Acceptance Criteria:**
- [ ] "Diensttype" used consistently (not "Type")
- [ ] "Type" column renamed to "Diensttype" or removed if technical
- [ ] "eigen-organisatie" not shown to end users
- [ ] Facets/filters use correct data model terminology
- [ ] "Soort dienst" does NOT appear as a separate term or column — it is a duplication of "Diensttype" and should be removed or consolidated

**Key Context from Comments:** Configuration error. Confirmed Feb 20: all "...Type" entries removed, faceting refactored.

---

### #358: Diensten: De status "Concept" wordt nog op verschillende plekken getoond

**Labels:** Aanbod, Wijziging
**Test Step:** Step 9

**Summary:** "Concept" status appears in multiple places but was not in the requirements. Should be removed.

**Acceptance Criteria:**
- [ ] "Concept" not in services wizard
- [ ] "Concept" not in search results
- [ ] "Concept" not in services overview table
- [ ] "Concept" not available as filter option
- [ ] "Status" field for services doesn't contain "Concept"

**Key Context from Comments:** Not in PvE. Removed from backend data model. Frontend also needs removal.

---

### #359: Diensten wizard: Uw dienst publiceren - tekst aanpassen

**Labels:** Aanbod, Tekstuele wijzigingen
**Test Step:** Step 9

**Summary:** Information tooltip text in the "Uw dienst publiceren" wizard (step: searching for applications) doesn't match the approved PowerPoint text.

**Acceptance Criteria:**
- [ ] Tooltip text (behind "i" icon) when searching for Applicaties matches the PowerPoint reference
- [ ] **Image comparison**: Fetch the reference screenshot from the issue (WilcoLouwerse comment image: `https://github.com/user-attachments/assets/822dce30-9bd2-4104-9509-c547a69d7d4c`) showing the expected text, then compare with the live UI
- [ ] Text is consistent with the diensten wizard texts defined in #316 through #328
- [ ] Text preserved across environment resets (stored in configuration, not overwritten on reset)

**Key Context from Comments:** Texts were updated but not stored in config, so they were overwritten on environment reset. Issues #316-#328 are the source of truth for the "toevoegen" wizard. This issue is about the "publiceren" wizard text.

---

### #360: Diensten wizard – Uw dienst publiceren: Meerdere i komen niet overeen met ppt

**Labels:** Aanbod, Tekstuele wijzigingen
**Test Step:** Step 9

**Summary:** ALL information tooltips ("i" icons) in step 2 of the diensten "publiceren" wizard (entering service data) don't match the approved PowerPoint.

**Acceptance Criteria:**
- [ ] ALL tooltips ("i" icons) in step 2 of the diensten wizard match the PowerPoint reference
- [ ] **Image comparison**: Fetch the reference screenshot from WilcoLouwerse's comment (`https://github.com/user-attachments/assets/359e9ec2-9026-4ac3-b937-593a393899c3`) showing the expected text, then compare each tooltip with the live UI
- [ ] Each field label's tooltip text matches the PowerPoint specification
- [ ] No tooltip is missing (all fields that should have an "i" icon do have one)
- [ ] Changes stored in configuration for persistence

**Key Context from Comments:** Related to #359. Being tracked together with similar textual issues.

---

### #361: Diensten wizard – Uw dienst publiceren: inconsistentie in labels

**Labels:** Aanbod, Tekstuele wijzigingen
**Test Step:** Step 9

**Summary:** Labels on review/confirmation form don't match input field labels.

**Acceptance Criteria:**
- [ ] Review form labels exactly match input field labels
- [ ] All labels follow naming conventions from approved PowerPoint
- [ ] No discrepancies between data entry and summary/review steps

**Key Context from Comments:** Not a regression — texts present since wizard was first accepted but not yet aligned with latest PowerPoint.

---

### #362: Diensten wizard – Uw dienst publiceren: onlogische tekst bovenaan de aanmeld-stap

**Labels:** Aanbod
**Test Step:** Step 9

**Summary:** On the "Service successfully registered" page, header still shows "Uw diensten publiceren" which is confusing.

**Acceptance Criteria:**
- [ ] Confirmation page does NOT show "Uw diensten publiceren" as header
- [ ] Only success message and relevant follow-up actions shown
- [ ] Page title is contextually appropriate for completed registration

**Key Context from Comments:** Agreed as good change, planned for after "afschalen producten." Assigned to SudoThijn.

---

### #363: Diensten wizard – Uw dienst publiceren: catalogus i.p.v. softwarecatalogus

**Labels:** Aanbod, Tekstuele wijzigingen, Wijziging
**Test Step:** Step 9

**Summary:** Success message uses "catalogus" instead of "softwarecatalogus".

**Acceptance Criteria:**
- [ ] Success message uses "softwarecatalogus" not "catalogus"
- [ ] Codebase-wide: no standalone "catalogus" where "softwarecatalogus" should be used
- [ ] No instances of "software catalogus" (with space) — always "softwarecatalogus"

**Key Context from Comments:** Requested code search for all incorrect instances. Assigned to SudoThijn.

---

### #364: Contactpersonen: e-mailadres is leeg

**Labels:** Aanbod
**Test Step:** Step 5

**Summary:** After creating a new contact person, the email address field appears empty despite being entered.

**Acceptance Criteria:**
- [ ] After creating a contact person with an email, the email is immediately visible
- [ ] Email displayed in contact persons overview
- [ ] Email persists after page refresh

**Key Context from Comments:** Same root cause as #352 — contact person not updated from Nextcloud account.

---

### #365: Contactpersonen: error bij het opslaan van een contactpersoon

**Labels:** Aanbod
**Test Step:** Step 5

**Summary:** Editing and saving an existing contact person produces a 400 error, specifically when a role is selected.

**Acceptance Criteria:**
- [ ] Editing a contact person and saving does not produce a 400 error
- [ ] Saving with a role selected works without errors
- [ ] Changes are persisted and visible after saving
- [ ] Works regardless of whether a role is selected

**Key Context from Comments:** Bug fixed on B environment. Only happens when a role is selected before saving. Duplicates #73 and #65.

---

### #366: Contactpersonen: veld Rollen niet consistent

**Labels:** Aanbod, Wijziging
**Test Step:** Step 5

**Summary:** For suppliers, the "Roles" field has little value since they're always "Aanbod beheerders". Frontend/backend inconsistency.

**Acceptance Criteria:**
- [ ] For suppliers, "Rollen" field is hidden (always "Aanbod beheerders")
- [ ] Backend role matches frontend display for all contact persons
- [ ] Role column shows correct role matching backend data
- [ ] For municipalities, "Rollen" field remains visible (multiple roles applicable)

**Key Context from Comments:** Change request related to RBAC and security. Implementation details need refinement.

---

### #367: Contactpersonen: Tussenvoegsel wordt niet getoond

**Labels:** Organisatie en configuratie, Aanbod
**Test Step:** Step 5

**Summary:** Prefix/tussenvoegsel not displayed in contact persons overview.

**Acceptance Criteria:**
- [ ] Names include prefix (e.g., "Jan de Vries" not "Jan Vries")
- [ ] Prefix shown in all views where contact person name appears
- [ ] After editing to add prefix, it's immediately visible

**Key Context from Comments:** Same root cause as #352.

---

### #368: Applicatie publiceren: Zonder een richting aan te geven is de koppeling op te voeren

**Labels:** Aanbod, Wijziging
**Test Step:** Step 11

**Summary:** Connection wizard allows saving without specifying a direction. "Richting" was being used as default value.

**Acceptance Criteria:**
- [ ] "Richting" field does NOT have "Richting" as a submittable default
- [ ] User must select one of: "<-> Bi-directioneel", "A -> B", "B -> A"
- [ ] Saving without selecting a direction shows a validation error
- [ ] Error clearly indicates direction is required
- [ ] Existing connections without valid direction handled gracefully

**Key Context from Comments:** Validation rule was missing since first version. Fix deployed to B environment.

---

### #369: Applicatie publiceren: de aangemaakte koppeling is niet zichtbaar

**Labels:** Aanbod, Koppeling
**Test Step:** Step 11

**Summary:** Connection created through the "Publish Application" wizard is not visible in connections overview. RBAC bug.

**Acceptance Criteria:**
- [ ] Connection created via wizard appears in /beheer/koppelingen
- [ ] Connection displays correct application name, type, and fields
- [ ] Visible immediately after wizard completion without page refresh
- [ ] Overview properly loads and shows all connections

**Key Context from Comments:** Confirmed as RBAC bug, fixed on B environment.

---

### #370: Applicatie: teveel kolommen worden getoond

**Labels:** Organisatie en configuratie, Aanbod, Wijziging
**Test Step:** Step 7

**Summary:** Applications table shows too many columns including unclear fields (Type, Applicatietype, Omvat, etc.).

**Acceptance Criteria:**
- [ ] Column selector does NOT offer: Type, Applicatietype, Omvat, Onderdeel van, Beoordelingen, Kwetsbaarheden, Geregistreerd door
- [ ] Only columns with wizard-managed data are available
- [ ] Same rule applies to Services and Connections tables
- [ ] Default columns display meaningful data
- [ ] Koppeling names in the table resolve to readable names immediately (not delayed UUID-to-name resolution)
- [ ] Compliance column shows clear, understandable content (not just application name repeated or a dash)
- [ ] SaaS application version is immediately visible after creation (not delayed)

**Key Context from Comments:** General rule: tables should only show columns with wizard-managed data. Applies to Applications, Services, and Connections.

---

### #371: Applicatie: UUID onder compliance

**Labels:** Aanbod, Wijziging
**Test Step:** Step 7

**Summary:** Applications table shows raw UUID in Compliance column. Should be replaced with "standaardVersies".

**Acceptance Criteria:**
- [ ] No UUID values in any column on /beheer/applicaties
- [ ] Compliance column replaced with "Standaardversies" showing readable names
- [ ] Multiple standards displayed in readable format
- [ ] Column heading accurately reflects content
- [ ] Compliance column does NOT show the application name repeated — it should show standards/compliance data
- [ ] For imported suppliers, Compliance column shows actual compliance data (not just a dash "-")

**Key Context from Comments:** Fix: show "standaardVersies" instead. Adjusted on B environment.

---

### #372: Applicaties: Kolom Contactpersoon toont geen tussenvoegsel

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** Contact Person column doesn't display tussenvoegsel (e.g., "van der").

**Acceptance Criteria:**
- [ ] Contact Person column shows full name including prefix
- [ ] E.g., "Maria van der Berg" not "Maria Berg"
- [ ] Tussenvoegsel displayed in all locations where contact person appears

**Key Context from Comments:** Duplicate of #352. Same underlying bug.

---

### #373: Applicatie: Gekoppelde diensten worden niet getoond

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** Application overview doesn't show associated services. "Diensten" display option was missing.

**Acceptance Criteria:**
- [ ] "Diensten" column is available and can be enabled on /beheer/applicaties
- [ ] When application has linked services, they are displayed
- [ ] Multiple services shown or count/link displayed
- [ ] Clicking navigates to filtered services view
- [ ] Bidirectional: service shows application AND application shows services
- [ ] When >10 diensten are linked to one applicatie, a count/link to filtered diensten view is shown

**Key Context from Comments:** Display option was missing, added to B environment. Duplicate of #377.

---

### #374: Applicaties: Standaarden, Standaarden GEMMA en Standaardversies?

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** Three confusing standards columns: "Standaarden", "Standaarden GEMMA", "Standaardversies". Should only show "Standaardversies".

**Acceptance Criteria:**
- [ ] Only "Standaardversies" column shown by default
- [ ] Separate "Standaarden" and "Standaarden GEMMA" columns removed or hidden
- [ ] If a standards column exists, labeled "Standaarden" (not "Standaarden GEMMA")
- [ ] No duplication of standards information
- [ ] Standaardversies shows readable names (not UUIDs)
- [ ] "Standaarden GEMMA" column is renamed to "Standaarden" (the "GEMMA" suffix is removed)

**Key Context from Comments:** Only show "Standaardversies" — separate standards columns are redundant.

---

### #375: Applicaties: versie voor SaaS applicaties?

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** SaaS applications show no version under "Applicatieversies". Should automatically receive a default version.

**Acceptance Criteria:**
- [ ] SaaS application created via wizard automatically receives a default version
- [ ] Default version visible in Applicatieversies tab
- [ ] For "SaaS en On Premise" apps, both version types can be managed
- [ ] Removing a version type properly handles cleanup
- [ ] Versions visible in overview table when column enabled

**Key Context from Comments:** Wizard should always create a version. Test with: SaaS, SaaS and On Premise, removing On Premise, removing SaaS.

---

### #376: Applicaties: labels wizard en tabel zijn anders

**Labels:** Aanbod, Tekstuele wijzigingen
**Test Step:** Step 7

**Summary:** Field labels in management table differ from wizard labels. Should be consistent.

**Acceptance Criteria:**
- [ ] Column headers on /beheer/applicaties match wizard field labels exactly
- [ ] No spelling differences between table and wizard
- [ ] No extra/unknown labels in table
- [ ] Same consistency for Services and Connections tables
- [ ] Labels match approved PowerPoint from 17-12-2025 (slide 42)
- [ ] **Image comparison**: Fetch the reference screenshot from the issue (`https://github.com/user-attachments/assets/f02880fc-4295-4cf2-85b8-0809e75808a2`) and compare table column headers with wizard field labels in the live UI
- [ ] Column header uses "Applicatieversies" (one word, no space) not "Applicatie Versies" (two words)

**Key Context from Comments:** Labels only updated in wizards, not in OpenRegister schema. This is a schema/OpenRegister labels change, not just UI. Related to #359. See also slide 42 of the PowerPoint.

---

### #377: Applicaties: tabel toont diensten niet

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** "Diensten" column empty for applications with linked services (e.g., PinoApp doesn't show "PinoApp beheer"), but reverse works.

**Acceptance Criteria:**
- [ ] When application has linked services, Diensten column shows them
- [ ] "PinoApp" shows "PinoApp beheer" in Diensten column
- [ ] Bidirectional relationship is consistent
- [ ] Diensten column can be enabled via column selector

**Key Context from Comments:** Display for services in this table was missing, added to B environment. Existed since "Aanbod" phase.

---

### #378: Applicatie: Standaarden na wijzigen veranderd

**Labels:** wontfix, Aanbod
**Test Step:** Step 7

**Summary:** After editing standards via Actions > "Bewerk standaarden", all standards reset to "Ondersteund" regardless of individual values.

**Acceptance Criteria:**
- [ ] Compliance statuses display correctly before editing
- [ ] After saving without changes, values remain unchanged (no reset to "Ondersteund")
- [ ] Each standard retains its individual status with correct color coding
- [ ] Alternatively, if all editing goes through wizards (#384), "Bewerk standaarden" is removed from Actions menu
- [ ] Uploaded compliance evidence documents retain their original filename (not renamed to "Bewijs_<unique number>.<format>")

**Key Context from Comments:** Labeled "wontfix" — will become moot once all editing routes through wizards (#384). Bug persists until then.

---

### #379: Applicatie: verschillende manier van tonen compliancy

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** Standards compliance displayed inconsistently in three different views. Management page is correct; search tab is incomplete; wizard review only shows compliant ones.

**Acceptance Criteria:**
- [ ] Management detail page shows all standards with correct status and colors
- [ ] Search/public view shows SAME information as management page
- [ ] Wizard review page shows ALL standards (supported AND not supported)
- [ ] All three views use the same table format
- [ ] Non-supported standards visible on all views
- [ ] Standards list sort order is consistent across all views (control page, detail page, wizard review page)

**Key Context from Comments:** Screenshots confirm both control and detail pages now use same table. Related to #348.

---

### #380: Applicatie: compliance aantallen komen niet overeen

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** Wizard shows all reference components imposing standards, management page shows only one. Inconsistent counts.

**Acceptance Criteria:**
- [ ] Management page shows ALL standard versions imposed by reference components
- [ ] Count matches wizard standards step count
- [ ] Multiple reference components each imposing standards all appear in both views
- [ ] Count/total consistent across wizard and management page

**Key Context from Comments:** Same root cause as #379 — inconsistency in compliance display.

---

### #381: Applicaties: non-compliant vervangen door niet ondersteund

**Labels:** Aanbod, Wijziging
**Test Step:** Step 7

**Summary:** "non-compliant" should be changed to "niet ondersteund" with red color indicator everywhere.

**Acceptance Criteria:**
- [ ] "non-compliant" does NOT appear anywhere in the UI
- [ ] All instances show "niet ondersteund"
- [ ] "niet ondersteund" displayed with red color indicator
- [ ] Applies to: tables, detail pages, wizard steps, review pages
- [ ] Consistent Dutch terminology (no English mixing)
- [ ] "Compliant" does NOT appear anywhere — replaced with "Ondersteund" for consistency (all Dutch terminology)
- [ ] "niet ondersteund" is ALWAYS displayed in red (not grey in some views and red in others)
- [ ] "Ondersteund" is used consistently for supported standards (not "Compliant" in some views)

**Key Context from Comments:** Good change, planned for after "producten afschalen."

---

### #382: Applicatie: compliancy link werkt niet

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** Compliance links treated as relative paths (e.g., "pino.nl/compliancy" becomes localhost/pino.nl/compliancy).

**Acceptance Criteria:**
- [ ] Compliance links open correct external URL in new tab
- [ ] URLs without protocol prefix handled properly (prepend "https://" or validate format)
- [ ] Link NOT treated as relative path
- [ ] Links with "http://" or "https://" work correctly

**Key Context from Comments:** Router issue — URLs without protocol treated as relative. Fix in progress.

---

### #383: Applicatie: selectie vakken werken niet

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** Selection checkboxes on application management page don't work.

**Acceptance Criteria:**
- [ ] Clicking a row checkbox selects that row (visual indication)
- [ ] Multiple rows can be selected
- [ ] "Select all" checkbox works
- [ ] Selected rows enable bulk actions (if applicable)
- [ ] Selection state is visually clear
- [ ] After selecting specific rows and clicking export, ONLY the selected rows are exported (not all rows)

**Key Context from Comments:** May be a regression from performance changes. Will be addressed after "producten afschalen."

---

### #384: Applicaties: eenduidige manier van bewerken

**Labels:** Aanbod, Wijziging
**Test Step:** Step 7

**Summary:** Multiple editing methods with different interfaces. All editing should go through wizards. Non-wizard editing options should be disabled except "Verwijderen".

**Acceptance Criteria:**
- [ ] "Bewerken" from table opens the application publish wizard
- [ ] "Bewerken" from detail view opens the wizard
- [ ] Actions menu only has "Bewerken" (via wizard) and "Verwijderen"
- [ ] Other action options (Bewerk standaarden, etc.) removed
- [ ] Wizard includes "Lange omschrijving" (long description) field
- [ ] Same pattern for Services and Connections
- [ ] Editing via wizard pre-fills all existing data
- [ ] Field is labeled "Uitgebreide omschrijving" (matching PowerPoint) not "Lange omschrijving"

**Key Context from Comments:** "Lange omschrijving" is a prerequisite. Not in design PowerPoints but necessary for wizard-only editing.

---

### #385: Applicatie: Geen huidige versie in gebruik

**Labels:** Aanbod, Wijziging
**Test Step:** Step 7

**Summary:** Detail page shows "Geen huidige versie in gebruik" in sidebar even when versions exist. Should remove "Huidige versie" from sidebar since Versions tab already shows this.

**Acceptance Criteria:**
- [ ] Gray sidebar does NOT show "Huidige versie" section
- [ ] "Geen huidige versie in gebruik" text not in sidebar
- [ ] Version info shown exclusively under "Versies" tab
- [ ] Versies tab displays correct version count and statuses
- [ ] Sidebar still shows other metadata

**Key Context from Comments:** Agreed: remove "Huidige versie" from gray block.

---

### #386: Applicaties – Uw applicatie publiceren: andere labels

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** Labels in the "Publish application" wizard don't match management/control form labels.

**Acceptance Criteria:**
- [ ] All wizard labels match management table and control form labels
- [ ] Labels consistent with approved PowerPoint specification
- [ ] No spelling differences between wizard steps and review/control form
- [ ] Labels in proper Dutch with agreed terminology
- [ ] **Image comparison**: Fetch the reference screenshot from the issue (`https://github.com/user-attachments/assets/e4f8f5bf-e1d5-44df-b7e5-dc52a1ce8676`) and compare each label with the live UI wizard

**Key Context from Comments:** Not regressions — labels have been this way since acceptance. Some labels were previously intentionally lengthened (diverged from schema) but should now be aligned back to the PowerPoint.

---

### #387: Applicaties – Uw applicatie publiceren: i niet aanwezig

**Labels:** Aanbod, Tekstuele wijzigingen
**Test Step:** Step 7

**Summary:** Information (i) tooltip icons missing for all fields in the version step of the application publish wizard.

**Acceptance Criteria:**
- [ ] Every field label on the version step has an (i) icon/tooltip (they are currently MISSING entirely)
- [ ] Clicking/hovering shows relevant help text matching the PowerPoint
- [ ] (i) icons present for ALL version-related labels, not just some
- [ ] Help text is meaningful and matches the PowerPoint specification
- [ ] Styling consistent with other wizard steps
- [ ] **Image comparison**: Fetch the reference screenshot from the issue (`https://github.com/user-attachments/assets/002c16a6-4ddb-4072-9a54-2aaff8bcd4f5`) showing the MISSING tooltips, then verify in the live UI whether they have been added

**Key Context from Comments:** Adjusted on B environment. The "i" tooltips need to be ADDED (they were completely absent, not just wrong text). The tooltip text should come from the PowerPoint.

---

### #390: Applicaties – Uw applicatie publiceren: labels komen niet overeen

**Labels:** Aanbod, Tekstuele wijzigingen
**Test Step:** Step 7

**Summary:** Labels in publish wizard don't match control/review form labels.

**Acceptance Criteria:**
- [ ] Control/review page labels exactly match wizard input step labels
- [ ] No discrepancies between any wizard step and its summary
- [ ] Same terminology and spelling throughout
- [ ] Labels follow approved PowerPoint specification
- [ ] **Image comparison**: Fetch the reference screenshot from the issue (`https://github.com/user-attachments/assets/63e3fc9a-b51b-4a6c-8002-9c17773f62e9`) showing the inconsistent labels, then verify in the live UI whether review form labels now match wizard input labels

**Key Context from Comments:** Fixed on B environment but still needs testing. Part of broader textual changes effort (#359).

---

### #391: Testen met een gebruiker van een bestaande organisatie

**Labels:** Aanbod
**Test Step:** Step 3

**Summary:** Testing with imported users from imported organizations was disabled. Need to verify activation and login works.

**Acceptance Criteria:**
- [ ] An imported organization exists with at least one contact person
- [ ] Contact person can be activated as a user (after fixing invalid email)
- [ ] Activated imported user can log in successfully
- [ ] Imported user can view and manage their organization's data
- [ ] Same capabilities as a user from a newly registered organization
- [ ] Imported users with invalid email addresses show a clear error or warning when activation is attempted without first correcting the email
- [ ] After correcting the email address of an imported contact person, activation proceeds successfully

**Key Context from Comments:** Duplicate of #392. Imported users received invalid emails — must be corrected before activation.

---

### #392: Back-end: geimporteerde gebruiker geeft error bij omzetten naar user

**Labels:** Aanbod
**Test Step:** Step 3

**Summary:** Creating a contact person for an imported organization does NOT convert them to a user (produces error), unlike new organizations where this is automatic.

**Acceptance Criteria:**
- [ ] Creating a contact person for an imported organization does NOT produce an error
- [ ] Contact person is converted to a user automatically, like for new organizations
- [ ] Converted user can log in with correct permissions
- [ ] Behavior consistent between imported and newly created organizations
- [ ] No backend errors in logs during conversion
- [ ] After environment re-deployment, previously imported contact persons can be activated without blockade
- [ ] Data import is completed before testing user conversion

**Key Context from Comments:** Duplicate of #391. Data import must be completed before testing.

---

### #393: Backend: fouten in voorzieningenregister

**Labels:** Aanbod
**Test Step:** Step 19

**Summary:** Errors in the voorzieningenregister (provisions register). Excel export broken. Scope narrowed to: schema retrieval, API docs, and exports must work.

**Acceptance Criteria:**
- [ ] Backend API returns valid schema data (GET schema endpoint returns 200)
- [ ] API documentation endpoint is accessible and complete
- [ ] Excel export works without errors and produces valid .xlsx file
- [ ] Exported Excel contains expected columns and rows
- [ ] No 500 errors when accessing voorzieningenregister endpoints
- [ ] Excel export works per register/schema combination (not the entire catalog in one export)
- [ ] Export file correctly represents the data for the selected register/schema combination only

**Key Context from Comments:** Excel export is a regression from "products scaling down." Data model partially cleaned. Scope: schema, API docs, exports.

---

### #394: Contactpersonen van gemeenten publiekelijke zichtbaar

**Labels:** Aanbod, Wijziging
**Test Step:** Step 12

**Summary:** Contact persons of **gemeenten** (municipalities) are publicly visible but should NOT be. Note: contact persons of **leveranciers** (vendors) ARE expected to be publicly visible — only gemeente/samenwerking contact persons should be hidden.

**RBAC Reference:** See `softwarecatalog/lib/Settings/softwarecatalogus_register.json` → `contactpersoon` schema → `authorization` block. The `contactpersoon` schema does NOT have `public` read access. Leverancier contact persons are exposed via **publications** (which extend contactpersonen), not via direct public access to the contactpersoon schema.

**Acceptance Criteria:**
- [ ] Contact persons of **leveranciers** ARE visible on public pages (this is expected/correct behavior)
- [ ] Contact persons of **gemeenten** are NOT visible to unauthenticated users on frontend
- [ ] Contact persons of **samenwerkingen** are NOT visible to unauthenticated users
- [ ] Public API (`_extend=contactpersonen`) correctly distinguishes: leverancier contacts visible, gemeente/samenwerking contacts hidden
- [ ] No personal contact information (name, email, phone) of gemeente users on public pages
- [ ] API endpoint enforces RBAC: authenticated gebruik-beheerder can see all contactpersonen, aanbod-beheerder sees only own org

**Key Context from Comments:** Regression from "published scaling" change. The RBAC model in `softwarecatalogus_register.json` shows contactpersoon read access is NOT public — leverancier contacts are only expected to be visible via publication extensions. The bug is that gemeente contact persons are exposed, not that leverancier ones are.

---

### #395: Menu linkerkant verdwijnt

**Labels:** Aanbod
**Test Step:** Step 4

**Summary:** Left navigation menu disappears after pressing F5/Ctrl+R to refresh on the Applicaties overview.

**Acceptance Criteria:**
- [ ] Navigate to "Applicaties" overview while logged in
- [ ] Press F5 or Ctrl+R to refresh
- [ ] Left navigation menu remains visible after refresh
- [ ] Menu present when directly navigating to URL (not just SPA navigation)
- [ ] Menu persists across refreshes on other pages (Diensten, Koppelingen, etc.)

**Key Context from Comments:** Marked as fixed on B environment. Needs verification on accept.

---

### #396: Verouderde NextCloud versie

**Labels:** Aanbod
**Test Step:** Infra

**Summary:** Backend running unsupported Nextcloud version. Agreement to upgrade to Nextcloud 32.

**Acceptance Criteria:**
- [ ] Nextcloud backend running version 32.x
- [ ] No "unsupported version" warnings in admin panel
- [ ] All softwarecatalogus functionality works on NC 32
- [ ] Verify via admin interface or status.php endpoint
- [ ] NOTE: Infrastructure issue — verify via admin panel
- [ ] Nextcloud admin log does not contain critical errors related to softwarecatalogus apps

**Key Context from Comments:** Both environments set to NC 32. NC 33 has breaking changes. VNG policy: run n-1, test quarterly.

---

### #397: Pagina aanmaken via CMS

**Labels:** Aanbod, Wijziging
**Test Step:** Step 21

**Summary:** CMS page editing broken. Cannot edit "algemene voorwaarden" text despite it previously working.

**Acceptance Criteria:**
- [ ] Admin can navigate to CMS page management
- [ ] Admin can create a new CMS page with custom content
- [ ] Admin can edit existing CMS pages
- [ ] After editing and saving, updated text is visible on public page
- [ ] CMS editor properly renders content in edit view
- [ ] CMS editing documentation/manual is accessible via the handleidingen page

**Key Context from Comments:** Regression from performance changes. Duplicates #332. CMS is a non-functional requirement. Page texts still need to be provided by VNG (#182).

---

### #399: Versies: een versie van een applicatie van een andere leverancier levert een foutmelding

**Labels:** Aanbod
**Test Step:** Step 7

**Summary:** Viewing a version of another supplier's application produces "Kon publicatie niet laden" error. Should be viewable in read-only.

**Acceptance Criteria:**
- [ ] Log in as supplier A, navigate to supplier B's application
- [ ] Click on a version — detail page loads without error
- [ ] Version details shown in read-only mode (no edit button)
- [ ] Own application's versions have edit functionality available
- [ ] Published endpoint returns correct data across suppliers
- [ ] Non-owner suppliers can navigate to the version detail page via the application's version list
- [ ] If the published endpoint returns a 404 for a version, the frontend shows a proper error page

**Key Context from Comments:** RBAC fix adjusts so versions viewable by other suppliers. Published endpoint updated.

---

### #400: Koppeling - Opslaan van een koppeling geeft een foutmelding

**Labels:** Aanbod
**Test Step:** Step 11

**Summary:** Saving a connection produces an error message.

**Acceptance Criteria:**
- [ ] Create a new koppeling via the wizard and fill in required fields
- [ ] Click save — saves successfully without error
- [ ] Saved koppeling appears in overview
- [ ] Editing and re-saving also works without errors
- [ ] Data persisted correctly

**Key Context from Comments:** None beyond original report.

---

### #401: Koppeling - geïmporteerde koppelingen kaartjes zijn leeg

**Labels:** Aanbod, Wijziging
**Test Step:** Step 11

**Summary:** Imported connection cards appear empty. PIMS@all connection directions incorrect. Requesting details produces error.

**Acceptance Criteria:**
- [ ] Imported koppeling cards display name and short description (not empty)
- [ ] Direction indicator on PIMS@all matches correct values
- [ ] Clicking a card opens detail view without error
- [ ] Cards from other suppliers also render with metadata
- [ ] Test on renewed environment (not old URL)
- [ ] Connections missing both moduleB and buitengemeentelijke voorziening show a clear indication of incomplete data
- [ ] Invalid standard version references in connections do not cause UUIDs to display in the card view

**Key Context from Comments:** Import data lacked @name column. Fix: default name during import. Re-importing should fix data.

---

### #402: Verschil tussen Edge en Chrome bij laden applicaties

**Labels:** Aanbod
**Test Step:** General

**Summary:** Same user sees different content in Edge vs Chrome. Side-by-side comparison shows different results.

**Acceptance Criteria:**
- [ ] Same user account in Edge and Chrome shows identical application list
- [ ] Data, ordering, and item count matches between browsers
- [ ] No caching artifacts cause differences (test after clearing cache)
- [ ] NOTE: Team could NOT reproduce with 3 testers — verify if issue persists

**Key Context from Comments:** Not reproducible by development team. May be browser caching behavior.

---

### #403: Tekst verwijderen aanpassen

**Labels:** Aanbod, Wijziging
**Test Step:** Step 21

**Summary:** Deletion confirmation text needs updating. Different text per object type, and should indicate if municipalities are using the item.

**Acceptance Criteria:**
- [ ] Deleting application NOT in use: "De applicatie \"<name>\" wordt niet gebruikt door gemeenten of samenwerkingen en kan veilig worden verwijderd."
- [ ] Deleting service NOT in use: "De dienst \"<name>\" wordt niet gebruikt..."
- [ ] Deleting connection NOT in use: "De koppeling \"<name>\" wordt niet gebruikt..."
- [ ] Deleting item IN USE: "De {type} \"<name>\" wordt gebruikt door onderstaande gemeenten en/of samenwerkingen en kan niet worden verwijderd." with list
- [ ] Object name dynamically inserted
- [ ] Object type dynamically inserted
- [ ] When deleting an application that has diensten linked by OTHER leveranciers, the system shows a specific warning
- [ ] A defined flow exists for the scenario where a leverancier attempts to delete an object used by another leverancier's diensten

**Key Context from Comments:** Exact text templates provided by markbacker. Two variants: not in use (can delete) and in use (cannot delete, shows users).

---

### #404: Regelmatig witte schermen

**Labels:** Organisatie en configuratie
**Test Step:** General

**Summary:** White screens (blank pages) occur regularly in Edge browser. Factory reset fixes it, cache clearing doesn't always.

**Acceptance Criteria:**
- [ ] Navigate through all major pages in Edge — no white screens
- [ ] Refreshing pages (F5) doesn't produce white screens
- [ ] After clearing cache in Edge, pages load correctly
- [ ] JavaScript console shows no critical errors causing blank rendering
- [ ] NOTE: Team hasn't seen this for a week — may be resolved

**Key Context from Comments:** Unable to reproduce for a week on test environment. May have been resolved as side effect of other fixes.

---

### #406: SiteImprove verwijderen

**Labels:** Organisatie en configuratie
**Test Step:** Step 21

**Summary:** Template contains unauthorized SiteImprove analytics script that must be removed. Only Piwik should be present.

**Acceptance Criteria:**
- [ ] HTML source does NOT contain `siteimproveanalytics.com` script tag
- [ ] No references to "siteimprove" in page source
- [ ] Only Piwik analytics script present
- [ ] Verify by viewing page source on public pages
- [ ] Only ONE configurable position for tracking scripts
- [ ] Verify removal by checking page source on production/accept environment — confirm no siteimprove script loads at runtime

**Key Context from Comments:** Must ensure only one configurable position for tracking/measurement scripts.

---

### #407: Toegevoegde standaarden verwijzen naar id-id-....

**Labels:** Aanbod
**Test Step:** Step 16

**Summary:** Standard links generate broken URLs with "id-" duplicated (e.g., `id-id-beba0771-...`), leading to 404 on GEMMA Online.

**Acceptance Criteria:**
- [ ] Click a linked standard on application detail page
- [ ] URL follows format: `https://www.gemmaonline.nl/wiki/GEMMA/id-{uuid}` (single "id-")
- [ ] Link does NOT contain "id-id-" (double prefix)
- [ ] Link opens correct GEMMA Online page
- [ ] Works for all standards across all applications

**Key Context from Comments:** Root cause: IDs already contain "id-" prefix but old code adds another. Fix: remove extra prefix.

---

### #408: Tabblad beschrijving bij Dienst

**Labels:** Aanbod
**Test Step:** Step 9

**Summary:** After creating a service, an unexpected "Beschrijving" tab appears containing a number instead of text.

**Acceptance Criteria:**
- [ ] Create a new dienst and navigate to detail page
- [ ] No unexpected "Beschrijving" tab appears
- [ ] Only expected/designed tabs are visible
- [ ] If "Beschrijving" tab exists, it shows text NOT a number
- [ ] Empty "uitgebreide omschrijving" doesn't cause phantom tab
- [ ] No internal numeric values (field length, index, property count) are displayed as tab content or tab labels

**Key Context from Comments:** Extended description field was empty, not filled with "13". Rendering bug displaying field length or numeric property instead of text.

---

### #409: Footer anders: inlog of uitgelogd

**Labels:** Organisatie en configuratie
**Test Step:** Step 21

**Summary:** Footer differs between logged-in and logged-out states. "Privacyverklaring" and "Algemene voorwaarden" links point to different pages.

**Acceptance Criteria:**
- [ ] Footer links are identical in logged-in and logged-out states
- [ ] "Privacyverklaring" link points to same URL in both states
- [ ] "Algemene voorwaarden" link points to same URL in both states
- [ ] Footer styling consistent between states
- [ ] NOTE: Team could not replicate — verify on latest environment
- [ ] A single, definitive set of footer links is defined and applied to both logged-in and logged-out states

**Key Context from Comments:** Couldn't replicate. May have been from two footer menu variants during testing.

---

### #410: Dashboard schrijfwijze softwarecatalogus

**Labels:** Organisatie en configuratie, Tekstuele wijzigingen
**Test Step:** Step 21

**Summary:** "softwarecatalogus" written inconsistently on dashboard. Should always be lowercase. New welcome text provided for suppliers.

**Acceptance Criteria:**
- [ ] All instances use lowercase "softwarecatalogus" (not "Softwarecatalogus", "Software Catalogus", etc.)
- [ ] Supplier welcome text heading: "Welkom in uw softwarecatalogus"
- [ ] Body includes four bullet points about what suppliers can register
- [ ] Instruction text about publishing new items and finding existing items via left menu present
- [ ] Closing paragraph about municipalities using the information present
- [ ] Spelling consistent across entire dashboard
- [ ] Welcome text uses "GEMeentelijke Model Architectuur (GEMMA)" with exact capitalization as provided

**Key Context from Comments:** Exact supplier text provided by Makkmetp (Feb 18). Also resolves #255.

---

### #187: Tekstvoorstellen

**Labels:** Tekstuele wijzigingen
**Test Step:** Step 21

**Summary:** Mega-issue containing 10 specific text change proposals across the application, serving as the key reference for many textual issues.

**Acceptance Criteria:**
- [ ] Contactpersoon text reads: "De geregistreerde contactpersoon is het eerste aanspreekpunt van de organisatie en beheerder van de gebruikers van de softwarecatalogus namens uw organisatie. Dit kan op een later moment nog gewijzigd worden."
- [ ] Aanmelding succesvol page title reads: "Aanmelding succesvol!"
- [ ] Aanmelding succesvol page body reads: "Beste <naam> van <organisatienaam>,\n\nUw aanmelding voor de softwarecatalogus is in goede orde ontvangen. We hebben een bevestigingsmail gestuurd naar <mailadres>. Controleer uw inbox (en eventueel uw spam folder) voor deze bevestiging.\n\nEen beheerder beoordeeld de aanmelding. Zodra de aanmelding is goedgekeurd, ontvangt u een nieuwe e-mail met daarin uw inloggegevens en verdere instructies voor het gebruik van de softwarecatalogus.\n\nHeeft u vragen? Neem dan contact op met via softwarecatalogus@vng.nl"
- [ ] Organisatie niet zichtbaar banner reads: "Uw organisatie is nog niet zichtbaar in de softwarecatalogus.\nBezoekers kunnen uw organisatie, producten en diensten nu nog niet vinden in de softwarecatalogus.\nMaak uw organisatie zichtbaar voor gemeenten en andere bezoekers door deze te publiceren.\n\nGa naar \"Mijn organisatie\" en klik rechtsboven op \"... Acties\".\nKies vervolgens \"Publiceren\" om uw organisatie zichtbaar te maken in de softwarecatalogus."
- [ ] Dashboard welcome title reads: "Welkom in de Softwarecatalogus"
- [ ] Dashboard welcome text reads: "Dit is de centrale plek om producten, applicaties, diensten en koppelingen te beheren. Door applicaties te koppelen aan GEMMA-referentiecomponenten wordt uw applicatielandschap gemapped op de GEMMA-referentiearchitectuur."
- [ ] Contactpersoon toevoegen dialog title reads: "Gebruiker toevoegen"
- [ ] Contactpersoon toevoegen dialog success text reads: "De gebruiker is succesvol toegevoegd."
- [ ] Contactpersoon depubliceren dialog title reads: "Gebruiker uitschakelen"
- [ ] Contactpersoon depubliceren dialog text reads: "Weet u zeker dat u deze gebruiker wilt depubliceren?\nTe depubliceren gebruiker:\n<voornaam + tussenvoegsel + achternaam>"
- [ ] Link https://www.gemmaonline.nl/wiki/Overzicht_alle_referentiecomponenten is placed behind the text "alle referentiecomponenten" as a clickable link (bare URL removed)
- [ ] "Contactpersonen" is renamed to "Gebruikers" in the left menu and page title
- [ ] Explanatory text with icons for login vs non-login users is present on the Gebruikers page
- [ ] Diensten registreren wizard title reads: "Dienst registreren"
- [ ] Diensten registreren wizard subtitle reads: "Voer de gegevens van uw dienst in, selecteer de relevante producten en/of applicaties en controleer uw invoer."
- [ ] Diensten registreren section header reads: "Registreer uw dienst" with text: "Registreer hier een dienst die uw organisatie aanbiedt -- bijvoorbeeld functioneel beheer, implementatieondersteuning, of licentiereseller.\nU kunt een dienst koppelen aan een product of applicatie van uw eigen organisatie, maar ook aan producten of applicaties van andere leveranciers.\nDoor uw diensten te registreren helpt u gemeenten en andere organisaties om snel te zien welke ondersteuning en expertise beschikbaar is."
- [ ] Diensten registreren "Basisinformatie" section header reads: "Informatie over uw dienst" with text: "Vul de naam, website en een beschrijving van uw dienst in. Voeg eventueel een logo toe. Gebruik een herkenbare naam, zoals:\n\"Functioneel beheer voor Zaakgericht Werken\" of \"Reseller van Applicatie X\"."
- [ ] Samenvatting placeholder reads: "Beschrijf in een of twee zinnen wat uw dienst inhoudt."
- [ ] Search tooltip text reads: "De zoekfunctie doorzoekt de naam en beschrijvingen van items. Dit wordt gedaan op basis van vergelijkbare woorden. Met de filters kunnen de zoekresultaten verder worden verfijnd."
- [ ] Application wizard success page title reads: "Uw applicatie is succesvol geregistreerd!"
- [ ] Application wizard success page body includes explanation of what happens next (visibility in catalogus, management via dashboard)

**Key Context from Comments:** This is a mega-issue with 10 distinct text changes. Items 1 (Contactpersoon text) and 3 (Organisatie niet zichtbaar banner) are marked as DONE per checkmarks in the issue. Related issues: #255, #268 (dashboard text). The diensten wizard texts should be consistent with #316-#328 wizard text standards.

---

### #316: Dienst toevoegen: Stap 1 Dienst zoeken

**Labels:** Gebruik, Bevinding, Wizard, Dienst toevoegen
**Test Step:** Step 10

**Summary:** The "Dienst toevoegen" wizard step 1 must display specific text and search functionality for finding services linked to the municipality's own applications.

**Acceptance Criteria:**
- [ ] Form header title displays exactly: "Een dienst toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om de dienst toe te voegen aan uw applicatielandschap."
- [ ] Section header displays exactly: "Toevoegen dienst"
- [ ] Section text displays exactly: "Zoek naar diensten die op de applicaties in uw applicatielandschap worden uitgevoerd. Zoek op de naam van de betrokken applicatie.\n\nAlle relevantie diensten die relevant zijn voor uw eigen applicaties worden weergegeven.\nBestaat de dienst nog niet, dan kunt u deze toevoegen.\n\nNa het selecteren van de gewenste dienst kunt u in de volgende stappen aanvullende informatie opvoeren."
- [ ] Blue info box title displays exactly: "Zoekpagina"
- [ ] Blue info box text displays exactly: "U kunt ook starten vanaf de zoekpagina. Open de detailpagina van de gevonden dienst en kies 'Dienst toevoegen'."
- [ ] A button with text "Ik kan de gewenste dienst niet vinden" is present
- [ ] This step is skipped when adding from a detail application page

**Key Context from Comments:** This step searches for existing services linked to the municipality's own applications. If not found, user can create a new one via a light version of the "Dienst publiceren" wizard. Source text from PowerPoint in #329.

---

### #317: Dienst toevoegen: Stap 2 Gebruiksinformatie

**Labels:** Gebruik, Wizard, Dienst toevoegen
**Test Step:** Step 10

**Summary:** The "Dienst toevoegen" wizard step 2 must display specific text and fields for entering usage information about the service.

**Acceptance Criteria:**
- [ ] Form header title displays exactly: "Een dienst toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om de dienst toe te voegen aan uw applicatielandschap."
- [ ] Section header displays exactly: "Toevoegen dienst"
- [ ] Section text displays exactly: "U kunt hier de status van de dienst aangeven en een interne notitie en toevoegen voor uw collega's."
- [ ] Blue info box title displays exactly: "Interne notitie"
- [ ] Blue info box text displays exactly: "De interne notitie is alleen te lezen door gebruikers binnen uw organisatie."
- [ ] A "Status" field is present (of de dienst wordt afgenomen)
- [ ] An "Interne notitie" field is present

**Key Context from Comments:** Source text from PowerPoint in #329. Part of the "Dienst toevoegen" wizard flow (issues #316-#318).

---

### #318: Dienst toevoegen: Stap 3 Controleren

**Labels:** Gebruik, Wizard, Dienst toevoegen
**Test Step:** Step 10

**Summary:** The "Dienst toevoegen" wizard step 3 (review/check) must display specific text allowing the user to verify their input before submitting.

**Acceptance Criteria:**
- [ ] Form header title displays exactly: "Een dienst toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om de dienst toe te voegen aan uw applicatielandschap."
- [ ] Section header displays exactly: "Controleer uw gegevens"
- [ ] Section text displays exactly: "Controleer of het overzicht van de dienst volledig en juist is voordat u verder gaat.\n\nU kunt met Vorige terug naar de eerdere stappen.\n\nNa het registreren van de koppeling kunt u via uw \"Dashboard\" de koppeling opzoeken en indien gewenst aanpassen."
- [ ] Blue info box title displays exactly: "Interne notitie"
- [ ] Blue info box text displays exactly: "De interne notitie is alleen te lezen door gebruikers binnen uw organisatie."

**Key Context from Comments:** Source text from PowerPoint in #329. Final review step of the "Dienst toevoegen" wizard (issues #316-#318).

---

### #319: Koppeling toevoegen: Stap 1 Koppeling zoeken

**Labels:** Gebruik, Wizard, Koppeling toevoegen
**Test Step:** Step 11

**Summary:** The "Koppeling toevoegen" wizard step 1 must display specific text and search functionality for finding connections supported by the municipality's applications.

**Acceptance Criteria:**
- [ ] Form header title displays exactly: "Een koppeling toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om de koppeling toe te voegen aan uw applicatielandschap"
- [ ] Section header displays exactly: "Een koppeling zoeken"
- [ ] Section text displays exactly: "Zoek naar koppelingen die door de applicaties in uw applicatielandschap worden ondersteund. Zoek op de naam van een van de betrokken applicaties.\n\nAlle koppelingen die relevant zijn voor uw eigen applicaties en voor buitengemeentelijke voorzieningen worden weergegeven.\n\nBestaat de koppeling nog niet, dan kunt u deze toevoegen.\n\nSelecteer de gewenste koppeling door deze in de lijst aan te vinken."
- [ ] Blue info box title displays exactly: "Zoekpagina"
- [ ] Blue info box text displays exactly: "U kunt ook starten vanaf de zoekpagina. Open de detailpagina van de gevonden koppeling en kies 'Koppeling toevoegen'."
- [ ] A button with text "Ik kan de gewenste koppeling niet vinden" is present
- [ ] This step is skipped when adding from a koppeling page
- [ ] This step is pre-filled when a koppeling is found from an application detail page
- [ ] Section text uses "buitengemeentelijke voorzieningen" instead of "externe systemen of diensten"

**Key Context from Comments:** Source text from PowerPoint in #329. Part of the "Koppeling toevoegen" wizard flow (issues #319-#322).

---

### #320: Koppeling toevoegen: Stap 2 Gebruiksinformatie

**Labels:** Gebruik, Wizard, Koppeling toevoegen
**Test Step:** Step 11

**Summary:** The "Koppeling toevoegen" wizard step 2 must display specific text and fields for entering usage information about the connection.

**Acceptance Criteria:**
- [ ] Form header title displays exactly: "Een koppeling toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om de koppeling toe te voegen aan uw applicatielandschap"
- [ ] Section header displays exactly: "Gebruiksinformatie"
- [ ] Section text displays exactly: "Selecteer de status. Ook kunt u een interne notitie toevoegen voor uw collega's."
- [ ] Blue info box title displays exactly: "Interne notitie"
- [ ] Blue info box text displays exactly: "De interne notitie is alleen zichtbaar voor de eigen organisatie. Gebruikers van buiten de organisatie zien deze niet."
- [ ] A "Status" field is present with default value "In gebruik"
- [ ] A "Startdatum status" field is present
- [ ] An "Interne notitie" field is present
- [ ] "Startdatum status" field defaults to today's date but allows manual entry of past dates

**Key Context from Comments:** Source text from PowerPoint in #329. Part of the "Koppeling toevoegen" wizard flow (issues #319-#322).

---

### #321: Koppeling toevoegen: Stap 3 Deelnemer

**Labels:** Gebruik, Wizard, Koppeling toevoegen
**Test Step:** Step 11

**Summary:** The "Koppeling toevoegen" wizard step 3 (participants) is ONLY shown for samenwerkingen (collaborations) and must display specific text for selecting participants.

**Acceptance Criteria:**
- [ ] This step is ONLY visible for samenwerkingen (collaborations), not for individual gemeenten
- [ ] Form header title displays exactly: "Een koppeling toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om de koppeling toe te voegen aan uw applicatielandschap"
- [ ] Section header displays exactly: "Deelnemers toevoegen"
- [ ] Section text displays exactly: "Selecteer de deelnemers van de samenwerking, die gebruik maken van deze koppeling.\n\nDe koppeling wordt getoond in het applicatielandschap van de geselecteerde deelnemer(s)."
- [ ] A "Selecteer alle" button is present
- [ ] A "Deselecteer alle" button is present

**Key Context from Comments:** Source text from PowerPoint in #329. This step only applies to samenwerkingen. Part of the "Koppeling toevoegen" wizard flow (issues #319-#322).

---

### #322: Koppeling toevoegen: Stap 4 Controleren

**Labels:** Gebruik, Wizard, Koppeling toevoegen
**Test Step:** Step 11

**Summary:** The "Koppeling toevoegen" wizard step 4 (review/check) must display specific text allowing the user to verify their input before submitting.

**Acceptance Criteria:**
- [ ] Form header title displays exactly: "Een koppeling toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om de koppeling toe te voegen aan uw applicatielandschap"
- [ ] Section header displays exactly: "Controleer uw gegevens"
- [ ] Section text displays exactly: "Controleer of het overzicht van de koppeling volledig en juist is voordat u verder gaat.\n\nU kunt met Vorige terug naar de eerdere stappen.\n\nNa het registreren van de koppeling kunt u via uw \"Dashboard\" de koppeling opzoeken en indien gewenst aanpassen."
- [ ] Blue info box text displays exactly: "De koppeling wordt toegevoegd aan uw applicatielandschap.\n\nUw gebruiksinformatie is zichtbaar voor andere gemeenten en samenwerkingen om kennisdeling te bevorderen. De leverancier ziet dat u de koppeling gebruikt.\n\nDe interne notitie is uitsluitend voor intern gebruik."

**Key Context from Comments:** Source text from PowerPoint in #329. Final review step of the "Koppeling toevoegen" wizard (issues #319-#322).

---

### #323: Applicatie toevoegen: Stap 1 Applicatie zoeken

**Labels:** Gebruik, Wizard, Applicatie toevoegen
**Test Step:** Step 10

**Summary:** The "Applicatie toevoegen" wizard step 1 must display specific text and search functionality for finding applications to add to the municipality's application landscape.

**Acceptance Criteria:**
- [ ] Form header title displays exactly: "Een applicatie toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om de applicatie toe te voegen aan uw applicatielandschap"
- [ ] Section header displays exactly: "Toevoegen applicatie"
- [ ] Section text displays exactly: "Selecteer de applicatie door te zoeken op de applicatie- en leveranciersnaam.\nAls u de applicatie niet vind, dan kan deze worden toegevoegd aan de centrale lijst"
- [ ] Blue info box title displays exactly: "Zoekpagina"
- [ ] Blue info box text displays exactly: "U kunt ook de zoekpagina gebruiken. Open de detailpagina van de gevonden applicatie en klik op 'Applicatie toevoegen'."
- [ ] A button with text "Ik kan de gewenste applicatie niet vinden" is present (opens step 1.1, see #328)

**Key Context from Comments:** Source text from PowerPoint in #329. Part of the "Applicatie toevoegen" wizard flow (issues #323-#327). The "Ik kan de gewenste applicatie niet vinden" button triggers the sub-step defined in #328.

---

### #324: Applicatie toevoegen: Stap 2 Gebruiksinformatie

**Labels:** Gebruik, Wizard, Applicatie toevoegen
**Test Step:** Step 10

**Summary:** The "Applicatie toevoegen" wizard step 2 must display specific text and fields for entering usage information about the application.

**Acceptance Criteria:**
- [ ] Form header title displays exactly: "Een applicatie toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om de applicatie toe te voegen aan uw applicatielandschap"
- [ ] Section header displays exactly: "Gebruiksinformatie"
- [ ] Section text displays exactly: "Selecteer de gebruikte hosting en versie. Ook kunt u een interne notitie toevoegen voor uw collega's."
- [ ] Blue info box title displays exactly: "Interne notitie"
- [ ] Blue info box text displays exactly: "De interne notitie is alleen zichtbaar voor de eigen organisatie. Gebruikers van buiten de organisatie zien deze niet."
- [ ] A "Hosting" field is present
- [ ] A "Versie" field is present (only shown for On-premise; SaaS uses default)
- [ ] A "Status" field is present with default value "in productie" and is required (verplicht)
- [ ] A "Startdatum status" field is present
- [ ] An "Interne notitie" field is present
- [ ] "Startdatum status" field defaults to today's date (timestamp) but allows manual entry of past dates

**Key Context from Comments:** Source text from PowerPoint in #329. Part of the "Applicatie toevoegen" wizard flow (issues #323-#327).

---

### #325: Applicatie toevoegen: Stap 3 Referentiecomponenten

**Labels:** Gebruik, Wizard, Applicatie toevoegen
**Test Step:** Step 10

**Summary:** The "Applicatie toevoegen" wizard step 3 must display specific text and fields for linking the application to GEMMA reference components.

**Acceptance Criteria:**
- [ ] Form header title displays exactly: "Een applicatie toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om de applicatie toe te voegen aan uw applicatielandschap"
- [ ] Section header displays exactly: "Koppel de applicatie aan referentiecomponenten"
- [ ] Section text displays exactly: "Door de applicatie te koppelen aan referentiecomponenten, maakt u inzichtelijk waarvoor u de applicatie gebruikt. Dit bevordert kennisdeling met andere gemeenten. Een overzicht van alle referentiecomponenten vindt u op GEMMA Online."
- [ ] The link https://www.gemmaonline.nl/wiki/Overzicht_alle_referentiecomponenten is present (either behind the text "alle referentiecomponenten" as a clickable link, or visible)
- [ ] A "Selecteer referentiecomponenten" field is present (multi-select from leverancier's list)
- [ ] A "Referentiecomponenten toevoegen" field is present (multi-select from GEMMA)

**Key Context from Comments:** Source text from PowerPoint in #329. Part of the "Applicatie toevoegen" wizard flow (issues #323-#327). Related to #187 item 7 (referentiecomponenten link formatting).

---

### #326: Applicatie toevoegen: Stap 4 Deelnemer

**Labels:** Gebruik, Wizard, Applicatie toevoegen
**Test Step:** Step 10

**Summary:** The "Applicatie toevoegen" wizard step 4 (participants) is ONLY shown for samenwerkingen (collaborations) and must display specific text for selecting participants.

**Acceptance Criteria:**
- [ ] This step is ONLY visible for samenwerkingen (collaborations), not for individual gemeenten
- [ ] Form header title displays exactly: "Een applicatie toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om de applicatie toe te voegen aan uw applicatielandschap"
- [ ] Section header displays exactly: "Deelnemers toevoegen"
- [ ] Section text displays exactly: "Selecteer de deelnemers van de samenwerking, die gebruik maken van deze applicatie.\n\nDe applicatie wordt getoond in het applicatielandschap van de geselecteerde deelnemer(s)."
- [ ] A "Selecteer alle" button is present
- [ ] A "Deselecteer alle" button is present

**Key Context from Comments:** Source text from PowerPoint in #329. This step only applies to samenwerkingen. Part of the "Applicatie toevoegen" wizard flow (issues #323-#327).

---

### #327: Applicatie toevoegen: Stap 5 Controleren

**Labels:** Gebruik, Wizard, Applicatie toevoegen
**Test Step:** Step 10

**Summary:** The "Applicatie toevoegen" wizard step 5 (review/check) must display specific text allowing the user to verify their input before submitting.

**Acceptance Criteria:**
- [ ] Form header title displays exactly: "Een applicatie toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om de applicatie toe te voegen aan uw applicatielandschap"
- [ ] Section header displays exactly: "Controleer uw gegevens"
- [ ] Section text displays exactly: "Controleer of het overzicht van de applicatie volledig en juist is voordat u verder gaat.\n\nU kunt met Vorige terug naar de eerdere stappen.\n\nNa het registreren van de applicatie kunt u via uw \"Dashboard\" de applicatie opzoeken en indien gewenst aanpassen."
- [ ] Blue info box text displays exactly: "De applicatie wordt toegevoegd aan uw applicatielandschap.\n\nUw gebruiksinformatie is zichtbaar voor andere gemeenten en samenwerkingen om kennisdeling te bevorderen. Daarnaast kan de leverancier zien dat u hun applicatie gebruikt.\n\nDe interne notitie is uitsluitend voor intern gebruik."

**Key Context from Comments:** Source text from PowerPoint in #329. Final review step of the "Applicatie toevoegen" wizard (issues #323-#327).

---

### #328: Applicatie toevoegen: Stap 1.1 Nieuwe applicatie opvoeren

**Labels:** Gebruik, Bevinding, Wizard, Applicatie toevoegen
**Test Step:** Step 10

**Summary:** The "Applicatie toevoegen" wizard sub-step 1.1 is triggered when the user cannot find the desired application in step 1. It must display specific text and fields for creating a new application entry.

**Acceptance Criteria:**
- [ ] Form header title displays exactly: "Een nieuwe applicatie toevoegen"
- [ ] Form header subtitle displays exactly: "Vul dit formulier in om een nieuwe applicatie toe te voegen aan uw applicatielandschap"
- [ ] Section header displays exactly: "Publiceren applicatie"
- [ ] Section text displays exactly: "Vul de gegevens in voor de applicatie. Na het opvoeren van de applicatie is deze ook zichtbaar voor andere gemeenten, zodat zij deze ook kunnen opnemen in hun applicatielandschap. Hiermee worden dubbele registraties voorkomen."
- [ ] Blue info box title displays exactly: "Applicatie zoeken"
- [ ] Blue info box text displays exactly: "Weet je zeker dat de applicatie niet al bestaat?\nGa naar de zoekpagina en zoek op de naam van applicatie of leverancier. Zoek ook op andere schrijfwijzen."
- [ ] A "Selecteren van leverancier" field is present
- [ ] A "Naam leverancier" field is present (shown when creating a new leverancier)
- [ ] A "Website leverancier" field is present (shown when creating a new leverancier)

**Key Context from Comments:** Source text from PowerPoint in #329. This sub-step is reached from #323 when the user clicks "Ik kan de gewenste applicatie niet vinden". After creating the application, it becomes visible for other municipalities as well.

---

### #329: TekstenSWC.2.5.laasteversie.defintief.

**Labels:** Tekstuele wijzigingen
**Test Step:** General

**Summary:** This is the SOURCE DOCUMENT for all wizard text, containing the PowerPoint file (Wizards applicaties.pptx) from December 11 that is the authoritative source for all text in the Softwarecatalogus wizards.

**Acceptance Criteria:**
- [ ] All text in the "Dienst toevoegen" wizard (steps 1-3) matches the attached PowerPoint from 11 December 2025 (verified via #316, #317, #318)
- [ ] All text in the "Koppeling toevoegen" wizard (steps 1-4) matches the attached PowerPoint from 11 December 2025 (verified via #319, #320, #321, #322)
- [ ] All text in the "Applicatie toevoegen" wizard (steps 1-5 + step 1.1) matches the attached PowerPoint from 11 December 2025 (verified via #323, #324, #325, #326, #327, #328)
- [ ] All form header titles, subtitles, section headers, section texts, blue info box titles, and blue info box texts match their respective issue specifications

**Key Context from Comments:** Issues #316-#328 are the individual implementations of this source document. When verifying, cross-reference each wizard step against this PowerPoint. Any discrepancies between the PowerPoint and the individual issues should be flagged.

---

### #415: Vraag: Spelling "Applicatie informatie" vs "Applicatieinformatie"

**Labels:** help wanted, Aanbod
**Test Step:** Step 7

**Summary:** Decision on the correct spelling of "applicatie-informatie". The PowerPoint says "Applicatie informatie" (two words), but the correct Dutch spelling is with a hyphen. Decision from Makkmetp comment: use "applicatie-informatie" (hyphenated, lowercase).

**Acceptance Criteria:**
- [ ] All instances in the UI use "applicatie-informatie" (hyphenated, lowercase)
- [ ] No instances of "Applicatie informatie" (two words without hyphen) appear anywhere
- [ ] No instances of "Applicatieinformatie" (one word without hyphen) appear anywhere
- [ ] This applies to wizard steps, detail pages, management tables, and any other location where this term appears

**Key Context from Comments:** Decision from Makkmetp: use "applicatie-informatie" (hyphenated, lowercase). This overrides the PowerPoint which says "Applicatie informatie" (two words).

---

### #420: [Bug] Applicaties die door gemeenten zijn aangemaakt verschijnen niet in het aanbod-endpoint

**Labels:** Gebruik, Testbevindingen Wilco
**Test Step:** Step 12

**Summary:** Applications created by municipalities do not appear in the supply (aanbod) endpoint.

**Acceptance Criteria:**
- [ ] Applications created by gemeenten are visible via the aanbod endpoint
- [ ] Adjustment implemented so these applications also appear in the aanbod-endpoint

**Key Context from Comments:** Bug reported during testing. Municipality-created applications are missing from the aanbod endpoint entirely.

---

### #419: Standaarden en standaard-versie lijken niet goed gekoppeld

**Labels:** bug
**Test Step:** Step 16

**Summary:** Standards (Standaard) and standard versions (Standaard-versie) are not properly linked, causing version IDs to display instead of names.

**Acceptance Criteria:**
- [ ] Standard version is linked to its parent standard
- [ ] Standard names display correctly (not version IDs)
- [ ] Connection chain: ReferentieComponent -> Standaard -> Standaard-versie is complete

**Key Context from Comments:** Example: AI-verordering standard has no connection with "AI-verordering (Actueel)" version. But the connection exists between ReferentieComponent "AI-Component" and Standaard "AI-verordering". Unclear if the issue is in GEMMA data or the data model.

---

### #418: [Bug] Performance: applicaties dropdown laadt traag bij toevoegen dienst wizard + onnodige product call (404)

**Labels:** Testbevindingen Wilco
**Test Step:** Step 10

**Summary:** N+1 API calls pattern for the applications dropdown in the "dienst toevoegen" wizard causes slow loading. Plus a spurious 404 call to a product endpoint.

**Acceptance Criteria:**
- [ ] Applications dropdown loads in a single API call (not N+1 pattern)
- [ ] No 404 error for product endpoint
- [ ] Dropdown loads within reasonable time (<2 seconds)
- [ ] Applications dropdown uses batch API call instead of individual calls per application
- [ ] Total dropdown load time for 6+ applications is under 3 seconds

**Key Context from Comments:** Performance issue with applications dropdown making excessive API calls when loading in the dienst wizard.

---

### #405: Applicatie: applicatie verwijderen die door dienst ondersteund wordt

**Labels:** Aanbod, Wijziging
**Test Step:** Step 7

**Summary:** When deleting an application that is used by a service, the delete dialog incorrectly says the application is not used anywhere. After deletion, inconsistencies appear.

**Acceptance Criteria:**
- [ ] Delete dialog correctly warns when an application is used by a dienst
- [ ] If deletion proceeds, the application is removed consistently from both overview table and detail pages
- [ ] Dependencies are clearly shown before deletion
- [ ] After deleting an application, it is consistently removed from BOTH the diensten management table AND detail pages (no orphan references)
- [ ] A flow decision is implemented for: should an application be deletable when diensten from OTHER leveranciers reference it?

**Key Context from Comments:** Related to #403 (deletion text changes). The delete confirmation should show which diensten reference the application.

---

### #398: Zoeken: Filter met UUID's onder leveranciers

**Labels:** Aanbod
**Test Step:** Step 14

**Summary:** UUIDs appear instead of supplier names in the leveranciers (suppliers) search filter.

**Acceptance Criteria:**
- [ ] Leveranciers filter shows human-readable supplier names, not UUIDs
- [ ] All suppliers in the filter have proper names
- [ ] No empty or UUID-only entries in the leveranciers dropdown
- [ ] All modules in the import reference existing organizations (no orphan references to non-existent organization UUIDs)
- [ ] Frontend does not make extra API calls to resolve missing organization names
- [ ] If an organization UUID cannot be resolved, a human-readable fallback is shown (not the raw UUID)

**Key Context from Comments:** Related to #333 (UUIDs in filters). Part of the broader UUID-in-filters problem affecting search experience.

---

### #339: Activeren gebruikers

**Labels:** Bevinding
**Test Step:** Step 3

**Summary:** Findings about user activation process.

**Acceptance Criteria:**
- [ ] User activation process works correctly
- [ ] Activated users can log in
- [ ] Activation status is reflected in the UI
- [ ] Activating a user does NOT produce a 500 error
- [ ] After activating an organization, the contact person is correctly converted to a user without disappearing from the contacts list
- [ ] Activated user receives correct roles (no duplicate role assignments)
- [ ] After organization activation, the filter state is preserved (organizations list does not reload unfiltered)
- [ ] User activation works for both newly created organizations AND imported/data-migrated organizations

**Key Context from Comments:** Findings during testing of user activation flow.

---

### #338: Dashboard en Inloggen

**Labels:** Bevinding
**Test Step:** Step 4

**Summary:** Dashboard and login findings.

**Acceptance Criteria:**
- [ ] Dashboard loads correctly after login
- [ ] All dashboard elements are visible and functional
- [ ] Dashboard suggestions are shown correctly after first login (not inverted/empty)
- [ ] Page load time after login is reasonable (within a few seconds)
- [ ] Accepting/adopting a suggestion does not produce a 404 error

**Key Context from Comments:** Findings during testing of dashboard and login flow.

---

### #336: Views

**Labels:** Bevinding
**Test Step:** Step 19

**Summary:** Findings about architecture views display.

**Acceptance Criteria:**
- [ ] Architecture views load and display correctly
- [ ] View content matches expected data
- [ ] "Identificatie" column shows consistent values (either names or UUIDs, not a mix of both)
- [ ] Views are accessible from the correct menu location

**Key Context from Comments:** Findings during testing of architecture views (AMEFF).

---

### #335: Diensten Wizards

**Labels:** Bevinding
**Test Step:** Step 9

**Summary:** Findings about the service (diensten) wizard flow.

**Acceptance Criteria:**
- [ ] Diensten wizard flow works correctly from start to finish
- [ ] All wizard steps are accessible and functional

**Key Context from Comments:** Findings during testing of the diensten wizard.

---

### #333: UUID uit filters Refcomp en standaarden opzoeken en corrigeren in datamigratie

**Labels:** Aanbod, Datamigratie
**Test Step:** Step 14

**Summary:** UUIDs appearing in reference component and standards filters need to be corrected in data migration.

**Acceptance Criteria:**
- [ ] Reference component filter shows human-readable names
- [ ] Standards filter shows human-readable names
- [ ] No UUIDs visible in any filter dropdown
- [ ] Referentiecomponent UUIDs for Regelbeheercomponent, Wkpb-component, and Sonderingsregistercomponent are resolved (merged or removed)
- [ ] Standaardversie UUIDs for "StUF Geo IMGeo (actueel)", "Samenwerken (actueel)", and "StUF LVBAG 2.06" are removed from compliancy data
- [ ] Leverancier filter no longer contains UUIDs (only readable supplier names)

**Key Context from Comments:** Data migration needs correction to resolve UUIDs to readable names in filters. Related to #398.

---

### #331: Koppeling relatie Applicatie

**Labels:** (none)
**Test Step:** Step 11

**Summary:** Connection (koppeling) relationship with application needs verification.

**Acceptance Criteria:**
- [ ] Koppelingen correctly reference their linked applications
- [ ] Application names display correctly in koppeling views

**Key Context from Comments:** Verifying the connection relationship between koppelingen and applicaties.

---

### #311: Altijd inlog-account en -organisatie tonen

**Labels:** Gebruik
**Test Step:** Step 4

**Summary:** Always show the logged-in account and organization in the UI.

**Acceptance Criteria:**
- [ ] Logged-in user name is always visible in the UI
- [ ] Active organization name is always visible
- [ ] Both are shown consistently across all pages

**Key Context from Comments:** Users need to always see which account and organization they are working under.

---

### #261: Wizards: pas te testen na RBAC

**Labels:** Gebruik, Wizard
**Test Step:** Step 7

**Summary:** Wizard testing was blocked pending RBAC implementation. Now that RBAC is in place, wizards should be fully testable.

**Acceptance Criteria:**
- [ ] Wizards appear for authorized users based on their role
- [ ] Aanbod-beheerder sees supplier wizards
- [ ] Gebruik-beheerder sees municipality wizards
- [ ] Unauthorized users do not see wizards they shouldn't access

**Key Context from Comments:** Testing was previously blocked on RBAC. Now that RBAC is implemented, wizards can be fully tested.

---

### #255: Beheer pagina's -- Dashboard: Tekst: welkom in de softwarecatalogus opleveren

**Labels:** Afschalen Producten, Bevinding, Tekstuele wijzigingen, Beheer
**Test Step:** Step 21

**Summary:** Dashboard welcome text needs to be delivered and displayed correctly. Cross-references #187 for exact text.

**Acceptance Criteria:**
- [ ] Dashboard shows "Welkom in de Softwarecatalogus" as heading
- [ ] Dashboard shows: "Dit is de centrale plek om producten, applicaties, diensten en koppelingen te beheren. Door applicaties te koppelen aan GEMMA-referentiecomponenten wordt uw applicatielandschap gemapped op de GEMMA-referentiearchitectuur."
- [ ] Text is consistent with #187 text proposals

**Key Context from Comments:** Related to #187 (Tekstvoorstellen) and #268 (Dashboard text). Also resolved by #410 (supplier-specific welcome text). The exact text was defined in #187 with screenshots.

---

### #268: Tekst aanleveren: Na inloggen: Dashboard tekst aanpassen

**Labels:** Tekstuele wijzigingen, Cms
**Test Step:** Step 21

**Summary:** Dashboard text after login needs adjustment. Cross-references #187 for exact text.

**Acceptance Criteria:**
- [ ] Post-login dashboard displays the correct welcome text (per #187)
- [ ] Dashboard text is role-specific if applicable
- [ ] Text styling matches the design

**Key Context from Comments:** Related to #187 (Tekstvoorstellen) and #255 (Dashboard welcome text). Part of the broader text alignment effort.

---

### #209: [Bug] De help knop op de NC dashboard organisaties pagina gaat naar een niet bestaande pagina toe

**Labels:** bug, Testbevindingen Wilco
**Test Step:** Step 3

**Summary:** Help button on NC dashboard organizations page links to a non-existent page.

**Acceptance Criteria:**
- [ ] Help button links to an existing, accessible page
- [ ] Help content is relevant to the organizations overview

**Key Context from Comments:** Reported by Wilco during testing. The help button navigates to a 404 page.

---

### #208: [Bug] NC Dashboard organisatie overzicht (table ipv cards) laat alleen het veld ID zien

**Labels:** bug, Testbevindingen Wilco
**Test Step:** Step 3

**Summary:** When switching to table view for organizations in NC Dashboard, only the ID field is shown.

**Acceptance Criteria:**
- [ ] Table view shows relevant fields (name, type, status) not just ID
- [ ] Table view is usable for managing organizations

**Key Context from Comments:** Reported by Wilco. Table view regression showing only ID column.

---

### #205: [Bug] Een gedepubliceerde applicatie is nog te vinden als je er naar zoekt

**Labels:** bug, Testbevindingen Wilco
**Test Step:** Step 14

**Summary:** A depublished application can still be found via search.

**Acceptance Criteria:**
- [ ] Depublished applications do NOT appear in public search results
- [ ] Only published applications are searchable by the general public
- [ ] Admin/owner can still find depublished applications in their management view

**Key Context from Comments:** Reported by Wilco. Depublished applications should be hidden from public search but remain accessible in management views.

---

### #231: [Bug] AMEFF exports (van views) geven een foutmelding als je deze probeert te importeren in Archi

**Labels:** bug, Testbevindingen Wilco
**Test Step:** Step 24

**Summary:** AMEFF exports of views produce errors when importing into Archi.

**Acceptance Criteria:**
- [ ] AMEFF export generates valid ArchiMate exchange format files
- [ ] Exported files can be imported into Archi without errors
- [ ] All expected elements and relationships are present in the export

**Key Context from Comments:** Reported by Wilco. The AMEFF export format is not fully compatible with Archi import requirements.

---

### #188: Aanmeldproces

**Labels:** Organisatie en configuratie, Restpunt
**Test Step:** Step 2

**Summary:** Registration/sign-up process findings.

**Acceptance Criteria:**
- [ ] Registration process works end-to-end
- [ ] User receives confirmation after registration
- [ ] Admin can activate registered organizations

**Key Context from Comments:** Outstanding findings from the registration process testing.

---

### #182: [Taak] 'Algemene voorwaarden', 'Privacyverklaring', 'Disclaimer' and FAQ

**Labels:** nonblock, Testbevindingen Wilco
**Test Step:** Step 21

**Summary:** Legal pages (Terms, Privacy, Disclaimer, FAQ) need to be created and accessible.

**Acceptance Criteria:**
- [ ] "Algemene voorwaarden" page exists and is accessible
- [ ] "Privacyverklaring" page exists and is accessible
- [ ] "Disclaimer" page exists and is accessible
- [ ] FAQ page exists and is accessible
- [ ] All pages are linked from the footer or relevant navigation
- [ ] Content is filled in (not placeholder text)

**Key Context from Comments:** Reported by Wilco. Legal pages are required for go-live. Related to #397 (CMS page editing) and #409 (footer links).

---

### #342: Zoeken: op kaartjes aantal referentiecomponenten duidelijk maken

**Labels:** Gebruik, Zoeken
**Test Step:** Step 14

**Summary:** When an application card has more reference components than can be displayed, the overflow should be handled clearly.

**Acceptance Criteria:**
- [ ] When an application card has more referentiecomponenten than can be displayed, a total count is shown (e.g., "+5 meer")
- [ ] A "Meer" link or count navigates to the application detail page where all referentiecomponenten are visible
- [ ] All referentiecomponenten are visible on the detail page

---

### #411: Vraag: Required eisen uitgezet voor dataimport

**Labels:** Vraag, Data Import
**Test Step:** Step 19

**Summary:** Required fields (beschrijvingKort, website for module; naam, moduleA, moduleB for koppeling; website for organisatie) were set to non-required to accommodate import data with null values. These constraints should be re-enabled after a clean re-import.

**Acceptance Criteria:**
- [ ] A new data import file fills in beschrijvingKort and website for all modules
- [ ] A new data import file provides naam, moduleA, and moduleB for all koppelingen
- [ ] A new data import file provides website for all organisaties
- [ ] After re-import with complete data, the required constraints on these fields are re-enabled in the schema
- [ ] Wizards properly enforce required field validation after constraints are restored

---

### #412: Vraag: Niet alle AMEF views hebben documentatie

**Labels:** Vraag, Architectuur
**Test Step:** Step 19

**Summary:** 5 specific AMEF views lack descriptions and display "geen beschrijving beschikbaar voor deze view" in the frontend.

**Acceptance Criteria:**
- [ ] Referentiecomponentenlandschap view has a description
- [ ] Test extra componenten view has a description
- [ ] Basisbeveiligingsniveau views (both) have descriptions
- [ ] Referentiecomponenten en ondersteuning BIO maatregelen view has a description
- [ ] No view displays "geen beschrijving beschikbaar voor deze view" after descriptions are provided

---

### #413: Vraag: Views testen vs softwarecatalogus scope

**Labels:** Vraag, Architectuur
**Test Step:** Step 19

**Summary:** Clarification on which AMEF views should be included in the softwarecatalogus. 22 views match the agreed filter. Test views should not appear in production.

**Acceptance Criteria:**
- [ ] Only the 22 views matching the agreed filter `publiceren=Softwarecatalogus+en+GEMMA+Online+en+redactie` are displayed
- [ ] Views with duplicate titelViewSwc are clearly distinguishable in the UI
- [ ] Test views not matching the production filter do not appear in the published softwarecatalogus

---

### #414: Vraag: Mogen deelnemers gebruiksobjecten lezen

**Labels:** Vraag, RBAC
**Test Step:** Step 12

**Summary:** Whether participants (deelnemers) in usage objects can read those objects when they are not the owner.

**Acceptance Criteria:**
- [ ] Deelnemers (participants) in a gebruiksobject can read the object even when they are not the owner
- [ ] Gemeenten and samenwerkingen can view each other's usage data where they are deelnemers

---

### #417: Vraag: Andere email adressen voor contactpersonen

**Labels:** Vraag, Data Import
**Test Step:** Step 3

**Summary:** Imported contact person email addresses use Gmail aliases (e.g., test.vng.swc+Bre@gmail.com) which are OAuth-incompatible. Proper email addresses should be provided for the definitive import.

**Acceptance Criteria:**
- [ ] Imported contact persons have OAuth-compatible email addresses (not Gmail aliases with + notation)
- [ ] When activating a contact person with an invalid/incompatible email, a clear error message is shown
- [ ] Email can be changed before activation as a workaround

**Key Context from Comments:** Priority is low since the definitive import will not have invalid emails. This is a data quality issue, not a code issue.

---

## Other Issues (In Review) — Additional Non-Testable Issues

The following issues are questions, PvE requirements, infrastructure tasks, test result collections, verzamelissues, or architecture/development tasks that are not directly testable via the IGS flow but remain in review.

| Issue # | Title | Labels | Test Step |
|---------|-------|--------|-----------|
| [#417](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/417) | Vraag: Kunnen we andere email adressen krijgen voor bestaande contactpersonen? | help wanted | Step 3 |
| [#416](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/416) | Vraag: Issue met twee delen (gebruikerstest + observaties) splitsen | (none) | General |
| [#414](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/414) | Vraag: Mogen deelnemers gebruiksobjecten lezen waar ze inzitten als deelnemer | Gebruik | Step 12 |
| [#413](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/413) | Vraag: De views waarmee we testen zijn geen onderdeel van de softwarecatalogus, moeten ze dat wel worden? | Referentiearchitectuur | Step 19 |
| [#412](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/412) | Vraag: Niet alle AMEF views hebben documentatie, kunnen deze worden aangeleverd? | Referentiearchitectuur | Step 19 |
| [#411](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/411) | Vraag: Required eisen uitgezet ivm dataimport, kan de data export worden uitgebreid? | (none) | Step 19 |
| [#341](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/341) | Tabelweergave: Optie toevoegen (optioneel) (out of scope) | Zoeken, Wijziging | Step 14 |
| [#181](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/181) | Testresultaten Mark donderdag 9 oktober | (none) | General |
| [#179](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/179) | Testresultaten 2025-10-05 | Aanbod, PvE eis, Bevinding | General |
| [#175](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/175) | Testresultaten 2025-09-24 (blok 3) | (none) | General |
| [#171](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/171) | Bevindingen fase 3 Aanbod | (none) | General |
| [#170](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/170) | Bevindingen importeren organisaties | (none) | Step 19 |
| [#167](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/167) | Bugs Open Register | (none) | General |
| [#166](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/166) | Verzamelissue wensen Open Register | (none) | General |
| [#165](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/165) | Verzamelissue reparaties fase 2 organisaties | (none) | Step 6 |
| [#164](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/164) | Verzamelissue grafische todo | (none) | General |
| [#162](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/162) | OpenAPI specificatie: compliance, documentatie, locatie | (none) | Infra |
| [#161](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/161) | (VNGR) Externe Koppelvlakken publiceren | Referentiearchitectuur | Step 19 |
| [#156](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/156) | (VNGR) Relatie standaard en standaardversie | Referentiearchitectuur | Step 16 |
| [#151](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/151) | Als functioneel beheerder wil ik GEMMA-referentiedata synchroniseren | Referentiearchitectuur | Step 19 |
| [#147](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/147) | Als architectuur-expert wil ik views vanuit GEMMA Online kunnen inladen | Referentiearchitectuur | Step 19 |
| [#146](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/146) | Als architectuur-expert wil ik de applicatielaag op een ArchiMate view kunnen plotten | Referentiearchitectuur | Step 19 |
| [#145](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/145) | Als architectuur-expert wil ik een ArchiMate view kunnen exporteren naar AMEFF | Referentiearchitectuur | Step 24 |
| [#143](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/143) | Als architectuur-expert wil ik de relatie zien tussen referentiecomponenten en standaarden | Referentiearchitectuur | Step 16 |
| [#138](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/138) | Als IBD wil ik basisbeveiligingsniveaus voor referentiecomponenten kunnen inzien | IBD | Step 19 |
| [#137](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/137) | Als IBD wil ik BIO-maatregelen per referentiecomponent inzien | IBD | Step 19 |
| [#136](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/136) | Als IBD wil ik de relatie zien tussen referentiecomponenten en BIO-beheersmaatregelen | IBD | Step 19 |
| [#124](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/124) | Als ontwikkelaar wil ik een geautomatiseerde datamigratie tool bouwen | Conduction ontwikkeling | Infra |
| [#104](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/104) | Het systeem moet beschikbaar zijn met minimaal 99,5% uptime | | Infra |
| [#103](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/103) | Het systeem moet responsief zijn en presteren binnen 2 seconden laadtijd | | General |
| [#102](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/102) | Het systeem moet voldoen aan WCAG 2.1 AA richtlijnen | | General |
| [#100](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/100) | Het systeem moet voldoen aan de relevante privacy- en beveiligingswetgeving (AVG) | | Infra |
| [#99](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/99) | Het systeem moet voldoen aan de API Design Rules (ADR) | | Infra |
| [#98](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/98) | De applicatie moet ondersteuning bieden voor meerdere talen (i18n) | | General |
| [#97](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/97) | De componenten moeten open source zijn en gepubliceerd onder een EUPL-licentie | | Infra |
| [#96](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/96) | Er moet uitgebreide documentatie beschikbaar zijn voor gebruikers en ontwikkelaars | | General |
| [#95](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/95) | De broncode moet beheerd worden op GitHub | | Infra |
| [#93](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/93) | De API moet voldoen aan de NL GOV API Design Rules | | Infra |
| [#88](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/88) | Componenten moeten draaien op een Kubernetes-omgeving | | Infra |
| [#86](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/86) | Als ontwikkelaar wil ik een schaalbare en onderhoudbare architectuur opzetten | | Infra |
| [#82](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/82) | Als ontwikkelaar wil ik een openbare API aanbieden voor softwaregegevens en GEMMA-informatie | Aanbod, PvE wens | Step 12 |
| [#72](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/72) | Als gebruik-raadpleger wil ik een ArchiMate-export maken vanuit mijn applicatielandschap | Gebruik, PvE eis | Step 24 |
| [#70](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/70) | Als functioneel beheerder wil ik koppelingen naar GEMMA Online beheren | Referentiearchitectuur | Step 19 |
| [#67](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/67) | Als IBD wil ik dat leveranciers BIO/NEN compliance-informatie kunnen registreren | IBD, PvE wens | Step 16 |
| [#58](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/58) | Als gebruik-beheerder wil ik koppelingen tussen applicaties kunnen registreren | Gebruik, PvE eis | Step 11 |
| [#56](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/56) | Als gebruik-beheerder wil ik standaardversies per koppeling kunnen registreren | Gebruik, PvE eis | Step 19 |
| [#53](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/53) | Als gebruik-raadpleger wil ik inzicht in de kwaliteit van het pakketoverzicht | Gebruik, PvE eis | Step 18 |
| [#52](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/52) | Als gebruik-raadpleger wil ik ArchiMate referentiecomponenten in context zien | Gebruik, PvE eis | Step 19 |
| [#51](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/51) | Als gebruik-raadpleger wil ik de koppeling zien tussen mijn applicaties en referentiecomponenten | Gebruik, PvE eis | Step 19 |
| [#50](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/50) | Als gebruik-beheerder wil ik referentiecomponenten koppelen aan mijn applicaties | Gebruik, PvE eis | Step 10 |
| [#49](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/49) | Als aanbod-beheerder wil ik de compliance van mijn pakket met standaarden bijhouden | Aanbod, PvE wens | Step 16 |
| [#48](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/48) | Als aanbod-beheerder wil ik versies van mijn pakket bijhouden | Aanbod, PvE wens | Step 7 |
| [#47](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/47) | Als aanbod-beheerder wil ik koppelingen met andere pakketten registreren | Aanbod, PvE wens | Step 11 |
| [#46](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/46) | Als aanbod-beheerder wil ik diensten bij mijn pakketten registreren | Aanbod, PvE wens | Step 9 |
| [#45](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/45) | Als aanbod-beheerder wil ik referentiecomponenten koppelen aan mijn pakket | Aanbod, PvE wens | Step 7 |
| [#44](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/44) | Als aanbod-beheerder wil ik contactpersonen koppelen aan mijn pakketten | Aanbod, PvE wens | Step 5 |
| [#42](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/42) | Als aanbod-beheerder wil ik kwetsbaarheden en beoordelingen bij mijn pakketten plaatsen | IBD, PvE wens | Step 7 |
| [#40](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/40) | Als aanbod-beheerder wil ik een pakket als SaaS of On-Premise kunnen registreren | Aanbod, PvE wens | Step 7 |
| [#37](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/37) | Als gebruik-beheerder wil ik de contactpersoon registreren verantwoordelijk voor een pakket | Gebruik, PvE wens | Step 5 |
| [#36](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/36) | Als gebruik-beheerder wil ik de versie en hosting-informatie van pakketten registreren | Gebruik, PvE wens | Step 10 |
| [#34](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/34) | Als gebruik-beheerder wil ik pakketten uit mijn pakketoverzicht kunnen verwijderen | Gebruik, PvE wens | Step 10 |
| [#32](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/32) | Als gebruik-beheerder wil ik applicaties van leveranciers selecteren voor mijn pakketoverzicht | Gebruik, PvE eis | Step 10 |
| [#31](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/31) | Als gebruik-beheerder wil ik een overzicht van alle pakketten in mijn pakketoverzicht | Gebruik, PvE eis | Step 10 |
| [#27](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/27) | Als functioneel beheerder wil ik GEMMA-referentiecomponenten beheren | Referentiearchitectuur | Step 21 |
| [#26](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/26) | Als functioneel beheerder wil ik standaarden en standaardversies beheren | Referentiearchitectuur | Step 21 |
| [#25](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/25) | Als functioneel beheerder wil ik organisatie-typen en -statussen configureren | Organisatie en configuratie | Step 21 |
| [#24](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/24) | Als functioneel beheerder wil ik de softwarecatalogus configureren | Organisatie en configuratie | Step 21 |
| [#21](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/21) | Als gebruik-raadpleger wil ik een ArchiMate-view van het applicatielandschap zien | Gebruik, PvE eis | Step 19 |
| [#18](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/18) | Als gebruik-raadpleger wil ik zoeken en filteren op pakketten | Gebruik, PvE eis | Step 14 |
| [#17](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/17) | Als bezoeker wil ik informatie zien over een specifiek pakket | PvE eis | Step 14 |
| [#16](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/16) | Als bezoeker wil ik zoeken en filteren op pakketten | PvE eis, Zoeken | Step 14 |
| [#14](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/14) | Als aanbod-beheerder wil ik referentiecomponenten koppelen aan mijn pakket | Aanbod, PvE eis | Step 7 |
| [#13](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/13) | Als aanbod-beheerder wil ik diensten bij mijn pakket registreren | Aanbod, PvE eis | Step 9 |
| [#12](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/12) | Als aanbod-beheerder wil ik een pakket met modules kunnen registreren | Aanbod, PvE eis | Step 7 |

---

## Previously Listed Other Issues (In Review) — 38 issues

| Issue # | Title | Labels | Test Step |
|---------|-------|--------|-----------|
| [#8](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/8) | Als aanbod-beheerder zie ik de door gebruik-beheerders onder mijn organisatie toegevoegde pakketten | Gebruik, PvE eis | Step 18 |
| [#10](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/10) | Als aanbod-beheerder wil ik kunnen registreren welke organisaties mijn pakket gebruiken | Gebruik, PvE eis | Step 18 |
| [#11](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/11) | Als functioneel beheerder wil ik een overzicht kunnen opvragen van alle door gebruik-beheerders geregistreerde pakketten en/of aanbieders | Gebruik, PvE eis, nonblock | Step 23 |
| [#19](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/19) | Als gebruik-raadpleger wil ik bij het bekijken van een pakket kunnen zien welke gemeenten het gebruiken | Gebruik, PvE eis | Step 17 |
| [#20](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/20) | Als gebruik-raadpleger wil ik kunnen "gluren bij de buren" om te bekijken welke pakketten bij een andere gemeente in gebruik zijn | Gebruik, PvE eis | Step 17 |
| [#22](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/22) | Als gebruik-raadpleger wil ik mijn pakketoverzicht kunnen filteren op meerdere eigenschappen | Gebruik, PvE eis | Step 17 |
| [#35](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/35) | Als gebruik-beheerder wil ik kunnen registreren welke diensten ik afneem voor de pakketten in mijn pakketoverzicht | Gebruik, PvE wens | Step 10 |
| [#38](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/38) | Als aanbod-beheerder wil ik bij SaaS voorzieningen kunnen aangeven bij welke cloud-provider deze draait | Aanbod, PvE wens | Step 7 |
| [#41](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/41) | Als gebruik-beheerder wil ik relevante documenten zoals DPIA's, verwerkersovereenkomsten en pentesten kunnen delen | IBD, PvE wens | Step 12 |
| [#43](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/43) | Als aanbod-beheerder wil ik documenten kunnen toevoegen aan mijn pakketten met een conceptstatus | IBD, PvE wens | Step 7 |
| [#54](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/54) | Als gebruik-raadpleger wil ik statistieken kunnen zien over mijn pakketoverzicht | Gebruik, PvE eis, nonblock | Step 18 |
| [#55](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/55) | Als gebruik-beheerder wil ik bij een koppeling kunnen aangeven of er gebruik wordt gemaakt van een standaardversie | Gebruik, PvE eis | Step 19 |
| [#57](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/57) | Als gebruik-beheerder van een samenwerkingsverband wil ik softwarepakketten kunnen opvoeren voor de gemeenten waarvoor we werken | Gebruik, PvE eis | Step 20 |
| [#59](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/59) | Als gebruik-beheerder wil ik alle informatie over mijn applicaties in de softwarecatalogus kunnen invoeren | Gebruik, PvE eis | Step 22 |
| [#60](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/60) | Als gebruik-beheerder wil ik voor meerdere organisaties met één account de pakketoverzichten kunnen bewerken | Gebruik, PvE eis | Step 20 |
| [#71](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/71) | (VNGR) Importeren ArchiMate ID-73 | help wanted, Referentiearchitectuur, PvE eis | Step 19 |
| [#74](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/74) | Als gebruik-raadpleger wil ik een overzicht met zoek- en filteropties van alle organisaties die pakketten of diensten gebruiken | question, Gebruik, PvE eis, Zoeken | Step 17 |
| [#75](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/75) | Als functioneel beheerder wil ik rapportages maken over de data in de softwarecatalogus | Management Informatie, PvE eis, nonblock | Step 21 |
| [#83](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/83) | Als ontwikkelaar wil ik via een beveiligde, besloten API aanbodinformatie kunnen registreren | Aanbod, PvE wens | Step 12 |
| [#84](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/84) | Als ontwikkelaar wil ik via een beveiligde, besloten API toegang hebben tot gebruiksinformatie | Gebruik, PvE wens | Step 12 |
| [#87](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/87) | Als gebruiker wil ik op een juiste manier geïnformeerd worden door het systeem wanneer er een fout optreedt | | General |
| [#89](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/89) | Componenten zijn out-of-the-box geschikt voor installatie binnen een gestandaardiseerde (cloud-)infrastructuur platform | | Infra |
| [#92](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/92) | Als functioneel beheerder wil ik inzicht in het gebruik van de softwarecatalogus via een open source webstatistiekenpakket | | Step 21 |
| [#101](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/101) | De gebruikersinterface moet intuïtief en eenvoudig te gebruiken zijn | | General |
| [#105](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/105) | Als gebruik-beheerder willen we dat aanbieders onze applicatielandschappen en koppelingen niet zien | Gebruik, PvE eis | Step 12 |
| [#109](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/109) | Als ontwikkelaar wil ik organisatie- en softwaregegevens integreren zodat deze beschikbaar zijn in de export | Conduction ontwikkeling | Step 13 |
| [#117](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/117) | Als ontwikkelaar wil ik robuuste foutafhandeling implementeren zodat mislukte imports netjes worden afgehandeld | Conduction ontwikkeling | Step 19 |
| [#121](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/121) | Als ontwikkelaar wil ik versioning implementeren zodat we kunnen rollbacken bij problemen | Conduction ontwikkeling | Infra |
| [#130](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/130) | Als ontwikkelaar wil ik CI/CD pipelines hebben zodat code automatisch wordt getest | Restpunt, Conduction ontwikkeling | Infra |
| [#135](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/135) | (VNGR) Valideren van non-functionele eisen voor component Referentiearchitectuur | Referentiearchitectuur | Step 22 |
| [#183](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/183) | [Feature] Als gebruiker wil ik een 'wachtwoord vergeten' optie | Testbevindingen Wilco | Step 4 |
| [#192](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/192) | [Taak] Organisatie adres info in organisatie cards (NC dashboard) | nonblock, Testbevindingen Wilco | Step 6 |
| [#195](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/195) | [Bug] In NC dashboard doen niet alle opties in de organisatie 'acties dropdown' wat ze moeten doen | bug, Testbevindingen Wilco | Step 3 |
| [#205](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/205) | [Bug] Een gedepubliceerde applicatie is nog te vinden als je er naar zoekt | bug, Testbevindingen Wilco | Step 14 |
| [#208](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/208) | [Bug] NC Dashboard organisatie overzicht (table ipv cards) laat alleen het veld ID zien | bug, Testbevindingen Wilco | Step 3 |
| [#209](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/209) | [Bug] De help knop op de NC dashboard organisaties pagina gaat naar een niet bestaande pagina toe | bug, Testbevindingen Wilco | Step 3 |
| [#231](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/231) | [Bug] AMEFF exports (van views) geven een foutmelding als je deze probeert te importeren in Archi | bug, Testbevindingen Wilco | Step 24 |
| [#342](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/342) | Zoeken: op kaartjes aantal referentiecomponenten duidelijk maken | Zoeken, Wijziging | Step 14 |

---

## Issue Distribution by Test Step

| Test Step | Description | IGS | Other | Total |
|-----------|-------------|-----|-------|-------|
| Step 3 | Organisatie activatie + gebruikersbeheer | 2 | 3 | 5 |
| Step 4 | Eerste inlog | 4 | 1 | 5 |
| Step 5 | Collega's uitnodigen / Contactpersonen | 6 | 0 | 6 |
| Step 6 | Organisatie profiel | 1 | 1 | 2 |
| Step 7 | Product aanmaken (applicaties) | 31 | 2 | 33 |
| Step 9 | Dienst wizard | 14 | 0 | 14 |
| Step 10 | Gebruik melden en beheren | 9 | 1 | 10 |
| Step 11 | Koppeling wizard | 11 | 0 | 11 |
| Step 12 | Privacy en zichtbaarheid | 3 | 4 | 7 |
| Step 13 | Excel export | 2 | 1 | 3 |
| Step 14 | Zoeken en resultaten | 11 | 2 | 13 |
| Step 16 | Standaarden beheer | 2 | 0 | 2 |
| Step 17 | "Gluren bij de buren" | 0 | 4 | 4 |
| Step 18 | Leverancier gebruik beheer | 0 | 3 | 3 |
| Step 19 | Geavanceerde koppelingen | 2 | 3 | 5 |
| Step 20 | Samenwerkingen | 0 | 2 | 2 |
| Step 21 | Beheer en configuratie | 11 | 2 | 13 |
| Step 22 | Geavanceerde zoek en filter | 1 | 2 | 3 |
| Step 23 | Functioneel beheer overzicht | 0 | 1 | 1 |
| Step 24 | AMEFF export | 0 | 1 | 1 |
| General | Cross-cutting / multiple steps | 3 | 2 | 5 |
| Infra | Infrastructure / non-testable | 1 | 3 | 4 |
| **Total** | | **114** | **38** | **152** |

> Note: Some issues with broad scope (General/Infra) are not mapped to a specific test step.

---

## Legend

| Value | Meaning |
|-------|---------|
| **Step N** | Mapped to test step N in `testen.md` |
| **General** | Cross-cutting issue affecting multiple steps |
| **Infra** | Infrastructure issue, not directly testable via UI |
