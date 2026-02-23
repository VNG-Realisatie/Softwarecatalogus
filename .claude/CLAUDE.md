# Softwarecatalogus Testing Project

## Project Overview

This is the documentation and testing project for the GEMMA Softwarecatalogus — the Dutch government's software catalog for municipalities. This repo lives on the `documentation` branch and contains functional specifications, customer journeys, and test scenarios.

**This is NOT a code repository.** It contains documentation, test flows, and issue tracking.

## Environments

- **Frontend (Public)**: https://softwarecatalogus.accept.opencatalogi.nl/
- **Backend (Admin)**: https://softwarecatalogus.accept.commonground.nu/
- **Browser**: Chrome recommended for consistent results

## Personas / User Roles

The system defines 6 personas, each with a dedicated testing agent in `.claude/skills/`:

| Persona | Role | Agent Skill |
|---------|------|-------------|
| Maria van der Berg | Gemeente (Municipality) ICT-coördinator | `test-gemeente` |
| Jan Pietersen | Leverancier (Vendor) Director | `test-leverancier` |
| Linda Bakker | Samenwerking (Collaboration) Coordinator | `test-samenwerking` |
| Peter van Dijk | Functioneel Beheerder (Functional Manager) | `test-functioneel-beheerder` |
| Dr. Sarah de Vries | Architectuur Expert (Architecture Expert) | `test-architectuur-expert` |
| Mark Jansen | Security Officer | `test-security-officer` |

## Authorization Roles

| Role | Access Level |
|------|-------------|
| Aanbod-beheerder | Supplier — manage own products, services, standards |
| Gebruik-beheerder | Municipality — manage usage, connections, applications |
| Gebruik-raadpleger | Municipality — read-only access to usage data |
| Functioneel beheerder | VNG Admin — full system access |
| VNG-raadpleger | VNG Staff — read-only |
| Bezoeker | Public — search/browse only |

## Key Documentation

| Path | Content |
|------|---------|
| `website/docs/Functionaliteiten/testen.md` | 24-step test flow (main test guide) |
| `website/docs/Klantreizen/` | 6 customer journey documents |
| `website/docs/Functionaliteiten/F*.md` | 14 functionality specifications |
| `website/docs/Concepten/K*.md` | 9 core concept definitions |
| `issues.md` | Issue tracking tables (IGS + other) |

## Testing Flow

The main test flow in `testen.md` has 24 steps covering:
1. Browser preparation
2. Organization registration (F001)
3. Organization activation + user management (F002, F003)
4. First login (F003)
5. Colleague invitations (F003)
6. Organization profile (F002)
7. Product creation - single module (F004)
8. Product creation - multi module (F004)
9. Service wizard (F005)
10. Usage reporting and management (F013)
11. Connection wizard (F013)
12. Privacy and visibility testing (F013, F003)
13. Excel export (F007)
14. Search and results (F011)
15. AMEFF reference applications (F014)
16. Standards management (F004, F011)
17. "Gluren bij de buren" benchmarking (F013, F011)
18. Vendor usage management (F013, F004)
19. Advanced connections and standards (F008, F014)
20. Collaborations and multi-org management (F010, F003)
21. Admin and configuration (F009, F006)
22. Advanced search and filters (F011, F004)
23. Functional manager overview (F009, F013)
24. AMEFF export and advanced data export (F007)

## Rules

- **READ ONLY on GitHub issues** — never update, close, or comment on issues
- When testing, document findings in this repository, not on GitHub issues
- All test scenarios reference the VNG-Realisatie/Softwarecatalogus issue tracker
- Testing agents should use Playwright (browser automation) for UI testing
