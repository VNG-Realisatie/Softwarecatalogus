---
id: voorzieningstype
title: Voorzienings type
sidebar_label: Voorzieningstype
sidebar_position: 7
---

# Voorzieningstype

Een Voorzieningstype is een categorisering van voorzieningen op basis van hun functie of doel. Het helpt bij het organiseren en zoeken van voorzieningen binnen de catalogus.

## Eigenschappen

| Naam | Type | Verplicht | Beschrijving |
|------|------|-----------|--------------|
| id | UUID | Ja | Unieke identifier van het Voorzieningstype |
| naam | string | Ja | Naam van het voorzieningstype |
| beschrijving | string | Nee | Beschrijving van het voorzieningstype |
| bovenliggendType | UUID | Nee | Bovenliggend voorzieningstype (voor hiërarchische indeling) |

## Relaties

- Een Voorzieningstype kan een bovenliggend Voorzieningstype hebben (hiërarchische relatie)
- Een Voorzieningstype kan door meerdere [Voorziening](./voorziening) objecten worden gebruikt

## Voorbeeld
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "naam": "Zaaksysteem",
  "beschrijving": "Systemen voor zaakgericht werken binnen de overheid",
  "bovenliggendType": "123e4567-e89b-12d3-a456-426614174001"
}
``` 


