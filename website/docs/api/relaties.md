---
id: relaties
title: GEMMA Relaties
sidebar_label: Relaties
---

# GEMMA Relaties

Relaties definiëren hoe elementen met elkaar verbonden zijn in het GEMMA architectuurmodel. Ze vertegenwoordigen verschillende soorten verbindingen volgens de ArchiMate-standaard.

## Soorten Relaties

Het GEMMA model bevat verschillende soorten relaties:

- **Compositie**: Element bestaat uit andere elementen
- **Aggregatie**: Element bevat andere elementen
- **Toewijzing**: Element is toegewezen aan een ander element
- **Realisatie**: Element realiseert een ander element
- **Gebruikt door**: Element wordt gebruikt door een ander element
- **Toegang**: Element heeft toegang tot een ander element
- **Associatie**: Element is geassocieerd met een ander element
- **Stroom**: Element heeft een stroom naar een ander element

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| id | string | Unieke identificatie voor de relatie |
| identifier | string | Menselijk leesbare identificatie voor de relatie |
| name | string | Naam van de relatie |
| type | string | ArchiMate type van de relatie (bijv. Composition, Aggregation, Assignment) |
| source | string | ID van het bronelement |
| target | string | ID van het doelelement |
| accessType | string | Type toegang of relatie |
| properties | object | Aangepaste eigenschappen van de relatie |

## API Endpoint

'''
GET /relations
'''

Voor een specifieke relatie:

'''
GET /relations/{id}
'''

## Voorbeeld Response

'''json
{
  "id": "r1",
  "name": "gebruikt",
  "type": "UsedBy",
  "source": "e1",
  "target": "e2",
  "identifier": "rel_gebruikt_e1_e2",
  "accessType": "Read",
  "properties": {
    "status": "Actief"
  }
}
'''

## Relaties met andere Componenten

Relaties hebben de volgende verbindingen met andere componenten:

- Verbinden twee Elementen (bron en doel)
- Worden gevisualiseerd door Verbindingen in Views
- Kunnen eigenschappen hebben die worden gedefinieerd door Eigenschapsdefinities 