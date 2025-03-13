---
id: voorzieningversie
title: VoorzieningVersie
sidebar_label: VoorzieningVersie
sidebar_position: 7
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# VoorzieningVersie

Een voorzieningversie is een specifieke versie van een voorzieningaanbod. Het bevat informatie over de release, ondersteuningsperiode, systeemvereisten en eventuele kwetsbaarheden.

## API Specificatie

De volledige API specificatie voor VoorzieningVersie is beschikbaar op de [VNG API Specificatie pagina](https://vng-realisatie.github.io/Softwarecatalogus/api#tag/Software-Catalogus/operation/getVoorzieningversies).

## Eigenschappen

| Eigenschap | Type | Verplicht | Beschrijving |
|------------|------|-----------|--------------|
| id | UUID | Ja | Unieke identificatie voor de voorzieningversie |
| voorzieningaanbodId | UUID | Ja | ID van het voorzieningaanbod |
| omschrijving | string | Ja | Beschrijving van deze specifieke versie en de belangrijkste kenmerken |
| naam | string | Ja | Naam van de versie zoals deze door de leverancier wordt gebruikt. Dit kan een marketingnaam zijn (bijv. 'Enterprise 2023') of een interne versieaanduiding. Voor technische versienummering zie 'nummer' |
| nummer | string | Ja | Versienummer van de voorziening volgens [Semantic Versioning](https://semver.org/) standaard (MAJOR.MINOR.PATCH) |
| releaseNotes | string | Nee | Release notes voor deze versie |
| productieDatum | string (date) | Ja | Datum waarop deze versie is uitgebracht |
| eindeDatum | string (date) | Nee | Datum waarop de ondersteuning voor deze versie eindigt |
| status | string | Ja | Status van deze versie (ontwikkeling, actief, onderhoud, einde-ondersteuning) |

## API Endpoint

```
GET /voorzieningversies
```

Voor een specifieke voorzieningversie:

```
GET /voorzieningversies/{id}
```

## Voorbeeld Response

```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "voorzieningaanbodId": "123e4567-e89b-12d3-a456-426614174000", 
  "omschrijving": "Enterprise versie met uitgebreide rapportagemogelijkheden",
  "naam": "Enterprise 2023",
  "nummer": "2.5.0",
  "releaseNotes": "Deze versie bevat verbeteringen in de zoekfunctionaliteit en lost diverse bugs op.",
  "productieDatum": "2023-06-15",
  "eindeDatum": "2025-06-15",
  "status": "actief"
}
```

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