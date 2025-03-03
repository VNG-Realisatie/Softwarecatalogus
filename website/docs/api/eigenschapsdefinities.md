---
id: eigenschapsdefinities
title: GEMMA Eigenschapsdefinities
sidebar_label: Eigenschapsdefinities
---

# GEMMA Eigenschapsdefinities

Eigenschapsdefinities specificeren de aangepaste eigenschappen die aan elementen en relaties kunnen worden toegekend. Elke eigenschap heeft een type, beschrijving en toepasselijke elementen.

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| id | string | Unieke identificatie voor de eigenschapsdefinitie |
| identifier | string | Menselijk leesbare identificatie voor de eigenschapsdefinitie |
| name | string | Weergavenaam van de eigenschap |
| type | string | Datatype van de eigenschap (bijv. string, integer, boolean) |
| description | string | Beschrijving van de eigenschap en het doel ervan |
| defaultValue | string | Standaardwaarde voor de eigenschap indien niet gespecificeerd |
| applicableElements | string[] | Typen elementen waarop deze eigenschap kan worden toegepast |

## API Endpoint

'''
GET /propertydefinitions
'''

Voor een specifieke eigenschapsdefinitie:

'''
GET /propertydefinitions/{id}
'''

## Voorbeeld Response

```json
{
  "id": "pd1",
  "identifier": "status",
  "name": "Status",
  "type": "string",
  "description": "De status van het element in de architectuur",
  "defaultValue": "Concept",
  "applicableElements": [
    "ApplicationComponent",
    "BusinessObject",
    "BusinessActor"
  ]
}
```

## Relaties met andere Componenten

Eigenschapsdefinities hebben de volgende relaties met andere componenten:

- Definiëren eigenschappen die kunnen worden toegepast op Elementen
- Definiëren eigenschappen die kunnen worden toegepast op Relaties 