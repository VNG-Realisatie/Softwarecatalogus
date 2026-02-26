# Test Results: Architectuur Expert (Dr. Sarah de Vries) -- Re-test

**Test Date:** 2026-02-26 (re-test of 2026-02-25 results)
**Persona:** Dr. Sarah de Vries (sarah.devries@test.nl)
**Role:** VNG-raadpleger + Architecture Focus
**Organisation:** Default Organisation
**Environment:** Frontend http://localhost:3000 / Backend http://localhost:8080
**Browser:** Chromium (Playwright headless, 1440x900)

---

## Summary

| Issue | Title | Previous Status | Current Status | Change |
|-------|-------|-----------------|----------------|--------|
| #148 | (VNGR) GEMMA-architectuur opvraagbaar met API | PARTIAL | **PARTIAL** | OAS now works for all users; views render in /beheer/view/; still no "GEMMA downloaden" button; model-id filter still ignored |
| #160 | Performance plotten views tbv ID-77 | PARTIAL | **PARTIAL** | Views now render in frontend (major improvement); poster view loads in ~14.7s (above 11s target); smaller views have rendering issues |
| #135 | Non-functionele eisen Referentiearchitectuur | PARTIAL | **PARTIAL** | View rendering now works; cold-cache 504 timeouts persist; no loading indicators |

---

## Issue #148: (VNGR) De GEMMA-architectuur is opvraagbaar met een API

**Status: PARTIAL**
**Test Step:** Step 12

### Acceptance Criteria Results

| # | Criterion | Status | Evidence |
|---|-----------|--------|----------|
| 1 | OAS documentation accessible at `/api/registers/4/oas` | **PASS** | Returns valid OpenAPI 3.1.0 JSON (~85KB). Tags: Element, Model, Organization, Property Definition, Relation, View. Works for both admin AND sarah.devries@test.nl (previously noted as returning 500 due to organisation filter bug -- now confirmed fixed). |
| 2 | `/elements` endpoint returns ArchiMate elements with correct counts | **PASS** | Returns 2,741 elements via `/api/objects/vng-gemma/element`. Response time <1s (warm cache). |
| 3 | Elements include the ArchiMate-type field | **PASS** | Elements have a `type` field (e.g., "Capability"). This is the ArchiMate type. Confirmed on element `id-9309d3a988c244f39a8f72d9f4e91f50` with type "Capability". |
| 4 | Empty properties omitted from element responses | **FAIL** | Null fields are NOT omitted. A typical element returns dozens of null fields: `gemmaType: null`, `gemmaThema: null`, `afkorting: null`, `alternateName: null`, `architectuurlaag: null`, etc. The `name` field at the top level is consistently `null` (actual name only in `xml.name._value` or `@self.name`). This causes significant payload bloat. |
| 5 | `/relations` endpoint returns relations correctly (not "bad gateway") | **PASS (with caveat)** | Returns 5,790 relations with correct data. On first cold-cache request: returned HTTP 500 after 34.9s. On subsequent (warmed) request: HTTP 200 in 0.75s. Relations include `type` ("Flow"), `source`, `target`, `identifier`. |
| 6 | Relations include the ArchiMate-type field | **PASS** | Confirmed: `type` field present (e.g., "Flow"). |
| 7 | `/views` endpoint returns view definitions with correct count | **PASS** | Returns 249 total views. Frontend view listing at `/beheer/view` shows 20 published views with titles and descriptions. |
| 8 | API supports a model-id query parameter | **FAIL** | Parameter is explicitly ignored. Query `?model-id=test` returns `"ignoredFilters":["model-id"]` with 0 results. The filter mechanism does not support this parameter. |
| 9 | `/models` endpoint returns available models | **PASS (with caveat)** | Returns 1 model (`id-b58b6b03-a59d-472b-bd87-88ba77ded4e6`). However, `name` is null (same issue as elements). On first cold-cache request: returned HTTP 500 after 109s. Subsequent requests: 0.66s. |
| 10 | ID fields documented | **PARTIAL** | OAS documentation exists and describes schemas. However, the confusing triple-ID situation persists: `identifier` = ArchiMate ID, `objectId` = OpenRegister UUID, `@self.id` = slug. No explicit documentation explaining their differences. |
| 11 | "Gemma downloaden" button on Mijn omgeving page | **FAIL** | No "GEMMA downloaden" button found. The `/beheer/mijn-omgeving` page shows "Geen data gevonden" with a 504 error for its related endpoint. A "Download AMEF" button exists in the Acties menu on individual view detail pages, but this exports a single view -- not the complete GEMMA model. |
| 12 | Downloaded XML imports into Archi without errors | **CANNOT_TEST** | No full GEMMA model download available. |
| 13 | Imported model matches original | **CANNOT_TEST** | Depends on criterion 12. |

### API Endpoint Summary (Register 4 / vng-gemma)

| Schema | Name | Slug | Count | Cold-Cache | Warm | Status |
|--------|------|------|-------|------------|------|--------|
| 20 | Element | element | 2,741 | <1s | <1s | Working |
| 21 | View | view | 249 | Timeout | <1s | Intermittent |
| 22 | Model | model | 1 | 109s/500 | 0.66s | Intermittent |
| 23 | Property Definition | property-definition | 74 | Timeout | 0.48s | Intermittent |
| 24 | Relation | relation | 5,790 | 34.9s/500 | 0.75s | Intermittent |

### Key Improvement Since Previous Test (2026-02-25)
- OAS endpoint now works for non-admin users (sarah.devries@test.nl) -- the organisation filter bug is fixed.
- View listing page at `/beheer/view` now renders properly with card-based UI, search, and descriptions.

### Persistent Issues
- `name` field null across all endpoints (names only in `xml.name._value` or `@self.name`)
- `model-id` filter is explicitly ignored by the API
- Cold-cache timeouts on relation and model endpoints (HTTP 500)
- No "GEMMA downloaden" button for full model export

---

## Issue #160: (VNGR) Performance plotten views tbv ID-77

**Status: PARTIAL**
**Test Step:** Step 22

### Major Improvement Since Previous Test
In the previous test (2026-02-25), view rendering was "completely non-functional" -- views showed as "Geen titel" in search with broken links to `/publicatie/undefined`. The authenticated `/beheer/view/` route now renders views correctly, representing a major improvement.

### Acceptance Criteria Results

| # | Criterion | Status | Evidence |
|---|-----------|--------|----------|
| 1 | Largest view (388 nodes) loads within 11 seconds | **FAIL** | "Poster basisbeveiligingsniveau van referentiecomponenten" loaded in approximately 14.7 seconds (click to full DOM render), exceeding the 11s target by 3.7s. Measured from navigation start to full content appearance. |
| 2 | Each loading phase ~3 seconds average | **CANNOT_VERIFY** | No distinct loading phases are visible. The view shows a generic "GEMMA weergaven beheer" placeholder while loading, then renders all content at once. No phase indicators. |
| 3 | Smaller views load in under 7 seconds | **FAIL** | Smaller views (e.g., "Bedrijfsfuncties bestuur", "Bedrijfsfuncties openbare orde en veiligheid") did NOT render their diagram content on direct navigation. They showed only the generic "GEMMA weergaven beheer" heading without any view diagram. Only the poster view reliably rendered its full diagram. This is a rendering bug, not a performance issue. |
| 4 | Views become interactive after rendering | **PASS** | Once rendered, the poster view provides interactive elements: filter checkboxes (Gebruik, Applicaties, Deelnames) with tooltip descriptions, an Acties button (Download SVG, Download AMEF), breadcrumb navigation, and the view diagram displays all GEMMA referentiecomponenten with BBN levels. |
| 5 | Backend API for single view returns within ~0.5s | **PASS** | Backend API for the poster view (largest, ~1MB response) measured at 0.533 seconds. Meets the ~0.5s target. |
| 6 | Large views display loading indicator | **FAIL** | No explicit loading indicator (spinner, progress bar, or "Loading..." message) was observed. The page shows a generic "GEMMA weergaven beheer / Beheer en bekijk GEMMA weergaven" placeholder which is not clearly a loading state -- it looks like the page itself, not a loading transition. |
| 7 | Acceptable on Chrome/Edge/Firefox without ad-blockers | **CANNOT_TEST** | Only tested on Playwright Chromium headless. Not tested on Edge or Firefox. |
| 8 | Benchmark view is "Poster basisbeveiligingsniveau" (388 nodes) | **PASS** | Present in system at `/beheer/view/id-50685fee30484963a4050ea10e6d5e25`. Renders with full BBN poster content including: Besturende bedrijfsfuncties, Primaire bedrijfsfuncties, Generieke applicatieservices, Klant- en keteninteractie, Infrastructurele applicatieservices, Privacy en informatiebeveiliging, and legend. |
| 9 | Warning/loading indicator for large views | **FAIL** | No warning or loading indicator shown. The initial "GEMMA weergaven beheer" placeholder is not a loading indicator -- it is the generic page header for the view management section. |

### Performance Measurements

| Metric | Value | Target | Status |
|--------|-------|--------|--------|
| Poster view total load (client, first render) | ~14.7s | <11s | **FAIL** |
| Backend API single view (poster, ~1MB) | 0.533s | ~0.5s | **PASS** |
| View listing page load (with 20 view cards) | <3s | N/A | OK |
| View listing API calls | All <1s | N/A | OK |

### View Rendering Bug
Smaller views fail to render their diagram content when navigated to directly. Tested views that did NOT render:
- `/beheer/view/id-b6b39994-05ca-4a34-be74-26e363243305` (Bedrijfsfuncties openbare orde en veiligheid)
- `/beheer/view/id-f8e6b28c-c959-452f-9d24-c772f008c205` (Bedrijfsfuncties bestuur)

Both showed only "GEMMA weergaven beheer / Beheer en bekijk GEMMA weergaven" with no diagram. The poster view (`id-50685fee30484963a4050ea10e6d5e25`) rendered correctly with full diagram content.

### Network Performance (View Pages)
All API calls on the `/beheer/view` page returned HTTP 200 with no failures:
- `/api/objects/vng-gemma/view?publiceren=...&_unset=xml&_limit=100` -- OK
- `/api/objects/voorzieningen/gebruik?_limit=10000&...` (3 variants) -- OK
- `/api/objects/voorzieningen/module?_limit=10000&_fields=id,naam` -- OK
- All schema/register lookups -- OK

No SLOW (>500ms) or PERFORMANCE_FAIL (>1000ms) API calls detected on the view pages.

---

## Issue #135: (VNGR) Valideren van non-functionele eisen voor component Referentiearchitectuur

**Status: PARTIAL**
**Test Step:** Step 22

**Note:** This issue has no detailed acceptance criteria in `issues.md` (only appears in the "Other" issues summary table). Assessment based on the title: "Valideren van non-functionele eisen voor component Referentiearchitectuur".

### Non-Functional Assessment

| Category | Finding | Status |
|----------|---------|--------|
| **Performance** | Poster view loads in ~14.7s (above 11s target). Backend API is fast (<0.6s). Frontend SVG rendering is the bottleneck. | **PARTIAL** |
| **Reliability** | GEMMA API endpoints (relations, models) timeout on cold cache (HTTP 500). Dashboard loads trigger multiple 504 errors for GEMMA-related schemas (4/21, 4/23, 4/24, 3/10). | **FAIL** |
| **Availability** | All endpoints accessible when cache is warmed. OAS documentation available for both admin and regular users. View listing page loads cleanly. | **PASS** |
| **Data Integrity** | 2,741 elements, 5,790 relations, 249 views, 1 model, 74 property-definitions present. Data appears complete and consistent. | **PASS** |
| **Usability** | View listing has search, descriptions, and card-based navigation. Individual views have filters (Gebruik, Applicaties, Deelnames) and export options (SVG, AMEF). | **PASS** |
| **Rendering Consistency** | Smaller views fail to render diagram content. Only the poster view renders reliably. This is a significant rendering bug. | **FAIL** |
| **Error Handling** | 504 errors on dashboard are not gracefully handled -- no user-visible error messages. "Referentiearchitectuur" backend page shows "Geen data gevonden" without explanation. Failed API calls produce no user feedback. | **FAIL** |
| **Export Capability** | "Download SVG" and "Download AMEF" available per view via Acties menu. No bulk GEMMA model download. | **PARTIAL** |
| **Accessibility** | Skip link present ("Direct naar de inhoud"). ARIA landmarks correct. Heading hierarchy mostly correct. `lang="nl"` set. | **PASS** |

### Dashboard Load Issues (Authenticated)
When the beheer dashboard loads, several GEMMA-related API calls fail with 504 Gateway Timeout:
```
504 - /api/apps/softwarecatalog/api/aanbod
504 - /api/apps/openregister/api/objects/4/23 (property-definition schema)
504 - /api/apps/openregister/api/objects/4/24 (relation schema)
504 - /api/apps/openregister/api/objects/4/21 (view schema)
504 - /api/apps/openregister/api/objects/3/10 (organisatie schema)
```
These fail silently with no user-visible error indication.

---

## Cross-Cutting Observations

### Login Experience
- Login as sarah.devries@test.nl succeeded without issues
- Dashboard loaded with welcome text explaining the softwarecatalogus purpose
- User correctly identified as "Sarah de Vries (Default Organisation)"
- Left navigation sidebar: Dashboard, Mijn Account, Mijn Organisatie, Diensten, Contactpersonen, Applicaties, Gebruik, Koppelingen, View

### Key Improvement vs Previous Test (2026-02-25)
| Area | Previous (2026-02-25) | Current (2026-02-26) |
|------|----------------------|---------------------|
| View rendering | "Completely non-functional" -- empty pages | Poster view renders fully with filters/export |
| View listing | Not accessible | `/beheer/view` shows 20 views with cards/search |
| OAS for non-admin | Not tested/unknown | Confirmed working for sarah.devries@test.nl |
| View interactivity | Not testable | Filters, Acties, Download SVG/AMEF all present |

### Architecture Component Navigation
- "View" in left navigation leads to AMEF Views listing with search
- 20 published views displayed with titles and descriptions
- Breadcrumb: Home > Beheer > View > [View name]
- No "Referentiearchitectuur" entry in left navigation -- only "View"

### GEMMA Online Links
- Footer links to GEMMA Online (https://www.gemmaonline.nl/) and NORA Online (https://www.noraonline.nl/) present on all pages
- External links indicated with "Opent in een nieuw tabblad" accessibility text

### Recurring Console Errors
- `Manifest: Line: 1, column: 1, Syntax error.` at `/meta/site.webmanifest` -- on every page (minor, non-blocking)

---

## Console Errors Summary

| Page | Errors | Notes |
|------|--------|-------|
| Login (/login) | 2 | Manifest syntax errors (benign) |
| Beheer dashboard (/beheer) | 7 | Manifest (2) + 504 timeouts (5): aanbod, schemas 4/23, 4/24, 4/21, 3/10 |
| Referentiearchitectuur (/beheer/referentiearchitectuur) | 3 | Manifest (2) + 504 on related endpoint |
| Mijn Omgeving (/beheer/mijn-omgeving) | 3 | Manifest (2) + 504 on related endpoint |
| View listing (/beheer/view) | 2 | Manifest errors only (clean load) |
| View detail (poster) | 2 | Manifest errors only (clean load) |
| Search (/zoeken) | 2 | Manifest errors only |

---

## Evidence

### Screenshots
| File | Description |
|------|-------------|
| `poster-view-rendered.png` | Poster basisbeveiligingsniveau view fully rendered with filters and Acties button |
| `view-listing-page.png` | AMEF Views listing page with search and view cards |

### API Test Summary

| Endpoint | Auth | HTTP | Time (warm) | Records |
|----------|------|------|-------------|---------|
| `/api/registers/4/oas` | admin | 200 | <1s | OAS 3.1.0 spec |
| `/api/registers/4/oas` | sarah | 200 | <1s | OAS 3.1.0 spec |
| `/api/objects/vng-gemma/element` | sarah | 200 | <1s | 2,741 total |
| `/api/objects/vng-gemma/relation` | sarah | 200* | 0.75s | 5,790 total |
| `/api/objects/vng-gemma/view` | sarah | 200 | <1s | 249 total |
| `/api/objects/vng-gemma/model` | sarah | 200* | 0.66s | 1 total |
| `/api/objects/vng-gemma/property-definition` | sarah | 200 | 0.48s | 74 total |
| `/api/objects/vng-gemma/view/{id}` (poster) | sarah | 200 | 0.53s | ~1MB response |

\* First cold-cache request returned HTTP 500 (timeout); subsequent requests succeed.

---

## Critical Findings (Priority Order)

1. **Smaller views fail to render** (#160) -- Only the poster view renders its diagram. Other views (Bedrijfsfuncties bestuur, openbare orde en veiligheid) show only the generic page header with no diagram content. This blocks most view-related testing.

2. **Cold-cache API timeouts** (#148, #135) -- Relations and models endpoints return HTTP 500 on first request. Dashboard loads trigger multiple 504 errors for GEMMA schemas. No graceful error handling.

3. **Poster view exceeds performance target** (#160) -- 14.7s vs 11s target (33% over). Backend API is within target (0.53s); the bottleneck is frontend rendering of the large SVG/DOM.

4. **Null `name` fields across all GEMMA API endpoints** (#148) -- Element, view, model, and property-definition objects all have `name: null`. Actual names are only in `xml.name._value` or `@self.name`.

5. **No loading indicator for views** (#160) -- Users see a generic page header during the 14+ second load time with no indication that content is loading.

6. **`model-id` filter ignored** (#148) -- API explicitly ignores this filter parameter, returning `"ignoredFilters":["model-id"]`.

7. **No "GEMMA downloaden" button** (#148) -- Full model download not available from the UI. Only per-view AMEF export exists.

8. **Empty properties not omitted from API** (#148) -- Dozens of null fields returned per object, causing significant payload bloat.
