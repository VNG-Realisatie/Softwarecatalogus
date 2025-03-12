---
id: relaties
title: GEMMA Relaties
sidebar_label: Relaties
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';
import ApiSchema from '@theme/ApiSchema';

# GEMMA Relaties

Relaties verbinden elementen in het GEMMA architectuurmodel. Ze definiëren hoe verschillende architectuurcomponenten met elkaar samenhangen en interacteren.

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| identifier | string | Unieke identificatie voor de relatie |
| source | string | Identifier van het bronelement |
| target | string | Identifier van het doelelement |
| accessType | string | Type toegang (indien van toepassing) |
| properties | object | Aangepaste eigenschappen van de relatie |

## API Endpoint

```
GET /relations
```

Voor een specifieke relatie:

```
GET /relations/{identifier}
```

## Voorbeelden

<Tabs>
  <TabItem value="json" label="JSON Voorbeeld" default>

```json
{
  "identifier": "r5678",
  "source": "e1234",
  "target": "e2345",
  "accessType": "write",
  "properties": {
    "type": "Realisatie",
    "sterkte": "Hoog",
    "beschrijving": "Applicatie realiseert het bedrijfsproces",
    "laatstGewijzigd": "2023-06-10"
  }
}
```

  </TabItem>
  <TabItem value="mapping" label="Mapping Configuratie">

```json
{
  "name": "Archio XML Relations to Gemma OAS",
  "mapping": {
    "identifier": "@attributes.identifier",
    "source": "@attributes.source",
    "target": "@attributes.target",
    "accessType": "@attributes.accessType",
    "properties": "{ {% if properties.property|keys == range(0, properties.property|length-1) %}{% for property in properties.property %}\"{{ property['@attributes'].propertyDefinitionRef }}\": \"{{ property.value }}\"{% if not loop.last %},{% endif %}{% endfor %}{%else%}{%set property = properties.property %}\"{{ property['@attributes'].propertyDefinitionRef }}\": \"{{ property.value }}\"{%endif%} }"
  },
  "cast": {
    "properties": "jsonToArray",
    "accessType": "unsetIfValue==@attributes.accessType"
  }
}
```

  </TabItem>
  <TabItem value="xml" label="XML Input Voorbeeld">

```xml
<relationship identifier="r5678" source="e1234" target="e2345" accessType="write" xsi:type="RealizationRelationship">
  <properties>
    <property propertyDefinitionRef="type">
      <value>Realisatie</value>
    </property>
    <property propertyDefinitionRef="sterkte">
      <value>Hoog</value>
    </property>
    <property propertyDefinitionRef="beschrijving">
      <value>Applicatie realiseert het bedrijfsproces</value>
    </property>
    <property propertyDefinitionRef="laatstGewijzigd">
      <value>2023-06-10</value>
    </property>
  </properties>
</relationship>
```

  </TabItem>
</Tabs>

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

## Relaties met andere Componenten

Relaties hebben de volgende verbindingen met andere componenten:

- Verbinden twee Elementen (bron en doel)
- Worden gevisualiseerd door Verbindingen in Views
- Kunnen eigenschappen hebben die worden gedefinieerd door Eigenschapsdefinities 