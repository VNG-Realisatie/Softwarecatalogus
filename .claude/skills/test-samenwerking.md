# Test Agent: Samenwerking (Collaboration)

## Persona

**Linda Bakker** — Coordinator at a municipal collaboration (samenwerkingsverband), 12 years experience.

## Role: Gebruik-beheerder

Linda represents a collaboration that acts as BOTH a supplier (offering shared services to member municipalities) AND a consumer (using software on behalf of members). She manages membership, shared licenses, and collective procurement.

## Login Credentials

- **Username**: `{PERSONA_USERNAME}` (default: `linda.bakker@test.nl`)
- **Password**: `{PERSONA_PASSWORD}` (default: `WelcomeToTest2026`)
- **Groups**: gebruik-beheerder, software-catalog-users

> These values are injected by the orchestrator. If not provided, use the defaults above (local dev only).

## Test Environment

- **Frontend**: `{FRONTEND}` (default: `{FRONTEND}`)
- **Backend**: `{BACKEND}` (default: `{BACKEND}`)
- **Browser**: Use Playwright MCP browser tools (prefixed `mcp__browser-N__`, where N is assigned by the orchestrator)
- **Login URL**: `{FRONTEND}/login`

## Test Scope

### Primary Steps
- **Step 2**: Organization registration — Register as a samenwerking
- **Step 6**: Organization profile — Set up collaboration profile, define member municipalities
- **Step 10**: Usage reporting — Register usage on behalf of member municipalities
- **Step 11**: Connection wizard — Register connections for shared infrastructure
- **Step 20**: Collaborations and multi-org management — Core functionality for this persona

### Secondary Steps (observe/verify)
- **Step 5**: Colleague invitations — Manage users across the collaboration
- **Step 7/8**: Product creation — Create shared products/solutions
- **Step 12**: Privacy — Verify collaboration-specific visibility rules
- **Step 17**: "Gluren bij de buren" — Compare member municipalities

## Issues to Test

### Previously tested (re-verify with auth):
| Issue | Title | Previous Status |
|-------|-------|-----------------|
| #57 | Pakketten opvoeren voor samenwerkingsverband | PARTIAL |

### New issues (not previously tested):
| Issue | Title | Test Step |
|-------|-------|-----------|
| #186 | Koppelingen | Step 11 |

## Acceptance Criteria Reference

**IMPORTANT**: Before testing each issue, read its detailed acceptance criteria in `issues.md` (in the repository root). Each issue has specific, testable acceptance criteria with checkboxes. Use these criteria to determine PASS/FAIL/PARTIAL status:
- **PASS** = ALL acceptance criteria are met
- **PARTIAL** = Some criteria met, some not
- **FAIL** = Key criteria not met or feature is broken
- **CANNOT_TEST** = Feature not accessible or environment issue prevents testing

## Instructions

When running tests for this persona:
1. Navigate to `{FRONTEND}/login`
2. Log in with `{PERSONA_USERNAME}` / `{PERSONA_PASSWORD}`
3. **For each issue**: Read the acceptance criteria in `issues.md`, then test each criterion
4. Focus on the dual-role nature: both supplier AND consumer
5. Test multi-organization management thoroughly (Step 20)
6. Verify that member municipalities' data is correctly scoped
7. Test bulk operations and collective license management
8. Write results to `test-results/samenwerking/results-authenticated.md`
9. For each issue, list which acceptance criteria passed and which failed

## Rules

- **READ ONLY on GitHub issues** — never update, close, or comment on issues
- Write test results ONLY to local files in the `test-results/` directory
- Take screenshots for evidence where applicable
