---
id: f005-dienstenbeheer
title: F005 - Dienstenbeheer
sidebar_label: F005 - Dienstenbeheer
sidebar_position: 5
description: Functionaliteit voor het beheren van diensten en leveranciers
keywords:
  - diensten
  - leveranciers
  - beheer
  - beoordeling
---

# F005 - Dienstenbeheer

## Beschrijving
Deze functionaliteit beschrijft hoe diensten kunnen worden beheerd, toegevoegd en beoordeeld in de GEMMA Softwarecatalogus.

## Toepasselijk voor
- 🏛️ **Gemeenten**: Leveranciers zoeken, diensten toevoegen en beoordelen
- 🤝 **Samenwerkingen & Communities**: Niet direct van toepassing
- 🏢 **Leveranciers**: Diensten toevoegen bij eigen en andere applicaties
- ⚙️ **Functioneel Beheer**: Niet direct van toepassing

## Processtappen

### Voor Gemeenten
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 5.1 | Leveranciers zoeken | Vind leveranciers die diensten aanbieden |
| 5.2 | Dienst toevoegen | Voeg een dienst toe aan een applicatie |
| 5.3 | Dienstinformatie bewerken | Pas informatie over een dienst aan |
| 5.4 | Dienst verwijderen | Verwijder een dienst van een applicatie |
| 5.5 | Dienstverlener beoordelen | Kwaliteit van dienstverlening beoordelen |

### Voor Leveranciers
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 5.1 | Applicatie zoeken | Zoek een bestaande applicatie binnen de catalogus |
| 5.2 | Applicatie selecteren | Selecteer de juiste applicatie |
| 5.3 | Diensten toevoegen/hergebruiken | Voeg de mogelijke diensten toe |
| 5.4 | Eigen diensten koppelen | Direct de eigen diensten kunnen toevoegen |

## Gerelateerde Issues
- [#144](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/144) - Leveranciers zoeken
- [#74](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/74) - Zoekfunctionaliteit
- [#105](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/105) - Zichtbaarheid
- [#35](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/35) - Dienst toevoegen
- [#34](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/34) - Beoordeling
- [#3](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/3) - Applicatie zoeken
- [#14](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/14) - Zoekfunctionaliteit
- [#36](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/36) - Diensten koppelen

## Autorisatie Matrix

| Functionaliteit | Aanbod-beheerder | Gebruik-beheerder | Gebruik-raadpleger | Functioneel beheerder | VNG-raadpleger | Bezoeker |
|------------------|------------------|-------------------|--------------------|-----------------------|----------------|----------|
| **Tonen statistieken gebruik** | ✅ (van eigen pakketten) | ✅ | ✅ | ✅ (alles) | ❌ | ❌ |

### Detailering
- [Gebruik View](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/id-5af2e6f1-0ffa-403a-b8e5-1bf6153acfe1/views/id-8f3fd01f6b974c0f85e43f514225e973.html)

## Vervolgfunctionaliteiten
- [F006 - Inzichten en Aanbevelingen](./F006-inzichten-en-aanbevelingen.md)
- [F007 - Data Export en Import](./F007-data-export-import.md)
