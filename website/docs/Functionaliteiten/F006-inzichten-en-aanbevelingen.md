---
id: f006-reviews-en-community-feedback
title: F006 - Reviews en Community Feedback
sidebar_label: F006 - Reviews en Community Feedback
sidebar_position: 6
description: Functionaliteit voor het schrijven en lezen van reviews, beoordelingen en community feedback
keywords:
  - reviews
  - beoordelingen
  - community
  - feedback
  - ervaringen
  - gebruikersmeldingen
---

# F006 - Reviews en Community Feedback

## Beschrijving
Deze functionaliteit beschrijft hoe gebruikers reviews kunnen schrijven, beoordelingen kunnen geven en community feedback kunnen delen over software, leveranciers en diensten. Het gaat om peer-to-peer informatie uitwisseling tussen gebruikers.

## Toepasselijk voor
- 🏛️ **Gemeenten**: Reviews schrijven/lezen, ervaringen delen, meldingen bekijken
- 🤝 **Samenwerkingen & Communities**: Community feedback faciliteren, ervaringen bundelen
- 🏢 **Leveranciers**: Reviews ontvangen, feedback verwerken, reputatie beheren
- ⚙️ **Functioneel Beheer**: Review moderatie, feedback trends analyseren

## Processtappen

### Voor Gemeenten (Reviews schrijven/lezen)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 6.1 | Software beoordelen | Beoordeling geven aan software die in gebruik is (sterren + tekst) |
| 6.2 | Review schrijven | Uitgebreide review schrijven over ervaringen met software/leverancier |
| 6.3 | Meldingen bekijken | Bekijk meldingen over wijzigingen van leveranciers |
| 6.4 | Gluren bij de buren | Bekijk welke applicaties door andere gemeenten in gebruik zijn |
| 6.5 | Reviews lezen | Lees ervaringen van andere gemeenten met software/leveranciers |
| 6.6 | Vragen stellen | Stel vragen aan andere gebruikers over hun ervaringen |

### Voor Leveranciers (Feedback ontvangen)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 6.1 | Reviews bekijken | Bekijk reviews en beoordelingen van klanten |
| 6.2 | Feedback verwerken | Reageer op feedback en verbeter dienstverlening |
| 6.3 | Overzicht afnemende organisaties | Inzicht wie mijn applicaties hebben opgevoerd |
| 6.4 | Applicatie/dienst promoten | Een dienst of applicatie delen met gemeenten via catalogus |

### Voor Samenwerkingen & Communities
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 6.1 | Leden ervaringen bundelen | Verzamel en deel ervaringen van leden |
| 6.2 | Gezamenlijke beoordelingen | Faciliteer gezamenlijke evaluaties van software |
| 6.3 | Best practices delen | Deel succesvolle implementaties en lessons learned |

### Voor Functioneel Beheer
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 6.1 | Review moderatie | Modereer reviews op kwaliteit en geschiktheid |
| 6.2 | Feedback trends analyseren | Analyseer patronen in gebruikersfeedback |
| 6.3 | Rapportages genereren | Maak rapportages over gebruikerstevredenheid |

## Gerelateerde Issues
- [#54](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/54) - Meldingen
- [#20](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/20) - Gluren bij de buren
- [#19](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/19) - Benchmarking
- [#8](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/8) - Afnemende organisaties
- [#10](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/10) - Promotie
- [#75](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/75) - Rapportages (voor feedback trends)

## Autorisatie Matrix

| Functionaliteit | Aanbod-beheerder | Gebruik-beheerder | Gebruik-raadpleger | Functioneel beheerder | VNG-raadpleger | Bezoeker |
|------------------|------------------|-------------------|--------------------|-----------------------|----------------|----------|
| **Reviews schrijven** | ✅ (eigen software) | ✅ (eigen organisatie) | ❌ | ✅ (moderatie) | ❌ | ❌ |
| **Reviews lezen** | ✅ (alle) | ✅ (alle) | ✅ (alle) | ✅ (alle) | ✅ (alle) | ✅ (publieke) |
| **Beoordelingen geven** | ✅ (eigen software) | ✅ (eigen organisatie) | ❌ | ✅ (moderatie) | ❌ | ❌ |
| **Meldingen bekijken** | ✅ (eigen software) | ✅ (eigen organisatie) | ✅ (eigen organisatie) | ✅ (alle) | ✅ (alle) | ❌ |
| **Community vragen stellen** | ✅ | ✅ | ❌ | ✅ | ❌ | ❌ |
| **Review moderatie** | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |

## Gebruikershandleidingen

### Review Schrijven

1. **Ga naar de software** die je wilt beoordelen
2. **Klik op 'Review schrijven'** 
3. **Geef een sterren beoordeling** (1-5 sterren)
4. **Schrijf je ervaring** in de tekstveld
5. **Voeg tags toe** (optioneel: implementatie, support, gebruiksvriendelijkheid)
6. **Publiceer je review**

### Reviews Lezen

1. **Ga naar een software pagina**
2. **Scroll naar de reviews sectie**
3. **Filter reviews** op sterren, datum, of organisatie type
4. **Lees ervaringen** van andere gebruikers
5. **Vind nuttige reviews** door op 'Nuttig' te klikken

## Vervolgfunctionaliteiten
- [F012 - AI Ondersteuning](./F012-ai-ondersteuning.md)
- [F007 - Data Export en Import](./F007-data-export-import.md)
