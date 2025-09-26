---
id: f006-inzichten-en-aanbevelingen
title: F006 - Inzichten en Aanbevelingen
sidebar_label: F006 - Inzichten en Aanbevelingen
sidebar_position: 6
description: Functionaliteit voor het verkrijgen van inzichten en aanbevelingen
keywords:
  - inzichten
  - aanbevelingen
  - AI
  - statistieken
---

# F006 - Inzichten en Aanbevelingen

## Beschrijving
Deze functionaliteit beschrijft hoe gebruikers inzichten kunnen verkrijgen en aanbevelingen kunnen ontvangen over hun applicatielandschap.

## Toepasselijk voor
- 🏛️ **Gemeenten**: Meldingen bekijken, benchmarking, AI-adviezen
- 🤝 **Samenwerkingen & Communities**: Niet direct van toepassing
- 🏢 **Leveranciers**: Overzicht van afnemende organisaties, promotie
- ⚙️ **Functioneel Beheer**: Rapportages genereren, statistieken

## Processtappen

### Voor Gemeenten
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 6.1 | Meldingen bekijken | Bekijk meldingen over wijzigingen van leveranciers |
| 6.2 | Wijzigingen bekijken | Bekijk wijzigingen zoals nieuwe versie, beëindiging ondersteuning |
| 6.3 | Gluren bij de buren | Bekijk welke applicaties door andere gemeenten in gebruik zijn |
| 6.4 | Statistieken bekijken | Inzicht in gebruik van de softwarecatalogus |
| 6.5 | AI advisering | Nieuwe inzichten via AI |
| 6.6 | Informatiestromen inzien | Diagrammen van informatiestromen tussen applicaties |
| 6.7 | Register van verwerkingen | Genereren van een register van verwerkingen |

### Voor Leveranciers
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 6.1 | Overzicht afnemende organisaties | Inzicht wie mijn applicaties hebben opgevoerd |
| 6.2 | Applicatie/dienst promoten | Een dienst of applicatie delen met gemeenten via catalogus |

### Voor Functioneel Beheer
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 6.1 | Genereer rapportages | Maak rapportages over het gebruik en de datakwaliteit |
| 6.2 | Menu items en teksten bewerken | Bewerken van menu's, pagina's en teksten |

## Gerelateerde Issues
- [#54](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/54) - Meldingen
- [#20](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/20) - Gluren bij de buren
- [#19](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/19) - Benchmarking
- [#32](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/32) - Statistieken
- [#13](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/13) - AI advisering
- [#53](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/53) - AI inzichten
- [#51](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/51) - Informatiestromen
- [#82](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/82) - Register van verwerkingen
- [#8](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/8) - Afnemende organisaties
- [#10](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/10) - Promotie
- [#75](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/75) - Rapportages
- [#28](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/28) - Menu bewerken
- [#29](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/29) - Pagina's bewerken
- [#30](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/30) - Teksten bewerken

## Autorisatie Matrix

| Functionaliteit | Aanbod-beheerder | Gebruik-beheerder | Gebruik-raadpleger | Functioneel beheerder | VNG-raadpleger | Bezoeker |
|------------------|------------------|-------------------|--------------------|-----------------------|----------------|----------|
| **Tonen statistieken gebruik** | ✅ (van eigen pakketten) | ✅ | ✅ | ✅ (alles) | ❌ | ❌ |
| **Filteren pakketoverzicht** | ❌ | ✅ (eigen overzicht) | ❌ | ✅ | ❌ | ❌ |
| **Database toegang informatietool** | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **Raadplegen aanbod API** | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |

### Detailering
- [Gebruik View](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/id-5af2e6f1-0ffa-403a-b8e5-1bf6153acfe1/views/id-8f3fd01f6b974c0f85e43f514225e973.html)
- [Managementinformatie View](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/id-5af2e6f1-0ffa-403a-b8e5-1bf6153acfe1/views/id-6071c57cc54647b8b82a29df8c170bcf.html)

## Vervolgfunctionaliteiten
- [F007 - Data Export en Import](./F007-data-export-import.md)
