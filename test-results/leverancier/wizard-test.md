# Wizard Test Results - Leverancier (Jan Pietersen)

**Test Date**: 2026-02-22
**Agent**: test-leverancier
**Persona**: Jan Pietersen (Leverancier / Vendor Director)
**Login**: jan.pietersen@test.nl
**Environment**: http://localhost:3000 (Frontend), http://localhost:8080 (Backend)
**Browser**: Playwright MCP browser-1 (headless)

---

## Summary

| Wizard | Status | Notes |
|--------|--------|-------|
| Applicatie publiceren | PASS | All 6 steps completed successfully |
| Dienst publiceren | PASS | All 3 steps completed successfully |
| Koppeling publiceren | PASS | All 4 steps completed successfully |
| Beheer verification | PASS | All objects visible in beheer tables |

**Overall Result: PASS** -- All three wizards executed successfully, objects created and verified.

---

## Pre-conditions

- Logged in as jan.pietersen@test.nl with password WelcomeToTest2026
- Organization "Test Leverancier BV" was already active and selected on the dashboard
- Dashboard showed wizard buttons: Applicatie publiceren, Koppeling publiceren, Dienst publiceren, Applicatiegebruik melden
- localStorage cleared before login to ensure clean session state

---

## Wizard 1: Applicatie publiceren

**URL**: http://localhost:3000/forms/applicatie?type=eigen
**Steps**: 6 (Applicatie-informatie, Licentie & Hosting, Referentiecomponenten, Standaarden, Koppelingen, Controleren)
**Result**: PASS

### Step 1: Applicatie-informatie
| Field | Value | Status |
|-------|-------|--------|
| Naam | Test Wizard App | Filled |
| Website | https://test-leverancier.nl/app | Filled |
| Korte beschrijving | Applicatie aangemaakt via wizard test | Filled |
| Lange beschrijving | Markdown text about test application | Filled (markdown editor) |
| Contactpersoon | Jan van de Berg | Selected from dropdown |

**Screenshot**: wizard-app-step1.png

### Step 2: Licentie & Hosting
| Field | Value | Status |
|-------|-------|--------|
| Licentievorm | Open source | Selected |
| Licentie | European Union Public Licence (EUPL), versie 1.2 | Selected |
| Hosting | SaaS | Selected |

**Screenshot**: wizard-app-step2.png

### Step 3: Referentiecomponenten
| Field | Value | Status |
|-------|-------|--------|
| Referentiecomponenten | Generiek zaakafhandelcomponent, Zaakregistratiecomponent | Selected (2 of available) |

**Screenshot**: wizard-app-step3-refcomp.png

### Step 4: Standaarden
| Field | Value | Status |
|-------|-------|--------|
| Besluiten API-standaard v1.x | Ondersteund (checked) | 1 of 13 verplichte standards checked |

**Note**: The standaarden step shows a table with 13 mandatory standards. Only one was checked for testing purposes.

**Screenshot**: wizard-app-step4-standaarden.png

### Step 5: Koppelingen
| Field | Value | Status |
|-------|-------|--------|
| Applicatie A | Test Wizard App (pre-filled, locked) | Pre-filled |
| Richting | Bi-directioneel | Selected |
| Applicatie B | Open Zaakbrug | Selected from dropdown |
| Naam | Test koppeling | Filled |

**Note**: Direction options were "A -> B", "B -> A", "Bi-directioneel" (differs from skill file which expected "Integreert met").

**Screenshot**: wizard-app-step5-koppelingen.png

### Step 6: Controleren (Review)
All data displayed correctly on the review page:
- Applicatie naam: Test Wizard App
- Licentie: Open source / EUPL 1.2
- Hosting: SaaS
- Referentiecomponenten: 2 selected
- Standaarden: 1 supported
- Koppelingen: Test koppeling (Test Wizard App <-> Open Zaakbrug, Bi-directioneel)

**Screenshot**: wizard-app-step6-review.png

### Submission
- Button label: "Applicatie aanmelden" (not "Opslaan" as expected from skill file)
- Success message: "Applicatie succesvol aangemeld!"
- Post-submission options: "Terug naar beheer dashboard", "Nieuwe applicatie registreren"

**Screenshot**: wizard-app-success.png

### Observations
- The wizard URL is `/forms/applicatie?type=eigen` (NOT `/beheer/forms/applicatie?type=eigen` -- the /beheer prefix causes a 500 error)
- The wizard has 6 steps, not 7 as described in the skill file (no separate "Versies" step)
- Direction options differ from skill file: actual options are "A -> B", "B -> A", "Bi-directioneel" instead of "Integreert met"
- Submit button is "Applicatie aanmelden" not "Opslaan"

---

## Wizard 2: Dienst publiceren

**URL**: http://localhost:3000/forms/dienst?type=eigen
**Steps**: 3 (Applicaties, Dienst informatie, Controleren)
**Result**: PASS

### Step 1: Applicaties
| Field | Value | Status |
|-------|-------|--------|
| Applicatie | Test Wizard App | Searched and selected from dropdown |

**Screenshot**: wizard-dienst-step1.png

### Step 2: Dienst informatie
| Field | Value | Status |
|-------|-------|--------|
| Naam | Test Wizard Dienst | Filled |
| Website | https://test-leverancier.nl/dienst | Filled |
| Korte beschrijving | Dienst aangemaakt via wizard test | Filled |
| Diensttype | Implementatieondersteuning | Selected |

**Screenshot**: wizard-dienst-step2.png

### Step 3: Controleren (Review)
All data displayed correctly:
- Dienst naam: Test Wizard Dienst
- Applicatie: Test Wizard App
- Diensttype: Implementatieondersteuning
- Website and beschrijving confirmed

**Screenshot**: wizard-dienst-step3-review.png

### Submission
- Button label: "Dienst registreren"
- Success message: "Dienst succesvol aangemeld!"
- Post-submission options: "Terug naar beheer dashboard", "Nieuwe dienst registreren"

**Screenshot**: wizard-dienst-success.png

### Observations
- The Dienst wizard has 3 steps (simpler than Applicatie wizard)
- The submit button is "Dienst registreren" not "Opslaan"

---

## Wizard 3: Koppeling publiceren

**URL**: http://localhost:3000/forms/koppeling?type=eigen-organisatie
**Steps**: 4 (Koppeling zoeken > Koppeling, Koppeling zoeken > Aanvullende informatie, Controleren)
**Result**: PASS

### Step 1: Koppeling zoeken - Applicatie selectie
| Field | Value | Status |
|-------|-------|--------|
| Applicatie | Test Wizard App | Selected from dropdown (2 options available) |

The page shows existing koppelingen for the selected applicatie:
- "Test koppeling" (Test Wizard App <-> Open Zaakbrug) from Wizard 1

**Screenshot**: wizard-koppeling-step1.png

### Step 2: Koppeling - Koppelingen met andere applicaties
| Field | Value | Status |
|-------|-------|--------|
| Applicatie A | Test Wizard App (pre-filled, locked) | Pre-filled |
| Richting | Bi-directioneel | Selected |
| Applicatie B | DigiD | Selected from dropdown (54 options available) |
| Naam | Test Wizard Koppeling | Filled |

**Screenshot**: wizard-koppeling-step2.png

### Step 3: Aanvullende informatie
| Field | Value | Status |
|-------|-------|--------|
| Korte beschrijving | Koppeling aangemaakt via wizard test voor authenticatie | Filled |
| Lange beschrijving | (left empty) | Optional |
| Standaardversies | (not selected) | Optional |
| Transportprotocol | (not selected) | Optional |
| Intermediair | (not selected) | Optional |

**Screenshot**: wizard-koppeling-step3-aanvullend.png

### Step 4: Controleren (Review)
All data displayed correctly:
- Koppelingen: Test Wizard Koppeling
- Route: Test Wizard App <-> DigiD
- Beschrijving: Koppeling aangemaakt via wizard test voor authenticatie

**Screenshot**: wizard-koppeling-step4-review.png

### Submission
- Button label: "Opslaan"
- Success message: "Koppelingen succesvol opgeslagen!"
- Confirmation: "Uw koppelingen zijn succesvol geregistreerd!"
- Post-submission options: "Terug naar beheer dashboard", "Nieuwe koppeling registreren"

**Screenshot**: wizard-koppeling-success.png

### Observations
- The Koppeling wizard has a nested step structure: Step 1 has sub-steps "Koppeling" and "Aanvullende informatie"
- The applicatie dropdown in Koppeling wizard shows a "Buiten Gemeentelijke Voorziening" (BGV) toggle to filter between applicaties and external systems
- Existing koppelingen for the selected applicatie are shown before proceeding
- The Applicatie B dropdown offers 54 options including external government systems (DigiD, BRP, etc.)
- This is the only wizard where the submit button is labeled "Opslaan"

---

## Beheer Table Verification

### Applicaties (/beheer/applicaties)
| Naam | Korte omschrijving | Leverancier | Licentievorm | Source |
|------|--------------------|-------------|--------------|--------|
| Test Applicatie Leverancier | Dit is een test applicatie... | Test Leverancier BV | Closed source | Pre-existing |
| **Test Wizard App** | **Applicatie aangemaakt via wizard test** | **Test Leverancier BV** | **Open source** | **Wizard 1** |

**Screenshot**: beheer-applicaties.png

### Diensten (/beheer/diensten)
| Naam | Aanbieder | Diensttype | Korte omschrijving | Source |
|------|-----------|------------|-------------------|--------|
| Test Dienst Implementatie | Test Leverancier BV | Implementatieondersteuning | Implementatie en ondersteuning dienst... | Pre-existing |
| **Test Wizard Dienst** | **Test Leverancier BV** | **Implementatieondersteuning** | **Dienst aangemaakt via wizard test** | **Wizard 2** |

**Screenshot**: beheer-diensten.png

### Koppelingen (/beheer/koppelingen)
| Naam | Status | Korte beschrijving | Applicatie A | Applicatie B | Source |
|------|--------|-------------------|-------------|-------------|--------|
| Test koppeling | in gebruik | - | Test Wizard App | Open Zaakbrug | Wizard 1 (koppelingen step) |
| **Test Wizard Koppeling** | **in gebruik** | **Koppeling aangemaakt via wizard test voor authenticatie** | **Test Wizard App** | **DigiD** | **Wizard 3** |

**Screenshot**: beheer-koppelingen.png

---

## Known Issues / Deviations from Skill File

1. **Direct URL navigation causes 500 error**: Navigating directly to `/beheer/forms/applicatie?type=eigen` results in a server error. The correct path is `/forms/applicatie?type=eigen` (without `/beheer` prefix). Wizards should be accessed via dashboard buttons.

2. **Wizard step count differs**: The Applicatie wizard has 6 steps (not 7). There is no separate "Versies" step as described in the skill file.

3. **Direction options differ**: The koppeling direction options are "A -> B", "B -> A", "Bi-directioneel" instead of "Integreert met" as described in the skill file.

4. **Submit button labels differ per wizard**:
   - Applicatie: "Applicatie aanmelden" (not "Opslaan")
   - Dienst: "Dienst registreren" (not "Opslaan")
   - Koppeling: "Opslaan"

5. **Console errors**: Several 404 errors for `/api/schemas/*/related` endpoints on beheer pages, and a manifest syntax error. These do not affect wizard functionality.

---

## Screenshots Index

| File | Description |
|------|-------------|
| login-dashboard.png | Dashboard after login |
| wizard-app-error.png | 500 error from direct /beheer URL |
| wizard-app-step1.png | Applicatie - Step 1 info |
| wizard-app-step2.png | Applicatie - Step 2 licentie/hosting |
| wizard-app-step3-refcomp.png | Applicatie - Step 3 referentiecomponenten |
| wizard-app-step4-standaarden.png | Applicatie - Step 4 standaarden |
| wizard-app-step5-koppelingen.png | Applicatie - Step 5 koppelingen |
| wizard-app-step6-review.png | Applicatie - Step 6 review |
| wizard-app-success.png | Applicatie - Success |
| wizard-dienst-step1.png | Dienst - Step 1 applicaties |
| wizard-dienst-step2.png | Dienst - Step 2 info |
| wizard-dienst-step3-review.png | Dienst - Step 3 review |
| wizard-dienst-success.png | Dienst - Success |
| wizard-koppeling-step1.png | Koppeling - Step 1 applicatie selectie |
| wizard-koppeling-step2.png | Koppeling - Step 2 koppeling details |
| wizard-koppeling-step3-aanvullend.png | Koppeling - Step 3 aanvullende info |
| wizard-koppeling-step4-review.png | Koppeling - Step 4 review |
| wizard-koppeling-success.png | Koppeling - Success |
| beheer-applicaties.png | Beheer table - Applicaties |
| beheer-diensten.png | Beheer table - Diensten |
| beheer-koppelingen.png | Beheer table - Koppelingen |
