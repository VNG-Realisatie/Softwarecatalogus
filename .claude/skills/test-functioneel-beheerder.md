# Test Agent: Functioneel Beheerder (Functional Manager)

## Persona

**Peter van Dijk** — Functional Manager at VNG, 6 years GEMMA experience, 10 years municipal ICT.

## Role: Functioneel beheerder (Full Admin)

Peter has full system access. He activates organizations, manages users, maintains the GEMMA model, monitors data quality, and configures the system.

## Login Credentials

- **Username**: `{PERSONA_USERNAME}` (default: `peter.vandijk@test.nl`)
- **Password**: `{PERSONA_PASSWORD}` (default: `WelcomeToTest2026`)
- **Groups**: functioneel-beheerder, gebruik-beheerder, aanbod-beheerder, software-catalog-admins, software-catalog-users

> These values are injected by the orchestrator. If not provided, use the defaults above (local dev only).

## Test Environment

- **Frontend**: `{FRONTEND}` (default: `{FRONTEND}`)
- **Backend**: `{BACKEND}` (default: `{BACKEND}`)
- **Browser**: Use Playwright MCP browser tools (prefixed `mcp__browser-N__`, where N is assigned by the orchestrator)
- **Login URL**: `{FRONTEND}/login`
- **Backend Admin**: `{BACKEND}/` ({ADMIN_USER}:{ADMIN_PASS})

## Test Scope

### Primary Steps
- **Step 3**: Organization activation — Activate organizations, manage users, set passwords
- **Step 5**: User management — Create users, assign roles, manage access
- **Step 12**: Privacy — Verify admin has full access to all data
- **Step 15**: AMEFF reference applications — Manage GEMMA component mappings
- **Step 19**: Advanced connections — ArchiMate import/export, legacy data
- **Step 21**: Admin and configuration — Content management, system settings, reports
- **Step 23**: Functional manager overview — Dashboard, data quality monitoring
- **Step 24**: AMEFF export — Specialized exports

## Issues to Test

### Previously tested (re-verify with auth):
| Issue | Title | Previous Status |
|-------|-------|-----------------|
| #155 | Definities via interactieve optie (Begrippenlijst) | RE-TEST (new admin criteria added: empty external link, keywords as text) |
| #267 | Naam is softwarecatalogus i.p.v. Softwarecatalogus | **MOVED → bezoeker** (public page check) |
| #332 | Voorpagina inrichten | PARTIAL |
| #397 | Pagina aanmaken via CMS | PASS |
| #403 | Tekst verwijderen aanpassen | CANNOT_TEST → **re-test (see hint #2)** |
| #406 | SiteImprove verwijderen | PARTIAL |
| #409 | Footer anders: inlog of uitgelogd | PARTIAL |
| #410 | Dashboard schrijfwijze softwarecatalogus | CANNOT_TEST → **re-test (login as leverancier)** |
| #92 | Webstatistiekenpakket (Piwik Pro) | PARTIAL |
| #169 | Rest issues Organisatie en Configuratie | PARTIAL |

### New issues (not previously tested):
| Issue | Title | Test Step |
|-------|-------|-----------|
| #85 | (VNGR) Publieke API toegang tot aanbodinformatie | Step 12 |
| #141 | Organisaties samenvoegen na herindeling/overname | Step 21 — **see hint #5** |
| #148 | (VNGR) GEMMA-architectuur opvraagbaar met API | Step 12 |
| #225 | Testresultaten 29-10-2025 | General |
| #278 | Filterteksten aanpassen | Step 14 |
| #286 | 500-error bij wachtwoord wijzigen | Step 5 |
| #392 | Geimporteerde gebruiker error bij omzetten naar user | Step 3 — **see hint #4** |
| #393 | Backend: fouten in voorzieningenregister | Step 19 |
| #396 | Verouderde NextCloud versie | Infra |
| N/A | Themes management (exploratory) | Step 21 |
| #15 | Exporteren van gegevens (CSV/Excel) | Step 24 |
| #355 | Exporteren functies (Applicatie export) | Step 24 — **bug fixed, re-test** |
| N/A | Schema export (OpenRegister registers) | Step 24 |
| N/A | Import round-trip (export → modify → reimport) | Step 24 |
| N/A | Facet editing (OpenRegister schemas) | Step 21 |

## Acceptance Criteria Reference

**IMPORTANT**: Before testing each issue, read its detailed acceptance criteria in `issues.md` (in the repository root). Each issue has specific, testable acceptance criteria with checkboxes. Use these criteria to determine PASS/FAIL/PARTIAL status:
- **PASS** = ALL acceptance criteria are met
- **PARTIAL** = Some criteria met, some not
- **FAIL** = Key criteria not met or feature is broken
- **CANNOT_TEST** = Feature not accessible or environment issue prevents testing

## Testing Hints for Specific Issues

1. **#155 (glossary management)**: Navigate to the Nextcloud backend at `{BACKEND}/index.php/apps/opencatalogi/#/glossary` (Catalogi → Instellingen → Glossary). Test:
   - Click **"Add Glossary"** to open the term modal
   - Leave the **External Link** field empty and fill in term, summary, description — save should succeed without validation error
   - In the **Keywords** field, type a keyword and press Enter — it should appear as a text tag (not a UUID)
   - Add multiple keywords and verify they all display as readable text
   - Save the term, then click to edit it — verify keywords load back as readable text tags
   - If an existing term has keywords, click edit and verify they show as text, not UUIDs
   - Take screenshots of: empty external link saving, keywords as text tags, editing existing term

2. **#403 (delete dialog text)**: Previously CANNOT_TEST because Peter's admin account has no own-organization applications. **Workaround**: Log in as **Jan Pietersen** (leverancier) first to test the delete dialog on the frontend, OR test via the backend:
   - **Option A (frontend as leverancier)**: Log in as `jan.pietersen@test.nl` / `WelcomeToTest2026`, navigate to `/beheer/applicaties`, find "Test Applicatie Leverancier", click Acties → Verwijderen. Verify dialog text, then Cancel.
   - **Option B (backend as admin)**: Navigate to `{BACKEND}/index.php/apps/openregister` → Search/Views, find any object, click the three-dot menu → Delete. Verify the dialog text shows the object type and name.
   - In both cases verify:
     - The dialog shows the correct object type ("applicatie", "dienst", or "koppeling")
     - The dialog shows the object name
     - The dialog checks if the object is in use by municipalities
     - Click **Cancel** to abort — do NOT actually delete.

3. **#286 (500-error bij wachtwoord wijzigen)**: Test password change via Nextcloud backend user management:
   1. Navigate to `{BACKEND}/settings/users`
   2. Find a test user (e.g., `maria.vanderberg@test.nl`)
   3. Click the **three-dot menu** (⋮) on the user row → click **"Edit"** or open the user detail
   4. Find the password field and enter a new password (e.g., `NewTestPassword2026`)
   5. Save the change
   6. Verify: No 500 error occurs, and a success message appears
   7. **Revert**: Change the password back to `WelcomeToTest2026` so other tests still work
   8. Also test via OCS API: `curl -u {ADMIN_USER}:{ADMIN_PASS} -X PUT "{BACKEND}/ocs/v2.php/cloud/users/maria.vanderberg%40test.nl" -d "key=password" -d "value=WelcomeToTest2026" -H "OCS-APIRequest: true"` — verify HTTP 200 response (not 500)
   9. Take screenshots of the password change flow

4. **#392 (geimporteerde gebruiker error bij omzetten)**: Previously CANNOT_TEST because no imported organization was available. **Setup first**, then test:

   **Setup — Create an "imported" organization** (one not created via wizard):
   1. Use the API to create a test organization directly:
      ```
      curl -s -u {ADMIN_USER}:{ADMIN_PASS} -X POST '{BACKEND}/index.php/apps/openregister/api/objects/3/15' \
        -H 'Content-Type: application/json' \
        -d '{"naam":"Test Import Org","type":["Leverancier"],"website":"https://test-import.nl","beschrijvingKort":"Organisatie voor import test"}'
      ```
   2. Note the returned UUID — this is your "imported" organization

   **Test — Create a contact person for the imported org**:
   1. Navigate to `{BACKEND}/index.php/apps/openregister` → **Search / Views**
   2. Filter by register: **Voorzieningen**, schema: **Contactpersoon**
   3. Click **"Add"** (or the + button) to create a new contact person
   4. Fill in: voornaam: `Test`, achternaam: `Import`, email: `test.import@test.nl`
   5. Link it to the "Test Import Org" organization created above
   6. Save the contact person
   7. Verify: No error occurs during save — the contact person should be created AND automatically converted to a Nextcloud user
   8. Check the Nextcloud users list (`{BACKEND}/settings/users`) to see if `test.import@test.nl` was created
   9. Check the backend logs for errors: `docker exec nextcloud tail -20 /var/www/html/data/nextcloud.log`
   10. **Clean up**: Delete the test contact person and user after testing
   11. Take screenshots of each step

5. **#141 (merge organizations)**: Previously CANNOT_TEST because no suitable merge candidate existed. **Setup first**, then test:

   **Setup — Ensure a merge candidate exists**:
   1. First, check existing organizations: `curl -s -u {ADMIN_USER}:{ADMIN_PASS} '{BACKEND}/index.php/apps/openregister/api/objects/3/15?_fields=naam,id&_limit=20'`
   2. If there is no duplicate/redundant organization to merge, create one:
      ```
      curl -s -u {ADMIN_USER}:{ADMIN_PASS} -X POST '{BACKEND}/index.php/apps/openregister/api/objects/3/15' \
        -H 'Content-Type: application/json' \
        -d '{"naam":"Test Leverancier BV (oud)","type":["Leverancier"],"website":"https://test-leverancier-oud.nl","beschrijvingKort":"Oude organisatie voor merge test"}'
      ```
   3. Note the returned UUID

   **Test — Merge organizations via backend**:
   1. Navigate to `{BACKEND}/index.php/apps/openregister`
   2. Click **"Search / Views"** in the left sidebar
   3. In the filter area, select register: **"voorzieningen"** and schema: **"organisatie"**
   4. Find the source organization "Test Leverancier BV (oud)" in the results
   5. Click the **three-dot menu** (⋮) on the right of the row → click **"Merge"**
   6. A merge dialog should open — select the **target organization** "Test Leverancier BV"
   7. Walk through the merge dialog steps:
      - **Property selection**: For each field, choose whether to keep source or target value
      - **Relations/references**: Choose how to handle linked objects
   8. **Do NOT click the final "Merge" button** — click **Cancel** to abort
   9. Take screenshots of each dialog step
   10. Document whether the merge dialog loads without timeout errors (previous run had 30000ms timeout)

3. **CMS pages (#397, #332)**: Manage CMS content at **{BACKEND}/index.php/apps/opencatalogi/pages#** (NOT `/#/pages`). This is the OpenCatalogi backend Pages management view. Test:
   - Navigate to the pages URL
   - Verify existing pages are listed (privacy, terms, FAQ, disclaimer, etc.)
   - Create a new test page: click "Add", set title "Test Page", add content, save
   - Edit an existing page: click on it, modify text, save
   - Verify saved changes appear on the public frontend (e.g., `/test-page`)
   - Delete the test page afterward to clean up

4. **Themes**: Manage themes at **{BACKEND}/index.php/apps/opencatalogi/themes#**. Test:
   - Navigate to the themes URL
   - Verify the themes management page loads correctly
   - Document what themes are available and which is active
   - If possible: create a new theme, modify colors/branding, save, and verify the change is reflected on the frontend
   - Check if the "Open Tilburg" footer branding can be changed via theme settings
   - Take screenshots of the themes management interface

4. **#15 / #355 (export)**: The export 500 error (#355) is **FIXED**. Test exports work correctly:
   - In any beheer table, click **"Acties"** dropdown → **"Exporteren"** → **"Als CSV"** or **"Als Excel"**. Verify the download works.
   - **Also verify via curl** (backend): `curl -s -o /dev/null -w '%{http_code}' -u {ADMIN_USER}:{ADMIN_PASS} '{BACKEND}/index.php/apps/openregister/api/objects/3/25/export?format=csv'` — should return `200` (not `500`).
   - Check that exported CSV/Excel contains readable column values, not raw UUIDs. UUID relation columns should have a companion `_columnName` column with the resolved name.

5. **Export & Import — Full Round-Trip Testing (OpenRegister)**:
   Test ALL export formats and the round-trip workflow (export → modify → reimport → verify).

   **5a. Schema-level object export (Excel)**:
   1. Navigate to `{BACKEND}/index.php/apps/openregister/registers#`
   2. Find the **"Voorzieningen"** register card and locate the **"Applicatie"** schema row
   3. Click the **three-dot menu** (⋮) on the Applicatie row → click **"Export"**
   4. In the export dialog, select **"Excel"** as the format
   5. Click **"Export"** — verify a .xlsx file downloads
   6. Open the file and verify it contains Applicatie object data with columns matching schema properties
   7. Take a screenshot of the export dialog and note the file size
   8. Document: Did the download succeed? Does the file contain expected columns (naam, beschrijving, etc.)? Are id values present?

   **5b. Schema-level object export (CSV)**:
   1. Repeat step 5a but select **"CSV"** as the format
   2. Verify a .csv file downloads
   3. Open the file and verify the data matches the Excel export
   4. Document: Did CSV export work? Is the data comma-separated? Are special characters (Dutch diacritics) preserved?

   **5c. Register-level API specification download (JSON config)**:
   1. Click the **three-dot menu** (⋮) on the **register card heading** "Voorzieningen" (NOT on a schema row)
   2. Click **"Download API Specification"**
   3. Verify a JSON file downloads containing the register configuration
   4. Open the file and check it contains register metadata, schema definitions, and property definitions
   5. Document: Is the JSON valid? Does it include all schemas? Are property types and constraints preserved?

   **5d. Register-level import dialog**:
   1. Click the **three-dot menu** (⋮) on the **register card heading** "Voorzieningen"
   2. Click **"Import"**
   3. Verify the import dialog appears with:
      - "Select File" button
      - Supported file types listed: JSON, Excel (.xlsx, .xls), CSV
      - Import requirements (id column, UUID format, metadata columns)
      - Toggle options: Include objects, Enable validation, Enable events, Enable RBAC, Enable Multi-tenancy, Auto-publish
   4. Take a screenshot of the import dialog
   5. Click **"Cancel"** — do NOT import yet

   **5e. Round-trip test: Export → Modify → Reimport → Verify**:
   This is the critical test — verifying that data can be exported, modified externally, and reimported with changes applied.

   1. **Export**: Export the **"Organisatie"** schema from the **"Voorzieningen"** register as **Excel**
      - Use the three-dot menu on the Organisatie row → Export → Excel
   2. **Download and inspect**: Note the current value of a field (e.g., the "naam" or "beschrijving" of one organisation)
   3. **Modify the file**: You cannot edit files locally, but you CAN test the import with the unmodified export file to verify the round-trip pipeline works:
      - Click the register-level three-dot menu → **"Import"**
      - Select the exported Excel file
      - Ensure **"Include objects in the import"** is ON and **"Enable validation"** is ON
      - Click **"Import"**
   4. **Verify**: After import completes:
      - Check that no errors were reported
      - Navigate to the Organisatie schema and verify objects still exist with correct data
      - Check the audit trail (Dashboard → Audit Trail Actions) for import-related entries
   5. Document the entire flow with screenshots at each step

   **5f. Import with different formats**:
   If time permits, also test:
   - Import a CSV file (schema-level import via the schema three-dot menu → Import)
   - Import a JSON configuration file (register-level)
   - Verify error handling: try importing a file with invalid data (wrong column names) and verify validation catches it

6. **#410 (Dashboard schrijfwijze softwarecatalogus)**: Previously CANNOT_TEST because Peter's admin account doesn't see the supplier/gemeente dashboard. **Workaround**: Log in as Jan Pietersen (`jan.pietersen@test.nl` / `WelcomeToTest2026`) and navigate to `/beheer`. Check the dashboard welcome heading for the capitalization of "softwarecatalogus" vs "Softwarecatalogus". Use `browser_snapshot` to capture the exact text. Compare with the header, footer, and browser tab title.

7. **Facet editing (OpenRegister schemas page)**: Test renaming a facet on a schema property:
   1. Navigate to `{BACKEND}/index.php/apps/openregister/schemas#`
   2. Find and click on a schema that has faceted properties (e.g., "dienst" which has "dienstType" with a facet)
   3. In the schema detail view, find the properties list
   4. Click the **action menu** (three-dot menu) on a faceted property (e.g., "dienstType")
   5. Select **"Edit"** or click to open the property editor
   6. Find the **facet configuration** section — it should show the current facet title
   7. Change the facet title (e.g., rename it to "Test Facet Title")
   8. Save the property changes
   9. Verify the facet title updated in the schema by refreshing the page
   10. **Revert the change** — rename it back to the original title (e.g., "Diensttype") and save
   11. Take screenshots of the facet editing interface
   12. Document: Is the facet editing UI intuitive? Does saving work without errors? Does the change persist after refresh?

## Instructions

When running tests for this persona:
1. Navigate to `{FRONTEND}/login`
2. Log in with `{PERSONA_USERNAME}` / `{PERSONA_PASSWORD}`
3. Also test the Nextcloud backend at `{BACKEND}/` (login `{ADMIN_USER}`/`{ADMIN_PASS}`)
4. **For each issue**: Read the acceptance criteria in `issues.md`, then test each criterion
5. Focus on admin-specific functionality other personas can't access
6. Test organization lifecycle: concept → active → inactive → reactivated
7. Test user lifecycle: create → assign role → deactivate → reactivate
8. Test content management and system configuration
9. For issues previously PARTIAL, verify the remaining parts now with auth
10. Write results to `test-results/functioneel-beheerder/results-authenticated.md`
11. For each issue, list which acceptance criteria passed and which failed

## Rules

- **READ ONLY on GitHub issues** — never update, close, or comment on issues
- Write test results ONLY to local files in the `test-results/` directory
- Take screenshots for evidence where applicable
