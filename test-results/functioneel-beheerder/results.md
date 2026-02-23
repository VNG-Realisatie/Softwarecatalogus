# Test Results: Functioneel Beheerder (Peter van Dijk)

**Test Date:** 2026-02-21
**Tester:** Peter van Dijk (functioneel-beheerder/admin)
**Environment:** https://softwarecatalogus.accept.opencatalogi.nl/ (public/unauthenticated)
**Agent:** Claude Opus 4.6

---

## Step 21 - Beheer en configuratie

## #155 - Definities worden weergegeven via interactieve optie
**Status:** PASS
**Test Step:** Step 21
**Observed:** A "Begrippenlijst" button is visible in the bottom-right corner of every page. Clicking it opens a dialog with two tabs: "Deze pagina" (showing terms relevant to the current page with definitions) and "Alle begrippen" (showing all 10 glossary terms with definitions, searchable). Each term has a "Meer informatie" link pointing to https://www.softwarecatalogus.nl/lexicon#[term]. Additionally, terms appearing in page text (e.g., "leverancier" in the homepage description) are rendered as clickable buttons that open the glossary panel when clicked. Console logs confirm "Glossary warmup complete: 10 terms loaded" on each page load.
**Expected:** Definitions/glossary should be shown via an interactive option.
**Evidence:** Begrippenlijst button present on all pages tested. Dialog opens with two tabs. Terms include: Addendum, Convenant VNG, Eindproduct-standaard, Gegevensstandaard, Grondstof-standaard, Halffabrikaat-standaard, Leverancier, Referentiecomponent, SaaS, Standaard. Inline term "leverancier" on homepage is a clickable button.

---

## #169 - Rest issues van Organisatie en Configuratie
**Status:** PARTIAL
**Test Step:** Step 21
**Observed:** The public frontend shows a generally functional application. The main navigation includes Home, Organisaties, and Applicaties. The registration flow is a multi-step wizard (Organisatiegegevens -> Contactpersoon -> Controleren). The login page has username/password fields with a "Wachtwoord vergeten?" option. The footer columns are labeled "Footer Left", "Footer Center", "Footer Right" which are generic placeholder labels rather than meaningful headings. The runtime config shows `ENABLE_AUTHENTICATION: false` and `MODE: development`, suggesting this is a development/acceptance configuration. Some configuration items like `SITE_DESCRIPTION: "Local development instance of the softwarecatalogus"` appear to be development defaults that have leaked into the accept environment.
**Expected:** Outstanding organisatie and configuration issues should be resolved.
**Evidence:** Footer column headings ("Footer Left", "Footer Center", "Footer Right") are still placeholder/technical labels. Runtime config shows development mode settings (SITE_DESCRIPTION, MODE=development). URL: https://softwarecatalogus.accept.opencatalogi.nl/

---

## #267 - Naam is softwarecatalogus i.p.v. VNG softwarecatalogus
**Status:** FAIL
**Test Step:** Step 21
**Observed:** The name used throughout the application is "Softwarecatalogus" without the "VNG" prefix in text form. Specifically:
- Page title: "Home - Softwarecatalogus" (all pages follow this pattern)
- H1 heading (DOM): "Softwarecatalogus"
- Header visual: VNG logo icon + "SOFTWARECATALOGUS" text (the VNG appears only as a logo, not in the text)
- Footer brand name: "Softwarecatalogus"
- Footer subtitle: "Een plek voor alle software voor en door Gemeenten"
- Runtime config SITE_TITLE: "Softwarecatalogus"
- Runtime config FOOTER_LOGO_TITLE: "Softwarecatalogus"

The issue requests the name should be "VNG Softwarecatalogus" (with VNG as part of the name, not just a logo). While the VNG logo is present in the header, the actual text/title does not include "VNG".
**Expected:** The name should be "VNG Softwarecatalogus" consistently across the site (page title, header, footer).
**Evidence:** Page title = "Home - Softwarecatalogus", H1 = "Softwarecatalogus", Footer = "Softwarecatalogus", runtime-config.js SITE_TITLE = "Softwarecatalogus". Screenshot: homepage-full.png

---

## #332 - Voorpagina inrichten
**Status:** PARTIAL
**Test Step:** Step 21
**Observed:** The homepage has been set up with:
- A hero banner with the VNG illustration image and a search bar ("Waar bent u naar op zoek?")
- A section titled "Onderwerpen" with a description: "Bekijk het overzicht van onderwerpen die relevant zijn voor gemeenten en leveranciers binnen het domein van gemeentelijke ICT."
- One topic card: "General" with description "General publications and announcements" and a link "Bekijk alle onderwerpen"
- Navigation menu (Home, Organisaties, Applicaties)
- Aanmelden and Inloggen buttons

Issues noted:
1. Only one topic ("General") is shown, with an English title and description instead of Dutch
2. The "Onderwerpen" section appears sparse with only one card
3. No featured applications, statistics, or other engaging homepage content beyond search and one topic
**Expected:** The homepage should be properly set up with meaningful content, layout, and navigation.
**Evidence:** URL: https://softwarecatalogus.accept.opencatalogi.nl/ - Screenshot shows hero with search, one "General" topic card. Screenshot: homepage-full.png

---

## #397 - Pagina aanmaken via CMS
**Status:** PASS
**Test Step:** Step 21
**Observed:** All four CMS pages exist and are accessible via the footer links:
1. /privacyverklaring - Title: "Privacyverklaring", has introductory text about privacy, personal data processing, and AVG rights. Page title: "Privacyverklaring - Softwarecatalogus"
2. /algemene-voorwaarden - Title: "Algemene Voorwaarden", has introductory text about definitions, service conditions, responsibilities, payment terms, and dispute resolution. Page title: "Algemene Voorwaarden - Softwarecatalogus"
3. /disclaimer - Title: "Disclaimer", has introductory text about liability, website availability, user responsibilities, and intellectual property. Page title: "Disclaimer - Softwarecatalogus"
4. /faq - Title: "Veelgestelde Vragen", has introductory text about general information, account access, technical support, privacy, and billing. Page title: "Faq - Softwarecatalogus"

All pages have breadcrumb navigation and consistent header/footer. The content is minimal (title + one paragraph summary each) but the pages exist and are functional.
**Expected:** CMS pages should exist and be accessible.
**Evidence:** All four URLs respond with proper page titles and content. Footer sub-navigation links (Privacy | Algemene voorwaarden | Disclaimer | FAQ) all work correctly. Screenshots: privacyverklaring.png, algemene-voorwaarden.png, disclaimer.png, faq.png

---

## #403 - Tekst verwijderen aanpassen
**Status:** CANNOT_TEST
**Test Step:** Step 21
**Observed:** This issue requires testing deletion confirmation dialogs, which are only available to authenticated users who can manage content. As an unauthenticated visitor, no delete actions are available.
**Expected:** Deletion confirmation text should be updated appropriately.
**Evidence:** No delete functionality accessible without authentication.

---

## #406 - SiteImprove verwijderen
**Status:** PASS
**Test Step:** Step 21
**Observed:** Examined the full page source of the homepage using JavaScript evaluation. No SiteImprove scripts, references, or tracking tags were found anywhere in the DOM. The search for "siteimprove", "SiteImprove", and "siteimproveanalytics" all returned false. The only analytics-related code found is a Piwik Pro bootstrapper script with empty configuration values (srcUrl="", dataLayerName="", id=""), which means it is not actively tracking.
**Expected:** SiteImprove script tags should be removed from the page source.
**Evidence:** JavaScript evaluation: `html.includes('siteimprove') = false`, `html.includes('SiteImprove') = false`. No SiteImprove script tags found in any `<script>` elements. All script sources point to softwarecatalogus.accept.opencatalogi.nl/static/js/*.

---

## #409 - Footer anders: inlog of uitgelogd
**Status:** PARTIAL
**Test Step:** Step 21
**Observed:** As an unauthenticated user, the footer contains:
- Three link columns: "Footer Left" (GEMMA Online, NORA Online), "Footer Center" (VNG), "Footer Right" (Commonground)
- Brand section: VNG logo + "Softwarecatalogus" + "Een plek voor alle software voor en door Gemeenten"
- Sub-footer links: Privacy | Algemene voorwaarden | Disclaimer | FAQ
- All external links correctly indicate "Opent in een nieuw tabblad"

Cannot verify the difference between logged-in and logged-out footer content since authentication is not available. The footer appears complete and well-structured for the public view, but there is no way to compare with the authenticated footer. Note: the column headings "Footer Left", "Footer Center", "Footer Right" are technical/placeholder names rather than user-friendly labels.
**Expected:** Footer should be consistent or appropriately different for logged-in vs logged-out users.
**Evidence:** Footer observed on homepage and all sub-pages. Column headers are "Footer Left", "Footer Center", "Footer Right". Cannot compare with authenticated view. URL: https://softwarecatalogus.accept.opencatalogi.nl/

---

## #410 - Dashboard schrijfwijze softwarecatalogus
**Status:** PARTIAL
**Test Step:** Step 21
**Observed:** In the public frontend, "softwarecatalogus" / "Softwarecatalogus" is used in different capitalizations:
- Header visual text: "SOFTWARECATALOGUS" (all caps)
- H1 DOM element: "Softwarecatalogus" (title case)
- Page titles: "Home - Softwarecatalogus" (title case, consistent across all pages)
- Footer: "Softwarecatalogus" (title case)
- Runtime config: SITE_TITLE = "Softwarecatalogus", FOOTER_LOGO_TITLE = "Softwarecatalogus"
- Runtime config SITE_DESCRIPTION: "Local development instance of the softwarecatalogus" (lowercase in running text)

The public frontend appears consistent in using "Softwarecatalogus" (title case) in titles and "softwarecatalogus" (lowercase) in running text. Cannot verify the Nextcloud Dashboard (NC backend) spelling without admin access.
**Expected:** "softwarecatalogus" should be spelled consistently across the platform.
**Evidence:** Page titles consistently use "Softwarecatalogus". Header uses "SOFTWARECATALOGUS". Cannot check NC Dashboard without admin access.

---

## Step 3 - Organisatie activatie

## #391 - Testen met een gebruiker van een bestaande organisatie
**Status:** CANNOT_TEST
**Test Step:** Step 3
**Observed:** The login page at /login is functional with username/password fields, a "Wachtwoord vergeten?" link, and an "Aanmelden" button to register. The registration page at /register shows a multi-step wizard: Step 1 (Organisatiegegevens - Naam, Organisatietype dropdown with Leverancier default, Website), Step 2 (Contactpersoon), Step 3 (Controleren). However, this test requires logging in as an existing organization user, which requires valid credentials. The runtime config shows `ENABLE_AUTHENTICATION: false`, which may affect the test.
**Expected:** Testing with an existing organization user to verify the activation flow.
**Evidence:** Login page: /login, Register page: /register (multi-step wizard visible). No test credentials available. Runtime config ENABLE_AUTHENTICATION=false.

---

## #392 - Backend: geimporteerde gebruiker geeft error bij omzetten naar user
**Status:** CANNOT_TEST
**Test Step:** Step 3
**Observed:** This is a backend issue that requires admin access to the Nextcloud backend to test importing and converting users. No admin access is available from the public frontend.
**Expected:** Imported users should not produce errors when converted to regular users.
**Evidence:** Backend admin access required. Not testable from public frontend.

---

## Step 19 - Geavanceerde koppelingen

## #393 - Backend: fouten in voorzieningenregister
**Status:** CANNOT_TEST
**Test Step:** Step 19
**Observed:** This is a backend issue regarding errors in the voorzieningenregister. Requires admin/backend access to diagnose and verify. Not testable from the public frontend.
**Expected:** Voorzieningenregister should function without errors.
**Evidence:** Backend admin access required. Not testable from public frontend.

---

## Other Steps

## #75 - Rapportages maken over data
**Status:** CANNOT_TEST
**Test Step:** Other
**Observed:** No reporting or analytics features are visible in the public frontend. The navigation only shows Home, Organisaties, and Applicaties. No "Rapportages", "Reports", or "Analytics" menu items or pages are accessible. This feature likely requires authenticated/admin access or may not yet be implemented in the frontend.
**Expected:** Reporting features should be available to create reports about data.
**Evidence:** No reporting UI elements found in navigation, footer, or page content. Searched all visible links and buttons.

---

## #92 - Webstatistiekenpakket (analytics)
**Status:** PARTIAL
**Test Step:** Other
**Observed:** A Piwik Pro Analytics bootstrapper script is present in the page source as an inline script. However, the configuration values are all empty strings:
- srcUrl = "" (empty)
- dataLayerName = "" (empty)
- id = "" (empty)

The script contains a check: if any of these values are empty, it logs an error "Piwik Pro Analytics: srcUrl, dataLayerName of id is niet ingesteld" and does NOT load the tracking script. This means Piwik Pro is integrated but not configured/active on this environment.

No other analytics tools were found:
- SiteImprove: Not present
- Google Analytics/gtag: Not present
- Matomo: Not present

Piwik Pro is an open-source-friendly analytics platform (though not fully open source itself), which partially satisfies the requirement for an open-source web analytics tool.
**Expected:** An open source web analytics tool (like Piwik Pro or Matomo) should be in use.
**Evidence:** Inline script contains Piwik Pro bootstrapper with empty config. The Piwik Pro script is present but inactive due to missing configuration. Runtime config has no Piwik-related settings.

---

## #195 - Organisatie acties dropdown bugs
**Status:** CANNOT_TEST
**Test Step:** Other
**Observed:** This issue requires access to the Nextcloud Dashboard to test organisation action dropdown functionality. Not accessible from the public frontend.
**Expected:** Organisation action dropdowns should work correctly in the NC Dashboard.
**Evidence:** NC Dashboard admin access required.

---

## #208 - NC Dashboard organisatie overzicht table
**Status:** CANNOT_TEST
**Test Step:** Other
**Observed:** This issue requires access to the Nextcloud Dashboard to test the organisation overview table. Not accessible from the public frontend.
**Expected:** Organisation overview table should display correctly in the NC Dashboard.
**Evidence:** NC Dashboard admin access required.

---

## #209 - Help knop gaat naar niet bestaande pagina
**Status:** CANNOT_TEST
**Test Step:** Other
**Observed:** No help buttons were found anywhere in the public frontend. A JavaScript search across all `<a>`, `<button>`, and `[role="button"]` elements for any containing "help" in text, class, id, or href returned zero results. The public frontend does not appear to have a help button. This feature may only be visible in the authenticated/dashboard view, or the help button may have already been removed or relocated.
**Expected:** Help buttons should link to existing pages.
**Evidence:** JavaScript evaluation searching all interactive elements for "help" returned 0 results across homepage, search pages, and detail pages. No help-related elements found in any page tested.

---

## Summary Table

| Issue | Title | Step | Status | Notes |
|-------|-------|------|--------|-------|
| #155 | Definities via interactieve optie | 21 | PASS | Begrippenlijst button works, inline terms clickable, 10 terms loaded |
| #169 | Rest issues Organisatie/Config | 21 | PARTIAL | Footer headings are placeholders, dev config values in accept env |
| #267 | Naam softwarecatalogus vs VNG | 21 | FAIL | "VNG" only appears as logo, not in text/titles. Should be "VNG Softwarecatalogus" |
| #332 | Voorpagina inrichten | 21 | PARTIAL | Homepage exists with search/hero but only 1 English topic card, sparse content |
| #397 | CMS pagina's aanmaken | 21 | PASS | All 4 CMS pages exist and accessible (/privacyverklaring, /algemene-voorwaarden, /disclaimer, /faq) |
| #403 | Tekst verwijderen aanpassen | 21 | CANNOT_TEST | Requires authenticated access to test delete confirmations |
| #406 | SiteImprove verwijderen | 21 | PASS | No SiteImprove scripts found in page source |
| #409 | Footer inlog vs uitgelogd | 21 | PARTIAL | Footer looks good for public view, but cannot compare with authenticated view. Placeholder column headers |
| #410 | Dashboard schrijfwijze | 21 | PARTIAL | Public frontend consistent, cannot verify NC Dashboard spelling |
| #391 | Testen bestaande organisatie user | 3 | CANNOT_TEST | Requires valid user credentials |
| #392 | Backend user import error | 3 | CANNOT_TEST | Backend admin access required |
| #393 | Backend fouten voorzieningenregister | 19 | CANNOT_TEST | Backend admin access required |
| #75 | Rapportages maken | Other | CANNOT_TEST | No reporting UI visible in public frontend |
| #92 | Webstatistiekenpakket | Other | PARTIAL | Piwik Pro script present but not configured (empty values) |
| #195 | Organisatie acties dropdown | Other | CANNOT_TEST | NC Dashboard access required |
| #208 | NC Dashboard organisatie table | Other | CANNOT_TEST | NC Dashboard access required |
| #209 | Help knop niet bestaande pagina | Other | CANNOT_TEST | No help buttons found in public frontend |

### Totals
- **PASS:** 3
- **FAIL:** 1
- **PARTIAL:** 5
- **CANNOT_TEST:** 8
- **BLOCKED:** 0
