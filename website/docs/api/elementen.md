---
id: elementen
title: GEMMA Elementen
sidebar_label: Elementen
---

# GEMMA Elementen

Elementen zijn de bouwstenen van het GEMMA architectuurmodel. Ze vertegenwoordigen verschillende aspecten van de gemeentelijke architectuur volgens de ArchiMate-standaard.

## Soorten Elementen

Het GEMMA model bevat verschillende soorten elementen:

- **Bedrijfselementen**: Actoren, processen, functies en objecten die de bedrijfslaag vormen
- **Applicatie-elementen**: Componenten, services en data-objecten die de applicatielaag vormen
- **Technologie-elementen**: Infrastructuur, apparaten en systeemcomponenten die de technologielaag vormen
- **Motivatie-elementen**: Doelen, principes en eisen die de motivatie voor de architectuur vormen

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| id | string | Unieke identificatie voor het element |
| name | string | Naam van het element |
| type | string | ArchiMate type van het element (bijv. BusinessActor, ApplicationComponent) |
| documentation | object | Documentatie behorende bij het element |
| properties | object | Aangepaste eigenschappen van het element |

## API Endpoint

'''
GET /elements
'''

Voor een specifiek element:

'''
GET /elements/{id}
'''

## Voorbeeld Response

'''json
{
  "id": "e1",
  "name": "Zaakafhandelcomponent",
  "type": "ApplicationComponent",
  "documentation": "Een component voor het afhandelen van zaken binnen de gemeentelijke dienstverlening.",
  "properties": {
    "status": "Actief",
    "releaseDate": "2022-01-15"
  }
}
'''

## Relaties met andere Componenten

Elementen hebben de volgende relaties met andere componenten:

- Worden gevisualiseerd door Nodes in Views
- Worden verbonden door Relaties
- Kunnen eigenschappen hebben die worden gedefinieerd door Eigenschapsdefinities 