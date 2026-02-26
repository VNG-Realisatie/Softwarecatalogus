# Test Agent: Bezoeker (Public Visitor)

## Persona

**Anonymous Visitor** — A member of the public browsing the Softwarecatalogus without logging in. Could be a journalist, researcher, or municipal employee who hasn't registered yet.

## Role: Bezoeker (Unauthenticated)

The bezoeker has NO account and is NOT logged in. They can only see public pages: the search page, application detail pages, organization pages, and CMS content pages. They should NOT see any private data (gemeente contacts, usage data, connections).

## Login Credentials

**None** — This persona does NOT log in. Do NOT navigate to /login or enter any credentials.

## Test Environment

- **Frontend**: `{FRONTEND}` (default: `{FRONTEND}`)
- **Backend**: `{BACKEND}` (default: `{BACKEND}`)
- **Browser**: Use Playwright MCP browser tools (prefixed `mcp__browser-N__`, where N is assigned by the orchestrator)
- **Start URL**: `{FRONTEND}/zoeken?_page=1`

## Test Scope

### Primary Focus
- **Public search page** (`/zoeken`) — filters, results, cards, pagination
- **Public detail pages** — application, dienst, organisatie detail pages
- **Privacy verification** — ensure private data is NOT visible
- **Application branding** — correct name, title, footer

### What This Persona Tests
This persona tests everything an **unauthenticated user** sees. The search page and detail pages are the primary interface for public visitors.

## Issues to Test

| Issue | Title | Test Focus |
|-------|-------|------------|
| #267 | Naam is softwarecatalogus i.p.v. Softwarecatalogus | Verify "Softwarecatalogus" in browser tab, header, footer, homepage |
| #263 | Niet ingelogd: gebruik tab toont gemeenten | Verify "Gebruik" tab is NOT visible on application detail pages |
| #278 | Filterteksten aanpassen | Check filter labels on /zoeken are correct and consistent |
| #315 | Zoekpagina toont gemeentelijk applicatielandschap | Verify municipalities NOT shown as suppliers, no private data |
| #345 | Dienst verschijnt niet in filters | Verify "Diensttype" filter is populated, diensten appear in results |
| #347 | Dienstkaartje toont array | Verify dienst cards show readable text, not raw JSON arrays |
| #394 | Contactpersonen gemeenten publiekelijk zichtbaar | Verify gemeente contact PII is NOT visible on public pages |

## Acceptance Criteria Reference

**IMPORTANT**: Before testing each issue, read its detailed acceptance criteria in `issues.md` (in the repository root). Use these criteria to determine status:
- **PASS** = ALL acceptance criteria are met
- **PARTIAL** = Some criteria met, some not
- **FAIL** = Key criteria not met or feature is broken
- **CANNOT_TEST** = Feature not accessible or environment issue prevents testing

## RBAC Reference

As an unauthenticated visitor, you should only see data that has `"public"` read access:

| Data Type | Should Be Visible? | Notes |
|-----------|-------------------|-------|
| Applicaties (leverancier) | YES | Only where `geregistreerdDoor: Leverancier` |
| Applicaties (gemeente) | NO | Municipality application landscapes are private |
| Diensten | YES | Public schema |
| Organisaties | YES | Public schema |
| Contactpersonen (leverancier) | YES | Visible via publication extensions |
| Contactpersonen (gemeente) | NO | Private — this is the #394 bug |
| Contactpersonen (samenwerking) | NO | Private |
| Koppelingen | NO | Private schema |
| Gebruik (usage) | NO | Private schema — this is the #263 check |

## Testing Instructions

### Step 1: Navigate to Search Page
1. Navigate to `{FRONTEND}/zoeken?_page=1`
2. Do NOT log in — remain anonymous
3. Verify the page loads with search results

### Step 2: Test #267 — Application Name
1. Check the browser tab title
2. Check the header/logo area for the application name
3. Check the footer for the application name
4. Navigate to the homepage (`/`) and check
5. **Expected**: "Softwarecatalogus" everywhere (not "Development Catalogus" or just "softwarecatalogus")

### Step 3: Test #345 — Dienst in Filters
1. On `/zoeken?_page=1`, look at the available filter facets on the left
2. Look for a "Type" or filter that includes "Dienst" as an option
3. Look for a "Diensttype" filter — it should be populated with values
4. Click on a dienst-type filter value and verify results filter correctly
5. **Expected**: Diensten appear in results, diensttype filter has values

### Step 4: Test #347 — Dienst Card Display
1. Find a dienst in the search results (filter by type=Dienst if available)
2. Look at the dienst card
3. **Expected**: Service types shown as readable comma-separated text, NOT `["type1", "type2"]`
4. Check that "Concept" status is clear (tooltip or alternative term)

### Step 5: Test #278 — Filter Texts
1. On the search page, examine all filter labels
2. Verify labels are consistent with terminology used elsewhere
3. Check for:
   - "Organisatietype" filter: should contain only valid types (Leverancier, Gemeente, Samenwerking), NOT "Applicatie", "extern", "intern"
   - "Aangeboden door" or "Leverancier" filter: should only contain actual suppliers
   - Filter labels should match wizards and management page terminology

### Step 6: Test #315 — Municipal Data Exposure
1. On the search page, check the "Aangeboden door" or supplier filter
2. **Expected**: Only actual vendors/suppliers listed, NOT municipalities like "Bloemendaal-Heemstede"
3. Check search result cards — the "aangeboden door" text should show a real vendor, not a municipality
4. Check the "Organisatietype" filter — should NOT contain contaminated values
5. Navigate to an application detail page — verify the supplier is correct

### Step 7: Test #263 — Gebruik Tab Visibility
1. Find an application in search results and click it to open the detail page
2. Look at the available tabs (Beschrijving, Diensten, Standaarden, etc.)
3. **Expected**: There should be NO "Gebruik" tab visible — usage data is private
4. If a "Gebruik" tab exists, check whether it shows municipality names (it should NOT)

### Step 8: Test #394 — Contact Person Privacy
1. Navigate to an application detail page of a **leverancier** application
2. Check if contact person information is visible
3. **Expected for leverancier**: Contact person name, email, phone MAY be visible (this is expected)
4. Check the API directly: `curl {BACKEND}/index.php/apps/openregister/api/objects/voorzieningen/module?_extend[]=contactpersonen&_limit=5`
5. In the API response, check contactpersonen:
   - Leverancier contacts: expected to be visible
   - Gemeente contacts (look for `organisatie` field → type "Gemeente"): should NOT be visible
   - Samenwerking contacts: should NOT be visible
6. Also check: `curl {BACKEND}/index.php/apps/openregister/api/objects/voorzieningen/contactpersoon?_limit=5` (without auth — should return 0 results since contactpersoon is not public)

### Step 9: Additional Checks
1. Check that the search page paginates correctly
2. Verify sort options work (A-Z, Z-A, etc.)
3. Check that clicking a search result navigates to a proper detail page (not `/publicatie/undefined`)
4. Verify no "beheer" or admin links are visible in the navigation

## Output Format

Write results to: `Softwarecatalogus/test-results/bezoeker/results-public.md`

Use this format:
- Header with persona name, date, environment
- Summary table: | Issue | Title | Previous Status | Current Status | Severity |
- Per-issue sections with acceptance criteria checkboxes marked [x] or [ ]
- Evidence screenshots saved to the same directory

## Rules

- **READ ONLY on GitHub issues** — never update, close, or comment on issues
- Write test results ONLY to local files in the `test-results/` directory
- Take screenshots for evidence where applicable
- Do NOT log in — all testing is done as an anonymous visitor
