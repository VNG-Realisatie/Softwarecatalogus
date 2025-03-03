---
id: nodes
title: GEMMA Nodes
sidebar_label: Nodes
---

# GEMMA Nodes

Nodes representeren elementen in een visueel diagram. Elke node heeft een positie, stijl en kan child nodes bevatten.

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| id | integer | Unieke identificatie voor de node |
| identifier | string | Menselijk leesbare identificatie voor de node |
| elementRef | string | Referentie naar het element dat deze node representeert |
| position | Position | Positie en afmetingen van de node in het diagram |
| style | NodeStyle | Visuele stijl van de node |
| nodes | Node[] | Child nodes die binnen deze node worden weergegeven |

## Position Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| x | integer | X-coördinaat van de node |
| y | integer | Y-coördinaat van de node |
| w | integer | Breedte van de node |
| h | integer | Hoogte van de node |

## NodeStyle Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| fillColor | Color | Vulkleur van de node |
| lineColor | Color | Lijnkleur van de node |
| font | Font | Lettertype voor tekst in de node |
| color | Color | Tekstkleur in de node |

## Voorbeeld

'''json
{
  "id": 1,
  "identifier": "node_e1",
  "elementRef": "e1",
  "position": {
    "x": 100,
    "y": 100,
    "w": 120,
    "h": 60
  },
  "style": {
    "fillColor": {
      "r": 181,
      "g": 255,
      "b": 255,
      "a": 255
    },
    "lineColor": {
      "r": 0,
      "g": 0,
      "b": 0,
      "a": 255
    },
    "font": {
      "name": "Arial",
      "size": 12
    },
    "color": {
      "r": 0,
      "g": 0,
      "b": 0
    }
  },
  "nodes": [
    {
      "id": 5,
      "identifier": "node_e1_child1",
      "elementRef": "e5",
      "position": {
        "x": 110,
        "y": 120,
        "w": 40,
        "h": 20
      },
      "style": {
        "fillColor": {
          "r": 200,
          "g": 255,
          "b": 255,
          "a": 255
        },
        "lineColor": {
          "r": 0,
          "g": 0,
          "b": 0,
          "a": 255
        },
        "font": {
          "name": "Arial",
          "size": 10
        },
        "color": {
          "r": 0,
          "g": 0,
          "b": 0
        }
      }
    }
  ]
}
'''

## Relaties met andere Componenten

Nodes hebben de volgende relaties met andere componenten:

- Representeren Elementen in een View
- Kunnen child Nodes bevatten
- Worden verbonden door Verbindingen 