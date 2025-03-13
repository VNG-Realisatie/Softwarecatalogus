---
id: verbindingen
title: GEMMA Verbindingen
sidebar_label: Verbindingen
---


import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# GEMMA Verbindingen

Verbindingen representeren relaties in een visueel diagram. Elke verbinding koppelt twee nodes en heeft stijleigenschappen.

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| id | string | Unieke identificatie voor de verbinding |
| relationRef | string | Referentie naar de onderliggende relatie die deze verbinding visualiseert |
| source | string | ID van de bronnode in de view |
| target | string | ID van de doelnode in de view |
| bendpoints | Bendpoint[] | Lijst van punten die het pad van de verbinding definiëren |
| style | ConnectionStyle | Visuele stijl van de verbinding |
| labelStyle | LabelStyle | Stijl voor het label van de verbinding |

## ConnectionStyle Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| lineColor | Color | Kleur van de verbindingslijn |
| lineWidth | integer | Breedte van de verbindingslijn |
| lineStyle | string | Stijl van de lijn (bijv. solid, dashed, dotted) |

## LabelStyle Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| position | Position | Positie van het label |
| font | Font | Lettertype voor het label |
| color | Color | Kleur van het label |

## Bendpoint Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| x | integer | X-coördinaat van het buigpunt |
| y | integer | Y-coördinaat van het buigpunt |

## Voorbeeld

'''json
{
  "id": "c1",
  "relationRef": "r1",
  "source": "1",
  "target": "2",
  "bendpoints": [
    {
      "x": 200,
      "y": 150
    }
  ],
  "style": {
    "lineColor": {
      "r": 0,
      "g": 0,
      "b": 0,
      "a": 255
    },
    "lineWidth": 1,
    "lineStyle": "solid"
  },
  "labelStyle": {
    "position": {
      "x": 180,
      "y": 130
    },
    "font": {
      "name": "Arial",
      "size": 10,
      "style": "normal"
    },
    "color": {
      "r": 0,
      "g": 0,
      "b": 0,
      "a": 255
    }
  }
}
'''

## Relaties met andere Componenten

Verbindingen hebben de volgende relaties met andere componenten:

- Visualiseren Relaties in een View
- Verbinden twee Nodes (bron en doel)
- Kunnen buigpunten hebben om het pad te definiëren 