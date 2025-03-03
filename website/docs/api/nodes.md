---
id: nodes
title: GEMMA Nodes
sidebar_label: Nodes
---

# GEMMA Nodes

Nodes zijn visuele representaties van elementen in een view. Ze definiëren hoe elementen worden weergegeven in diagrammen, inclusief positie en stijl.

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| identifier | string | Unieke identificatie voor de node |
| elementRef | string | Referentie naar het element dat wordt weergegeven |
| position | object | Positie en afmetingen van de node (x, y, w, h) |
| style | object | Visuele stijl van de node (kleuren, lettertype) |
| nodes | array | Geneste nodes (indien van toepassing) |

## API Endpoint

Nodes worden meestal opgevraagd als onderdeel van een view:

'''
GET /views/{viewIdentifier}
'''

## Voorbeelden

<Tabs>
  <TabItem value="json" label="JSON Voorbeeld" default>

```json
{
  "identifier": "n1",
  "elementRef": "e2345",
  "position": {
    "x": "100",
    "y": "150",
    "w": "120",
    "h": "60"
  },
  "style": {
    "fillColor": {
      "r": "255",
      "g": "255",
      "b": "255",
      "a": "100"
    },
    "lineColor": {
      "r": "0",
      "g": "0",
      "b": "0",
      "a": "100"
    },
    "font": {
      "name": "Arial",
      "size": "12",
      "color": {
        "r": "0",
        "g": "0",
        "b": "0"
      }
    }
  },
  "nodes": []
}
```

  </TabItem>
  <TabItem value="mapping" label="Mapping Configuratie">

```json
{
  "name": "Archio XML View Nodes",
  "mapping": {
    "identifier": "{{ attribute(_context, '@attributes').identifier }}",
    "elementRef": "{{ attribute(_context, '@attributes').elementRef }}",
    "position": "{\"x\":\"{{ attribute(_context, '@attributes').x }}\",\"y\":\"{{ attribute(_context, '@attributes').y }}\",\"w\":\"{{ attribute(_context, '@attributes').w }}\",\"h\":\"{{ attribute(_context, '@attributes').h }}\"}",
    "style": "{\"fillColor\":{ \"r\":\"{{ attribute(style.fillColor,'@attributes').r }}\", \"g\":\"{{ attribute(style.fillColor,'@attributes').g }}\", \"b\":\"{{ attribute(style.fillColor,'@attributes').b }}\", \"a\":\"{{ attribute(style.fillColor,'@attributes').a }}\" }, \"lineColor\":{ \"r\":\"{{ attribute(style.lineColor,'@attributes').r }}\", \"g\":\"{{ attribute(style.lineColor,'@attributes').g }}\", \"b\":\"{{ attribute(style.lineColor,'@attributes').b }}\", \"a\":\"{{ attribute(style.lineColor,'@attributes').a }}\" }, \"font\":{ \"name\":\"{{ attribute(style.font, '@attributes').name }}\", \"size\":\"{{ attribute(style.font, '@attributes').size }}\", \"color\":{ \"r\":\"{{ attribute(style.font.color, '@attributes').r }}\", \"g\":\"{{ attribute(style.font.color, '@attributes').g }}\", \"b\":\"{{ attribute(style.font.color, '@attributes').b }}\"}}}",
    "nodes": "{% if node|default %}{{ executeMapping(3, node, true)|json_encode }}{%else%}[]{% endif %}"
  },
  "cast": {
    "position": "jsonToArray",
    "style": "jsonToArray",
    "nodes": "jsonToArray"
  }
}
```

  </TabItem>
  <TabItem value="xml" label="XML Input Voorbeeld">

```xml
<node identifier="n1" elementRef="e2345" x="100" y="150" w="120" h="60">
  <style>
    <fillColor r="255" g="255" b="255" a="100"/>
    <lineColor r="0" g="0" b="0" a="100"/>
    <font name="Arial" size="12">
      <color r="0" g="0" b="0"/>
    </font>
  </style>
</node>
```

  </TabItem>
</Tabs>

## Relaties met andere Componenten

Nodes hebben de volgende relaties met andere componenten:

- Representeren Elementen in een View
- Kunnen child Nodes bevatten
- Worden verbonden door Verbindingen 