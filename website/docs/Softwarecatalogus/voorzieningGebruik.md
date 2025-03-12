---
id: voorzieninggebruik
title: VoorzieningGebruik
sidebar_label: VoorzieningGebruik
sidebar_position: 5
---

# VoorzieningGebruik

Een VoorzieningGebruik beschrijft een organisatie die een voorziening gebruikt, met optioneel de versie die gebruikt wordt en een contactpersoon.

## API Specificatie

De volledige API specificatie voor VoorzieningGebruik is beschikbaar op de [VNG API Specificatie pagina](https://vng-realisatie.github.io/Softwarecatalogus/api#tag/Software-Catalogus).

## Eigenschappen

| Naam | Type | Verplicht | Beschrijving |
|------|------|-----------|--------------|
| id | string | Ja | Unieke identifier van het VoorzieningGebruik |
| organisatie | [Organisatie](./Organisatie) | Ja | De organisatie die de voorziening gebruikt |
| voorziening | [Voorziening](./Voorziening) | Ja | De voorziening die gebruikt wordt |
| versie | string | Nee | De specifieke versie van de voorziening die gebruikt wordt |
| contactpersoon | [Persoon](./Persoon) | Nee | De contactpersoon voor dit gebruik van de voorziening |
| startDatum | date | Nee | De datum waarop het gebruik van de voorziening is gestart |
| eindDatum | date | Nee | De datum waarop het gebruik van de voorziening is beëindigd (indien van toepassing) |
| status | enum | Ja | De status van het gebruik (bijv. 'Actief', 'Gepland', 'Beëindigd') |
| opmerkingen | string | Nee | Aanvullende informatie over het gebruik van de voorziening |
| isGerelateerdAan | array | Nee | Gerelateerde referentieconcepten |

## Relaties

- Een VoorzieningGebruik is gekoppeld aan precies één [Organisatie](./Organisatie)
- Een VoorzieningGebruik is gekoppeld aan precies één [Voorziening](./Voorziening)
- Een VoorzieningGebruik kan gekoppeld zijn aan één [Persoon](./Persoon) als contactpersoon
- Een VoorzieningGebruik kan gekoppeld zijn aan meerdere [Contract](./Contract) objecten
- Een VoorzieningGebruik kan gerelateerd zijn aan [ReferentieConcept](./ReferentieConcept) objecten

## Voorbeeld

```json
{
  "id": "VG-2023-001",
  "organisatie": {
    "id": "ORG-001",
    "naam": "Gemeente Amsterdam"
  },
  "voorziening": {
    "id": "VZ-001",
    "naam": "DigiD"
  },
  "versie": "5.2.1",
  "contactpersoon": {
    "id": "PER-001",
    "naam": "Jan Jansen",
    "email": "j.jansen@amsterdam.nl"
  },
  "startDatum": "2023-01-15",
  "eindDatum": null,
  "status": "Actief",
  "opmerkingen": "Gebruik voor burgerportaal",
  "isGerelateerdAan": [
    {
      "id": "RC-002",
      "naam": "Authenticatiecomponent",
      "type": "Referentiecomponent"
    }
  ]
}
```