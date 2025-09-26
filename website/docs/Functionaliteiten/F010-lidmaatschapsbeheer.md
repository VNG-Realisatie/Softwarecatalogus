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
Deze functionaliteit beschrijft hoe organisaties kunnen aangeven waar ze lid van zijn (samenwerkingen en communities) en hoe ze deze lidmaatschappen kunnen beheren.

## Toepasselijk voor
- 🏛️ **Gemeenten**: Lidmaatschap aangeven bij samenwerkingen/communities
- 🤝 **Samenwerkingen & Communities**: Zien welke organisaties lid zijn
- 🏢 **Leveranciers**: Lidmaatschap aangeven bij communities
- ⚙️ **Functioneel Beheer**: Lidmaatschappen monitoren en ondersteunen

## Processtappen

### Voor Gemeenten en Leveranciers (Lidmaatschap aangeven)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 10.1 | Samenwerking/community identificeren | Organisatie identificeert relevante samenwerking of community |
| 10.2 | Lidmaatschap aangeven | Via beheerder lidmaatschap aangeven in softwarecatalogus |
| 10.3 | Lidmaatschap direct actief | Lidmaatschap is direct zichtbaar, geen bevestiging nodig |
| 10.4 | Voordelen benutten | Organisatie kan profiteren van lidmaatschap voordelen |

### Voor Samenwerkingen & Communities (Leden zien)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 10.1 | Potentiële leden benaderen | Actief benaderen van organisaties voor lidmaatschap |
| 10.2 | Lidmaatschap aansporen | Leden aansporen om lidmaatschap aan te geven in catalogus |
| 10.3 | Ledenlijst bekijken | Zien welke organisaties zich als lid hebben aangegeven |
| 10.4 | Leden ondersteunen | Leden begeleiden en ondersteunen bij gebruik van voordelen |

### Voor Organisaties (Lidmaatschap beëindigen)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 10.1 | Besluit tot uitstappen | Organisatie besluit lidmaatschap te beëindigen |
| 10.2 | Lidmaatschap verwijderen | Via beheerder lidmaatschap verwijderen uit catalogus |
| 10.3 | Direct effect | Lidmaatschap is direct niet meer zichtbaar |
| 10.4 | Voordelen vervallen | Toegang tot lidmaatschap voordelen vervalt |

## Gebruikershandleidingen

### Lidmaatschap Aangeven (voor Gemeenten/Leveranciers)

1. **Log in** op de softwarecatalogus
2. **Ga naar organisatiebeheer**
3. **Zoek de samenwerking/community** in de lijst
4. **Klik op "Lidmaatschap aangeven"**
5. **Bevestig uw keuze**
6. **Lidmaatschap is direct actief** - geen wachttijd

### Ledenlijst Bekijken (voor Samenwerkingen/Communities)

1. **Log in** als beheerder van de samenwerking/community
2. **Ga naar ledenbeheer**
3. **Bekijk huidige leden** die zich hebben aangegeven
4. **Zie organisatie details**:
   - Welke organisaties zijn lid
   - Wanneer ze lid zijn geworden
   - Contactgegevens van leden
5. **Export ledenlijst** indien gewenst
6. **Neem contact op** met leden voor samenwerking

### Leden Werven

1. **Identificeer potentiële leden** die passen bij uw doelstellingen
2. **Neem contact op** via telefoon, e-mail of persoonlijk gesprek
3. **Leg voordelen uit** van lidmaatschap van uw samenwerking/community
4. **Verwijs naar de softwarecatalogus** voor lidmaatschap aangeven
5. **Controleer** of de organisatie het lidmaatschap heeft aangegeven
6. **Begeleid nieuwe leden** bij hun eerste stappen

## Gerelateerde Issues
- [#144](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/144) - Lidmaatschap aangeven
- [#145](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/145) - Ledenlijst bekijken
- [#146](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/146) - Leden werven

## Autorisatie Matrix

| Functionaliteit | Aanbod-beheerder | Gebruik-beheerder | Gebruik-raadpleger | Functioneel beheerder | VNG-raadpleger | Bezoeker |
|------------------|------------------|-------------------|--------------------|-----------------------|----------------|----------|
| **Lidmaatschap aangeven** | ✅ (eigen organisatie) | ✅ (eigen organisatie) | ❌ | ✅ (alle organisaties) | ❌ | ❌ |
| **Ledenlijst bekijken** | ✅ (eigen samenwerking/community) | ✅ (eigen samenwerking/community) | 👁️ (eigen samenwerking/community) | ✅ (alle) | 👁️ (alleen lezen) | ❌ |
| **Leden werven** | ✅ (eigen samenwerking/community) | ✅ (eigen samenwerking/community) | ❌ | ✅ (alle) | ❌ | ❌ |
| **Lidmaatschap opzeggen** | ✅ (eigen organisatie) | ✅ (eigen organisatie) | ❌ | ✅ (alle organisaties) | ❌ | ❌ |

## Vervolgfunctionaliteiten
- [F002 - Organisatie Inrichten](./F002-organisatie-inrichten.md)
- [F004 - Applicatiebeheer](./F004-applicatiebeheer.md)
- [F005 - Dienstenbeheer](./F005-dienstenbeheer.md)
