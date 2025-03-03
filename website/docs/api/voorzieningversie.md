---
id: voorzieningversie
title: Voorzieningversie
sidebar_label: Voorzieningversie
---

# Voorzieningversie

Een voorzieningversie is een specifieke versie van een voorzieningaanbod. Het bevat informatie over de release, ondersteuningsperiode, systeemvereisten en eventuele kwetsbaarheden.

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| id | string | Unieke identificatie voor de voorzieningversie |
| voorzieningaanbodId | string | ID van het voorzieningaanbod |
| versienummer | string | Versienummer van de voorziening |
| releaseNotes | string | Release notes voor deze versie |
| releaseDatum | string (date) | Datum waarop deze versie is uitgebracht |
| eindeDatum | string (date) | Datum waarop de ondersteuning voor deze versie eindigt |
| status | string | Status van deze versie (ontwikkeling, actief, onderhoud, einde-ondersteuning) |
| systeemvereisten | object | Systeemvereisten voor deze versie |
| kwetsbaarheden | array | Bekende kwetsbaarheden in deze versie |

## API Endpoint

'''
GET /voorzieningversies
'''

Voor een specifieke voorzieningversie:

'''
GET /voorzieningversies/{id}
'''

## Voorbeeld Response

'''json
{
  "id": "vv1",
  "voorzieningaanbodId": "va1",
  "versienummer": "2.5.0",
  "releaseNotes": "Deze versie bevat verbeteringen in de zoekfunctionaliteit en lost diverse bugs op.",
  "releaseDatum": "2023-06-15",
  "eindeDatum": "2025-06-15",
  "status": "actief",
  "systeemvereisten": {
    "besturingssysteem": [
      "Windows Server 2019+",
      "Linux (Ubuntu 20.04+)"
    ],
    "hardware": "4GB RAM, 20GB schijfruimte",
    "software": [
      "PostgreSQL 12+",
      ".NET Core 6.0+"
    ]
  },
  "kwetsbaarheden": [
    {
      "id": "k1",
      "titel": "XSS kwetsbaarheid in zoekfunctie",
      "ernst": "gemiddeld"
    }
  ]
}
'''

## Relaties met andere Componenten

Voorzieningversies hebben de volgende relaties met andere componenten:

- Behoren tot één Voorzieningaanbod
- Kunnen meerdere Kwetsbaarheden hebben

## Object Relaties

Het Voorzieningversie object heeft de volgende relaties met andere objecten in het model:

- **Voorzieningaanbod**: Een voorzieningversie behoort tot precies één voorzieningaanbod. Dit is een veel-op-één relatie waarbij de versie een specifieke release is van het aanbod.
- **Kwetsbaarheid**: Een voorzieningversie kan meerdere kwetsbaarheden hebben. Dit is een één-op-veel relatie waarbij elke kwetsbaarheid een beveiligingsprobleem in de versie vertegenwoordigt.
- **Leveranciersorganisatie**: Er is een indirecte relatie met de leveranciersorganisatie via het voorzieningaanbod. De leverancier is verantwoordelijk voor het uitbrengen en onderhouden van de versie.
- **Voorziening**: Er is een indirecte relatie met de voorziening via het voorzieningaanbod. De versie implementeert de functionaliteit van de voorziening.

## Relatie tot PublicCode.yaml

In de [publiccode.yaml](https://github.com/publiccodeyml/publiccode.yaml) standaard komt het concept van een voorzieningversie overeen met versie-specifieke informatie. De volgende velden zijn relevant:

| Voorzieningversie | publiccode.yaml | Beschrijving |
|-------------------|-----------------|--------------|
| versienummer | softwareVersion | Versie van de software |
| releaseNotes | releaseDate | Datum van de release |
| releaseDatum | releaseDate | Datum van de release |
| status | developmentStatus | Ontwikkelingsstatus van de software |
| systeemvereisten | dependsOn | Afhankelijkheden van de software |

De publiccode.yaml standaard bevat minder gedetailleerde informatie over specifieke versies dan het Voorzieningversie object in de Softwarecatalogus. In publiccode.yaml wordt doorgaans alleen de huidige versie beschreven, terwijl de Softwarecatalogus informatie bijhoudt over meerdere versies, inclusief historische versies en hun ondersteuningsstatus. Ook bevat de Softwarecatalogus meer gedetailleerde informatie over systeemvereisten en kwetsbaarheden per versie. 