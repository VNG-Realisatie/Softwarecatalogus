---
id: voorzieningaanbod
title: Voorzieningaanbod
sidebar_label: Voorzieningaanbod
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Voorzieningaanbod

Een voorzieningaanbod is een specifiek aanbod van een voorziening door een leverancier. Het beschrijft hoe een leverancier een bepaalde voorziening aanbiedt, inclusief licentiemodel, ondersteuning en hostingopties.

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| id | string | Unieke identificatie voor het voorzieningaanbod |
| voorzieningId | string | ID van de voorziening die wordt aangeboden |
| leveranciersorganisatieId | string | ID van de leveranciersorganisatie die de voorziening aanbiedt |
| productpagina | string (URI) | URL naar de productpagina van de leverancier |
| ondersteuningsmodel | string | Beschrijving van het ondersteuningsmodel |
| licentiemodel | string | Beschrijving van het licentiemodel |
| hostingopties | array | Beschikbare hostingopties (on-premises, SaaS, PaaS, hybride) |
| versies | array | Beschikbare versies van dit voorzieningaanbod |

## API Endpoint

```
GET /voorzieningaanbiedingen
```

Voor een specifiek voorzieningaanbod:

```
GET /voorzieningaanbiedingen/{id}
```

## Voorbeeld Response

```json
{
  "id": "va1",
  "voorzieningId": "v1",
  "leveranciersorganisatieId": "l1",
  "productpagina": "https://www.voorbeeldsoftware.nl/zaaksysteem-pro",
  "ondersteuningsmodel": "24/7 telefonische ondersteuning en online helpdesk",
  "licentiemodel": "Jaarlijkse licentie gebaseerd op aantal gebruikers",
  "hostingopties": [
    "on-premises",
    "SaaS"
  ],
  "versies": [
    {
      "id": "vv1",
      "versienummer": "2.5.0",
      "status": "actief"
    },
    {
      "id": "vv2",
      "versienummer": "2.4.2",
      "status": "onderhoud"
    }
  ]
}
```

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