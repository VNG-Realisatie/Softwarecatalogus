# Samenwerking Agent Test Results
**Tester:** Linda Bakker (Samenwerking Agent)
**Date:** 2026-02-21
**Environment:** https://softwarecatalogus.accept.opencatalogi.nl/
**Testing as:** Unauthenticated visitor (public view)

---

## #57 - Als gebruik-beheerder van een samenwerkingsverband wil ik pakketten opvoeren voor gemeenten
**Status:** PARTIAL
**Test Step:** Step 20 (Samenwerkingen)
**Observed:**
- The search page at `/zoeken?_schema=organisatie` correctly shows samenwerkingsverbanden.
- The **Organisatietype** filter includes a "Samenwerking (91)" option, which when selected filters to show 91 samenwerkingsverbanden.
- The **Samenwerkingstype** filter is available with 14 sub-types: Ambtelijke fusie (13), Archiefdienst (regionaal) (2), Bedrijfsvoeringsorganisatie (2), Belastingsamenwerking (7), Centrumgemeenteregeling (1), DVO (1), Gemeenschappelijke Regeling (2), Gemeenschappelijke Regeling (samenwerking meerdere domeinen) (7), Gemeentelijke herindeling (gepland) (1), ICT (bijvoorbeeld Shared Service Center) (25), Omgevingsdienst (15), Shared Service Center (1), Sociaal Domein samenwerking (11), Uitvoeringsorganisatie (3).
- The **Geregistreerd door** filter shows "Samenwerking (398)" indicating 398 items were registered by samenwerkingsverbanden.
- Individual samenwerking detail pages (e.g., ABG Gemeenten at `/publicatie/c1616142-42f5-4145-8faf-ae1e1fe3cbe6`) correctly display:
  - Organisation name
  - Contact information (email, phone, website)
  - Tab showing member "Organisaties (3)" with linked municipalities (Alphen-Chaam, Baarle-Nassau, Gilze en Rijen)
- **However:** The actual functionality of "pakketten opvoeren voor gemeenten" (adding packages for municipalities) requires authentication and could NOT be tested as a public visitor. The issue requires a "gebruik-beheerder" role.

**Expected:** Samenwerkingsverbanden should be visible in search results and filterable. The ability to add packages for municipalities requires authentication.
**Evidence:**
- URL: `https://softwarecatalogus.accept.opencatalogi.nl/zoeken?_order%5B_name%5D=asc&_schema=organisatie&type%5B%5D=Samenwerking&_page=1`
- Filter: Organisatietype > Samenwerking (91) works correctly
- Filter: Samenwerkingstype (14 sub-types) available and expandable
- Detail page: `https://softwarecatalogus.accept.opencatalogi.nl/publicatie/c1616142-42f5-4145-8faf-ae1e1fe3cbe6` shows ABG Gemeenten with 3 member organisations
- Screenshots: `samenwerking-filter-results.png`, `samenwerking-detail-abg.png`

---

## #60 - Als gebruik-beheerder wil ik met een account meerdere organisaties bewerken
**Status:** CANNOT_TEST
**Test Step:** Step 20 (Samenwerkingen)
**Observed:** This feature requires authentication with a "gebruik-beheerder" account. The public frontend shows "Aanmelden" and "Inloggen" buttons but does not allow testing of multi-organisation account management functionality without valid credentials. The feature is about editing multiple organisations from a single account, which is an administrative function.
**Expected:** A gebruik-beheerder should be able to manage multiple organisations from a single account.
**Evidence:**
- Login/Register buttons visible at: `https://softwarecatalogus.accept.opencatalogi.nl/`
- No public access to account management or organisation editing features
- Feature is inherently an authenticated-only capability

---

## Summary Table

| Issue | Title | Status | Notes |
|-------|-------|--------|-------|
| #57 | Pakketten opvoeren voor gemeenten via samenwerkingsverband | PARTIAL | Samenwerkingsverbanden visible and filterable (91 found, 14 types). Actual package management requires auth. |
| #60 | Met een account meerdere organisaties bewerken | CANNOT_TEST | Requires authenticated gebruik-beheerder account |
