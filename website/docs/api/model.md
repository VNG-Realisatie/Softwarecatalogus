---
id: model
title: GEMMA Model
sidebar_label: Model
---

# GEMMA Model

Het model is de hoofdcontainer voor het GEMMA architectuurmodel. Het bevat alle elementen, relaties, views en eigenschapsdefinities die samen de gemeentelijke architectuur beschrijven.

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| name | string | Naam van het model |
| documentation | string | Documentatie of beschrijving van het model |
| properties | object | Aangepaste eigenschappen van het model |
| elements | array | Alle elementen in het model |
| relationships | array | Alle relaties in het model |
| views | array | Alle views in het model |
| propertyDefinitions | array | Alle eigenschapsdefinities in het model |

## API Endpoint

'''
GET /model
'''

## Voorbeelden

<Tabs>
  <TabItem value="json" label="JSON Voorbeeld" default>

```json
{
  "name": "GEMMA 2.0",
  "documentation": "Gemeentelijke Model Architectuur versie 2.0",
  "properties": {
    "versie": "2.0",
    "publicatiedatum": "2022-01-15",
    "beheerder": "VNG Realisatie"
  },
  "elements": [
    {
      "identifier": "e1234",
      "name": "Zaakafhandeling"
    }
  ],
  "relationships": [
    {
      "identifier": "r5678",
      "source": "e1234",
      "target": "e2345"
    }
  ],
  "views": [
    {
      "identifier": "v9012",
      "name": "Applicatielandschap Burgerzaken"
    }
  ],
  "propertyDefinitions": [
    {
      "identifier": "pd1",
      "name": "status"
    }
  ]
}
```

  </TabItem>
  <TabItem value="mapping" label="Mapping Configuratie">

```json
{
  "name": "Archio XML Model to Gemma OAS",
  "mapping": {
    "name": "name",
    "documentation": "documentation",
    "properties": "{ {% for property in properties.property %}\"{{property['@attributes']['propertyDefinitionRef']}}\":\"{{property['value']}}\"{% if not loop.last %},{% endif %}{% endfor %} }",
    "elements": "{{ executeMapping(1, elements.element, true)|json_encode }}",
    "relationships": "{{ executeMapping(4, relationships.relationship, true)|json_encode }}",
    "views": "{{ executeMapping(2, views.view, true)|json_encode }}",
    "propertyDefinitions": "{{ executeMapping(5, propertyDefinitions.propertyDefinition, true)|json_encode }}"
  },
  "cast": {
    "properties": "jsonToArray",
    "elements": "jsonToArray",
    "relationships": "jsonToArray",
    "views": "jsonToArray",
    "propertyDefinitions": "jsonToArray"
  }
}
'''

  </TabItem>
  <TabItem value="xml" label="XML Input Voorbeeld">

```xml
<model>
  <name>GEMMA 2.0</name>
  <documentation>Gemeentelijke Model Architectuur versie 2.0</documentation>
  <properties>
    <property propertyDefinitionRef="versie">
      <value>2.0</value>
    </property>
    <property propertyDefinitionRef="publicatiedatum">
      <value>2022-01-15</value>
    </property>
    <property propertyDefinitionRef="beheerder">
      <value>VNG Realisatie</value>
    </property>
  </properties>
  <elements>
    <element identifier="e1234" xsi:type="BusinessProcess">
      <name>Zaakafhandeling</name>
    </element>
    <!-- Meer elementen -->
  </elements>
  <relationships>
    <relationship identifier="r5678" source="e1234" target="e2345" xsi:type="RealizationRelationship">
      <!-- Relatie details -->
    </relationship>
    <!-- Meer relaties -->
  </relationships>
  <views>
    <view identifier="v9012" viewpoint="application">
      <name>Applicatielandschap Burgerzaken</name>
      <!-- View details -->
    </view>
    <!-- Meer views -->
  </views>
  <propertyDefinitions>
    <propertyDefinition identifier="pd1" type="string">
      <name>status</name>
      <!-- Eigenschapdefinitie details -->
    </propertyDefinition>
    <!-- Meer eigenschapdefinities -->
  </propertyDefinitions>
</model>
```

  </TabItem>
</Tabs>

## Relaties met andere Componenten

Het Model heeft de volgende relaties met andere componenten:

- Bevat één Organisatie
- Bevat meerdere Elementen
- Bevat meerdere Relaties
- Bevat meerdere Views
- Definieert meerdere Eigenschapsdefinities 