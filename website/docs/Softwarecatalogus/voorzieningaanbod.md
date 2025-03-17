---
id: voorzieningaanbod
title: Voorziening Aanbod
sidebar_label: VoorzieningAanbod
sidebar_position: 4
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# VoorzieningAanbod

Een voorzieningaanbod is een specifiek aanbod van een voorziening door een leverancier. Het beschrijft hoe een leverancier een bepaalde voorziening aanbiedt, inclusief licentiemodel, ondersteuning en hostingopties.

## Specificaties

<ApiSchema id="gemma" example   pointer="#/components/schemas/VoorzieningAanbod" />;

## Relaties

- Een VoorzieningAanbod is gekoppeld aan precies één [Voorziening](./voorziening)
- Een VoorzieningAanbod wordt aangeboden door precies één [Organisatie](./organisatie)
- Een VoorzieningAanbod kan meerdere [VoorzieningVersie](./voorzieningversie) objecten hebben
- Een VoorzieningAanbod kan gekoppeld zijn aan meerdere [Contract](./contract) objecten
- Een VoorzieningAanbod kan gerelateerd zijn aan ReferentieConcept objecten



## Relaties met andere Componenten

Voorzieningaanbiedingen hebben de volgende relaties met andere componenten:

- Zijn gekoppeld aan één Voorziening
- Worden aangeboden door één Leveranciersorganisatie
- Kunnen meerdere Voorzieningversies hebben

## Object Relaties

Het Voorzieningaanbod object heeft de volgende relaties met andere objecten in het model:

- **Voorziening**: Een voorzieningaanbod is gekoppeld aan precies één voorziening. Dit is een veel-op-één relatie waarbij het voorzieningaanbod een specifieke implementatie is van een voorziening.
- **Leveranciersorganisatie**: Een voorzieningaanbod wordt aangeboden door precies één leveranciersorganisatie. Dit is een veel-op-één relatie waarbij de leverancier het aanbod op de markt brengt.
- **Voorzieningversie**: Een voorzieningaanbod kan meerdere versies hebben. Dit is een één-op-veel relatie waarbij elke versie een specifieke release van het aanbod vertegenwoordigt.

## Relatie tot PublicCode.yaml

In de [publiccode.yaml](https://github.com/publiccodeyml/publiccode.yaml) standaard komt het concept van een voorzieningaanbod overeen met verschillende aspecten van de software-distributie. De volgende velden zijn relevant:

| Voorzieningaanbod | publiccode.yaml | Beschrijving |
|-------------------|-----------------|--------------|
| productpagina | url | URL naar de homepage van de software |
| ondersteuningsmodel | maintenance.type | Type onderhoud (intern, community, commercieel) |
| licentiemodel | legal.license | Licentie waaronder de software wordt gedistribueerd |
| hostingopties | installation.type | Type installatie (standalone, SaaS, etc.) |
| versies | softwareVersion | Versie van de software |

De publiccode.yaml standaard maakt geen expliciet onderscheid tussen een voorziening en een voorzieningaanbod zoals de Softwarecatalogus dat doet. In publiccode.yaml wordt de software beschreven als één geheel, inclusief zowel de functionaliteit (voorziening) als de distributie-aspecten (voorzieningaanbod). Het Voorzieningaanbod object in de Softwarecatalogus biedt meer gedetailleerde informatie over hoe een specifieke leverancier een voorziening aanbiedt, inclusief commerciële aspecten die niet altijd relevant zijn in de publiccode.yaml context. 