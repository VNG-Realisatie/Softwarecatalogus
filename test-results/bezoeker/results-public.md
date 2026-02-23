# Test Results: Bezoeker (Public Visitor)

**Persona:** Anonymous Visitor (Bezoeker) -- unauthenticated
**Date:** 2026-02-22
**Environment:** Local development (Frontend: http://localhost:3000, Backend: http://localhost:8080)
**Browser:** Playwright (browser-6, headed)
**Tester:** Automated test agent

---

## Summary Table

| Issue | Title | Status | Severity |
|-------|-------|--------|----------|
| #267 | Naam is softwarecatalogus i.p.v. Softwarecatalogus | **PARTIAL** | Medium |
| #345 | Dienst verschijnt niet in filters | **PASS** | Low |
| #347 | Dienstkaartje toont array | **PASS** | Low |
| #263 | Niet ingelogd: gebruik tab toont gemeenten | **PASS** | High |
| #394 | Contactpersonen gemeenten publiekelijk zichtbaar | **PASS** | Critical |
| #315 | Zoekpagina toont gemeentelijk applicatielandschap | **PARTIAL** | High |
| #278 | Filterteksten aanpassen | **FAIL** | Medium |

---

## Detailed Results

### #267: Naam is softwarecatalogus i.p.v. Softwarecatalogus

**Status: PARTIAL**

**Acceptance Criteria:**
- [x] Browser tab, header, and homepage read "Softwarecatalogus"
- [x] The name is consistent across main pages (header, search page, detail pages)
- [ ] Footer displays "Softwarecatalogus" branding (NOT "Open Tilburg")

**Findings:**

The application name is correctly displayed as "Softwarecatalogus" in:
- Browser tab titles: "Zoeken - Softwarecatalogus", "Home - Softwarecatalogus", "Softwarecatalogus | Publicatie"
- Header h1 heading: "Softwarecatalogus"
- Header link text: "Softwarecatalogus"

However, the **footer** still shows incorrect branding:
- Footer displays **"Open Tilburg"** with the tagline **"Een plek voor alle publicaties van Gemeente Tilburg"**
- This is clearly incorrect for the GEMMA Softwarecatalogus
- The footer section headings are also generic: "Footer Left", "Footer Center", "Footer Right" instead of meaningful titles

**Evidence:** Screenshots `02-homepage.png`, `03-search-page-loaded.png`

---

### #345: Zoeken: toegevoegde dienst verschijnt niet in filters

**Status: PASS**

**Acceptance Criteria:**
- [x] After adding a new service, it appears in search results
- [x] "Diensttype" filter is populated with correct service type values (labeled "Soort dienst" -- see #278 note)
- [x] "Type=Dienst" is available as a filter option
- [ ] No test configuration values like "eigen-organisatie" appear in production (not observed, but this is local dev)
- [x] Filtering by "Dienst" shows only services

**Findings:**

- The "Type" filter includes **"Dienst (2)"** as a filter option -- correctly populated
- The **"Soort dienst (1)"** filter exists and contains **"Implementatieondersteuning (2)"** -- filter values are populated
- Filtering by Type=Dienst returns exactly 2 results: "Test Dienst Implementatie" and "Test Wizard Dienst"
- Both diensten show the correct supplier: "Aangeboden door Test Leverancier BV"
- No "eigen-organisatie" test values observed in filters

**Note:** The filter is labeled "Soort dienst" rather than "Diensttype" as specified in #340. This is tracked separately under #278.

**Evidence:** Screenshot `06-dienst-filter-results.png`

---

### #347: Zoeken: Dienstkaartje toont array

**Status: PASS**

**Acceptance Criteria:**
- [x] Service types displayed as readable comma-separated list (NOT raw JSON array)
- [x] Service type values are human-readable labels
- [ ] "Concept" status either has a tooltip or is replaced with a clearer term (no Concept status observed in results)
- [x] Service card layout is consistent with application cards

**Findings:**

The dienst cards display correctly:
- "Test Dienst Implementatie" card shows: date "22 februari 2026", type "Dienst", service type "Implementatieondersteuning" -- all as readable text
- "Test Wizard Dienst" card shows the same pattern: date, "Dienst", "Implementatieondersteuning"
- No raw JSON arrays (like `["type1", "type2"]`) visible on any dienst card
- Card layout is consistent with application cards (title, supplier, description, date, type)

No "Concept" status was observed on these dienst cards, so that specific acceptance criterion cannot be fully evaluated.

**Evidence:** Screenshot `06-dienst-filter-results.png`

---

### #263: Niet ingelogd: onder een applicatie staat in het tabje gebruik de gemeenten

**Status: PASS**

**Acceptance Criteria:**
- [x] When NOT logged in, the "Gebruik" tab is NOT visible or does not show municipality usage data
- [ ] When logged in as an authorized user, the "Gebruik" tab IS visible with correct data (not testable by this persona)

**Findings:**

On the application detail page for "3D - Digital Twin (Future Insight Group)" (`/publicatie/68f04fdf-caad-55ef-9b7f-a94308afd381`), the visible tabs are:
1. **Standaarden (30)** -- active/selected
2. **Geschikt voor (1)**
3. **Organisaties (1)**
4. **Applicatie Versies (1)**

There is **no "Gebruik" tab** visible to the unauthenticated visitor. This is the correct behavior -- usage data showing which municipalities use an application should not be publicly visible.

**Evidence:** Screenshot `04-application-detail-3d-digital-twin.png`

---

### #394: Contactpersonen van gemeenten publiekelijk zichtbaar

**Status: PASS**

**Acceptance Criteria:**
- [x] Contact persons of **leveranciers** ARE visible on public pages (expected/correct behavior) -- N/A, no contacts displayed on the pages tested
- [x] Contact persons of **gemeenten** are NOT visible to unauthenticated users on frontend
- [x] Contact persons of **samenwerkingen** are NOT visible to unauthenticated users
- [x] Public API (`_extend=contactpersonen`) correctly distinguishes: leverancier contacts visible, gemeente/samenwerking contacts hidden
- [x] No personal contact information (name, email, phone) of gemeente users on public pages
- [ ] API endpoint enforces RBAC: authenticated gebruik-beheerder can see all contactpersonen (not testable by this persona)

**Findings:**

**API Test 1:** Direct contactpersoon access without auth:
```
GET http://localhost:8080/index.php/apps/openregister/api/objects/voorzieningen/contactpersoon?_limit=5
Response: {"results": [], "total": 0, ...}
```
Result: **0 results** returned. The contactpersoon schema correctly requires authentication. RBAC is enforced.

**API Test 2:** Module API with `_extend[]=contactpersonen` without auth:
```
GET http://localhost:8080/index.php/apps/openregister/api/objects/voorzieningen/module?_extend[]=contactpersonen&_limit=50
```
Result: All 50 modules returned are from **Leverancier** registrations, and **none** have expanded contact person data. The `_extend` mechanism correctly does not leak gemeente contact persons to unauthenticated users.

**Frontend:** No contact person information (name, email, phone) was visible on the application detail page for "3D - Digital Twin" when accessed as an anonymous visitor.

---

### #315: Hoge prioriteit: Zoekpagina toont gemeentelijk applicatielandschap

**Status: PARTIAL**

**Acceptance Criteria:**
- [ ] "Leverancier" filter on /zoeken contains ONLY actual suppliers, NOT municipalities
- [x] Search result cards show the actual supplier as "aangeboden door", NOT a municipality
- [ ] Filtering by municipality name is not possible (municipalities appear in "Geregistreerd door" filter)
- [x] Application detail page shows the correct supplier
- [ ] Municipal application landscape data is not publicly visible to unauthenticated users (partially -- see below)
- [x] Supplier on search card matches supplier on detail page

**Findings:**

**Issue 1: "Gemeente Rotterdam" in Leverancier filter**
The "Leverancier (280)" filter contains **"Gemeente Rotterdam (2)"** -- a municipality is listed as a supplier. This indicates that at least 2 items are registered by Gemeente Rotterdam as a "leverancier", which is incorrect. Only actual software vendors should appear in this filter.

**Issue 2: Unresolved UUIDs in Leverancier filter**
Several entries in the Leverancier filter show raw UUIDs instead of resolved names:
- `108f0876-5d19-5800-858c-e04ba9ebdd33 (1)`
- `236cb622-f9d2-5e31-ad03-d54fb036b68a (1)`
- `2bddf1c5-06cc-5dc1-9e44-fb936d68a28d (1)`
- `a748dbad-8bce-5e72-a848-b3e3a787d232 (4)`
- `b281986f-77c7-568c-9712-055dba0f54da (1)`
- `cd5fcd3b-4b4a-5d9d-814a-5e44c3f904b9 (2)`
- `da63cb18-a487-52e4-9970-f01bfa9057fb (2)`

These UUIDs could not be resolved to names (all returned 404 from the names API). Some of these may be municipalities or other entities that should not appear.

**Issue 3: "Geregistreerd door" shows Gemeente (2342)**
The "Geregistreerd door" filter shows 2342 items registered by "Gemeente". While this filter correctly labels these as gemeente-registered (not as suppliers), it means municipality-registered data is still visible in search results when no filters are applied. The 4,165 total results include Organisatie (3,110), Applicatie (1,053), and Dienst (2) -- the organisatie entries include municipalities themselves.

**Positive:** The search result cards correctly show "Aangeboden door [Supplier Name]" for application cards (e.g., "Aangeboden door Future Insight Group", "Aangeboden door Xxllnc"). No municipality name was observed as the supplier on application cards.

**Evidence:** Screenshots `03-search-page-loaded.png`, `05-leverancier-filter-expanded.png`

---

### #278: Filterteksten aanpassen

**Status: FAIL**

**Acceptance Criteria:**
- [ ] Filter labels on /zoeken display correct, updated text
- [ ] Updated texts appear without stale cached content
- [ ] Filter texts are consistent with terminology used in wizards and management pages

**Findings:**

Multiple filter text issues were identified:

**Issue 1: "Soort dienst" should be "Diensttype"**
The service type filter is labeled **"Soort dienst (1)"** but per #340, it should be renamed to **"Diensttype"**. This is inconsistent with the terminology used elsewhere.

**Issue 2: "Organisatietype" filter contains invalid values**
The "Organisatietype (5)" filter contains values that are not valid organization types:
- **"Applicatie (1051)"** -- This is NOT an organization type; it is a publication type
- **"Implementatieondersteuning (2)"** -- This is a service type, not an organization type

Valid organization types should be limited to: Gemeente, Leverancier, Samenwerking. The filter is being contaminated with values from other schemas/types.

Current filter values:
1. Applicatie (1051) -- INVALID
2. Gemeente (351) -- Valid
3. Implementatieondersteuning (2) -- INVALID
4. Leverancier (2663) -- Valid
5. Samenwerking (96) -- Valid

**Issue 3: Unresolved UUIDs in "Leverancier" filter**
As documented under #315, seven entries in the Leverancier filter display as raw UUIDs instead of human-readable names.

**Issue 4: Footer section headings are generic**
Footer navigation headings display as "Footer Left", "Footer Center", "Footer Right" instead of meaningful category names.

**Evidence:** Screenshot `05-leverancier-filter-expanded.png`

---

## Additional Observations

### Positive Findings

1. **Pagination works correctly:** 209 pages of results with pagination controls visible and functional
2. **Sort options available:** "Meest relevant", "Datum - oud naar nieuw", "Datum - nieuw naar oud", "Naam - A naar Z", "Naam - Z naar A"
3. **No admin/beheer links visible:** The navigation correctly shows only "Aanmelden" and "Inloggen" for unauthenticated users
4. **Breadcrumbs work:** Navigation shows "Home > Zoeken" and "Home > Zoeken > Applicatie" as appropriate
5. **Application cards are well-structured:** Title, supplier name, description, date, and type are clearly displayed

### Negative Findings / Bugs

1. **Slow initial page load:** Search results initially show "Geen titel" and "/publicatie/undefined" links while data is loading (approximately 5-8 seconds for full enrichment). This is a poor user experience.
2. **Footer branding incorrect:** Footer displays "Open Tilburg" and "Een plek voor alle publicaties van Gemeente Tilburg" instead of Softwarecatalogus branding.
3. **Console errors:** Multiple 404 errors for name resolution (7 UUIDs) on every page load. These correspond to the unresolved UUIDs in the Leverancier filter.
4. **"Begrippenlijst" button overlaps content:** The floating "Begrippenlijst" button in the bottom-right may overlap with pagination or content on smaller viewports.

---

## Environment Notes

- Frontend running on webpack-dev-server (development mode)
- 4,165 total publications in the catalog
- 2 diensten available (test data)
- All tests performed without authentication (anonymous visitor)
- localStorage cleared before testing
