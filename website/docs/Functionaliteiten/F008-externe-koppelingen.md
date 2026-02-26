---
id: f008-externe-koppelingen
title: F008 - Externe Koppelingen
sidebar_label: F008 - Externe Koppelingen
sidebar_position: 8
description: Functionaliteit voor het koppelen met externe databronnen
keywords:
  - externe koppelingen
  - API
  - synchronisatie
  - databronnen
---

# F008 - Externe Koppelingen

## Beschrijving
Deze functionaliteit beschrijft hoe externe databronnen kunnen worden gekoppeld om het applicatielandschap actueel te houden.

## Toepasselijk voor
- 🏛️ **Gemeenten**: Data bijwerken vanuit externe bronnen
- 🤝 **Samenwerkingen & Communities**: Niet direct van toepassing
- 🏢 **Leveranciers**: Niet direct van toepassing
- ⚙️ **Functioneel Beheer**: Niet direct van toepassing

## Processtappen

### Voor Gemeenten
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 8.1 | Data bijwerken vanuit externe bronnen | API, CSV of andere opties voor synchronisatie |

## Koppelingsmogelijkheden

### API Koppelingen
- **Real-time synchronisatie**: Directe koppeling met externe systemen
- **Geautomatiseerde updates**: Automatische bijwerking van applicatiegegevens
- **Bidirectioneel**: Zowel ophalen als versturen van data

### Bestandsimport
- **CSV Import**: Periodieke import van CSV-bestanden
- **Excel Import**: Import van Excel-bestanden
- **Batch Processing**: Verwerking van grote datasets

### Externe Bronnen
- **Leverancierssystemen**: Directe koppeling met leveranciers
- **Andere Catalogussen**: Synchronisatie met andere softwarecatalogi
- **Architectuurtools**: Import vanuit architectuurtools

## Gerelateerde Issues
- [#52](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/52) - Externe bronnen

## Autorisatie Matrix

| Functionaliteit | Aanbod-beheerder | Gebruik-beheerder | Gebruik-raadpleger | Functioneel beheerder | VNG-raadpleger | Bezoeker |
|------------------|------------------|-------------------|--------------------|-----------------------|----------------|----------|
| **Externe koppelingen beheren** | ❌ | ✅ (eigen organisatie) | ❌ | ✅ (alles) | ❌ | ❌ |

### Detailering
Externe koppelingen worden voornamelijk gebruikt door gemeenten om hun applicatielandschap automatisch bij te werken vanuit eigen systemen.

## Vervolgfunctionaliteiten
- Dit is de laatste functionaliteit in de keten
