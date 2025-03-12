---
id: voorzieningstype
title: Voorzieningstype
sidebar_label: Voorzieningstype
sidebar_position: 7
---

# Voorzieningstype

Een Voorzieningstype is een categorisering van voorzieningen op basis van hun functie of doel. Het helpt bij het organiseren en zoeken van voorzieningen binnen de catalogus.

## Eigenschappen

| Naam | Type | Verplicht | Beschrijving |
|------|------|-----------|--------------|
| id | string | Ja | Unieke identifier van het Voorzieningstype |
| naam | string | Ja | Naam van het voorzieningstype |
| beschrijving | string | Nee | Beschrijving van het voorzieningstype |
| bovenliggendType | [Voorzieningstype](./Voorzieningstype) | Nee | Bovenliggend voorzieningstype (voor hiërarchische indeling) |

## Relaties

- Een Voorzieningstype kan een bovenliggend Voorzieningstype hebben (hiërarchische relatie)
- Een Voorzieningstype kan aan meerdere [Voorziening](./Voorziening) objecten gekoppeld zijn

## Voorbeeld

```json
{
  "id": "VZT-001",
  "naam": "Zaaksysteem",
  "beschrijving": "Systemen voor zaakgericht werken binnen de overheid",
  "bovenliggendType": {
    "id": "VZT-000",
    "naam": "Primaire processen"
  }
}
``` 