# Architectuur-Expert Agent Test Results
**Tester:** Dr. Sarah de Vries (Architectuur-Expert Agent)
**Date:** 2026-02-21
**Environment:** https://softwarecatalogus.accept.opencatalogi.nl/
**Testing as:** Unauthenticated visitor (public view)

---

## #160 - Performance plotten views tbv ID-77
**Status:** PARTIAL
**Test Step:** Step 22 (Advanced search/Architecture)
**Observed:**
- The backend schema cache reveals ArchiMate-related schemas are registered: `view` (schema 20), `element` (schema 19), `model` (schema 21), `relation` (schema 23). These are the core building blocks of ArchiMate architecture views.
- Searching for "referentiearchitectuur" returns 17 results, including ArchiMate-related applications:
  - **Archi** (by Phillip Beauvoir) - "Open source tool voor architectuurmodellering in ArchiMate"
  - **Mavim & GEMMA (Enterprise Architectuur volgens ArchiMate)** (by Mavim)
- The Archi detail page (`/publicatie/37e8fe04-3dc3-5fa9-9db7-685689e04476`) shows:
  - Standaarden tab with ArchiMate File Format compliance: 3.0 (ONDERSTEUND), 3.1 (ONDERSTEUND), 3.2 (NIET ONDERSTEUND), 2.1 (NIET ONDERSTEUND)
  - "Geschikt voor" tab mapping to "Architectuur- en ontwerpcomponent" referentiecomponent
  - Applicatie Versies tab (14 versions)
  - Organisaties tab (1)
- **However:** No dedicated ArchiMate view rendering pages were found in the public frontend. The schemas for `view`, `element`, `model`, and `relation` exist in the backend but there is no public-facing visualization of ArchiMate views or diagrams. The "plotten views" (rendering views) functionality is not exposed in the public UI, which aligns with this being a performance/backend issue about rendering views.

**Expected:** ArchiMate views should be plottable/renderable. The backend schemas exist, but public-facing visualization of architecture views was not found.
**Evidence:**
- Schema cache shows: view (20), element (19), model (21), relation (23)
- Search URL: `https://softwarecatalogus.accept.opencatalogi.nl/zoeken?_search=referentiearchitectuur` (17 results)
- Archi detail: `https://softwarecatalogus.accept.opencatalogi.nl/publicatie/37e8fe04-3dc3-5fa9-9db7-685689e04476`
- Standaardversies filter includes "ArchiMate File Format 3.0" and "Archimate File Format 3.1"
- Screenshot: `archi-detail-page.png`

---

## #135 - Valideren non-functionele eisen voor Referentiearchitectuur
**Status:** PARTIAL
**Test Step:** Step 22 (Advanced search/Architecture)
**Observed:**
- **Referentiecomponenten** are prominently visible as a filter facet on the search page, with 161 distinct referentiecomponenten available. This is a core part of the GEMMA referentiearchitectuur.
- Notable architecture-related referentiecomponenten include:
  - Architectuur- en ontwerpcomponent (6 applications)
  - Gemeentelijke servicebuscomponent (54)
  - Generiek zaakafhandelcomponent (58)
  - Gegevensdistributiecomponent (32)
  - Gegevensmagazijncomponent (74)
  - Bedrijfsproces beheercomponent (BPM) (48)
  - BPM-engine component (14)
  - And 154 more...
- Each application detail page shows its referentiecomponent mapping via the "Geschikt voor" tab. For example, Archi maps to "Architectuur- en ontwerpcomponent" which links to the GEMMA Online wiki.
- The Standaardversies filter includes ArchiMate-specific standards (ArchiMate File Format 3.0, 3.1).
- Applications show compliance status per standard (ONDERSTEUND / NIET ONDERSTEUND) with badges for requirement level (VERPLICHT / AANBEVOLEN).
- **Non-functional aspects observed:**
  - Search loads 4,144 results efficiently with pagination (208 pages of 20 results)
  - Filter facets load and update dynamically when selections change
  - Some 404 errors observed for name resolution of certain UUIDs (8 failed name lookups out of 538), but this does not block functionality
  - Initial page load shows "0 resultaten" skeleton briefly before data loads (minor UX issue)

**Expected:** Referentiearchitectuur elements should be visible and validatable. The referentiecomponenten are well-represented as filterable facets.
**Evidence:**
- Search page filters: `https://softwarecatalogus.accept.opencatalogi.nl/zoeken?_schema=module`
- Referentiecomponenten filter: 161 distinct components visible
- Standaardversies filter: 270 standard versions including ArchiMate formats
- Console errors: 8 x 404 for name resolution (`/api/names/{uuid}`) -- minor data quality issue
- Application detail pages correctly map to referentiecomponenten via "Geschikt voor" tab

---

## #59 - Als gebruik-beheerder wil ik alle informatie over applicaties invoeren
**Status:** CANNOT_TEST
**Test Step:** Step 22 (Advanced search/Architecture)
**Observed:** This feature requires authentication with a "gebruik-beheerder" account. The public frontend displays application detail pages in read-only mode. No edit buttons or data entry forms are visible to unauthenticated visitors. The feature involves entering/editing all information about applications, which is an administrative function.

From the public view, the following application information fields are visible (read-only):
- Application name and vendor
- Description
- Website URL
- License type (Open source / Closed source)
- Hosting type
- Standaarden (standards compliance table with status and evidence)
- Geschikt voor (referentiecomponent mapping)
- Organisaties (linked organisations)
- Applicatie Versies (version history)

**Expected:** A gebruik-beheerder should be able to enter all information about applications through authenticated forms.
**Evidence:**
- Example read-only application page: `https://softwarecatalogus.accept.opencatalogi.nl/publicatie/37e8fe04-3dc3-5fa9-9db7-685689e04476`
- Login/Register buttons visible but no edit functionality accessible publicly
- Feature is inherently an authenticated-only capability

---

## Summary Table

| Issue | Title | Status | Notes |
|-------|-------|--------|-------|
| #160 | Performance plotten views tbv ID-77 | PARTIAL | Backend schemas for ArchiMate views exist (view, element, model, relation). No public-facing view rendering/visualization found. ArchiMate standards and applications are listed. |
| #135 | Valideren non-functionele eisen voor Referentiearchitectuur | PARTIAL | 161 referentiecomponenten visible as filters. Standards compliance shown per application. Minor issues: 8/538 name lookup 404s, brief skeleton flash on load. |
| #59 | Alle informatie over applicaties invoeren | CANNOT_TEST | Requires authenticated gebruik-beheerder account. Read-only data visible publicly. |
