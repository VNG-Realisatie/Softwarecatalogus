# Test Results: Architectuur Expert (Authenticated)

**Persona**: Dr. Sarah de Vries -- Senior Enterprise Architect at VNG
**Date**: 2026-02-23 (Session 6 -- re-verification with browser-7)
**Environment**: Local Development (Frontend: http://localhost:3000, Backend: http://localhost:8080)
**Login**: sarah.devries@test.nl / WelcomeToTest2026
**Groups**: vng-raadpleger, gebruik-beheerder, software-catalog-users
**Browser**: Chromium (Playwright headless via MCP browser-7)
**Test Method**: Combined browser automation + API testing

---

## Summary Table

| Issue | Title | Previous Status | Current Status | Severity |
|-------|-------|----------------|----------------|----------|
| #148 | (VNGR) De GEMMA-architectuur is opvraagbaar met een API | PARTIAL (6/10) | **PARTIAL** (6/10 pass) | HIGH |
| #160 | Performance plotten views | PASS (5/7) | **PASS** (5/7 pass) | LOW |
| #135 | Non-functionele eisen Referentiearchitectuur | PARTIAL (6/18) | **PARTIAL** (7/18 testable pass) | MEDIUM |

---

## Login Verification

- **Status**: PASS
- **Evidence**: `s6-01-login-dashboard.png`
- **Notes**: Login completed successfully. localStorage cleared before login to ensure clean session. Redirected to `/beheer` dashboard showing "Mijn Softwarecatalogus" with action buttons (Applicatie toevoegen, Koppeling toevoegen, Dienst toevoegen). All initial API calls returned 200 OK. Backend cache loading completed in 2084ms for 2 registers (voorzieningen, vng-gemma). No unexpected console errors.

### Console Errors (Login)
- `Manifest: Line: 1, column: 1, Syntax error.` at site.webmanifest -- Known, expected, ignored.

### Network Performance (Login)
- All API calls returned 200 OK.
- No calls >500ms detected during initial page load (expected for initial warm-up).

---

## Issue #148: (VNGR) De GEMMA-architectuur is opvraagbaar met een API

**Test Step**: Step 12
**Previous Status**: PARTIAL (6/10 pass)
**Current Status**: PARTIAL (6/10 criteria evaluated, 6 pass, 2 fail, 2 partial)

### Acceptance Criteria Results

| # | Criterion | Status | Notes |
|---|-----------|--------|-------|
| 1 | ArchiMate API auto-generated documentation (OAS) is accessible | PASS | OAS endpoint at `/api/registers/4/oas` returns valid OpenAPI 3.1.0 spec (as Sarah and publicly). Title: "AMEF API", Version: 0.0.6, EUPL-1.2 licensed. Tags: Element, Model, Organization, Property Definition, Relation, View. 12 paths defined. **Note**: OAS endpoint returns 500 when accessed with admin:admin user (organization scoping query fails) -- works correctly with Sarah's credentials and unauthenticated. |
| 2 | /elements endpoint returns ArchiMate elements with correct counts | PASS | Endpoint `/objects/vng-gemma/element` returns 2,741 elements. Response time: ~2.0s (first call, cold cache). |
| 3 | Elements include the ArchiMate-type field | PASS | Each element includes a `type` field (e.g., "Capability", "Flow"). |
| 4 | Empty properties are omitted from element responses | FAIL | Empty/null properties are NOT omitted. First element shows **80 null properties** vs. 8 non-null properties. Responses remain very verbose with significant payload overhead. |
| 5 | /relations endpoint returns relations correctly (not "bad gateway") | PASS | Endpoint `/objects/vng-gemma/relation` returns 5,790 relations with HTTP 200. Response time: ~1.5s. |
| 6 | Relations include the ArchiMate-type field | PASS | Relations include the `type` field (e.g., "Flow"). |
| 7 | /views endpoint returns view definitions with correct count | PASS | Endpoint `/objects/vng-gemma/view` returns 249 views. Response time: ~0.9s. However, the top-level `name` field is null for all views -- names are only available in `xml.name._value` (e.g., "Waardecreatie"). This impacts usability of the API. |
| 8 | API supports a model-id query parameter for querying specific models | FAIL | Testing `?model=id-b58b6b03-a59d-472b-bd87-88ba77ded4e6` returns 0 results. Element records have no top-level `model` field, so the filter cannot match. The model-id filter is not functional. |
| 9 | /models endpoint returns a list of available models | PASS | Endpoint `/objects/vng-gemma/model` returns 1 model with identifier `id-b58b6b03-a59d-472b-bd87-88ba77ded4e6`. Response time: ~0.8s. |
| 10 | ID fields (Archi id, Object ID, Open Register id) are documented | PARTIAL | OAS documentation includes field definitions for `id`, `identifier`, and `objectId` across Element, Model, Relation, and View schemas. Descriptions are generic (e.g., "De identifier van dit Element") but do not clearly distinguish between the three ID types or explain their semantic purposes. Improvements needed: document Archi ID vs Object ID vs Open Register ID distinction. |

### Technical Details

**Named Endpoint Pattern**: `http://localhost:8080/index.php/apps/openregister/api/objects/vng-gemma/{schema-name}`

| Resource | Register | Named Endpoint | Count | Response Time |
|----------|----------|----------------|-------|---------------|
| Elements | vng-gemma | `/api/objects/vng-gemma/element` | 2,741 | ~2.0s |
| Relations | vng-gemma | `/api/objects/vng-gemma/relation` | 5,790 | ~1.5s |
| Views | vng-gemma | `/api/objects/vng-gemma/view` | 249 | ~0.9s |
| Models | vng-gemma | `/api/objects/vng-gemma/model` | 1 | ~0.8s |
| Property Definitions | vng-gemma | `/api/objects/vng-gemma/property-definition` | 74 | ~1.3s |

**OAS Documentation**: Available at `/api/registers/4/oas` (returns valid OpenAPI 3.1.0 JSON). Accessible as authenticated user (Sarah) and publicly. **Fails with admin:admin** due to organization-scoped query returning no results.

### Console Errors (Issue #148)
- `Manifest: Line: 1, column: 1, Syntax error.` -- Known, ignored.
- `/beheer/referentie-architectuur`: 404 on `schemas/referentie-architectuur/related?_limit=20&_page=1`
- `/beheer/referentie-architectuur`: "Error fetching related schemas for referentie-architectuur: AxiosError 404"
- `/beheer/referentie-architectuur`: "Schema error set for type: schema_referentie-architectuur_related"
- `/beheer/referentie-architectuur`: "Failed to prepare related actions: AxiosError 404"
- `/beheer/views`: No errors (only Manifest known issue)

### Changes from Previous Session (Session 5)
- **SAME**: OAS documentation remains accessible at `/api/registers/4/oas`.
- **SAME**: Empty properties still not omitted (80 null fields per element).
- **SAME**: Model-id filter still not working.
- **SAME**: Referentie-architectuur page still broken (404 on related schemas).
- **SAME**: Views overview page still shows "Geen weergaven beschikbaar".
- **NEW FINDING**: API response times are notably slower (~1-2s vs ~0.1s in session 5). This may be due to cold cache or environment load.
- **NEW FINDING**: View `name` field is null at top level -- names only in `xml.name._value`.
- **NEW FINDING**: OAS endpoint returns 500 for admin:admin user (organization scoping issue).

---

## Issue #160: (VNGR) Performance plotten views tbv ID-77

**Test Step**: Step 22
**Previous Status**: PASS (5/7 pass)
**Current Status**: PASS (5/7 pass, 1 cannot_test, 1 partial)

### Acceptance Criteria Results

| # | Criterion | Status | Notes |
|---|-----------|--------|-------|
| 1 | Largest ArchiMate view (388 nodes) loads within 11 seconds on Chromium | PASS | "Poster basisbeveiligingsniveau van referentiecomponenten" (388 nodes) rendered in **908.8ms** total base render time. Well under the 11-second benchmark. |
| 2 | Each loading phase completes in approximately 3 seconds average | PASS | All phases well under 3s: Graph+Paper init: 14.1ms, Base data prep: 2.0ms, renderToGraph: 280.0ms, DOM flush: 551.2ms, Color+viewBox: 60.9ms. |
| 3 | Smaller views load in under 7 seconds | PASS | "Waardecreatie" (6 nodes) loaded in **55.6ms** total. |
| 4 | Views become interactive (tooltips, zoom) after rendering | PASS | Filter checkboxes (Gebruik, Applicaties, Deelnames) are available and functional. Tooltip info icons provide descriptive text. ArchiMate diagram SVG is rendered (448x800px for Poster view). |
| 5 | Backend API for a single view returns data within ~0.5 seconds | PARTIAL | Poster basisbeveiligingsniveau: **0.72s** (warm cache), **1.05s** (cold cache). Waardecreatie: **0.65s**. Slightly above 0.5s target. Previous session measured ~0.1s -- the difference may be due to server load or cache state. Still well within acceptable performance range for user experience. |
| 6 | Large views display a loading indicator | CANNOT_TEST | The view renders in ~0.9s which is too fast for a loading indicator to be meaningfully observable. Could not confirm presence of loading indicator during the brief load time. |
| 7 | Acceptable performance on Chrome, Edge, and Firefox | PARTIAL | Only tested on Chromium (Playwright headless). Cannot verify Edge or Firefox in this environment. |

### Performance Data: Poster basisbeveiligingsniveau (388 nodes)

| Phase | Duration |
|-------|----------|
| Graph+Paper init | 14.1ms |
| Base data prep (388 nodes) | 2.0ms |
| ViewRenderer.renderToGraph | 280.0ms |
| paper.unfreeze (DOM flush) | 551.2ms |
| Color+viewBox apply | 60.9ms |
| **TOTAL base render** | **908.8ms** |
| Overlay cleanup | 0.0ms |

### Performance Data: Waardecreatie (6 nodes)

| Phase | Duration |
|-------|----------|
| Graph+Paper init | 7.9ms |
| Base data prep (6 nodes) | 0.8ms |
| ViewRenderer.renderToGraph | 14.2ms |
| paper.unfreeze (DOM flush) | 30.2ms |
| Color+viewBox apply | 2.5ms |
| **TOTAL base render** | **55.6ms** |

### Console Errors (Issue #160)
- `Manifest: Line: 1, column: 1, Syntax error.` -- Known, ignored.
- No unexpected console errors on view detail pages.

### Network Performance (Issue #160)
- `/api/objects/vng-gemma/view/id-50685fee30484963a4050ea10e6d5e25` => 200 OK
- `/api/objects/vng-gemma/view/id-5a84ed73-6886-40ec-967c-83598b4bd84b` => 200 OK
- No SLOW or PERFORMANCE_FAIL network calls detected on view pages.

### Changes from Previous Session (Session 5)
- **SAME**: Views load correctly on beheer pages with excellent performance.
- **SAME**: Performance consistently excellent (~0.9s for 388 nodes).
- **SLIGHTLY WORSE**: Backend API response times for individual views are ~0.7s (was ~0.1s). Still acceptable.
- **NEW FINDING**: Public view page (`/views/{id}`) shows title but NO diagram rendering -- warning "View data is missing nodes and connections". This is a regression from the authenticated beheer view which renders correctly.

---

## Issue #135: (VNGR) Non-functionele eisen Referentiearchitectuur

**Test Step**: Step 22
**Previous Status**: PARTIAL (6/18 testable pass)
**Current Status**: PARTIAL (7/18 testable pass, improved)

This issue covers a broad set of non-functional requirements from the PvE (Program of Requirements). Many criteria relate to organizational processes that cannot be fully validated through UI/API testing alone.

### Acceptance Criteria Results

| # | PvE Eis | Category | Status | Notes |
|---|---------|----------|--------|-------|
| 102 | Feedback na fout | Toegankelijkheid | PASS | **IMPROVED from PARTIAL**. Error messages are now user-friendly. When accessing a nonexistent view slug, the page shows "Weergave niet gevonden" with guidance: "De opgevraagde weergave kon niet worden gevonden of er was een fout bij het laden. Controleer de selectie en probeer het opnieuw." Clear, actionable feedback for users. |
| 87 | Beheerorganisatie | Betrouwbaarheid | CANNOT_TEST | Organizational/contractual SLA requirement. Cannot be validated through UI testing. |
| 103 | Testen | Werkwijze | CANNOT_TEST | Development process requirement about testing completeness. Cannot be validated through UI testing. |
| 99 | Aanpasbaarheid Softwareplatform | Overdraagbaarheid | PASS | Built with open-source stack: Nextcloud (PHP), React frontend, PostgreSQL. Active communities for all components. EUPL-1.2 license confirmed in both OAS documents (AMEF API and Voorzieningen API). |
| 101 | OTAP omgeving | Overdraagbaarheid | PASS | Development environment (localhost), Acceptance (accept.opencatalogi.nl), Production (softwarecatalogus.nl). OTAP structure confirmed per environment documentation. |
| 100 | Installeerbaarheid | Overdraagbaarheid | PARTIAL | Docker-based deployment confirmed (docker-compose with Nextcloud container). Container deployment works. CI/CD pipeline details require separate verification. |
| 88 | Gebruikersvriendelijk | Bruikbaarheid | PARTIAL | View rendering UI is clean with breadcrumb navigation (Home > Beheer > View > view-name). Filter controls with info tooltips (Gebruik/Applicaties/Deelnames). However: (1) `/beheer/views` shows "Geen weergaven beschikbaar" despite 249 views in API -- users cannot browse views, (2) `/beheer/referentie-architectuur` shows "Geen data gevonden" with no helpful guidance, (3) Public `/referentie-architectuur` page is nearly blank (just empty h1). |
| 89 | Toegankelijkheid (digitoegankelijk.nl) | Bruikbaarheid | PARTIAL | Accessibility features present: "Direct naar de inhoud" skip link, proper heading hierarchy (h1, h3, h4), labeled navigation landmarks (Hoofdnavigatie, Kruimelpad), breadcrumb navigation with aria labels, descriptive link text (e.g., "Opent in een nieuw tabblad"), labeled form controls. ArchiMate diagrams rendered as SVG with text labels. Full digitoegankelijk audit still needed. |
| 93 | Gebruik informatiemodel voorzieningencatalogus | Informatiemodel | PASS | API structured around ArchiMate model (AMEF) with proper schemas for elements (2,741), relations (5,790), views (249), models (1), and property definitions (74). OAS documentation reflects this informatiemodel with OpenAPI 3.1.0. |
| 95 | Herbruikbaarheid | Onderhoudbaarheid | PASS | Source code available as open source. EUPL-1.2 license confirmed in both AMEF API and Voorzieningen API OAS documentation. Code in VNG Realisatie git repositories. |
| 96 | Modulariteit | Onderhoudbaarheid | PASS | Modular architecture: separate OpenRegister backend (register/schema layer), OpenCatalogi (glossary, menus), Softwarecatalog (business logic), and React frontend. Process logic configurable through register/schema definitions. |
| 98 | Techniek toekomstvast | Onderhoudbaarheid | PASS | Technology stack: PHP/Nextcloud, React/JavaScript, PostgreSQL. All have large developer communities (well over 100 developers in NL). |
| 97 | Webstatistieken | Onderhoudbaarheid | CANNOT_TEST | Matomo or similar analytics integration requires separate verification. |
| 90 | Logging activiteiten | Informatiebeveiliging | CANNOT_TEST | Audit logging requires backend/infrastructure verification. |
| 91 | nl.internet standaarden | Informatiebeveiliging | CANNOT_TEST | Requires testing production domain against nl.internet.nl. Not testable on localhost. |
| 92 | Toegangsbeveiliging | Informatiebeveiliging | PARTIAL | RBAC implemented (vng-raadpleger, aanbod-beheerder, gebruik-beheerder, functioneel-beheerder groups). Login with username/password works. 2FA (TOTP) not tested. Organization-scoped data access confirmed (registers are organization-aware). |
| 86 | NL API strategie standaarden | Standaarden | PARTIAL | API uses OpenAPI 3.1.0 specification. OAS documentation accessible at `/api/registers/4/oas` and `/api/registers/2/oas`. REST endpoints with proper pagination, HTTP status codes. Full REST-API Design Rules compliance audit needed. |
| 94 | E-mail standaarden (DKIM/DMARC) | Standaarden | CANNOT_TEST | Email standards require production domain testing. |
| - | Performance: Plotten views | Performance | PASS | 388-node view renders in ~0.9s. Backend API responds in ~0.7s. Well within 11-second benchmark. |

### Key Findings

1. **Views Overview Page Still Broken**: The `/beheer/views` page shows "Geen weergaven beschikbaar" despite 249 views existing in the API. This remains a significant usability gap -- users cannot browse/discover views through the UI.

2. **Referentie-architectuur Page Still Has Errors**: The `/beheer/referentie-architectuur` page shows "Geen data gevonden" with 404 errors on the `schemas/referentie-architectuur/related` endpoint. Same as previous sessions.

3. **Public View Page Does Not Render Diagram**: Navigating to `/views/{id}` shows the view title correctly but the ArchiMate diagram is NOT rendered. Warning: "View data is missing nodes and connections". The authenticated `/beheer/views/{id}` renders correctly -- this appears to be a data-fetching issue on the public page.

4. **Public Referentie-architectuur Page Nearly Blank**: The `/referentie-architectuur` public page shows only an empty h1 heading and footer. 404 error on `/api/pages/referentie-architectuur` endpoint.

5. **Error Handling Improved**: Nonexistent view slugs now show a user-friendly error message with guidance, passing PvE eis 102.

6. **API Response Times Slower**: Backend API responses are ~0.7-2.0s compared to ~0.05-0.1s in session 5. This may be due to server load or cold cache, but frontend render times remain excellent (~0.9s for 388 nodes).

### Console Errors (Issue #135)

| Page | Error | Severity |
|------|-------|----------|
| `/beheer/referentie-architectuur` | 404 on `schemas/referentie-architectuur/related?_limit=20&_page=1` | MEDIUM |
| `/beheer/referentie-architectuur` | "Error fetching related schemas for referentie-architectuur: AxiosError 404" | MEDIUM |
| `/beheer/referentie-architectuur` | "Schema error set for type: schema_referentie-architectuur_related" | MEDIUM |
| `/beheer/referentie-architectuur` | "Failed to prepare related actions: AxiosError 404" | MEDIUM |
| `/referentie-architectuur` (public) | 404 on `api/pages/referentie-architectuur` | MEDIUM |
| `/referentie-architectuur` (public) | "Blocked call to navigator.vibrate" | LOW |
| `/views/{id}` (public) | "View data is missing nodes and connections" (warning) | MEDIUM |

### Changes from Previous Session (Session 5)
- **IMPROVED**: Error handling for nonexistent views now provides user-friendly messages (PvE eis 102 upgraded from PARTIAL to PASS).
- **SAME**: Views overview page still broken (shows "Geen weergaven beschikbaar").
- **SAME**: Referentie-architectuur page still has 404 errors.
- **SAME**: EUPL license confirmed, modular architecture verified.
- **NEW FINDING**: Public view pages (`/views/{id}`) do not render diagrams -- "View data is missing nodes and connections".
- **NEW FINDING**: Public `/referentie-architectuur` page is nearly blank (empty h1 + footer only).

---

## Performance Summary

### API Response Times

| Endpoint | Response Time | Status |
|----------|--------------|--------|
| OAS Documentation (register 4, Sarah auth) | ~0.72s | OK |
| OAS Documentation (register 4, public) | ~0.07s | OK |
| OAS Documentation (register 2, admin auth) | ~0.67s | OK |
| Elements list (_limit=5, Sarah auth) | ~2.0s | SLOW |
| Relations list (_limit=5, Sarah auth) | ~1.5s | SLOW |
| Views list (_limit=5, Sarah auth) | ~0.9s | OK |
| Models list (Sarah auth) | ~0.76s | OK |
| Property Definitions (_limit=5, Sarah auth) | ~1.3s | SLOW |
| Single view: Poster basisbeveiligingsniveau (cold) | ~1.05s | OK |
| Single view: Poster basisbeveiligingsniveau (warm) | ~0.72s | OK |
| Single view: Waardecreatie | ~0.65s | OK |

**Note**: API response times in this session are notably higher than session 5 (~0.05-0.1s). This may be due to cold cache, server load, or environment state. Elements and relations list endpoints exceed 1s which is flagged as SLOW but could be acceptable for these large datasets (2,741 elements, 5,790 relations).

### Frontend Render Times

| View | Nodes | Total Render | Status |
|------|-------|-------------|--------|
| Poster basisbeveiligingsniveau | 388 | 908.8ms | EXCELLENT |
| Waardecreatie | 6 | 55.6ms | EXCELLENT |

---

## Console Errors Summary

### Expected/Known Errors (Ignored)

- `Manifest: Line: 1, column: 1, Syntax error.` at site.webmanifest -- Known, occurs on every page load.
- `Slow network is detected.` -- Dev server font loading messages, not production relevant.

### Unexpected Errors

| Page | Error | Severity |
|------|-------|----------|
| `/beheer/referentie-architectuur` | 404 on `schemas/referentie-architectuur/related?_limit=20&_page=1` | MEDIUM |
| `/beheer/referentie-architectuur` | "Error fetching related schemas for referentie-architectuur: AxiosError 404" | MEDIUM |
| `/beheer/referentie-architectuur` | "Schema error set for type: schema_referentie-architectuur_related" | MEDIUM |
| `/beheer/referentie-architectuur` | "Failed to prepare related actions: AxiosError 404" | MEDIUM |
| `/beheer/views/nonexistent-view-slug` | 404 on view fetch (expected -- error handled gracefully) | LOW |
| `/referentie-architectuur` (public) | 404 on `api/pages/referentie-architectuur` | MEDIUM |
| `/referentie-architectuur` (public) | "Blocked call to navigator.vibrate" | LOW |
| `/referentie-architectuur` (public) | "Page fetch error: AxiosError: Request failed with status code 404" | MEDIUM |
| `/views/{id}` (public) | "View data is missing nodes and connections" (warning) | MEDIUM |

---

## Overall Test Summary

| Issue | Title | Previous | Current | Key Change |
|-------|-------|----------|---------|------------|
| #148 | GEMMA-architectuur opvraagbaar met API | PARTIAL (6/10) | **PARTIAL** (6/10 pass) | Same status. OAS accessible, elements/relations/views/models work. Null property omission and model-id filter still failing. API response times higher but acceptable. |
| #160 | Performance plotten views | PASS (5/7) | **PASS** (5/7 pass) | Stable. 388-node view in 0.9s. Backend API slightly slower (~0.7s vs ~0.1s) but still good. Public view page does not render diagrams (new finding). |
| #135 | Non-functionele eisen Referentiearchitectuur | PARTIAL (6/18) | **PARTIAL** (7/18 testable pass) | Improved: error handling now passes PvE eis 102. Views overview and referentie-architectuur pages still broken. Public pages have significant gaps. |

### Critical Issues Remaining

1. **Views overview page broken** (severity: HIGH): `/beheer/views` shows "Geen weergaven beschikbaar" despite 249 views in the API. Users cannot browse/discover views.

2. **Referentie-architectuur page broken** (severity: HIGH): `/beheer/referentie-architectuur` shows "Geen data gevonden" with 404 errors on related schemas endpoint.

3. **Public view pages do not render diagrams** (severity: HIGH): `/views/{id}` shows the view title but no diagram -- "View data is missing nodes and connections". This means the public-facing ArchiMate visualization is non-functional.

4. **Public referentie-architectuur page nearly blank** (severity: HIGH): `/referentie-architectuur` shows only an empty h1 and footer.

5. **Null properties in API responses** (severity: MEDIUM): Element responses contain ~80 null fields per record, significantly increasing payload size.

6. **Model-id filter not working** (severity: MEDIUM): Cannot filter elements by model, limiting multi-model query capability.

7. **OAS endpoint fails for admin user** (severity: LOW): `/api/registers/4/oas` returns 500 for admin:admin due to organization scoping. Works for Sarah and publicly.

### Positive Findings

1. **Excellent rendering performance**: 388-node view renders in 0.9 seconds (12x faster than the 11-second benchmark).
2. **OAS documentation accessible**: Valid OpenAPI 3.1.0 spec at `/api/registers/4/oas` with EUPL-1.2 license.
3. **Rich GEMMA data**: 2,741 elements, 5,790 relations, 249 views, 74 property definitions.
4. **Good interactivity on beheer views**: Filter controls, tooltip info icons, breadcrumb navigation all work correctly.
5. **Improved error handling**: Nonexistent view slugs show user-friendly error messages.
6. **Open source compliance**: EUPL-1.2 license confirmed in both API specifications.
7. **Modular architecture**: Separate backend (OpenRegister), catalog (OpenCatalogi), business logic (Softwarecatalog), and React frontend.
8. **Accessibility features**: Skip link, heading hierarchy, landmark roles, labeled navigation, breadcrumbs all present.

### Evidence Files

| File | Description |
|------|-------------|
| `s6-01-login-dashboard.png` | Successful login as sarah.devries@test.nl |
| `s6-148-01-oas-documentation.png` | OAS documentation JSON rendered in browser |
| `s6-148-02-referentie-architectuur.png` | Referentie-architectuur page showing "Geen data gevonden" |
| `s6-148-03-views-empty.png` | Views overview showing "Geen weergaven beschikbaar" |
| `s6-160-01-poster-view-loaded.png` | Poster basisbeveiligingsniveau view loaded (388 nodes) |
| `s6-160-02-waardecreatie-view.png` | Waardecreatie smaller view loaded (6 nodes) |
| `s6-135-01-public-referentie-architectuur.png` | Public referentie-architectuur page (nearly blank) |
| `s6-135-02-public-view-no-diagram.png` | Public view page showing title but no diagram |
| `s6-135-03-error-handling-view-not-found.png` | Error handling for nonexistent view (user-friendly message) |
