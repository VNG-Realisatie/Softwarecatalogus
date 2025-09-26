---
id: f001-toegang-verkrijgen
title: F001 - Toegang Verkrijgen
sidebar_label: F001 - Toegang Verkrijgen
sidebar_position: 1
description: Functionaliteit voor het verkrijgen van toegang tot de GEMMA Softwarecatalogus
keywords:
  - toegang
  - registratie
  - VNG
  - beheerders
---

# F001 - Toegang Verkrijgen

## Beschrijving
Deze functionaliteit beschrijft hoe verschillende typen organisaties toegang kunnen verkrijgen tot de GEMMA Softwarecatalogus.

## Toepasselijk voor
- 🏛️ **Gemeenten**: Automatische toegang, beheerders kunnen contact opnemen met VNG
- 🤝 **Samenwerkingen & Communities**: Moeten contact opnemen met VNG voor toelating
- 🏢 **Leveranciers**: Aanmelden via registratieformulier
- ⚙️ **Functioneel Beheer**: Directe toegang als VNG medewerker

## Processtappen

### Voor Gemeenten
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 1.1 | Gemeente bestaat controleren | VNG controleert of gemeente al in systeem bestaat |
| 1.2 | Gemeente aanmaken (indien nodig) | VNG maakt gemeente aan in het systeem |
| 1.3 | Toegang controleren | Controleren of beheerder al toegang heeft |
| 1.4 | Contact opnemen met VNG | Beheerder zonder toegang neemt contact op met VNG |
| 1.5 | VNG beoordeelt verzoek | VNG besluit over toegang verlenen of doorverwijzen |
| 1.6 | Toegang verlenen | VNG geeft direct toegang aan nieuwe beheerder |
| 1.7 | Contact met huidige beheerder | VNG brengt in contact met bestaande beheerder |

### Voor Samenwerkingen & Communities
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 1.1 | Contact opnemen met VNG | Samenwerking/community neemt contact op voor toelating |
| 1.2 | Beoordeling door VNG | VNG Realisatie beoordeelt de aanvraag |
| 1.3 | Besluit toelating | Goedkeuring of afwijzing van de aanvraag |
| 1.4 | Organisatie-informatie opvoeren | VNG voert organisatiegegevens in het systeem in |
| 1.5 | Eerste beheerder aanmaken | VNG maakt het eerste beheerdersaccount aan |
| 1.6 | Toegang verlenen | Beheerder krijgt toegang tot het platform |

### Voor Leveranciers
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 1.1 | Organisatie aanmelden | Startpunt voor leveranciers om toegang aan te vragen |
| 1.2 | Registratie bevestigen (via e-mail) | Leverancier bevestigt aanmelding via link in e-mail |
| 1.3 | Eerste account aanmaken (beheerder) | De eerste gebruiker wordt door functioneel beheer aangemaakt |

## Gerelateerde Issues
- [#139](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/139) - Leverancier aanmelding
- [#63](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/63) - Account aanmaken

## Gebruikershandleidingen

### Aanmelden

Voor leveranciers die zich willen aanmelden bij de GEMMA Softwarecatalogus:

1. **Ga naar de aanmeldpagina** van de softwarecatalogus
2. **Vul het registratieformulier in** met:
   - Bedrijfsgegevens
   - Contactinformatie
   - Beschrijving van uw organisatie
   - Type software dat u aanbiedt
3. **Verstuur de aanmelding**
4. **Wacht op bevestiging** - Dit kan enkele werkdagen duren
5. **Ontvang toegangsgegevens** via e-mail na goedkeuring

:::note Verwerkingstijd
Nadat u op "Aanmelden" heeft gedrukt kan het heel even duren voordat uw aanmelding is verwerkt. VNG Realisatie beoordeelt elke aanmelding handmatig.
:::

### Inloggen

Voor gebruikers die al toegang hebben:

1. **Ga naar de inlogpagina** van de softwarecatalogus
2. **Voer uw gebruikersnaam en wachtwoord in**
3. **Klik op "Inloggen"**
4. **U wordt doorgeleid naar het dashboard**

### Wachtwoord Vergeten

Als u uw wachtwoord bent vergeten:

1. **Ga naar de inlogpagina**
2. **Klik op "Wachtwoord vergeten?"**
3. **Voer uw e-mailadres in**
4. **Controleer uw e-mail** voor reset instructies
5. **Volg de link** in de e-mail om een nieuw wachtwoord in te stellen
6. **Log in met uw nieuwe wachtwoord**

:::tip Hulp nodig?
Als u problemen heeft met inloggen of uw account, neem dan contact op met de functioneel beheerder via de contactgegevens in de catalogus.
:::

## Autorisatie Matrix

### Toegang Verkrijgen per Rol

| Rol | Toegang Verkrijgen | Registratiemethode | Goedkeuring Vereist |
|-----|-------------------|-------------------|-------------------|
| **Aanbod-beheerder** | ✅ Via registratieformulier | Zelfregistratie leverancier | ✅ VNG Realisatie |
| **Gebruik-beheerder** | ✅ Via VNG (gemeenten) | Contact VNG of via huidige beheerder | ✅ VNG of bestaande beheerder |
| **Gebruik-raadpleger** | ✅ Via organisatie beheerder | Uitnodiging door beheerder | ✅ Organisatie beheerder |
| **Functioneel beheerder** | ✅ Direct (VNG medewerker) | Interne VNG procedure | ❌ Automatisch |
| **VNG-raadpleger** | ✅ Via VNG | VNG interne aanvraag | ✅ VNG management |
| **Bezoeker** | ❌ Geen toegang tot beheer | Geen registratie mogelijk | N.v.t. |

### Uitgebreide Autorisatie Matrix - Alle Functionaliteiten

| Functionaliteit | Aanbod-beheerder | Gebruik-beheerder | Gebruik-raadpleger | Functioneel beheerder | VNG-raadpleger | Bezoeker |
|------------------|------------------|-------------------|--------------------|-----------------------|----------------|----------|
| **F001 - Toegang Verkrijgen** | ✅ (zelf) | ✅ (via VNG) | ✅ (via beheerder) | ✅ (direct) | ✅ (via VNG) | ❌ |
| **F002 - Organisatie Inrichten** | ✅ (eigen org) | ✅ (eigen org) | ❌ | ✅ (alle org) | 👁️ (alleen lezen) | ❌ |
| **F003 - Gebruikersbeheer** | ✅ (eigen org) | ✅ (eigen org) | ❌ | ✅ (alle org) | 👁️ (alleen lezen) | ❌ |
| **F004 - Applicatiebeheer** | ✅ (eigen apps) | ✅ (eigen gebruik) | 👁️ (eigen org) | ✅ (alle apps) | 👁️ (alle apps) | 👁️ (publiek) |
| **F005 - Dienstenbeheer** | ✅ (eigen diensten) | ✅ (eigen gebruik) | 👁️ (eigen org) | ✅ (alle diensten) | 👁️ (alle diensten) | 👁️ (publiek) |
| **F006 - Aanbevelingen** | 👁️ (ontvangen) | ✅ (geven/ontvangen) | 👁️ (eigen org) | ✅ (beheren) | 👁️ (alle) | ❌ |
| **F007 - Rapportage & Export** | ✅ (eigen data) | ✅ (eigen data) | 👁️ (eigen org) | ✅ (alle data) | ✅ (alle data) | ❌ |
| **F008 - Externe Koppelingen** | ✅ (eigen koppelingen) | ✅ (eigen koppelingen) | 👁️ (eigen org) | ✅ (alle koppelingen) | 👁️ (alle koppelingen) | ❌ |
| **F009 - Beheer & Configuratie** | ❌ | ❌ | ❌ | ✅ (volledig) | ❌ | ❌ |

### Legenda
- ✅ **Volledig**: Kan alle acties uitvoeren binnen de functionaliteit
- 👁️ **Alleen Lezen**: Kan informatie bekijken maar niet wijzigen  
- ❌ **Geen Toegang**: Heeft geen toegang tot deze functionaliteit
- **(eigen org)**: Beperkt tot eigen organisatie
- **(alle)**: Toegang tot alle organisaties/data

## Vervolgfunctionaliteiten
- [F002 - Organisatie Inrichten](./F002-organisatie-inrichten.md)
- [F003 - Gebruikersbeheer](./F003-gebruikersbeheer.md)
