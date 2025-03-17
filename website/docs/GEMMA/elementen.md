---
id: elementen
title: GEMMA Elementen
sidebar_label: Elementen
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# GEMMA Elementen


Elementen zijn de bouwstenen van het GEMMA architectuurmodel. Ze vertegenwoordigen verschillende architectuurcomponenten zoals bedrijfsprocessen, applicaties, gegevens en technologie.

## Soorten Elementen

Het GEMMA model bevat verschillende soorten elementen:

- **Bedrijfselementen**: Actoren, processen, functies en objecten die de bedrijfslaag vormen
- **Applicatie-elementen**: Componenten, services en data-objecten die de applicatielaag vormen
- **Technologie-elementen**: Infrastructuur, apparaten en systeemcomponenten die de technologielaag vormen
- **Motivatie-elementen**: Doelen, principes en eisen die de motivatie voor de architectuur vormen

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| identifier | string | Unieke identificatie voor het element |
| name | string | Naam van het element |
| documentation | string | Documentatie of beschrijving van het element |
| properties | object | Aangepaste eigenschappen van het element |

## API Endpoint

```
GET /elements
```

Voor een specifiek element:

```
GET /elements/{identifier}
```

## Voorbeelden

<Tabs>
  <TabItem value="json" label="JSON Voorbeeld" default>

```json
{
  "identifier": "e1234",
  "name": "Zaakafhandeling",
  "documentation": "Het proces voor het afhandelen van zaken binnen de gemeente",
  "properties": {
    "status": "Actief",
    "eigenaar": "Afdeling Dienstverlening",
    "gemmaCode": "P0123",
    "laatstGewijzigd": "2023-05-15"
  }
}
```

  </TabItem>
  <TabItem value="mapping" label="Mapping Configuratie">

```json
{
  "name": "Archio XML Elements to Gemma OAS",
  "mapping": {
    "identifier": "@attributes.identifier",
    "name": "name",
    "documentation": "documentation",
    "properties": "{ {% for property in properties.property %}\"{{property['@attributes']['propertyDefinitionRef']}}\":\"{{property['value']}}\"{% if not loop.last %},{% endif %}{% endfor %} }"
  },
  "cast": {
    "properties:": "jsonToArray"
  }
}
```

  </TabItem>
  <TabItem value="xml" label="XML Input Voorbeeld">

```xml
<element identifier="e1234" xsi:type="BusinessProcess">
  <name>Zaakafhandeling</name>
  <documentation>Het proces voor het afhandelen van zaken binnen de gemeente</documentation>
  <properties>
    <property propertyDefinitionRef="status">
      <value>Actief</value>
    </property>
    <property propertyDefinitionRef="eigenaar">
      <value>Afdeling Dienstverlening</value>
    </property>
    <property propertyDefinitionRef="gemmaCode">
      <value>P0123</value>
    </property>
    <property propertyDefinitionRef="laatstGewijzigd">
      <value>2023-05-15</value>
    </property>
  </properties>
</element>
```

  </TabItem>
</Tabs>

## Relaties met andere Componenten

Elementen hebben de volgende relaties met andere componenten:

- Worden gevisualiseerd door Nodes in Views
- Worden verbonden door Relaties
- Kunnen eigenschappen hebben die worden gedefinieerd door Eigenschapsdefinities 