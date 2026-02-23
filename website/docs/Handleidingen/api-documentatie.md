---
id: api-documentatie
title: API-documentatie raadplegen
sidebar_label: API-documentatie
sidebar_position: 6
description: Handleiding voor het raadplegen en gebruiken van de API-documentatie van de Softwarecatalogus
keywords:
  - API
  - documentatie
  - endpoints
  - OpenAPI
  - Redoc
  - handleiding
---

# API-documentatie raadplegen

De Softwarecatalogus biedt een uitgebreide REST API waarmee externe systemen data kunnen opvragen en beheren. De API-documentatie is beschikbaar als interactieve Redoc-pagina en als OpenAPI-specificatie.

## API-documentatie vinden

### Via de beheeromgeving

1. Log in op het Nextcloud-backend als **admin**
2. Klik op **OpenRegister** in de linkermenubalk
3. Klik op **API Documentation** in het linkermenu
4. De API-documentatie opent in een nieuw tabblad

![De knop voor API-documentatie in de beheeromgeving van OpenRegister](./viewApiDocumentation.png)

### Via de documentatiesite

De API-documentatie is ook direct beschikbaar op de documentatiesite:

| Documentatie | URL | Beschrijving |
|-------------|-----|--------------|
| **Softwarecatalogus API** | [`/Softwarecatalogus/api`](/api) | Volledige API-specificatie van de Softwarecatalogus |
| **GEMMA API** | [`/Softwarecatalogus/gemma`](/gemma) | GEMMA-standaard API-specificatie |

## Beschikbare endpoints

De API biedt endpoints voor alle objecttypen in de Softwarecatalogus:

| Endpoint | Beschrijving |
|----------|--------------|
| **Applicaties** | Software-applicaties in de catalogus |
| **Organisaties** | Gemeenten, leveranciers en samenwerkingsverbanden |
| **Voorzieningen** | Diensten en koppelingen |
| **Standaarden** | Ondersteunde standaarden en versies |
| **Referentiecomponenten** | GEMMA-referentiecomponenten |

## Basisgebruik

### Objecten opvragen

De API werkt via standaard HTTP-verzoeken. Een voorbeeld om alle applicaties op te vragen:

```
GET /index.php/apps/opencatalogi/api/search?_queries[]=voorzieningen
```

### Authenticatie

- **Publieke endpoints** (zoeken, raadplegen) zijn zonder authenticatie beschikbaar
- **Beheerendpoints** (aanmaken, bewerken, verwijderen) vereisen authenticatie via Nextcloud basic auth

### Responsformaat

Alle API-responses worden geretourneerd in **JSON-formaat**. De Redoc-documentatie toont voor elk endpoint de verwachte request- en response-structuur.

## Tips voor gebruik

:::tip Interactieve documentatie
De Redoc-pagina's zijn interactief: u kunt de endpoints uitklappen om de parameters, request body en mogelijke responses te bekijken. Gebruik de zoekfunctie bovenin om snel een specifiek endpoint te vinden.
:::

:::tip OpenAPI-specificatie downloaden
De onderliggende OpenAPI-specificaties (YAML/JSON) kunnen worden gebruikt om automatisch API-clients te genereren voor uw programmeertaal. Dit is handig bij het bouwen van integraties met de Softwarecatalogus.
:::

## Bekende aandachtspunten

- De API-documentatie wordt automatisch gegenereerd vanuit de OpenAPI-specificatie. Bij wijzigingen in de API kan het even duren voordat de documentatie is bijgewerkt
- Niet alle endpoints zijn publiek toegankelijk — beheerendpoints vereisen de juiste autorisatierol
- De rate limiting van de API is ingesteld op basis van het IP-adres. Bij veelvuldig gebruik vanuit hetzelfde adres kan tijdelijk een beperking optreden

## Gerelateerde handleidingen

- [Export beheer](./export-beheer.md) — Registers en schema's exporteren via de beheeromgeving
- [Facetbeheer](./facet-beheer.md) — Zoekfacetten configureren (bepaalt welke filters beschikbaar zijn in de API)
