---
id: gebruiker
title: Gebruiker
sidebar_position: 7
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Gebruiker

## Inleiding

Het Gebruiker object representeert een gebruiker van het systeem. Gebruikers kunnen verschillende rollen hebben binnen het systeem, zoals beheerder, bewerker of alleen-lezen toegang. Elke gebruiker heeft een unieke identificatie, gebruikersnaam en e-mailadres.

## Eigenschappen

| Eigenschap | Type | Verplicht | Beschrijving |
|------------|------|-----------|--------------|
| id | string | Ja | Unieke identificatie voor de gebruiker |
| username | string | Ja | Gebruikersnaam voor inloggen |
| email | string (email) | Ja | E-mailadres van de gebruiker |
| voornaam | string | Nee | Voornaam van de gebruiker |
| achternaam | string | Nee | Achternaam van de gebruiker |
| functie | string | Nee | Functie van de gebruiker binnen de organisatie |
| organisatie | string | Nee | Organisatie waartoe de gebruiker behoort |
| telefoonnummer | string | Nee | Telefoonnummer van de gebruiker |
| rollen | array van strings | Nee | Rollen die de gebruiker heeft in het systeem (admin, editor, viewer) |
| actief | boolean | Nee | Geeft aan of het gebruikersaccount actief is (standaard: true) |
| laatsteInlogdatum | string (date-time) | Nee | Datum en tijd van de laatste inlog |
| aanmaakdatum | string (date-time) | Nee | Datum en tijd waarop het account is aangemaakt |
| wijzigingsdatum | string (date-time) | Nee | Datum en tijd van de laatste wijziging aan het account |
| voorkeuren | object | Nee | Gebruikersvoorkeuren |

### Voorkeuren object

| Eigenschap | Type | Verplicht | Beschrijving |
|------------|------|-----------|--------------|
| taal | string | Nee | Voorkeurstaal van de gebruiker (nl, en) (standaard: nl) |
| thema | string | Nee | Voorkeur voor weergavethema (licht, donker, systeem) (standaard: systeem) |

## Voorbeeld

```json
{
  "id": "user-123",
  "username": "jdoe",
  "email": "john.doe@example.com",
  "voornaam": "John",
  "achternaam": "Doe",
  "functie": "Applicatiebeheerder",
  "organisatie": "Gemeente Amsterdam",
  "telefoonnummer": "0201234567",
  "rollen": ["admin", "editor"],
  "actief": true,
  "laatsteInlogdatum": "2023-03-15T14:30:00Z",
  "aanmaakdatum": "2022-01-10T09:00:00Z",
  "wijzigingsdatum": "2023-02-20T11:15:00Z",
  "voorkeuren": {
    "taal": "nl",
    "thema": "licht"
  }
}
```

## API Endpoints

### Alle gebruikers ophalen

```
GET /users
```

Geeft een lijst van alle gebruikers terug.

### Een specifieke gebruiker ophalen

```
GET /users/{id}
```

Geeft details van een specifieke gebruiker terug op basis van het ID.

### Een nieuwe gebruiker aanmaken

```
POST /users
```

Maakt een nieuwe gebruiker aan met de opgegeven gegevens.

### Een gebruiker bijwerken

```
PUT /users/{id}
```

Werkt een bestaande gebruiker bij met de opgegeven gegevens.

### Een gebruiker verwijderen

```
DELETE /users/{id}
```

Verwijdert een bestaande gebruiker op basis van het ID.

## Relaties met andere objecten

Gebruikers kunnen verschillende rollen hebben binnen het systeem en zijn vaak gekoppeld aan specifieke organisaties. Ze kunnen verantwoordelijk zijn voor het beheren van voorzieningen, voorzieningaanbiedingen en kwetsbaarheden. 