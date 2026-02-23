# Test Softwarecatalogus — Orchestrator

Run automated browser tests for the GEMMA Softwarecatalogus using 7 persona-based testing agents.

**Input**: Optional argument after `/test-softwarecatalog`:
- No argument → run all 7 personas in parallel
- Comma-separated persona names → run only those (e.g., `leverancier,gemeente,bezoeker`)
- `summary-only` → regenerate the summary report from existing results without re-running tests

**Valid persona names**: `leverancier`, `gemeente`, `security-officer`, `functioneel-beheerder`, `samenwerking`, `architectuur-expert`, `bezoeker`

---

## Shared Context (inject into every sub-agent)

All sub-agents share this context:

### Environment
- **Frontend**: http://localhost:3000/
- **Backend**: http://localhost:8080/
- **Login URL**: http://localhost:3000/login
- **Backend Admin**: http://localhost:8080/ (admin/admin)

### OAS Documentation URLs
These auto-generated OpenAPI specs document the available API endpoints and schemas:
- **Voorzieningen register (id=2)**: http://localhost:8080/index.php/apps/openregister/api/registers/2/oas
- **GEMMA/AMEFF register (id=4)**: http://localhost:8080/index.php/apps/openregister/api/registers/4/oas

Use these when testing issues related to API access, OAS documentation, or public API availability (e.g., #85, #148).

### Login Procedure
1. Navigate to http://localhost:3000/login
2. **Before entering credentials**: Use `browser_evaluate` to run `localStorage.clear()` — this removes stale sessions from previous agents
3. Enter the persona's username and password
4. Verify the dashboard loads after login

### Acceptance Criteria
Before testing each issue, read its detailed acceptance criteria in `Softwarecatalogus/issues.md`. Each issue has specific, testable acceptance criteria with checkboxes. Use these to determine status:
- **PASS** = ALL acceptance criteria are met
- **PARTIAL** = Some criteria met, some not
- **FAIL** = Key criteria not met or feature is broken
- **CANNOT_TEST** = Feature not accessible or environment issue prevents testing

### CMS Page Management
CMS pages (privacy, terms, FAQ, disclaimer) are managed in the **OpenCatalogi** Nextcloud backend app:
- **Pages URL**: http://localhost:8080/index.php/apps/opencatalogi/pages#
- **Themes URL**: http://localhost:8080/index.php/apps/opencatalogi/themes#
- **IMPORTANT**: The URL pattern is `/apps/opencatalogi/pages#` (NOT `/#/pages`)
- **Features**: Create, edit, delete, copy pages with title, slug, summary, description
- **Public API**: `GET /index.php/apps/opencatalogi/api/pages/{slug}`
- Relevant for issues: #397 (CMS page creation), #332 (front page), themes management

### RBAC Reference
The authoritative RBAC rules are defined in the register JSON configuration:
- **File**: `softwarecatalog/lib/Settings/softwarecatalogus_register.json`
- Each schema has an `"authorization"` block with `create`, `read`, `update`, `delete` rules
- Rules can be simple group names (e.g., `"public"`, `"gebruik-beheerder"`) or conditional: `{ "group": "aanbod-beheerder", "match": { "_organisation": "$organisation" } }` (only own org's data)

**Key RBAC rules for testing:**

| Schema | Public Read | aanbod-beheerder Read | gebruik-beheerder Read |
|--------|------------|----------------------|----------------------|
| **contactpersoon** | NO (but leverancier contact persons ARE expected to be publicly visible via publications) | Own org only | ALL |
| **module** (applicatie) | Only where `geregistreerdDoor: Leverancier` | Own org only | ALL |
| **koppeling** | NO | Own org only | ALL |
| **gebruik** | NO | Own org only | ALL |
| **organisatie** | YES (all) | ALL | ALL |
| **dienst** | YES (all) | ALL | ALL |

**Important RBAC notes for agents:**
- **Contactpersonen of leveranciers are expected to be publicly visible.** Only gemeente/samenwerking contact persons should be hidden from public view. When testing #394, verify that ONLY leverancier contact persons are exposed — not gemeente ones.
- **Applicatielandschappen page may be visible** to aanbod-beheerder, but should only show applications belonging to their own organization. When testing #105, verify the page shows ONLY own-org data, not that the page itself is blocked.
- When unsure about RBAC, read the register JSON file directly to check the `authorization` block for the relevant schema.

### Rules
- **READ ONLY on GitHub issues** — NEVER update, close, or comment on issues
- Write test results ONLY to local files in `Softwarecatalogus/test-results/`
- Take screenshots as evidence where applicable

---

## Persona Registry

| Key | Skill File | Persona | Role | Organization |
|-----|-----------|---------|------|--------------|
| `leverancier` | `test-leverancier.md` | Jan Pietersen | Aanbod-beheerder (Vendor) | Test Leverancier BV |
| `gemeente` | `test-gemeente.md` | Maria van der Berg | Gebruik-beheerder (Municipality) | Test Gemeente |
| `security-officer` | `test-security-officer.md` | Mark Jansen | Gebruik-beheerder (Security) | Test Gemeente |
| `functioneel-beheerder` | `test-functioneel-beheerder.md` | Peter van Dijk | Admin (Functional Manager) | (Default / admin) |
| `samenwerking` | `test-samenwerking.md` | Linda Bakker | Gebruik-beheerder (Collaboration) | Test Samenwerking |
| `architectuur-expert` | `test-architectuur-expert.md` | Dr. Sarah de Vries | VNG-raadpleger (Architecture) | (Default / VNG) |
| `bezoeker` | `test-bezoeker.md` | Anonymous Visitor | Bezoeker (Unauthenticated) | (none — public) |

---

## Steps

### Step 0: Environment Setup

Run the setup script to create test organizations, contact persons, user accounts, and link everything together:

```bash
bash Softwarecatalogus/test-setup.sh
```

This script creates:
- 6 Nextcloud user accounts with proper group assignments
- 4 organizations (Test Leverancier BV, Test Gemeente, Test Samenwerking, Test Leverancier 2)
- 4 contact persons linked to their organizations
- Joins each user to their org and sets it as active
- Clears rate limiting / brute force protection

The script is idempotent — it can be run multiple times safely (existing users/orgs are skipped).

**Skip this step** if running with `summary-only` argument or if you've already run the setup script in this session.

### Step 1: Parse Arguments

Read the argument provided after `/test-softwarecatalog`:

- **No argument or empty**: Set `personas` to all 7: `leverancier, gemeente, security-officer, functioneel-beheerder, samenwerking, architectuur-expert, bezoeker`
- **`summary-only`**: Skip to Step 4 (summary generation)
- **Comma-separated names**: Parse into list, validate each against the persona registry. If invalid name found, show error and list valid names.

### Step 2: Launch Sub-Agents in Parallel

For each persona in the `personas` list, launch a Task agent **in parallel** (all in a single message with multiple Task tool calls). Use `subagent_type: "general-purpose"`.

**Browser assignment per persona** (use these when launching sub-agents):

| Persona | Browser |
|---------|---------|
| `leverancier` | `browser-1` |
| `gemeente` | `browser-2` |
| `security-officer` | `browser-3` |
| `functioneel-beheerder` | `browser-4` |
| `samenwerking` | `browser-5` |
| `bezoeker` | `browser-6` |
| `architectuur-expert` | `browser-7` |

Note: All 7 browsers are used. The bezoeker uses browser-6 (does not need headed mode since it's unauthenticated public testing).

**Sub-agent prompt template** (replace `{persona}` with the persona key and `{browser_num}` with the assigned browser number):

```
You are a testing agent for the GEMMA Softwarecatalogus.

Read and follow the instructions in the skill file at:
Softwarecatalogus/.claude/skills/test-{persona}.md

This file contains your persona details, login credentials, test scope, and the list of issues to test.

## Browser Assignment

You MUST use browser-{browser_num} for ALL browser operations. Use tools prefixed with `mcp__browser-{browser_num}__`:
- `mcp__browser-{browser_num}__browser_navigate` to navigate
- `mcp__browser-{browser_num}__browser_click` to click
- `mcp__browser-{browser_num}__browser_snapshot` to take snapshots
- `mcp__browser-{browser_num}__browser_evaluate` to run JS
- `mcp__browser-{browser_num}__browser_fill_form` to fill forms
- `mcp__browser-{browser_num}__browser_take_screenshot` for screenshots
- etc. (all tools use the `mcp__browser-{browser_num}__` prefix)

If your assigned browser errors or is unresponsive, try the next available browser number (skip browser-6 which is headed).

## Additional Context

### OAS Documentation URLs
When testing API-related issues (e.g., #85, #148), use these OAS documentation endpoints:
- Voorzieningen register: http://localhost:8080/index.php/apps/openregister/api/registers/2/oas
- GEMMA/AMEFF register: http://localhost:8080/index.php/apps/openregister/api/registers/4/oas

### Login Procedure
**For authenticated personas (all except bezoeker):**
1. Use `mcp__browser-{browser_num}__browser_navigate` to go to http://localhost:3000/login
2. IMPORTANT: Before entering credentials, use `mcp__browser-{browser_num}__browser_evaluate` to run: localStorage.clear()
   This removes stale sessions from previous tests.
3. Enter your persona's credentials (from the skill file)
4. Verify dashboard loads after login

**For bezoeker (unauthenticated):**
1. Use `mcp__browser-{browser_num}__browser_navigate` to go to http://localhost:3000/zoeken?_page=1
2. Use `mcp__browser-{browser_num}__browser_evaluate` to run: localStorage.clear()
3. Do NOT log in — all testing is done as an anonymous visitor

### Organization Context
Your persona is linked to a proper organization (not Default Organisation):
- Leverancier personas (jan.pietersen) → "Test Leverancier BV"
- Gemeente personas (maria.vanderberg, mark.jansen) → "Test Gemeente"
- Samenwerking personas (linda.bakker) → "Test Samenwerking"
- Admin/VNG personas (peter.vandijk, sarah.devries) → Default Organisation (expected for admin/VNG roles)
Organization-specific features (wizards, filters, dashboards) should work for your persona's org type.

### RBAC Reference
The authoritative RBAC rules are in `softwarecatalog/lib/Settings/softwarecatalogus_register.json`.
Each schema has an `"authorization"` block. Key rules:
- **contactpersoon**: NOT public, but leverancier contact persons ARE expected to be publicly visible via publications. Only gemeente contact persons should be hidden.
- **module** (applicatie): Public can read only where `geregistreerdDoor: Leverancier`. aanbod-beheerder sees only own org.
- **koppeling**: NOT public. gebruik-beheerder sees all; aanbod-beheerder sees only own org.
- **gebruik**: NOT public. gebruik-beheerder sees all; aanbod-beheerder sees only own org.
- **organisatie**: Public readable by everyone.
When testing RBAC/visibility issues, read the register JSON for the exact rules.

### CMS Pages
CMS pages (privacy, terms, FAQ, disclaimer) are managed in the OpenCatalogi Nextcloud backend:
- URL: http://localhost:8080/index.php/apps/opencatalogi/#/pages
- Use this when testing CMS-related issues (#397, #403, #332).

### Wizard Execution — MANDATORY
**CRITICAL**: Authenticated agents (leverancier, gemeente) MUST execute their wizard flows BEFORE testing individual issues. The skill files contain detailed step-by-step walkthroughs.

- **Leverancier**: Must complete Applicatie publiceren, Dienst publiceren, and Koppeling publiceren wizards (all steps)
- **Gemeente**: Must complete Applicatie toevoegen wizard (all steps)
- **Both**: Document every wizard step with screenshots, noting field values entered and navigation behavior

The setup script also pre-creates test objects ("Test Applicatie Leverancier", "Test Dienst Leverancier", "Test Applicatie Gemeente") so beheer tables are never empty.

### Testing Hints for Specific Issues
- **#399 (cross-vendor)**: Public search page → find "Test Applicatie Leverancier 2", click Versies tab, click a version. Verify no error.
- **#375 (SaaS version)**: After wizard, find the created app on `/zoeken?_page=1`, check Versies tab.
- **#105 (RBAC)**: Leverancier only — `/beheer/applicatielandschappen` should show ONLY own org's applications (data scoping, not page visibility).
- **#141 (merge)**: Functioneel-beheerder only — test via Nextcloud backend: OpenRegister → Search/Views → voorzieningen register → organisatie schema → three-dot menu → Merge.
- **#403 (delete dialog)**: Find a test object in beheer table, click delete, verify dialog text and usage check, click Cancel.
- **#15 (export)**: In beheer table, click Acties → Exporteren → Als CSV/Excel. Verify download.
- **#402 (Edge vs Chrome)**: **SKIP** — untestable (single Chromium engine).

### Acceptance Criteria
Before testing each issue, read its acceptance criteria from Softwarecatalogus/issues.md.
The file contains detailed checkboxes for each issue. Use these to determine PASS/FAIL/PARTIAL/CANNOT_TEST.

### Output Format
Write your results to: Softwarecatalogus/test-results/{persona}/results-authenticated.md

Use this format:
- Header with persona name, date, environment, login used
- Summary table: | Issue | Title | Previous Status | Current Status | Severity |
- Per-issue sections with acceptance criteria checkboxes marked [x] or [ ]
- Evidence screenshots saved to the same directory

### Rules
- NEVER update, close, or comment on GitHub issues — READ ONLY
- Write results ONLY to local files in test-results/
- Take screenshots for evidence
```

### Step 3: Wait for Completion

Wait for all sub-agent tasks to complete. As each finishes, note its completion status.

If any agent fails (crashes, doesn't write results), log the failure and continue with the remaining agents.

### Step 4: Generate Summary Report

After all agents complete (or in `summary-only` mode), read all result files and generate a summary.

**Read these files:**
- `Softwarecatalogus/test-results/leverancier/results-authenticated.md`
- `Softwarecatalogus/test-results/gemeente/results-authenticated.md`
- `Softwarecatalogus/test-results/security-officer/results-authenticated.md`
- `Softwarecatalogus/test-results/functioneel-beheerder/results-authenticated.md`
- `Softwarecatalogus/test-results/samenwerking/results-authenticated.md`
- `Softwarecatalogus/test-results/architectuur-expert/results-authenticated.md`
- `Softwarecatalogus/test-results/bezoeker/results-public.md`

For each file, extract:
- Issue number, title, status (PASS/PARTIAL/FAIL/CANNOT_TEST), severity
- Agent name that tested it

**Write the summary to**: `Softwarecatalogus/test-results/README.md`

### Summary Report Format

```markdown
# GEMMA Softwarecatalogus — Test Results Summary

**Date:** {today's date}
**Environment:** Local development (Frontend: http://localhost:3000, Backend: http://localhost:8080)
**Method:** Automated browser testing with 7 persona-based agents using Playwright MCP

---

## Overall Results

| Status | Count | Percentage |
|--------|-------|------------|
| **PASS** | {count} | {pct}% |
| **PARTIAL** | {count} | {pct}% |
| **FAIL** | {count} | {pct}% |
| **CANNOT_TEST** | {count} | {pct}% |
| **Total tested** | {count} | — |
| **Not yet tested** | {count} | — |

---

## FAIL Issues (Requires Attention)

| Issue | Title | Severity | Agent | Summary |
|-------|-------|----------|-------|---------|
| #{num} | {title} | {severity} | {agent} | {one-line summary of failure} |
...

---

## CANNOT_TEST Issues (Blocked)

| Issue | Title | Agent | Reason |
|-------|-------|-------|--------|
| #{num} | {title} | {agent} | {why it couldn't be tested} |
...

---

## Results by Agent

### 1. Leverancier — Jan Pietersen
| PASS | PARTIAL | FAIL | CANNOT_TEST |
|------|---------|------|-------------|
| {n} | {n} | {n} | {n} |

Key findings: {2-3 bullet points}

### 2. Gemeente — Maria van der Berg
...{repeat for all 7 agents, including Bezoeker — Anonymous Visitor}

---

## Critical Findings

{List the most important FAIL issues with details — particularly security, privacy, and data integrity issues}

---

## Improvements Since Last Run

| Issue | Title | Previous | Current | Agent |
|-------|-------|----------|---------|-------|
{issues that improved}

---

## Regressions

| Issue | Title | Previous | Current | Agent |
|-------|-------|----------|---------|-------|
{issues that got worse}

---

## Environment Limitations

{List factors that prevented testing or affected results}

---

## Recommendations

### Immediate (Security)
{numbered list}

### High Priority
{numbered list}

### Before Next Test Run
{numbered list}
```

### Step 5: Report to User

After writing the summary, display a concise overview to the user:
- Total issues tested
- PASS/FAIL/PARTIAL/CANNOT_TEST counts
- Top 3 critical findings
- Link to the full report: `Softwarecatalogus/test-results/README.md`
