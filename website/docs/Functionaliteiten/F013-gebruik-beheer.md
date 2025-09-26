---
id: f013-gebruik-beheer
title: F013 - Gebruik Beheer
sidebar_label: F013 - Gebruik Beheer
sidebar_position: 13
description: Functionaliteit voor het beheren van applicatielandschap, gebruik registratie en installaties
keywords:
  - gebruik
  - applicatielandschap
  - installaties
  - koppelingen
  - hosting
  - contracten
---

# F013 - Gebruik Beheer

## Beschrijving
Deze functionaliteit beschrijft hoe organisaties hun applicatielandschap kunnen vastleggen en gebruik kunnen registreren. Het gaat om het complete overzicht van welke producten en diensten worden afgenomen, waar deze worden gehost, aan welke systemen ze zijn gekoppeld en voor welke functionaliteiten ze worden ingezet. Dit is het "installatie-object" perspectief - de daadwerkelijke implementaties van software.

## Toepasselijk voor
- 🏛️ **Gemeenten**: Applicatielandschap vastleggen, gebruik registreren, koppelingen beheren
- 🤝 **Samenwerkingen & Communities**: Gebruik registreren voor leden, collectief applicatielandschap
- 🏢 **Leveranciers**: Gebruik voorstellen voor gemeenten (eigen software), klantoverzicht
- ⚙️ **Functioneel Beheer**: Gebruik valideren, installatie kwaliteit bewaken

## Processtappen

### Voor Gemeenten (Applicatielandschap Beheren)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 13.1 | Applicatie zoeken | Vind applicaties in de catalogus om toe te voegen aan applicatielandschap |
| 13.2 | Gebruik registreren | Registreer dat gemeente deze software gebruikt (via wizard) |
| 13.3 | Gebruiksdetails vastleggen | Specificeer: afdeling, aantal gebruikers, versie, go-live datum |
| 13.4 | Hosting informatie | Vastleggen waar software wordt gehost (eigen datacenter, cloud, SaaS) |
| 13.5 | Functionaliteiten koppelen | Aangeven voor welke gemeentelijke processen software wordt gebruikt |
| 13.6 | Koppelingen beheren | Vastleggen welke systemen met elkaar zijn gekoppeld |
| 13.7 | Contractinformatie | Vastleggen van contractduur, kosten, contactpersoon leverancier |
| 13.8 | Gebruik bijwerken | Wijzigen van gebruiksgegevens (nieuwe versie, meer gebruikers, etc.) |
| 13.9 | Gebruik beëindigen | Registreren dat software niet meer wordt gebruikt |
| 13.10 | Missende software melden | Software die niet in catalogus staat als concept aanmelden |

### Voor Samenwerkingen & Communities (Gebruik voor Leden)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 13.1 | Collectief gebruik registreren | Gebruik aanmelden namens meerdere leden tegelijk |
| 13.2 | Gezamenlijke inkoop vastleggen | Registreren van software die gezamenlijk is ingekocht |
| 13.3 | Lidmaatschap koppelen | Aangeven welke leden gebruik maken van welke software |
| 13.4 | Hosting coördineren | Beheren van gezamenlijke hosting arrangementen |
| 13.5 | Contractbeheer | Beheren van collectieve contracten en licenties |
| 13.6 | Gebruik monitoren | Overzicht houden van gebruik door verschillende leden |

### Voor Leveranciers (Gebruik Voorstellen en Monitoren)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 13.1 | Klanten identificeren | Zien welke gemeenten hun software gebruiken |
| 13.2 | Gebruik voorstellen | Voorstellen dat gemeente hun software gebruikt (mits eigen product) |
| 13.3 | Gebruiksdetails aanvullen | Helpen bij het compleet maken van gebruiksinformatie |
| 13.4 | Klantoverzicht beheren | Overzicht bijhouden van alle klanten en hun gebruik |
| 13.5 | Implementatie ondersteunen | Ondersteuning bieden bij registratie van nieuwe implementaties |
| 13.6 | Referenties beheren | Klanten vragen om referentie te worden voor andere gemeenten |

### Voor Functioneel Beheer (Gebruik Validatie)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 13.1 | Gebruik valideren | Controleren of geregistreerd gebruik klopt met werkelijkheid |
| 13.2 | Installatie kwaliteit | Controleren op volledigheid van gebruiksgegevens |
| 13.3 | Duplicaten opruimen | Meerdere registraties van hetzelfde gebruik samenvoegen |
| 13.4 | Koppelingen valideren | Controleren of geregistreerde koppelingen kloppen |
| 13.5 | Contract compliance | Controleren of gebruik overeenkomt met contracten |

## Gerelateerde Issues
- [#18](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/18) - Applicatie toevoegen
- [#17](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/17) - Informatie invullen
- [#56](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/56) - Koppelingen maken
- [#144](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/144) - Gebruik registreren
- [#145](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/145) - Hosting informatie

## Autorisatie Matrix

| Functionaliteit | Aanbod-beheerder | Gebruik-beheerder | Gebruik-raadpleger | Functioneel beheerder | VNG-raadpleger | Bezoeker |
|------------------|------------------|-------------------|--------------------|-----------------------|----------------|----------|
| **Gebruik registreren (eigen organisatie)** | ❌ | ✅ | ❌ | ✅ | ❌ | ❌ |
| **Gebruik voorstellen (eigen software)** | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **Gebruik registreren (voor leden)** | ✅ (samenwerkingen) | ✅ (samenwerkingen) | ❌ | ✅ | ❌ | ❌ |
| **Koppelingen beheren** | ❌ | ✅ | ❌ | ✅ | ❌ | ❌ |
| **Applicatielandschap bekijken** | ✅ (eigen klanten) | ✅ (eigen organisatie) | ✅ (eigen organisatie) | ✅ (alle) | ✅ (geanonimiseerd) | ❌ |
| **Hosting informatie beheren** | ❌ | ✅ | ❌ | ✅ | ❌ | ❌ |
| **Contractinformatie beheren** | ❌ | ✅ | ❌ | ✅ | ❌ | ❌ |
| **Gebruik valideren** | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |

## Gebruikershandleidingen

### Gebruik Registreren (voor Gemeenten)

1. **Zoek de software** in de catalogus via F011 - Zoeken & Ontdekken
2. **Klik op "Gebruik registreren"** bij de gewenste software
3. **Doorloop de wizard** met de volgende stappen:
   - **Stap 1**: Basisgegevens (afdeling, contactpersoon, go-live datum)
   - **Stap 2**: Gebruiksdetails (aantal gebruikers, versie, licentie type)
   - **Stap 3**: Hosting (waar wordt het gehost, door wie beheerd)
   - **Stap 4**: Functionaliteiten (voor welke processen wordt het gebruikt)
   - **Stap 5**: Contractinformatie (leverancier, contractduur, kosten)
4. **Controleer en bevestig** alle gegevens
5. **Gebruik is geregistreerd** en zichtbaar in uw applicatielandschap

### Gebruik Voorstellen (voor Leveranciers)

1. **Ga naar uw klantoverzicht** in het leverancierspaneel
2. **Zoek de gemeente** die uw software gebruikt
3. **Klik op "Gebruik voorstellen"** naast de gemeente
4. **Selecteer uw software** uit uw productportfolio
5. **Vul bekende details in** (implementatiedatum, versie, contactpersoon)
6. **Verstuur het voorstel** naar de gemeente
7. **Gemeente ontvangt notificatie** en kan het voorstel accepteren/aanvullen

### Collectief Gebruik (voor Samenwerkingen)

1. **Ga naar ledenbeheer** in uw samenwerkingspaneel
2. **Selecteer "Gebruik registreren voor leden"**
3. **Kies de software** die gezamenlijk wordt gebruikt
4. **Selecteer de leden** die deze software gebruiken
5. **Vul collectieve details in** (gezamenlijk contract, hosting arrangement)
6. **Bevestig registratie** voor alle geselecteerde leden

### Applicatielandschap Overzicht

1. **Dashboard bekijken**: Overzicht van alle geregistreerde software
2. **Filteren en zoeken**: Vind specifieke applicaties of categorieën
3. **Koppelingen visualiseren**: Zie hoe systemen met elkaar verbonden zijn
4. **Rapporten genereren**: Exporteer overzichten voor management
5. **Trends analyseren**: Zie ontwikkelingen in uw applicatielandschap

## Vervolgfunctionaliteiten
- [F004 - Aanbod Beheer](./F004-aanbod-beheer.md)
- [F005 - Dienstenbeheer](./F005-dienstenbeheer.md)
- [F006 - Reviews en Community Feedback](./F006-reviews-en-community-feedback.md)
- [F008 - Externe Koppelingen](./F008-externe-koppelingen.md)
