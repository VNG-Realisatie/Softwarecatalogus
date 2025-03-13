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
| id | UUID | Ja | Unieke identificatie voor de voorziening |
| naam | string | Ja | Naam van de voorziening |
| beschrijving | string | Ja | Beschrijving van de voorziening |
| voorzieningstypeId | UUID  | Nee | id van [Voorzieningstype](./voorzieningstype) Type van de voorziening |
| categorie | string | Nee | Categorie waartoe de voorziening behoort |
| functionaliteiten | array[UUID] | Nee | Array van UUID's die verwijzen naar de functionaliteiten die de voorziening biedt |
| doelgroep | array[enum] | Nee | Doelgroepen waarvoor de voorziening is bedoeld. Mogelijke waarden: 'Gemeente', 'Waterschap', 'Provincie', 'Ministerie', 'Uitvoeringsorganisatie', 'Samenwerkingsverband', 'Leverancier'. De definitie on [Organisatie](./Organisatie.md) is hiervoor leidend |
| referentieComponenten | array[UUID] | Nee | GEMMA referentiecomponenten die de voorziening implementeert |
| standaarden | array[UUID] | Nee | Array van UUID's die verwijzen naar de standaarden die de voorziening ondersteunt |

## Relaties

- Een Voorziening kan van een bepaald [Voorzieningstype](./voorzieningstype) zijn
- Een Voorziening kan worden aangeboden via meerdere [VoorzieningAanbod](./voorzieningaanbod) objecten
- Een Voorziening kan worden gebruikt via meerdere [VoorzieningGebruik](./voorzieninggebruik) objecten
- Een Voorziening kan voldoen aan meerdere [Standaard](./standaard) objecten
- Een Voorziening kan gerelateerd zijn aan [ReferentieConcept](./referentieconcept) objecten

## Voorbeeld

```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "naam": "Zaaksysteem Pro",
  "beschrijving": "Een uitgebreid zaaksysteem voor gemeenten",
  "voorzieningstype": "123e4567-e89b-12d3-a456-426614174000",
  "categorie": "Zaakgericht werken",
  "functionaliteiten": [
    "123e4567-e89b-12d3-a456-426614174030",
    "123e4567-e89b-12d3-a456-426614174031",
    "123e4567-e89b-12d3-a456-426614174032",
    "123e4567-e89b-12d3-a456-426614174033"
  ],
  "doelgroep": [
    "Gemeente",
    "Samenwerkingsverband"
  ],
  "referentieComponenten": [
    "123e4567-e89b-12d3-a456-426614174020",
    "123e4567-e89b-12d3-a456-426614174021"
  ],
  "standaarden": [
    "123e4567-e89b-12d3-a456-426614174010",
    "123e4567-e89b-12d3-a456-426614174011"
  ]
}
```
## API Documentatie

De volledige API specificatie voor Voorziening is beschikbaar op de [VNG API Specificatie pagina](https://vng-realisatie.github.io/Softwarecatalogus/api#tag/Software-Catalogus/operation/getVoorzieningen).

## Relaties met andere Componenten

Voorzieningen hebben de volgende relaties met andere componenten:

- Worden aangeboden door Leveranciersorganisaties via Voorzieningaanbiedingen
- Kunnen meerdere Voorzieningaanbiedingen hebben
- Kunnen gerelateerd zijn aan GEMMA referentiecomponenten

### Ophalen van alle aanbiedingen voor een voorziening

```CLI
GET /voorzieningaanbiedingen?voorziening=[id]
```

### Ophalen van alle versies van een voorziening

```CLI
GET /voorzieningversies?voorziening=[id]
```

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