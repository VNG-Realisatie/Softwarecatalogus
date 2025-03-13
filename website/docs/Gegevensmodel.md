---
id: model-structuur
title: GEMMA Model Structuur
sidebar_label: Model Structuur
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# GEMMA Architectuur Model Structuur

De GEMMA API biedt toegang tot een uitgebreid architectuurmodel dat de ArchiMate-standaard volgt, evenals een Software Catalogus met informatie over gemeentelijke software. Deze pagina legt de structuur van het model en de relaties tussen de componenten uit.

## GEMMA Architectuur Componenten

### Kern Componenten

Het GEMMA architectuurmodel bestaat uit verschillende kerncomponenten:

- [Model](GEMMA/model) - De hoofdcontainer die alle architectuurelementen, relaties, views en eigenschapsdefinities bevat
- [Elementen](GEMMA/elementen) - De bouwstenen van de architectuur (bedrijfsprocessen, applicaties, etc.)
- [Relaties](GEMMA/relaties) - De verbindingen tussen elementen
- [Views](GEMMA/views) - Verschillende perspectieven op het architectuurmodel
- [Eigenschapsdefinities](GEMMA/eigenschapsdefinities) - Definities van eigenschappen die aan elementen en relaties kunnen worden toegekend

### Visualisatie Componenten

Het model bevat componenten voor het visualiseren van de architectuur:

- [Nodes](GEMMA/nodes) - Visuele representaties van elementen in een diagram
- [Verbindingen](GEMMA/verbindingen) - Visuele representaties van relaties in een diagram

### Object Diagram

Het volgende diagram toont de structuur van het GEMMA architectuurmodel en de relaties tussen de componenten:


Voor meer informatie over het GEMMA architectuurmodel, zie de [GEMMA](GEMMA/introduction.md) pagina.

## Software Catalogus Componenten

Naast het architectuurmodel bevat de API ook toegang tot de Software Catalogus, die informatie biedt over gemeentelijke software:

- [Leveranciersorganisatie](Softwarecatalogus/leveranciersorganisatie) - Organisaties die software en diensten leveren
- [Voorziening](Softwarecatalogus/voorziening) - Softwareproducten en diensten voor gemeenten
- [Voorzieningaanbod](Softwarecatalogus/voorzieningaanbod) - Specifieke aanbiedingen van voorzieningen door leveranciers
- [Voorzieningversie](Softwarecatalogus/voorzieningversie) - Specifieke versies van voorzieningaanbiedingen
- [Kwetsbaarheid](Softwarecatalogus/kwetsbaarheid) - Beveiligingsproblemen in voorzieningversies

### Object Diagram

Het volgende diagram toont de structuur van de Software Catalogus en de relaties tussen de objecttypen:



## API Toegang

Je kunt deze componenten benaderen via de GEMMA API:

### GEMMA Architectuur Endpoints

- `/model` - Verkrijg het complete architectuurmodel
- `/elements` - Verkrijg alle architectuurelementen
- `/relations` - Verkrijg alle relaties tussen elementen
- `/views` - Verkrijg alle architectuurviews
- `/propertydefinitions` - Verkrijg alle eigenschapsdefinities

### Software Catalogus Endpoints

- `/leveranciersorganisaties` - Verkrijg alle leveranciersorganisaties
- `/voorzieningen` - Verkrijg alle voorzieningen
- `/voorzieningaanbiedingen` - Verkrijg alle voorzieningaanbiedingen
- `/voorzieningversies` - Verkrijg alle voorzieningversies
- `/kwetsbaarheden` - Verkrijg alle kwetsbaarheden

Voor gedetailleerde API documentatie, zie de [API Specificatie](/api). 