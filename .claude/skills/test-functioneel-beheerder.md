# Test Agent: Functioneel Beheerder (Functional Manager)

## Persona

**Peter van Dijk** — Functional Manager at VNG, 6 years GEMMA experience, 10 years municipal ICT.

## Role: Functioneel beheerder (Full Admin)

Peter has full system access. He activates organizations, manages users, maintains the GEMMA model, monitors data quality, and configures the system.

## Login Credentials

- **Username**: `peter.vandijk@test.nl`
- **Password**: `WelcomeToTest2026`
- **Groups**: functioneel-beheerder, gebruik-beheerder, aanbod-beheerder, software-catalog-admins, software-catalog-users

## Test Environment

- **Frontend**: http://localhost:3000/
- **Backend**: http://localhost:8080/
- **Browser**: Use Playwright MCP browser tools (prefixed `mcp__browser-N__`, where N is assigned by the orchestrator)
- **Login URL**: http://localhost:3000/login
- **Backend Admin**: http://localhost:8080/ (Nextcloud admin: admin/admin)

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
| #403 | Tekst verwijderen aanpassen | CANNOT_TEST |
| #406 | SiteImprove verwijderen | PARTIAL |
| #409 | Footer anders: inlog of uitgelogd | PARTIAL |
| #410 | Dashboard schrijfwijze softwarecatalogus | CANNOT_TEST |
| #92 | Webstatistiekenpakket (Piwik Pro) | PARTIAL |
| #169 | Rest issues Organisatie en Configuratie | PARTIAL |

### New issues (not previously tested):
| Issue | Title | Test Step |
|-------|-------|-----------|
| #85 | (VNGR) Publieke API toegang tot aanbodinformatie | Step 12 |
| #141 | Organisaties samenvoegen na herindeling/overname | Step 21 |
| #148 | (VNGR) GEMMA-architectuur opvraagbaar met API | Step 12 |
| #225 | Testresultaten 29-10-2025 | General |
| #278 | Filterteksten aanpassen | Step 14 |
| #393 | Backend: fouten in voorzieningenregister | Step 19 |
| #396 | Verouderde NextCloud versie | Infra |
| N/A | Themes management (exploratory) | Step 21 |
| N/A | Schema export (OpenRegister registers) | Step 24 |
| N/A | Facet editing (OpenRegister schemas) | Step 21 |

## Acceptance Criteria Reference

**IMPORTANT**: Before testing each issue, read its detailed acceptance criteria in `issues.md` (in the repository root). Each issue has specific, testable acceptance criteria with checkboxes. Use these criteria to determine PASS/FAIL/PARTIAL status:
- **PASS** = ALL acceptance criteria are met
- **PARTIAL** = Some criteria met, some not
- **FAIL** = Key criteria not met or feature is broken
- **CANNOT_TEST** = Feature not accessible or environment issue prevents testing

## Testing Hints for Specific Issues

1. **#155 (glossary management)**: Navigate to the Nextcloud backend at `http://localhost:8080/index.php/apps/opencatalogi/#/glossary` (Catalogi → Instellingen → Glossary). Test:
   - Click **"Add Glossary"** to open the term modal
   - Leave the **External Link** field empty and fill in term, summary, description — save should succeed without validation error
   - In the **Keywords** field, type a keyword and press Enter — it should appear as a text tag (not a UUID)
   - Add multiple keywords and verify they all display as readable text
   - Save the term, then click to edit it — verify keywords load back as readable text tags
   - If an existing term has keywords, click edit and verify they show as text, not UUIDs
   - Take screenshots of: empty external link saving, keywords as text tags, editing existing term

2. **#403 (delete dialog text)**: Navigate to any beheer table (e.g., `/beheer/applicaties`), find a test object ("Test Applicatie Leverancier"), click the delete action. Verify:
   - The dialog shows the correct object type ("applicatie", "dienst", or "koppeling")
   - The dialog shows the object name
   - The dialog checks if the object is in use by municipalities
   - Click **Cancel** to abort — do NOT actually delete.

2. **#141 (merge organizations)**: Test via the **Nextcloud backend admin UI**:
   1. Navigate to `http://localhost:8080/index.php/apps/openregister`
   2. Click **"Search / Views"** in the left sidebar
   3. In the filter area, select register: **"voorzieningen"** and schema: **"organisatie"**
   4. Find a source organization (e.g., "Test Leverancier 2") in the results
   5. Click the **three-dot menu** (⋮) on the right of the row → click **"Merge"**
   6. A merge dialog should open — select the **target organization** (e.g., "Test Leverancier BV")
   7. Walk through the merge dialog steps:
      - **Property selection**: For each field, choose whether to keep source or target value
      - **Relations/references**: Choose how to handle linked objects
   8. **Do NOT click the final "Merge" button** — click **Cancel** to abort
   9. Take screenshots of each dialog step
   10. Document whether the merge dialog loads without timeout errors (previous run had 30000ms timeout)

3. **CMS pages (#397, #332)**: Manage CMS content at **http://localhost:8080/index.php/apps/opencatalogi/pages#** (NOT `/#/pages`). This is the OpenCatalogi backend Pages management view. Test:
   - Navigate to the pages URL
   - Verify existing pages are listed (privacy, terms, FAQ, disclaimer, etc.)
   - Create a new test page: click "Add", set title "Test Page", add content, save
   - Edit an existing page: click on it, modify text, save
   - Verify saved changes appear on the public frontend (e.g., `/test-page`)
   - Delete the test page afterward to clean up

4. **Themes**: Manage themes at **http://localhost:8080/index.php/apps/opencatalogi/themes#**. Test:
   - Navigate to the themes URL
   - Verify the themes management page loads correctly
   - Document what themes are available and which is active
   - If possible: create a new theme, modify colors/branding, save, and verify the change is reflected on the frontend
   - Check if the "Open Tilburg" footer branding can be changed via theme settings
   - Take screenshots of the themes management interface

4. **#15 (export)**: In any beheer table, click **"Acties"** dropdown → **"Exporteren"** → **"Als CSV"** or **"Als Excel"**. Verify the download works and data is scoped to your org.

5. **Schema export (OpenRegister registers page)**: Test exporting a schema from the backend:
   1. Navigate to `http://localhost:8080/index.php/apps/openregister/registers#`
   2. Click on the **"voorzieningen"** register to open it
   3. Find a schema in the register (e.g., "applicatie", "dienst", or "organisatie")
   4. Click on the schema to open its detail view
   5. Click the **action menu** (three-dot menu or "Acties" button)
   6. Select **"Export"** (or similar export option)
   7. Walk through the export flow — verify it offers JSON export
   8. Verify the exported file contains the full schema definition (properties, required fields, etc.)
   9. Take screenshots of each step of the export flow
   10. Document: Does the export include all properties? Are `$ref` references preserved? Is the format valid JSON Schema?

6. **Facet editing (OpenRegister schemas page)**: Test renaming a facet on a schema property:
   1. Navigate to `http://localhost:8080/index.php/apps/openregister/schemas#`
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
1. Navigate to http://localhost:3000/login
2. Log in with `peter.vandijk@test.nl` / `WelcomeToTest2026`
3. Also test the Nextcloud backend at http://localhost:8080/ (login admin/admin)
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
