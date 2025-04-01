---
id: views
title: GEMMA Views
sidebar_label: Views
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# GEMMA Views

Views bieden verschillende perspectieven op het GEMMA architectuurmodel. Ze tonen specifieke aspecten van de architectuur en maken het model toegankelijker voor verschillende stakeholders.


## Specificaties

<ApiSchema id="gemma" example   pointer="#/components/schemas/View" />;


## Mappping

<Tabs>
  <TabItem value="json" label="JSON Voorbeeld" default>

```json
{
  "identifier": "v9012",
  "viewpoint": "application",
  "name": "Applicatielandschap Burgerzaken",
  "documentation": "Overzicht van applicaties voor burgerzaken",
  "properties": {
    "versie": "1.2",
    "auteur": "Jan Jansen",
    "datum": "2023-07-20"
  },
  "node": [
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
      }
    }
  ],
  "connection": [
    {
      "identifier": "c1",
      "relationshipRef": "r5678",
      "source": "n1",
      "target": "n2",
      "style": {
        "lineColor": {
          "r": "0",
          "g": "0",
          "b": "0"
        },
        "font": {
          "name": "Arial",
          "size": "10",
          "color": {
            "r": "0",
            "g": "0",
            "b": "0"
          }
        }
      }
    }
  ]
}
```

  </TabItem>
  <TabItem value="mapping" label="Mapping Configuratie">

```json
{
  "name": "Archio XML Views to Gemma OAS",
  "mapping": {
    "identifier": "@attributes.identifier",
    "viewpoint": "@attributes.viewpoint",
    "name": "name",
    "documentation": "documentation",
    "properties": "{ {% for property in properties.property %}\"{{property['@attributes']['propertyDefinitionRef']}}\":\"{{property['value']}}\"{% if not loop.last %},{% endif %}{% endfor %} }",
    "node": "{% if node|default %}{{ executeMapping(3, node, true)|json_encode }}{%else%}[]{%endif%}",
    "connection": "[ {% for tConnection in connection %}{ \"identifier\":\"{{ tConnection['@attributes']['identifier'] }}\", \"relationshipRef\":\"{{ tConnection['@attributes']['relationshipRef'] }}\", \"source\":\"{{ tConnection['@attributes']['source'] }}\", \"target\":\"{{ tConnection['@attributes']['target'] }}\", \"style\":{ \"lineColor\":{ \"r\":\"{{ tConnection['style']['lineColor']['@attributes']['r'] }}\", \"g\":\"{{ tConnection['style']['lineColor']['@attributes']['g'] }}\", \"b\":\"{{ tConnection['style']['lineColor']['@attributes']['b'] }}\" }, \"font\":{ \"name\":\"{{ tConnection['style']['font']['@attributes']['name'] }}\", \"size\":\"{{ tConnection['style']['font']['@attributes']['size'] }}\", \"color\":{ \"r\":\"{{ tConnection['style']['font']['color']['@attributes']['r'] }}\", \"g\":\"{{ tConnection['style']['font']['color']['@attributes']['g'] }}\", \"b\":\"{{ tConnection['style']['font']['color']['@attributes']['b'] }}\" } } } }{% if not loop.last %},{% endif %}{% endfor %} ]"
  },
  "cast": {
    "properties": "jsonToArray",
    "node": "jsonToArray",
    "connection": "jsonToArray"
  }
}
```

  </TabItem>
  <TabItem value="xml" label="XML Input Voorbeeld">

```xml
<view identifier="v9012" viewpoint="application">
  <name>Applicatielandschap Burgerzaken</name>
  <documentation>Overzicht van applicaties voor burgerzaken</documentation>
  <properties>
    <property propertyDefinitionRef="versie">
      <value>1.2</value>
    </property>
    <property propertyDefinitionRef="auteur">
      <value>Jan Jansen</value>
    </property>
    <property propertyDefinitionRef="datum">
      <value>2023-07-20</value>
    </property>
  </properties>
  <node identifier="n1" elementRef="e2345" x="100" y="150" w="120" h="60">
    <style>
      <fillColor r="255" g="255" b="255" a="100"/>
      <lineColor r="0" g="0" b="0" a="100"/>
      <font name="Arial" size="12">
        <color r="0" g="0" b="0"/>
      </font>
    </style>
  </node>
  <connection identifier="c1" relationshipRef="r5678" source="n1" target="n2">
    <style>
      <lineColor r="0" g="0" b="0"/>
      <font name="Arial" size="10">
        <color r="0" g="0" b="0"/>
      </font>
    </style>
  </connection>
</view>
```

  </TabItem>
</Tabs>

## Soorten Views

Het GEMMA model bevat verschillende soorten views:

- **Bedrijfsviews**: Tonen bedrijfsprocessen, actoren en objecten
- **Applicatieviews**: Tonen applicatiecomponenten en hun interacties
- **Technologieviews**: Tonen infrastructuur en technische componenten
- **Implementatieviews**: Tonen hoe componenten worden geïmplementeerd
- **Motivatieviews**: Tonen doelen, principes en eisen

## Relaties met andere Componenten

Views hebben de volgende relaties met andere componenten:

- Bevatten Nodes die Elementen visualiseren
- Bevatten Verbindingen die Relaties visualiseren
- Kunnen eigenschappen hebben die worden gedefinieerd door Eigenschapsdefinities 