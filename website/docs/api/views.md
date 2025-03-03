---
id: views
title: GEMMA Views
sidebar_label: Views
---

# GEMMA Views

Views bieden verschillende perspectieven op het GEMMA architectuurmodel. Elke view richt zich op specifieke aspecten van de architectuur en bevat visuele representaties van elementen en hun relaties.

## Soorten Views

Het GEMMA model bevat verschillende soorten views:

- **Bedrijfsviews**: Tonen bedrijfsprocessen, actoren en objecten
- **Applicatieviews**: Tonen applicatiecomponenten en hun interacties
- **Technologieviews**: Tonen infrastructuur en technische componenten
- **Implementatieviews**: Tonen hoe componenten worden geïmplementeerd
- **Motivatieviews**: Tonen doelen, principes en eisen

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| id | string | Unieke identificatie voor de view |
| name | string | Naam van de view |
| viewpoint | string | Type viewpoint (bijv. Application, Business, Technology) |
| documentation | string | Documentatie behorende bij de view |
| properties | object | Aangepaste eigenschappen van de view |
| nodes | Node[] | Verzameling van nodes die elementen in de view representeren |
| connections | Connection[] | Verzameling van verbindingen die relaties in de view representeren |

## API Endpoint

'''
GET /views
'''

Voor een specifieke view:

'''
GET /views/{id}
'''

## Voorbeeld Response

'''json
{
  "id": "v1",
  "name": "Zaakgericht werken",
  "viewpoint": "Application",
  "documentation": "Overzicht van de componenten voor zaakgericht werken",
  "properties": {
    "status": "Actief",
    "domein": "Dienstverlening"
  },
  "nodes": [...],
  "connections": [...]
}
'''

## Relaties met andere Componenten

Views hebben de volgende relaties met andere componenten:

- Bevatten Nodes die Elementen visualiseren
- Bevatten Verbindingen die Relaties visualiseren
- Kunnen eigenschappen hebben die worden gedefinieerd door Eigenschapsdefinities 