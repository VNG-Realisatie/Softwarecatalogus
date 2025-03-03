---
id: softwarecatalogus
title: Software Catalogus
sidebar_label: Software Catalogus
---

# Software Catalogus

De Software Catalogus biedt een overzicht van software en diensten die beschikbaar zijn voor gemeenten. Het bevat informatie over leveranciers, voorzieningen, versies en kwetsbaarheden.

## Objecttypen

De Software Catalogus bestaat uit de volgende objecttypen:

- [Leveranciersorganisatie](leveranciersorganisatie) - Organisaties die software en diensten leveren
- [Voorziening](voorziening) - Softwareproducten en diensten voor gemeenten
- [Voorzieningaanbod](voorzieningaanbod) - Specifieke aanbiedingen van voorzieningen door leveranciers
- [Voorzieningversie](voorzieningversie) - Specifieke versies van voorzieningaanbiedingen
- [Kwetsbaarheid](kwetsbaarheid) - Beveiligingsproblemen in voorzieningversies

## Object Diagram

Het volgende diagram toont de structuur van de Software Catalogus en de relaties tussen de objecttypen:

![Software Catalogus Model Structuur](/Softwarecatalogus/img/softwarecatalogus-model.png)

## API Toegang

Je kunt deze objecten benaderen via de Software Catalogus API:

- `/leveranciersorganisaties` - Verkrijg alle leveranciersorganisaties
- `/voorzieningen` - Verkrijg alle voorzieningen
- `/voorzieningaanbiedingen` - Verkrijg alle voorzieningaanbiedingen
- `/voorzieningversies` - Verkrijg alle voorzieningversies
- `/kwetsbaarheden` - Verkrijg alle kwetsbaarheden

Voor gedetailleerde API documentatie, zie de [API Specificatie](/api).

## Object Relaties

De objecten in de Software Catalogus hebben de volgende relaties met elkaar:

- **Leveranciersorganisatie** biedt één of meerdere **Voorzieningaanbiedingen** aan
- **Voorziening** wordt aangeboden als één of meerdere **Voorzieningaanbiedingen**
- **Voorzieningaanbod** heeft één of meerdere **Voorzieningversies**
- **Voorzieningversie** kan één of meerdere **Kwetsbaarheden** bevatten

Deze relaties maken het mogelijk om de volledige levenscyclus van gemeentelijke software te volgen, van leverancier tot specifieke versie en eventuele beveiligingsproblemen.

## Relatie tot PublicCode.yaml

De [publiccode.yaml](https://github.com/publiccodeyml/publiccode.yaml) standaard is een specificatie voor het beschrijven van publieke software. De Software Catalogus en publiccode.yaml hebben verschillende maar complementaire doelen:

| Software Catalogus | publiccode.yaml | Vergelijking |
|--------------------|-----------------|--------------|
| Gericht op gemeentelijke software | Gericht op publieke software in het algemeen | De Software Catalogus is specifieker gericht op de gemeentelijke context |
| Bevat informatie over commerciële en open source software | Primair gericht op open source software | De Software Catalogus heeft een bredere scope |
| Gedetailleerde informatie over leveranciers | Beperkte informatie over ontwikkelaars | De Software Catalogus biedt meer context over de commerciële aspecten |
| Bijhoudt meerdere versies en hun status | Beschrijft primair de huidige versie | De Software Catalogus biedt historische context |
| Bevat informatie over kwetsbaarheden | Geen expliciete ondersteuning voor kwetsbaarheden | De Software Catalogus biedt meer informatie over beveiliging |

De Software Catalogus kan worden gezien als een uitbreiding op de publiccode.yaml standaard, specifiek gericht op de behoeften van gemeenten. Waar publiccode.yaml zich richt op het beschrijven van de software zelf, biedt de Software Catalogus een breder ecosysteem van informatie over leveranciers, aanbiedingen, versies en beveiliging.

Gemeenten kunnen beide standaarden complementair gebruiken: publiccode.yaml voor gedetailleerde technische informatie over specifieke softwareprojecten, en de Software Catalogus voor een breder overzicht van beschikbare oplossingen en hun leveranciers. 