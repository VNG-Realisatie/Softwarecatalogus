---
id: voorziening
title: Voorziening
sidebar_label: Voorziening
sidebar_position: 3
---

# Voorziening

Een voorziening is een softwareproduct of dienst die functionaliteit biedt voor gemeentelijke of andere overheidsprocessen. Voorzieningen vormen de basis van de informatievoorziening en kunnen door verschillende leveranciers worden aangeboden.

## API Specificatie

De volledige API specificatie voor Voorziening is beschikbaar op de [VNG API Specificatie pagina](https://vng-realisatie.github.io/Softwarecatalogus/api#tag/Software-Catalogus/operation/getVoorzieningen).

## Eigenschappen

| Eigenschap | Type | Verplicht | Beschrijving |
|------------|------|-----------|--------------|
| id | string | Ja | Unieke identificatie voor de voorziening |
| naam | string | Ja | Naam van de voorziening |
| beschrijving | string | Ja | Beschrijving van de voorziening |
| voorzieningstype | [Voorzieningstype](./Voorzieningstype) | Nee | Type van de voorziening |
| categorie | string | Nee | Categorie waartoe de voorziening behoort |
| functionaliteiten | array | Nee | Lijst van functionaliteiten die de voorziening biedt |
| doelgroep | array | Nee | Doelgroepen waarvoor de voorziening is bedoeld |
| gemmaReferentieComponenten | array | Nee | GEMMA referentiecomponenten die de voorziening implementeert |
| standaarden | array | Nee | Standaarden die de voorziening ondersteunt |
| aanbiedingen | array | Nee | Aanbiedingen van deze voorziening door verschillende leveranciers |

## Relaties

- Een Voorziening kan van een bepaald [Voorzieningstype](./Voorzieningstype) zijn
- Een Voorziening kan worden aangeboden via meerdere [VoorzieningAanbod](./VoorzieningAanbod) objecten
- Een Voorziening kan worden gebruikt via meerdere [VoorzieningGebruik](./VoorzieningGebruik) objecten
- Een Voorziening kan voldoen aan meerdere [Standaard](./Standaard) objecten
- Een Voorziening kan gerelateerd zijn aan [ReferentieConcept](./ReferentieConcept) objecten

## Voorbeeld

```json
{
  "id": "VZ-001",
  "naam": "Zaaksysteem Pro",
  "beschrijving": "Een uitgebreid zaaksysteem voor gemeenten",
  "voorzieningstype": {
    "id": "VZT-001",
    "naam": "Zaaksysteem"
  },
  "categorie": "Zaakgericht werken",
  "functionaliteiten": [
    "Zaakregistratie",
    "Documentbeheer",
    "Werkstromen",
    "Rapportages"
  ],
  "doelgroep": [
    "Gemeenten",
    "Samenwerkingsverbanden"
  ],
  "gemmaReferentieComponenten": [
    {
      "code": "ZRC",
      "naam": "Zaakregistratiecomponent"
    },
    {
      "code": "DRC",
      "naam": "Documentregistratiecomponent"
    }
  ],
  "standaarden": [
    {
      "naam": "StUF-ZKN",
      "versie": "3.10"
    },
    {
      "naam": "ZGW API",
      "versie": "1.0"
    }
  ],
  "aanbiedingen": [
    {
      "id": "VA-001",
      "leveranciersorganisatieId": "ORG-002",
      "leveranciersnaam": "Voorbeeld Software B.V."
    }
  ]
}
```

## API Endpoint

'''
GET /voorzieningen
'''

Voor een specifieke voorziening:

'''
GET /voorzieningen/{id}
'''

## Relaties met andere Componenten

Voorzieningen hebben de volgende relaties met andere componenten:

- Worden aangeboden door Leveranciersorganisaties via Voorzieningaanbiedingen
- Kunnen meerdere Voorzieningaanbiedingen hebben
- Kunnen gerelateerd zijn aan GEMMA referentiecomponenten

## Object Relaties

Het Voorziening object heeft de volgende relaties met andere objecten in het model:

- **Voorzieningaanbod**: Een voorziening kan via meerdere voorzieningaanbiedingen worden aangeboden. Dit is een één-op-veel relatie waarbij de voorziening het product is dat wordt aangeboden.
- **Leveranciersorganisatie**: Er is een indirecte relatie met leveranciersorganisaties via de voorzieningaanbiedingen. Een voorziening kan door meerdere leveranciers worden aangeboden.
- **GEMMA Referentiecomponenten**: Een voorziening kan één of meerdere GEMMA referentiecomponenten implementeren, wat aangeeft hoe de voorziening past binnen de GEMMA architectuur.

## Relatie tot PublicCode.yaml

In de [publiccode.yaml](https://github.com/publiccodeyml/publiccode.yaml) standaard komt het concept van een voorziening overeen met de hoofdbeschrijving van de software. De volgende velden zijn relevant:

| Voorziening | publiccode.yaml | Beschrijving |
|-------------|-----------------|--------------|
| naam | name | Naam van de software |
| beschrijving | description.* | Beschrijving van de software in verschillende talen |
| categorie | categories | Categorieën waartoe de software behoort |
| functionaliteiten | description.features | Functionaliteiten die de software biedt |
| doelgroep | usedBy | Organisaties die de software gebruiken |
| standaarden | intendedAudience.scope | Beoogde gebruikers en toepassingsgebied |
| gemmaReferentieComponenten | localisation.availableLanguages | Ondersteunde talen en lokalisaties |

De publiccode.yaml standaard is primair gericht op het beschrijven van de software zelf, wat overeenkomt met het Voorziening object in de Softwarecatalogus. Het biedt gedetailleerde informatie over de functionaliteit, doelgroep en technische aspecten van de software. 