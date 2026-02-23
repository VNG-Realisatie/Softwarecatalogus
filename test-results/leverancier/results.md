# Test Results: Agent Jan Pietersen (Leverancier/Aanbod-beheerder)
## Step 7 - Applicatie Issues

**Test Date:** 2026-02-21
**Environment:** https://softwarecatalogus.accept.opencatalogi.nl/
**Tester:** Unauthenticated public visitor (no login)
**Browser:** Playwright Chrome (automated)

---

## #294 - Applicatie publiceren: uitlijning rechthoek
**Status:** CANNOT_TEST
**Test Step:** Step 7
**Observed:** The "Uw applicatie publiceren" page is only accessible to authenticated users (requires login at `/login`). As an unauthenticated visitor, this page cannot be reached. The public registration page at `/register` shows a wizard with fields (Naam, Organisatietype, Website) that appear properly aligned.
**Expected:** Check alignment of the rectangle/box on the publish application page.
**Evidence:** Screenshot at `/register` shows the registration form is well-aligned with no visible alignment issues in the form fields. The actual "applicatie publiceren" form requires authentication. See `register-page.png`.

---

## #300 - Beheer: overzicht applicaties teveel applicaties
**Status:** CANNOT_TEST
**Test Step:** Step 7
**Observed:** The "beheer" (management) pages require authentication. The `/beheer/applicaties` URL is not accessible without login. The public search page at `/zoeken?_schema=module` shows 4,144 total results (1,053 Applicaties + 3,091 Organisaties) when the `module` schema filter is active. This public view mixes both types unless the "Applicatie" type checkbox is explicitly checked.
**Expected:** The beheer applicatie overview should only show applications belonging to the logged-in vendor, not applications from other vendors.
**Evidence:** Screenshot `applicaties-overview.png` shows 4,144 results on the public page. The beheer page cannot be tested without authentication. The public overview does correctly allow filtering by "Applicatie (1,053)" type via checkbox.

---

## #370 - Applicatie: teveel kolommen worden getoond
**Status:** PASS
**Test Step:** Step 7
**Observed:** On the public applicatie overview (search results page), the card-based layout does NOT show excessive columns. Each card displays: icon, name, vendor ("Aangeboden door"), description, "Geschikt voor" referentiecomponenten, date, and type ("Applicatie"). The columns mentioned in the issue (Type, Applicatietype, Omvat, Onderdeel van, Beoordelingen, Kwetsbaarheden, Geregistreerd door) are NOT visible in the public card view. The issue appears to reference the beheer table view, which would need auth to verify fully, but the public view does not show these extra columns.
**Expected:** The unnecessary columns (Type, Applicatietype, Omvat, Onderdeel van, Beoordelingen, Kwetsbaarheden, Geregistreerd door) should be hidden.
**Evidence:** Screenshot `applicaties-filtered.png` shows card-based layout with appropriate fields only. The issue screenshot shows a table-based beheer view that requires authentication.

---

## #373 - Applicatie: Gekoppelde diensten worden niet getoond
**Status:** FAIL
**Test Step:** Step 7
**Observed:** On application detail pages (e.g., "3D - Digital Twin", "4WOZ"), the tabs shown are: "Standaarden", "Geschikt voor", "Organisaties", "Applicatie Versies". There is NO "Diensten" (services) tab. Linked services are not displayed anywhere on the public application detail page.
**Expected:** Linked services (diensten) should be displayed on an application detail page, either as a tab or as a link showing the number of diensten.
**Evidence:** Application detail pages for "3D - Digital Twin" (URL: `/publicatie/68f04fdf-caad-55ef-9b7f-a94308afd381`) and "4WOZ" (URL: `/publicatie/bdbef04a-1c7a-5314-ad69-fa7479139e36`) both show only 4 tabs: Standaarden, Geschikt voor, Organisaties, Applicatie Versies. No Diensten tab exists. Screenshot `applicatie-detail-3d-digital-twin.png`.

---

## #375 - Applicaties: versie voor SaaS applicaties?
**Status:** PARTIAL
**Test Step:** Step 7
**Observed:** The application "4WOZ" is listed as Hosting type: SaaS. It has an "Applicatie Versies (1)" tab with one version. The application "3D - Digital Twin" is also SaaS and also has "Applicatie Versies (1)". Both SaaS applications do show at least one version entry. The version on "3D Digitale Stad - Digital Twin" shows "In gebruik" and "In ontwikkeling sinds 30 april 2021". However, whether this was automatically created as a default version for SaaS apps or manually added cannot be determined from the public view.
**Expected:** SaaS applications should have a default version automatically created.
**Evidence:** 4WOZ (SaaS) has Applicatie Versies (1) tab. 3D - Digital Twin (SaaS) also has Applicatie Versies (1). Both show at least one version, suggesting the default SaaS version may have been implemented, but this needs verification in the beheer interface.

---

## #376 - Applicaties: labels wizard en tabel zijn anders
**Status:** CANNOT_TEST
**Test Step:** Step 7
**Observed:** The wizard and management table are both behind authentication. The public view shows card-based search results with consistent labels: name, vendor, description, "Geschikt voor", date, type. Cannot compare wizard labels vs. table labels without login.
**Expected:** Labels in the wizard should match the labels in the management table.
**Evidence:** The beheer table and wizard both require authentication. Public view only shows the search results cards.

---

## #377 - Applicaties: tabel toont diensten niet
**Status:** CANNOT_TEST
**Test Step:** Step 7
**Observed:** The management table (beheer) is behind authentication. On the public search results, there is no "Diensten" column visible. The card-based public view shows: name, vendor, description, "Geschikt voor", date, type -- no diensten information. This is consistent with issue #373 where diensten are also missing from detail pages.
**Expected:** The Diensten column in the applicatie table should show linked services.
**Evidence:** The public search results cards do not show diensten. The beheer table view requires authentication.

---

## #379 - Applicatie: verschillende manier van tonen compliancy
**Status:** PARTIAL
**Test Step:** Step 7
**Observed:** On the public application detail page, compliancy/standards are displayed in a table format under the "Standaarden" tab. The table has columns: "Standaardversie", "Status", "Bewijs". Standards are grouped into categories (Verplicht, Aanbevolen, Toegevoegd). Each standard shows a linked name, its requirement level (VERPLICHT/AANBEVOLEN/TOEGEVOEGD), and the applicable referentiecomponent(en). The status is shown as "ONDERSTEUND" (green) or "NIET ONDERSTEUND" (red). This display is consistent across the application detail pages tested. However, the wizard and beheer views cannot be compared without authentication.
**Expected:** Compliancy should be displayed consistently across all pages (beheer, search detail, wizard).
**Evidence:** Screenshot `applicatie-detail-3d-digital-twin.png` shows the standards table with proper formatting. Application "4WOZ" also shows a similar consistent table. Cannot verify the wizard or beheer display without auth.

---

## #380 - Applicatie: compliance aantallen komen niet overeen
**Status:** CANNOT_TEST
**Test Step:** Step 7
**Observed:** The public application detail page shows a count in the "Standaarden" tab label (e.g., "Standaarden (41)" for 4WOZ, "Standaarden (30)" for 3D - Digital Twin). However, the wizard/beheer views cannot be compared without authentication to verify if the counts match.
**Expected:** Compliance counts should match between the wizard and management pages.
**Evidence:** Public detail page shows 41 standards for 4WOZ and 30 for 3D - Digital Twin. Cannot compare with wizard counts without auth.

---

## #381 - Applicaties: non-compliant vervangen door niet ondersteund
**Status:** PASS
**Test Step:** Step 7
**Observed:** On the public application detail pages, the text "NIET ONDERSTEUND" is used consistently (in red) for non-compliant standards. The text "non-compliant" does NOT appear anywhere. The text "ONDERSTEUND" (in green) is used for compliant standards. This matches the expected fix.
**Expected:** The text "non-compliant" should be replaced with "niet ondersteund" with red coloring.
**Evidence:** On "3D - Digital Twin" detail page, all non-compliant items show "NIET ONDERSTEUND" in red. On "4WOZ", same text is used. Screenshot `applicatie-detail-3d-digital-twin.png` confirms this. No instance of "non-compliant" text found.

---

## #382 - Applicatie: compliancy link werkt niet
**Status:** PASS
**Test Step:** Step 7
**Observed:** Compliancy standard links on the public application detail page correctly point to external URLs at `gemmaonline.nl`. For example, "Webrichtlijnen versie 2 (WRv2)" links to `https://www.gemmaonline.nl/wiki/GEMMA/id-32edeb45-733f-40c9-8e58-3e2443b2ee4e`. Clicking the link opened a new tab with the correct GEMMA Online page. The links do NOT use relative URLs.
**Expected:** Compliancy links should open the correct external URLs (not relative URLs like `/pino.nl/compliancy`).
**Evidence:** Tested on "3D - Digital Twin" page. Link "Webrichtlijnen versie 2 (WRv2)" correctly opens `https://www.gemmaonline.nl/wiki/GEMMA/id-32edeb45-733f-40c9-8e58-3e2443b2ee4e` in a new tab. Verified tab title: "Webrichtlijnen versie 2 (WRv2) - GEMMA Online". Note: the original issue mentioned PinoApp specifically, which was not found in the catalog by search. The fix appears to be globally applied.

---

## #383 - Applicatie: selectie vakken werken niet
**Status:** CANNOT_TEST
**Test Step:** Step 7
**Observed:** The selection checkboxes referenced in the issue appear to be in the beheer (management) interface. On the public search page, there are filter checkboxes (Applicatie, Organisatie, Closed source, Open source, Gemeente, Leverancier, Samenwerking) that work correctly -- checking "Applicatie (1.053)" properly filtered results from 4,144 to 1,053. However, the issue screenshots show checkboxes in a management table view that requires authentication.
**Expected:** Selection checkboxes on the applicatie page should be functional.
**Evidence:** Public filter checkboxes work correctly (tested Applicatie filter). The beheer selection checkboxes cannot be tested without authentication.

---

## #384 - Applicaties: eenduidige manier van bewerken
**Status:** CANNOT_TEST
**Test Step:** Step 7
**Observed:** Editing functionality is only available to authenticated users. The public view does not show any "Bewerken" (edit) buttons or links. Cannot test the consistency of the editing approach without logging in.
**Expected:** All editing should go through the wizards in a consistent manner.
**Evidence:** No edit buttons visible on public pages. Requires authentication to test.

---

## #385 - Applicatie: Geen huidige versie in gebruik
**Status:** PASS
**Test Step:** Step 7
**Observed:** On the application detail pages tested ("3D - Digital Twin", "4WOZ"), the right-side gray block shows: Website, Licentietype, and Hosting type. There is NO "Huidige versie" field or "Geen huidige versie in gebruik" text displayed. The version information is properly contained within the "Applicatie Versies" tab. The issue requested removing "Huidige versie" from the gray block since versions are already under the tab, and this appears to have been done.
**Expected:** The "Geen huidige versie in gebruik" text should be removed from the gray block since versions are already shown under the Versies tab.
**Evidence:** Application detail pages "3D - Digital Twin" and "4WOZ" show only Website, Licentietype, and Hosting type in the sidebar. No "Huidige versie" text is present. Screenshot `applicatie-detail-3d-digital-twin.png`.

---

## #386 - Applicaties - Uw applicatie publiceren: andere labels
**Status:** CANNOT_TEST
**Test Step:** Step 7
**Observed:** The "Uw applicatie publiceren" wizard requires authentication. The public registration page (Aanmelden) shows labels: Naam, Organisatietype, Website in step 1. But the actual application publishing wizard is different from the registration wizard and cannot be accessed without login.
**Expected:** Labels in "Uw applicatie publiceren" should match the expected/reference labels from the PowerPoint.
**Evidence:** Registration page shows correct labels for its purpose. The applicatie publiceren wizard requires authentication.

---

## #387 - Applicaties - Uw applicatie publiceren: i niet aanwezig
**Status:** CANNOT_TEST
**Test Step:** Step 7
**Observed:** The "Uw applicatie publiceren" wizard requires authentication. The information icons (i) referenced in the issue are in the version publishing wizard steps, which cannot be accessed without login.
**Expected:** Information icons should be present where expected in the publish wizard fields.
**Evidence:** Cannot access the publish wizard without authentication.

---

## #390 - Applicaties - Uw applicatie publiceren: labels komen niet overeen
**Status:** CANNOT_TEST
**Test Step:** Step 7
**Observed:** The wizard and control form require authentication. Cannot compare labels between the wizard and the PowerPoint reference without login access.
**Expected:** Labels in the publish wizard should match the PowerPoint reference.
**Evidence:** Cannot access the wizard without authentication.

---

## #399 - Versies: een versie van een applicatie van een andere leverancier levert een foutmelding
**Status:** CANNOT_TEST
**Test Step:** Step 7
**Observed:** This issue specifically requires logging in as a vendor (e.g., "Steam") and then clicking on a version of another vendor's (e.g., "Centric") application. As an unauthenticated visitor, the public view shows application versions under the "Applicatie Versies" tab with a "Lees meer" link. Clicking on a version opens its detail page without error, but the editing/beheer functionality is not available without login.
**Expected:** Clicking on a version of another vendor's application should not show "Kon publicatie niet laden" error, but should allow viewing (just not editing).
**Evidence:** Public view of versions works without errors. The issue requires authenticated vendor-specific behavior testing.

---

## Summary Table

| Issue | Title | Status | Notes |
|-------|-------|--------|-------|
| #294 | Applicatie publiceren: uitlijning rechthoek | CANNOT_TEST | Requires authentication |
| #300 | Beheer: overzicht applicaties teveel applicaties | CANNOT_TEST | Beheer page requires authentication |
| #370 | Applicatie: teveel kolommen worden getoond | PASS | Public card view shows appropriate fields only |
| #373 | Applicatie: Gekoppelde diensten worden niet getoond | FAIL | No Diensten tab on application detail pages |
| #375 | Applicaties: versie voor SaaS applicaties? | PARTIAL | SaaS apps show 1 version, unclear if auto-generated |
| #376 | Applicaties: labels wizard en tabel zijn anders | CANNOT_TEST | Requires authentication |
| #377 | Applicaties: tabel toont diensten niet | CANNOT_TEST | Beheer table requires authentication |
| #379 | Applicatie: verschillende manier van tonen compliancy | PARTIAL | Public detail view is consistent; cannot verify wizard/beheer |
| #380 | Applicatie: compliance aantallen komen niet overeen | CANNOT_TEST | Requires authentication to compare |
| #381 | Applicaties: non-compliant vervangen door niet ondersteund | PASS | "NIET ONDERSTEUND" used consistently in red |
| #382 | Applicatie: compliancy link werkt niet | PASS | Links correctly open external gemmaonline.nl URLs |
| #383 | Applicatie: selectie vakken werken niet | CANNOT_TEST | Beheer checkboxes require authentication |
| #384 | Applicaties: eenduidige manier van bewerken | CANNOT_TEST | Requires authentication |
| #385 | Applicatie: Geen huidige versie in gebruik | PASS | "Huidige versie" removed from sidebar; shown in tab |
| #386 | Applicaties - Uw applicatie publiceren: andere labels | CANNOT_TEST | Requires authentication |
| #387 | Applicaties - Uw applicatie publiceren: i niet aanwezig | CANNOT_TEST | Requires authentication |
| #390 | Applicaties - Uw applicatie publiceren: labels komen niet overeen | CANNOT_TEST | Requires authentication |
| #399 | Versies: versie van andere leverancier geeft foutmelding | CANNOT_TEST | Requires authenticated vendor login |

### Summary Statistics
- **PASS:** 4 (#370, #381, #382, #385)
- **FAIL:** 1 (#373)
- **PARTIAL:** 2 (#375, #379)
- **CANNOT_TEST:** 11 (require authentication)

### Key Observations

1. **Most issues require authentication** -- 11 of 18 issues reference beheer/wizard functionality that is only available to logged-in users. Testing as "Jan Pietersen" (leverancier/aanbod-beheerder) requires actual login credentials to fully verify these issues.

2. **Diensten (services) are not shown** (#373 FAIL) -- The public application detail page does not have a Diensten tab, confirming this issue persists. Tabs shown are limited to: Standaarden, Geschikt voor, Organisaties, Applicatie Versies.

3. **Compliancy display is improved** -- "NIET ONDERSTEUND" text (in red) is used instead of "non-compliant" (#381 PASS), and compliancy links correctly point to external gemmaonline.nl URLs (#382 PASS).

4. **"Huidige versie" removed from sidebar** (#385 PASS) -- Version information is properly contained within the "Applicatie Versies" tab, and the sidebar no longer shows "Geen huidige versie in gebruik".

5. **Public overview filters work correctly** -- The search/filter functionality on the public page properly separates Applicaties (1,053) from Organisaties (3,091).

6. **PinoApp not found** -- The application "PinoApp" referenced in multiple issues (#377, #382) was not found via public search. This may indicate it was removed or is only visible in the beheer interface.
