---
id: model
title: GEMMA Model
sidebar_label: Model
---

# GEMMA Model

Het Model is de hoofdcontainer in de GEMMA architectuur. Het bevat alle architectuurelementen, relaties, views en eigenschapsdefinities die samen het complete architectuurkader vormen.

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| id | string | Unieke identificatie voor het architectuurmodel |
| name | string | Naam van het architectuurmodel |
| version | string | Versie van het architectuurmodel |
| description | string | Beschrijving van het architectuurmodel |
| organization | Organization | Organisatie die eigenaar is of het model beheert |
| elements | Element[] | Verzameling van alle ArchiMate elementen in het model |
| relations | Relation[] | Verzameling van alle ArchiMate relaties in het model |
| views | View[] | Verzameling van alle views in het model |
| propertyDefinitions | PropertyDefinition[] | Verzameling van alle eigenschapsdefinities in het model |

## API Endpoint

'''
GET /model
'''

## Voorbeeld Response

'''json
{
  "id": "gemma-3.0",
  "name": "GEMMA 3.0",
  "version": "3.0",
  "description": "Gemeentelijke Model Architectuur versie 3.0",
  "organization": {
    "id": "vng-realisatie",
    "name": "VNG Realisatie"
  },
  "elements": [...],
  "relations": [...],
  "views": [...],
  "propertyDefinitions": [...]
}
'''

## Relaties met andere Componenten

Het Model heeft de volgende relaties met andere componenten:

- Bevat één Organisatie
- Bevat meerdere Elementen
- Bevat meerdere Relaties
- Bevat meerdere Views
- Definieert meerdere Eigenschapsdefinities 