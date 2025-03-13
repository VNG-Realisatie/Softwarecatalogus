---
id: voorzieninggebruik
title: Voorziening Gebruik
sidebar_label: Voorziening Gebruik
sidebar_position: 5
---

# Voorziening Gebruik

Een Voorziening Gebruik beschrijft een organisatie die een voorziening gebruikt, met optioneel de versie die gebruikt wordt en een contactpersoon.

## API Specificatie

De volledige API specificatie voor VoorzieningGebruik is beschikbaar op de [VNG API Specificatie pagina](https://vng-realisatie.github.io/Softwarecatalogus/api#tag/Software-Catalogus).

## Eigenschappen

| Naam | Type | Verplicht | Beschrijving |
|------|------|-----------|--------------|
| id | UUID | Ja | Unieke identifier van het VoorzieningGebruik |
| organisatieId | UUID | Ja | ID van de [Organisatie](./Organisatie) die de voorziening gebruikt |
| voorzieningId | UUID | Ja | ID van de [Voorziening](./Voorziening) die gebruikt wordt |
| versieId | UUID | Nee | ID van de specifieke [Versie](./Voorzieningversie) van de voorziening die gebruikt wordt |
| contactpersoon | Persoon | Nee | De contactpersoon voor dit gebruik van de voorziening. Dit is een genest object gebaseerd op schema.org/Person met de volgende eigenschappen:<br/>- naam: string - De volledige naam van de persoon<br/>- email: string - Het e-mailadres van de persoon<br/>- telefoonnummer: string - Het telefoonnummer van de persoon<br/>- functie: string - De functie van de persoon |
| startDatum | date | Nee | De datum waarop het gebruik van de voorziening is gestart |
| eindDatum | date | Nee | De datum waarop het gebruik van de voorziening is beëindigd (indien van toepassing) |
| status | enum | Ja | De status van het gebruik (bijv. 'Actief', 'Gepland', 'Beëindigd') |
| opmerkingen | string | Nee | Aanvullende informatie over het gebruik van de voorziening |

## Relaties

- Een VoorzieningGebruik is gekoppeld aan precies één [Organisatie](./Organisatie)
- Een VoorzieningGebruik is gekoppeld aan precies één [Voorziening](./Voorziening)
- Een VoorzieningGebruik kan gekoppeld zijn aan één [Persoon](./Persoon) als contactpersoon
- Een VoorzieningGebruik kan gebruikt worden door meerdere [Contract](./Contract) objecten
- Een VoorzieningGebruik kan gerelateerd zijn aan [ReferentieConcept](./ReferentieConcept) objecten

## Voorbeeld

```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "organisatieId": "123e4567-e89b-12d3-a456-426614174000",
  "voorzieningId": "123e4567-e89b-12d3-a456-426614174001",
  "versieId": "123e4567-e89b-12d3-a456-426614174002",
  "contactpersoon": {
    "naam": "Jan Jansen",
    "email": "j.jansen@amsterdam.nl"
  },
  "startDatum": "2023-01-15",
  "eindDatum": null,
  "status": "Actief",
  "opmerkingen": "Gebruik voor burgerportaal",
  ]
}
```

## API Documentatie

