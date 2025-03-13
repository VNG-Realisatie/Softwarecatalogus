---
id: voorzieningaanbod
title: VoorzieningAanbod
sidebar_label: VoorzieningAanbod
sidebar_position: 4
---

# VoorzieningAanbod

Een voorzieningaanbod is een specifiek aanbod van een voorziening door een leverancier. Het beschrijft hoe een leverancier een bepaalde voorziening aanbiedt, inclusief licentiemodel, ondersteuning en hostingopties.

## API Specificatie

De volledige API specificatie voor VoorzieningAanbod is beschikbaar op de [VNG API Specificatie pagina](https://vng-realisatie.github.io/Softwarecatalogus/api#tag/Software-Catalogus/operation/getVoorzieningaanbiedingen).

## Eigenschappen

| Eigenschap | Type | Verplicht | Beschrijving |
|------------|------|-----------|--------------|
| id | UUID | Ja | Unieke identificatie voor het voorzieningaanbod |
| naam | string | Ja | Naam van het voorzieningaanbod |
| omschrijving | string | Ja | Beschrijving van het voorzieningaanbod |
| type | array[enum] | Ja | Type van het voorzieningaanbod. Mogelijke waarden: 'Hosting', 'Beheer', '(door)ontwikkeling', 'Implementatie', 'Migratie', 'Consultancy' |
| voorzieningId | UUID | Ja | ID van de voorziening die wordt aangeboden |
| organisatieId | UUID | Ja | ID van de organisatie die de voorziening aanbiedt |
| productpagina | string (URI) | Nee | URL naar de productpagina van de leverancier |
| ondersteuningsmodel | string | Nee | Beschrijving van het ondersteuningsmodel |
| licentiemodel | string | Nee | Beschrijving van het licentiemodel |
| hostingopties | array | Nee | Beschikbare hostingopties (on-premises, SaaS, PaaS, hybride) |
| versies | array[UUID] | Nee | Array van UUID's die verwijzen naar specifieke versies van dit voorzieningaanbod. Als er geen versies zijn opgegeven, wordt aangenomen dat het aanbod alle versies betreft |

## Relaties

- Een VoorzieningAanbod is gekoppeld aan precies één [Voorziening](./voorziening)
- Een VoorzieningAanbod wordt aangeboden door precies één [Organisatie](./organisatie)
- Een VoorzieningAanbod kan meerdere [VoorzieningVersie](./voorzieningversie) objecten hebben
- Een VoorzieningAanbod kan gekoppeld zijn aan meerdere [Contract](./contract) objecten
- Een VoorzieningAanbod kan gerelateerd zijn aan ReferentieConcept objecten

## Voorbeeld

```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "naam": "Zaaksysteem Pro Enterprise",
  "omschrijving": "Complete zaaksysteem oplossing voor grote organisaties",
  "type": [
    "Hosting",
    "Beheer",
    "(door)ontwikkeling",
    "Implementatie"
  ],
  "voorzieningId": "123e4567-e89b-12d3-a456-426614174001",
  "organisatieId": "123e4567-e89b-12d3-a456-426614174002", 
  "productpagina": "https://www.voorbeeldsoftware.nl/zaaksysteem-pro",
  "ondersteuningsmodel": "24/7 telefonische ondersteuning en online helpdesk",
  "licentiemodel": "Jaarlijkse licentie gebaseerd op aantal gebruikers",
  "hostingopties": [
    "on-premises",
    "SaaS"
  ],
  "versies": [
    "123e4567-e89b-12d3-a456-426614174010",
    "123e4567-e89b-12d3-a456-426614174011"
  ]
}
```

## API Documentatie


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