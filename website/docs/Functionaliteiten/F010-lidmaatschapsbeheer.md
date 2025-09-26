---
id: f010-lidmaatschapsbeheer
title: F010 - Lidmaatschapsbeheer
sidebar_label: F010 - Lidmaatschapsbeheer
sidebar_position: 10
description: Functionaliteit voor het beheren van lidmaatschappen van samenwerkingen en communities
keywords:
  - lidmaatschap
  - samenwerkingen
  - communities
  - leden
---

# F010 - Lidmaatschapsbeheer

## Beschrijving
Deze functionaliteit beschrijft hoe organisaties lidmaatschappen van samenwerkingen en communities kunnen aangeven, bevestigen en beheren.

## Toepasselijk voor
- 🏛️ **Gemeenten**: Lidmaatschap aangeven bij samenwerkingen/communities
- 🤝 **Samenwerkingen & Communities**: Lidmaatschappen bevestigen en beheren
- 🏢 **Leveranciers**: Lidmaatschap aangeven bij communities
- ⚙️ **Functioneel Beheer**: Lidmaatschappen monitoren en ondersteunen

## Processtappen

### Voor Gemeenten en Leveranciers (Lid worden)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 10.1 | Samenwerking/community identificeren | Organisatie identificeert relevante samenwerking of community |
| 10.2 | Contact opnemen | Informeel contact met samenwerking/community over lidmaatschap |
| 10.3 | Lidmaatschap aangeven | Via beheerder lidmaatschap aangeven in softwarecatalogus |
| 10.4 | Wachten op bevestiging | Samenwerking/community bevestigt het lidmaatschap |
| 10.5 | Lidmaatschap actief | Organisatie is officieel lid en kan profiteren van voordelen |

### Voor Samenwerkingen & Communities (Leden beheren)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 10.1 | Potentiële leden benaderen | Actief benaderen van organisaties voor lidmaatschap |
| 10.2 | Lidmaatschap aansporen | Leden aansporen om lidmaatschap aan te geven in catalogus |
| 10.3 | Lidmaatschapsverzoeken beoordelen | Beoordelen van inkomende lidmaatschapsverzoeken |
| 10.4 | Lidmaatschap bevestigen | Goedgekeurde lidmaatschappen bevestigen |
| 10.5 | Leden ondersteunen | Nieuwe leden begeleiden en ondersteunen |

### Voor Organisaties (Uitstappen)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 10.1 | Besluit tot uitstappen | Organisatie besluit lidmaatschap te beëindigen |
| 10.2 | Lidmaatschap opzeggen | Via beheerder lidmaatschap opzeggen in catalogus |
| 10.3 | Bevestiging ontvangen | Systeem bevestigt beëindiging lidmaatschap |
| 10.4 | Toegang aanpassen | Toegang tot samenwerking/community wordt aangepast |

## Gebruikershandleidingen

### Lidmaatschap Aangeven (voor Gemeenten/Leveranciers)

1. **Log in** op de softwarecatalogus
2. **Ga naar organisatiebeheer**
3. **Zoek de samenwerking/community** in de lijst
4. **Klik op "Lidmaatschap aangeven"**
5. **Bevestig uw verzoek**
6. **Wacht op goedkeuring** van de samenwerking/community

### Lidmaatschap Bevestigen (voor Samenwerkingen/Communities)

1. **Log in** als beheerder van de samenwerking/community
2. **Ga naar ledenbeheer**
3. **Bekijk openstaande lidmaatschapsverzoeken**
4. **Beoordeel elk verzoek**:
   - Controleer of organisatie past bij doelstellingen
   - Controleer of organisatie voldoet aan criteria
5. **Klik op "Goedkeuren" of "Afwijzen"**
6. **Voeg eventueel een bericht toe** voor de aanvrager

### Leden Werven

1. **Identificeer potentiële leden** die passen bij uw doelstellingen
2. **Neem contact op** via telefoon, e-mail of persoonlijk gesprek
3. **Leg voordelen uit** van lidmaatschap van uw samenwerking/community
4. **Verwijs naar de softwarecatalogus** voor officiële aanmelding
5. **Volg op** of de organisatie het lidmaatschap heeft aangegeven
6. **Begeleid nieuwe leden** bij hun eerste stappen

## Gerelateerde Issues
- [#144](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/144) - Lidmaatschap aangeven
- [#145](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/145) - Lidmaatschap bevestigen
- [#146](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/146) - Leden werven

## Autorisatie Matrix

| Functionaliteit | Aanbod-beheerder | Gebruik-beheerder | Gebruik-raadpleger | Functioneel beheerder | VNG-raadpleger | Bezoeker |
|------------------|------------------|-------------------|--------------------|-----------------------|----------------|----------|
| **Lidmaatschap aangeven** | ✅ (eigen organisatie) | ✅ (eigen organisatie) | ❌ | ✅ (alle organisaties) | ❌ | ❌ |
| **Lidmaatschap bevestigen** | ✅ (eigen samenwerking/community) | ✅ (eigen samenwerking/community) | ❌ | ✅ (alle) | 👁️ (alleen lezen) | ❌ |
| **Leden werven** | ✅ (eigen samenwerking/community) | ✅ (eigen samenwerking/community) | ❌ | ✅ (alle) | ❌ | ❌ |
| **Lidmaatschap opzeggen** | ✅ (eigen organisatie) | ✅ (eigen organisatie) | ❌ | ✅ (alle organisaties) | ❌ | ❌ |

## Vervolgfunctionaliteiten
- [F002 - Organisatie Inrichten](./F002-organisatie-inrichten.md)
- [F004 - Applicatiebeheer](./F004-applicatiebeheer.md)
- [F005 - Dienstenbeheer](./F005-dienstenbeheer.md)
