---
id: f004-aanbod-beheer
title: F004 - Aanbod Beheer
sidebar_label: F004 - Aanbod Beheer
sidebar_position: 4
description: Functionaliteit voor het beheren van software aanbod, producten en diensten door leveranciers
keywords:
  - aanbod
  - producten
  - software
  - leveranciers
  - applicaties
  - modules
  - GEMMA
---

# F004 - Aanbod Beheer

## Beschrijving
Deze functionaliteit beschrijft hoe leveranciers hun software aanbod kunnen beheren. Het gaat om het aanmaken, onderhouden en promoten van applicaties, modules en diensten in de softwarecatalogus. Leveranciers gebruiken dit om hun digitale etalage te beheren en zichtbaar te zijn voor gemeenten.

Deze functionaliteit is gekoppeld aan **[K002 - Applicatie](./K002-applicatie.md)** en ondersteunt ook de nieuwe concepten **[K006 - Suite](./K006-suite.md)** en **[K007 - Component](./K007-component.md)**.

## Toepasselijk voor
- 🏢 **Leveranciers**: Applicaties, modules en diensten aanbieden en beheren
- 🤝 **Samenwerkingen & Communities**: Eigen software aanbieden (indien van toepassing)
- ⚙️ **Functioneel Beheer**: Aanbod valideren, conceptpakketten controleren

## Processtappen

### Voor Leveranciers (Aanbod Creëren en Beheren)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 4.1 | Applicatie aanmaken | Nieuwe applicatie toevoegen aan de catalogus (via wizard) |
| 4.2 | Productinformatie vastleggen | Naam, beschrijving, functionaliteiten, doelgroep |
| 4.3 | GEMMA koppeling | Applicatie relateren aan GEMMA referentiecomponenten |
| 4.4 | Technische specificaties | Hostingtype (SaaS, on-premise, hybrid), technologie stack |
| 4.5 | Licentiemodel definiëren | Open source, commercieel, freemium, etc. |
| 4.6 | Prijsmodel instellen | Kosten per gebruiker, eenmalig, abonnement |
| 4.7 | Documentatie uploaden | Brochures, handleidingen, verwerkersovereenkomsten |
| 4.8 | Screenshots en media | Visuele presentatie van de software |
| 4.9 | Modules toevoegen | Uitbreidingen en add-ons bij hoofdapplicatie |
| 4.10 | Versies beheren | Verschillende versies en releases bijhouden |
| 4.11 | Aanbod promoten | Software actief promoten bij doelgroepen |
| 4.12 | Aanbod bijwerken | Wijzigingen in functionaliteit, prijzen, of beschikbaarheid |

### Voor Samenwerkingen & Communities (Eigen Software Aanbieden)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 4.1 | Gezamenlijk ontwikkelde software | Software die door de samenwerking is ontwikkeld aanbieden |
| 4.2 | Open source projecten | Community-ontwikkelde software beschikbaar maken |
| 4.3 | Collectieve licenties | Software aanbieden met speciale voorwaarden voor leden |

### Voor Functioneel Beheer (Aanbod Validatie)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 4.1 | Aanbod valideren | Controleren of aangeboden software klopt en compleet is |
| 4.2 | Conceptpakketten controleren | Valideren van door gemeenten aangemelde software |
| 4.3 | Duplicaten samenvoegen | Meerdere registraties van dezelfde software samenvoegen |
| 4.4 | Aanbod kwaliteit bewaken | Controleren op volledigheid van productinformatie |
| 4.5 | Leverancier koppelen | Conceptpakketten koppelen aan de juiste leverancier |
| 4.6 | GEMMA compliance | Controleren of GEMMA koppelingen correct zijn |

## Gerelateerde Issues
- [#144](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/144) - Applicatie zoeken
- [#21](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/21) - Zoekfunctionaliteit
- [#31](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/31) - Applicaties vergelijken
- [#18](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/18) - Applicatie toevoegen
- [#17](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/17) - Informatie invullen
- [#56](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/56) - Koppelingen maken
- [#5](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/5) - Applicatie aanmaken
- [#4](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/4) - GEMMA koppeling
- [#9](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/9) - Hostingtype
- [#7](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/7) - Licentietype
- [#11](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/11) - Conceptpakketten

## Autorisatie Matrix

| Functionaliteit | Aanbod-beheerder | Gebruik-beheerder | Gebruik-raadpleger | Functioneel beheerder | VNG-raadpleger | Bezoeker |
|------------------|------------------|-------------------|--------------------|-----------------------|----------------|----------|
| **Applicatie aanmaken** | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **Aanbod beheren (eigen software)** | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **Aanbod bekijken** | ✅ (eigen) | ✅ (alle) | ✅ (alle) | ✅ (alle) | ✅ (alle) | ✅ (publiek) |
| **Prijsmodel beheren** | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **GEMMA koppeling beheren** | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **Documentatie uploaden** | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **Aanbod promoten** | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **Aanbod valideren** | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |

### Detailering
- [Gebruik View](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/id-5af2e6f1-0ffa-403a-b8e5-1bf6153acfe1/views/id-8f3fd01f6b974c0f85e43f514225e973.html)
- [Aanbod View](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/id-5af2e6f1-0ffa-403a-b8e5-1bf6153acfe1/views/id-0a04a95fc8b743089aa04706580e0dc3.html)
- [Referentiearchitectuur View](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/id-5af2e6f1-0ffa-403a-b8e5-1bf6153acfe1/views/id-00da0c7e38764f8f82a57792dcddab00.html)

## Gebruikershandleidingen

### Nieuwe Applicatie Aanmelden (Applicatie Wizard)

De applicatie wizard begeleidt u door het complete aanmeldproces in 8 stappen:

#### Stap 0: Organisatie Selectie (Optioneel)
- **Alleen getoond** wanneer u een applicatie aanmeldt voor een andere organisatie
- **Selecteer organisatie** uit de lijst of klik 'Ik kan de gewenste aanbieder niet vinden'
- **Controle tabel** toont bestaande applicaties van de geselecteerde leverancier

#### Stap 1: Applicatie Informatie
- **Naam en website** van de applicatie
- **Korte en uitgebreide omschrijving** van functionaliteiten
- **Logo upload** voor visuele herkenning
- **Contactpersoon toewijzing** (nieuw!)

#### Stap 2: Versies (Conditioneel)
- **Alleen getoond** bij On-Premises (Self-managed) hosting
- **Versienummer, status en acties** beheren
- **Meerdere versies** kunnen worden toegevoegd

#### Stap 3: Licentie / Hosting
- **Licentievorm en specifieke licentie** selecteren
- **Hosting locatie** waar de applicatie wordt gehost
- **Data opslag land** voor compliance (omgedraaid voor betere titel lengte)
- **Hosting vorm** (SaaS, On-premise, Hybrid)

#### Stap 4: Referentie Componenten
- **GEMMA referentiecomponenten** zoeken en selecteren
- **Koppeling** aan architectuur concepten voor interoperabiliteit
- **Doorverwijzing** naar GEMMA Online voor meer informatie

#### Stap 5: Standaarden
- **Standaarden compliance** configureren
- **Ondersteund checkbox** per standaard
- **Bewijs upload** of link voor compliance
- *Applicatie kolom vervalt* voor meer overzicht

#### Stap 6: Koppelingen
- **Integraties** met andere applicaties definiëren
- **Applicatie A** is automatisch de huidige applicatie (niet selecteerbaar)
- **Richting data-uitwisseling** en soort koppeling specificeren

#### Stap 7: Diensten
- **Services** die de applicatie aanbiedt
- **Dienst type** selecteren uit beschikbare opties
- *Applicatie kolom vervalt* voor meer ruimte voor dienst naam

#### Stap 8: Controleren
- **Samengevoegd overzicht** van alle ingevoerde informatie
- **Alle gegevens** in één scherm voor finale controle
- **Product aanmelden** of terug naar vorige stappen voor aanpassingen

Zie [K002 - Applicatie](./K002-applicatie.md) voor de gedetailleerde wizard sequence diagram en technische flow.

### Aanbod Beheren en Bijwerken

1. **Ga naar "Mijn Aanbod"** in het leverancierspaneel
2. **Selecteer de applicatie** die u wilt bijwerken
3. **Bewerk de gewenste secties**:
   - Productinformatie en beschrijving
   - Prijsmodel en voorwaarden
   - Screenshots en documentatie
   - GEMMA koppelingen
4. **Sla wijzigingen op** - deze zijn direct zichtbaar
5. **Promoot uw software** via de promotie tools

### Modules en Versies Toevoegen

1. **Open uw applicatie** in het beheerportaal
2. **Ga naar "Modules"** of "Versies"
3. **Klik op "Toevoegen"**
4. **Vul module/versie details in**:
   - Naam en beschrijving
   - Functionaliteiten
   - Prijsinformatie
   - Technische vereisten
5. **Koppel aan hoofdapplicatie** en publiceer

## Vervolgfunctionaliteiten
- [F013 - Gebruik Beheer](./F013-gebruik-beheer.md)
- [F005 - Dienstenbeheer](./F005-dienstenbeheer.md)
- [F006 - Inzichten en Aanbevelingen](./F006-inzichten-en-aanbevelingen.md)
