---
id: f007-data-export-import
title: F007 - Data Export en Import
sidebar_label: F007 - Data Export en Import
sidebar_position: 7
description: Functionaliteit voor het exporteren en importeren van data
keywords:
  - export
  - import
  - AMEFF
  - CSV
  - Excel
---

# F007 - Data Export en Import

## Beschrijving
Deze functionaliteit beschrijft hoe data kan worden geëxporteerd en geïmporteerd in verschillende formaten.

## Toepasselijk voor
- 🏛️ **Gemeenten**: Applicatielandschap exporteren in verschillende formaten
- 🤝 **Samenwerkingen & Communities**: Niet direct van toepassing
- 🏢 **Leveranciers**: Applicatielandschap exporteren en importeren
- ⚙️ **Functioneel Beheer**: Organisaties samenvoegen

## Processtappen

### Voor Gemeenten
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 7.1 | Applicatielandschap overzicht | Overzichtelijke tabel weergave van het applicatielandschap |
| 7.2 | Filter toepassen | Filter het landschap op relevante criteria |
| 7.3 | Weergave selecteren | Selecteer een gewenste weergave (view) van het landschap |
| 7.4 | Exporteren als AMEFF (Applicaties) | Exporteer applicaties als AMEFF-bestand |
| 7.5 | Exporteren als CSV/Excel (Applicaties) | Exporteer applicaties als CSV of Excel |
| 7.6 | Exporteren als AMEFF (Koppelingen) | Exporteer koppelingen als AMEFF-bestand |
| 7.7 | Exporteren als CSV/Excel (Koppelingen) | Exporteer koppelingen als CSV of Excel |

### Voor Leveranciers
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 7.1 | Applicatielandschap exporteren | Overzicht van de opgevoerde applicaties exporteren |
| 7.2 | Landschap importeren | Overzicht van applicaties kunnen importeren van klanten |

### Voor Functioneel Beheer
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 7.1 | Voeg gefuseerde organisaties samen | Verwerk herindelingen of fusies van gemeenten of leveranciers |

## Export Formaten

### AMEFF (Architecture Model Exchange File Format)
- **Gebruik**: Architectuurmodellen en -diagrammen
- **Voordeel**: Behoud van relationele informatie
- **Toepassingen**: Import in architectuurtools

### CSV/Excel
- **Gebruik**: Tabelgegevens en lijsten
- **Voordeel**: Breed ondersteund, eenvoudig te bewerken
- **Toepassingen**: Rapportages, analyses, presentaties

## Gerelateerde Issues
- [#33](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/33) - Applicatielandschap overzicht
- [#22](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/22) - Filter functionaliteit
- [#68](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/68) - Weergave selecteren
- [#16](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/16) - AMEFF export
- [#15](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/15) - CSV/Excel export
- [#141](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/141) - Organisaties samenvoegen

## Autorisatie Matrix

| Functionaliteit | Aanbod-beheerder | Gebruik-beheerder | Gebruik-raadpleger | Functioneel beheerder | VNG-raadpleger | Bezoeker |
|------------------|------------------|-------------------|--------------------|-----------------------|----------------|----------|
| **Gebruik exporteren** | ❌ | ✅ | ❌ | ✅ | ❌ | ❌ |
| **Aanbod exporteren** | ✅ | ✅ | ❌ | ✅ | ❌ | ❌ |
| **Exporteren ArchiMate** | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ |
| **Importeren ArchiMate** | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **Ontsluiten architectuur concepten** | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |

### Detailering
- [Gebruik View](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/id-5af2e6f1-0ffa-403a-b8e5-1bf6153acfe1/views/id-8f3fd01f6b974c0f85e43f514225e973.html)
- [Aanbod View](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/id-5af2e6f1-0ffa-403a-b8e5-1bf6153acfe1/views/id-0a04a95fc8b743089aa04706580e0dc3.html)
- [Referentiearchitectuur View](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/id-5af2e6f1-0ffa-403a-b8e5-1bf6153acfe1/views/id-00da0c7e38764f8f82a57792dcddab00.html)

## Vervolgfunctionaliteiten
- [F008 - Externe Koppelingen](./F008-externe-koppelingen.md)
