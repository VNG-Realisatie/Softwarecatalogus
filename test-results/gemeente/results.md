# Gemeente Test Results - Maria van der Berg (gebruik-beheerder)

**Date:** 2026-02-21
**Environment:** https://softwarecatalogus.accept.opencatalogi.nl/
**Tester:** Maria van der Berg (gemeente testing agent)
**Role:** Unauthenticated visitor (public view)
**Browser:** Playwright (Chrome)

---

## Step 14 - Zoeken Issues

## #144 - Overzicht organisaties met zoek- en filteropties
**Status:** PASS
**Test Step:** Step 14
**Observed:** The Organisaties overview page is accessible via the top navigation link "Organisaties" which navigates to `/zoeken?_schema=organisatie`. The page displays 4,144 results with a full set of search and filter options. The search bar allows searching by name or keyword. Filters are displayed on the right side and include: Type (Applicatie/Organisatie), Leverancier (280 options), Licentievorm (Closed source/Open source), Referentiecomponenten (161 options), Standaardversies (270 options), Samenwerkingstype (14 options), Geregistreerd door (Gemeente/Leverancier/Samenwerking), and Organisatietype (Applicatie/Gemeente/Leverancier/Samenwerking). Filtering by Organisatietype works correctly with counts shown per type. The active filter "organisatie" is displayed as a removable chip. A "Wis alle filters" (Clear all filters) button is available.
**Expected:** An overview with search and filter options for organizations offering packages or services.
**Evidence:** URL visited: `https://softwarecatalogus.accept.opencatalogi.nl/zoeken?_schema=organisatie`. Organisatietype filter present with 4 options: Applicatie (1051), Gemeente (348), Leverancier (2652), Samenwerking (91). Active filter chip "organisatie" visible. Search box with placeholder "Zoek op naam of trefwoord" present.

## #280 - Zoeken: sorteren gaat niet goed
**Status:** PARTIAL
**Test Step:** Step 14
**Observed:** Sorting functionality was tested extensively:
1. **A-Z sort works:** Default sort is "Naam - A naar Z". Results correctly start with 050media, 1Password.com, 2150, 21South, 2da... alphabetically.
2. **Z-A sort works:** Changing to "Naam - Z naar A" correctly shows Zynyo, ZXY Cloud, Zwolle... in reverse alphabetical order.
3. **Sorting after text search WORKS:** Searched for "Centric" with Z-A sort active. Results correctly showed 119 results in Z-A order (Zakenmagazijn, XCENT, WDBCenter...). Switching to A-Z while "Centric" search was active correctly re-sorted results (Basisgemeentesuite NHR, BR Controls, CAD Accent...).
4. **Sort persistence:** Sort selection persists when typing a search query.
5. **Sort options available:** "Meest relevant", "Datum - oud naar nieuw", "Datum - nieuw naar oud", "Naam - A naar Z", "Naam - Z naar A".
6. **Server-side sorting confirmed:** The URL changes to include `_order[_name]=asc` or `_order[_name]=desc`, confirming sorting is done server-side across ALL results, not just the visible page.

The "PARTIAL" status is because while basic sorting works correctly now (including after text search), I cannot confirm the behavior across all edge cases reported in the original issue without exhaustive pagination testing.
**Expected:** Sorting should work correctly across all pages and remain effective after text search. Based on the issue, sorting after text search previously had no effect.
**Evidence:** URLs visited: `/zoeken?_schema=organisatie` (A-Z default), `/zoeken?_schema=organisatie&_order[_name]=desc&_page=1` (Z-A), `/zoeken?_schema=organisatie&_page=1&_search=Centric&_order[_name]=asc` (A-Z after search). Sort order correctly changes result ordering in all cases tested.

## #340 - Bevindingen op tussenoplevering Zoeken
**Status:** PARTIAL
**Test Step:** Step 14
**Observed:** Multiple findings tested:

**1. Performance:** There is a noticeable loading delay on initial page load. When navigating to the search page, results initially show "0 resultaten" with "Geen titel" placeholder cards and "No filters available" for approximately 2-5 seconds before data populates. This occurs on every fresh page navigation. The filter facet labels require resolving 538 UUIDs in the background, with console logs showing names being fetched and cached. After the initial load, subsequent interactions (sorting, searching) are responsive.

**2. Sorting:**
- Default sort IS "Naam - A naar Z" (the issue says default should NOT be this). OBSERVATION: The default sort shown on initial load is "Naam - A naar Z" [selected].
- "Meest relevant" option EXISTS in the dropdown but is not selected by default.
- Cards show a date (e.g., "30 maart 2020") but no label indicating what this date represents (the issue requests showing "Eerste registratie" using @self.created).
- Sorting after text search WORKS correctly (previously reported as broken).

**3. Filters:**
- "Schema" has been renamed to "Type" - CONFIRMED. The filter heading says "Type (2)" with options "Applicatie" and "Organisatie".
- Active filter indication persists after text search - CONFIRMED. The "organisatie" filter chip remained visible and active after performing a text search.
- No "Soort dienst" or "Diensttype" label was found in the public search view. This may only appear in authenticated/admin views.

**4. Text renaming:**
- "Soort dienst" to "Diensttype": NOT VISIBLE in public search view. Cannot verify.

**Expected:** Performance improvements, correct default sort, "Meest relevant" explanation, date labels on cards, "Schema" renamed to "Type", "Soort dienst" renamed to "Diensttype", persistent filter indication.
**Evidence:**
- Loading delay observed on every page navigation (placeholder "Geen titel" cards visible for 2-5 seconds).
- Console shows "Resolving 538 UUIDs in background for facets" and individual name resolution calls with some 404 errors for missing names.
- Sort dropdown shows "Naam - A naar Z" as default selected option.
- Filter heading confirmed as "Type (2)" not "Schema".
- Active filter chip "organisatie" persists through search and sort changes.
- Date shown on cards without label (just the date string like "30 maart 2020").

## #344 - Zoeken: Geen resultaten bij Gravenbeheercomponent (niet ingelogd)
**Status:** PASS
**Test Step:** Step 14
**Observed:** Navigated to the specific URL from the issue: `https://softwarecatalogus.accept.opencatalogi.nl/zoeken?@self[schema]=16&referentieComponenten[]=6d928d61-febe-4994-9b20-3df92ad1cf6c&_page=1`. The page now correctly returns **6 resultaten** (6 results):
1. BAM 2020 Online (HTA Software) - Applicatie
2. Burger- en BedrijvenBoxx (Gemboxx) - Applicatie
3. Centric Begraven (Centric) - Applicatie
4. Greenpoint (Greenpoint Advies) - Applicatie
5. IBurgerzaken (PinkRoccade Local Government) - Applicatie
6. SBA Forms (Stadsbeheer b.v.) - Applicatie

The active filter chip shows "Gravenbeheercomponent" correctly. Note: the `@self[schema]=16` parameter was stripped from the URL (page redirected to just the referentieComponenten filter), but results still appear correctly.
**Expected:** Results should appear when filtering by Gravenbeheercomponent referentiecomponent (the issue reported 0 results).
**Evidence:** URL visited: `https://softwarecatalogus.accept.opencatalogi.nl/zoeken?@self[schema]=16&referentieComponenten[]=6d928d61-febe-4994-9b20-3df92ad1cf6c&_page=1`. Page shows "6 resultaten" with filter chip "Gravenbeheercomponent" active. Leverancier filter shows 6 distinct suppliers. All results are of type "Applicatie".

## #342 - Zoeken: op kaartjes aantal referentiecomponenten duidelijk maken
**Status:** FAIL
**Test Step:** Step 14
**Observed:** Search result cards do NOT show referentiecomponenten information at all. Each card displays:
- An image/icon
- Title (heading)
- Provider name (for applications, e.g., "(Aangeboden door Centric)")
- Brief description (for applications that have one)
- A date (e.g., "30 maart 2020")
- Type indicator (Organisatie/Applicatie)
- "Lees meer over [name]" link

There is no count, list, or "Meer" link for referentiecomponenten on the cards. When viewing a detail page (BAM 2020 Online), the referentiecomponenten are visible through the "Geschikt voor" tab, but this information is not surfaced on the search result cards.
**Expected:** When there are more referentiecomponenten than can fit on screen, the card should show the total number or a "Meer" link pointing to the application page.
**Evidence:** Examined 20+ search result cards on `/zoeken?_schema=organisatie` and `/zoeken?_schema=module`. None of the cards show referentiecomponenten counts or listings. The detail page for BAM 2020 Online shows a tab "Geschikt voor (1)" but this data is not shown on the search card.

---

## Step 13 - Export Issues

## #15 - Data vanuit softwarecatalogus exporteren
**Status:** CANNOT_TEST
**Test Step:** Step 13
**Observed:** No export button or functionality was found on the public search/overview pages. The search page (`/zoeken`) does not have any visible export option for unauthenticated users. The page contains only: search bar, sort dropdown, result cards, pagination, and filters. No export icon, button, or menu item was visible. This functionality likely requires authentication with aanbod-beheerder or gebruik-beheerder role.
**Expected:** Users should be able to export data from the softwarecatalogus for use in spreadsheets or other purposes.
**Evidence:** Examined the full search page layout at `/zoeken?_schema=organisatie` and `/zoeken?_schema=module`. No export button, icon, or link found. Login page exists at `/login` but no credentials available for testing.

## #355 - Diensten: Export geeft allerlei UUID's
**Status:** CANNOT_TEST
**Test Step:** Step 13
**Observed:** Cannot test export functionality as it requires authentication. However, a related issue was observed in the public view: on the search results page with Z-A sorting, one result card showed "(Aangeboden door 236cb622-f9d2-5e31-ad03-d54fb036b68a)" - a raw UUID instead of a readable organization name. This indicates that UUID resolution to readable names is still incomplete for some records. Console logs confirm this: "Name not found (404) for 236cb622-f9d2-5e31-ad03-d54fb036b68a" and 7 other UUIDs that return 404 errors from the names API endpoint.
**Expected:** Export should show readable text instead of UUIDs.
**Evidence:** UUID visible in search result card: "Zorg-Portaal" shows "(Aangeboden door 236cb622-f9d2-5e31-ad03-d54fb036b68a)" instead of a human-readable name. Console errors show 8 UUIDs returning 404 from `/api/names/` endpoint. Export testing requires authentication.

---

## Step 4 - Login/Navigation Issues

## #266 - Na inloggen: Mijn account & persoonlijke gegevens leeg?
**Status:** CANNOT_TEST
**Test Step:** Step 4
**Observed:** Login page is accessible at `/login` with fields for "Gebruikersnaam" and "Wachtwoord". No credentials are available for testing. This issue requires logging in and checking "Mijn account" and "persoonlijke gegevens" pages.
**Expected:** After logging in, "Mijn account" and "persoonlijke gegevens" pages should show user data.
**Evidence:** Login page verified at `https://softwarecatalogus.accept.opencatalogi.nl/login`. Form contains username and password fields. Cannot proceed without credentials.

## #350 - Link achter gebruikersnaam verwijzen naar Mijn account
**Status:** CANNOT_TEST
**Test Step:** Step 4
**Observed:** The username link is only visible when logged in. As an unauthenticated visitor, the top navigation shows "Aanmelden" and "Inloggen" links instead of a username. Cannot verify the behavior of the username link without authentication.
**Expected:** The username link at the top should navigate to "Mijn account" instead of the dashboard.
**Evidence:** Unauthenticated navigation shows "Aanmelden" (/register) and "Inloggen" (/login) links. No username visible.

## #395 - Menu linkerkant verdwijnt
**Status:** PARTIAL
**Test Step:** Step 4
**Observed:** In the public (unauthenticated) view, there is no left-side menu. The public pages use a top navigation bar (Hoofdnavigatie) with links: Home, Organisaties, Applicaties. The filters panel appears on the right side of the search results. On page refresh (F5), the top navigation and filter panel both persist correctly after the initial loading delay (filters show "No filters available" briefly during loading, then populate).

However, there is a notable loading issue: on initial page load/refresh, the page briefly shows "0 resultaten", "Geen titel" placeholder cards, and "No filters available" for 2-5 seconds before content appears. While the navigation never disappears, this loading state could be confused with content disappearing.

The left-side menu mentioned in the issue (#395) is likely the admin/authenticated navigation sidebar visible in the backend, which is not accessible in public view. This issue needs to be tested in an authenticated session.
**Expected:** Left-side menu should persist after page refresh (F5/Ctrl+R).
**Evidence:** Navigated to `/zoeken?_schema=module`, observed page load: initial state shows "0 resultaten" and "No filters available" for ~3 seconds, then full content loads with navigation intact. Top navigation (Home, Organisaties, Applicaties) persists through refreshes. No left-side menu visible in public view.

---

## Additional Observations

### Loading State Issues
On every page navigation (not just search), the SPA shows a loading state where:
- Results heading shows "0 resultaten"
- Cards show "Geen titel" (No title) with links to `/publicatie/undefined`
- Filters show "No filters available"
- This lasts approximately 2-5 seconds before content loads

This is a user experience issue that could confuse users into thinking results are empty.

### UUID Resolution Failures
Console logs show 8 UUIDs that consistently fail to resolve to names (returning 404):
- 108f0876-5d19-5800-858c-e04ba9ebdd33
- 236cb622-f9d2-5e31-ad03-d54fb036b68a
- 2bddf1c5-06cc-5dc1-9e44-fb936d68a28d
- a748dbad-8bce-5e72-a848-b3e3a787d232
- b281986f-77c7-568c-9712-055dba0f54da
- cd5fcd3b-4b4a-5d9d-814a-5e44c3f904b9
- da63cb18-a487-52e4-9970-f01bfa9057fb
- c2eded21-8db0-11e3-67ab-0050568a6153

These UUIDs appear as raw strings in filter labels and at least one search result card ("Zorg-Portaal" shows UUID instead of provider name).

### Filter Schema URL Handling
When navigating to the Organisaties page via URL `?_schema=organisatie`, the `_schema` parameter is displayed as a removable filter chip (e.g., "organisatie" or "module"). Removing this chip shows all results across both types. The Applicaties page (`?_schema=module`) shows the same 4,144 total results, suggesting the filter is either applied differently or the count includes all types regardless of the `_schema` parameter.

---

## Summary

| Issue | Title | Status | Notes |
|-------|-------|--------|-------|
| #144 | Overzicht organisaties met zoek- en filteropties | PASS | Full search/filter functionality working |
| #280 | Zoeken: sorteren gaat niet goed | PARTIAL | Sorting works correctly including after text search; cannot exhaustively test all edge cases |
| #340 | Bevindingen op tussenoplevering Zoeken | PARTIAL | Schema->Type rename done; sorting after search fixed; loading delay persists (2-5s); default sort still "Naam - A naar Z"; date labels missing on cards |
| #344 | Geen resultaten bij Gravenbeheercomponent | PASS | Now returns 6 results correctly (was 0) |
| #342 | Kaartjes aantal referentiecomponenten | FAIL | Cards do not show referentiecomponenten count or "Meer" link |
| #15 | Data exporteren | CANNOT_TEST | No export visible for unauthenticated users; requires login |
| #355 | Export geeft UUID's | CANNOT_TEST | Export requires authentication; UUID issue observed in public view (search card shows raw UUID as provider name) |
| #266 | Mijn account leeg na inloggen | CANNOT_TEST | Requires authentication |
| #350 | Link gebruikersnaam naar Mijn account | CANNOT_TEST | Requires authentication |
| #395 | Menu linkerkant verdwijnt | PARTIAL | No left menu in public view; top nav persists through refreshes; loading delay creates brief "empty" state |

**Total:** 2 PASS, 1 FAIL, 3 PARTIAL, 0 BLOCKED, 4 CANNOT_TEST
