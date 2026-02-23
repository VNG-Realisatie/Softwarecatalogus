---
id: glossary-beheer
title: Begrippenlijst beheer
sidebar_label: Begrippenlijst beheer
sidebar_position: 2
description: Handleiding voor het beheren van de begrippenlijst (glossary) in de Softwarecatalogus
keywords:
  - begrippenlijst
  - glossary
  - begrippen
  - definities
  - handleiding
---

# Begrippenlijst beheer

De Softwarecatalogus beschikt over een interactieve begrippenlijst (glossary) die begrippen en hun definities toont aan gebruikers. Termen uit de begrippenlijst worden automatisch herkend op pagina's en als klikbare elementen weergegeven.

## Hoe werkt de begrippenlijst?

De begrippenlijst werkt op twee manieren:

1. **Automatische herkenning**: Wanneer een begrip uit de lijst voorkomt op een pagina, wordt het automatisch als klikbaar element weergegeven. Gebruikers kunnen erop klikken om de definitie te zien.
2. **Begrippenlijst-paneel**: Via de zwevende knop "Begrippenlijst" (rechtsonder op elke pagina) kunnen gebruikers alle begrippen doorzoeken.

### Het begrippenlijst-paneel

Het paneel heeft twee tabbladen:

| Tabblad | Functie |
|---------|---------|
| **Deze pagina** | Toont alleen begrippen die op de huidige pagina voorkomen |
| **Alle begrippen** | Toont alle begrippen met een zoekfunctie |

Elk begrip toont:
- **Titel** van het begrip
- **Samenvatting** (korte beschrijving)
- **Beschrijving** (uitgebreide definitie)
- **Meer informatie**-link naar de externe bron (softwarecatalogus.nl/lexicon)

## Huidige begrippen

De begrippenlijst bevat momenteel de volgende termen:

| Begrip | Beschrijving |
|--------|--------------|
| Addendum | Aanvulling op een bestaand document of overeenkomst |
| Convenant VNG | Overeenkomst tussen VNG en gemeenten |
| Eindproduct-standaard | Standaard voor eindproducten |
| Gegevensstandaard | Standaard voor gegevensuitwisseling |
| Grondstof-standaard | Standaard voor grondstoffen |
| Halffabrikaat-standaard | Standaard voor halffabrikaten |
| Leverancier | Aanbieder van software in de catalogus |
| Referentiecomponent | Component uit de GEMMA-architectuur |
| SaaS | Software as a Service |
| Standaard | Afspraak of norm voor interoperabiliteit |

## Begrippen beheren

Begrippen worden beheerd via de Nextcloud-backend.

### Navigeren naar begrippenbeheer

1. Log in op het Nextcloud-backend
2. Klik op **OpenCatalogi** in de linkermenubalk
3. Navigeer naar het onderdeel **Glossary** (Begrippenlijst)
4. U ziet nu een overzicht van alle begrippen

### Een nieuw begrip toevoegen

1. Klik op **Toevoegen** of **Add Term**
2. Vul de volgende velden in:
   - **Title**: De term zelf (bijv. "Referentiecomponent")
   - **Summary**: Een korte omschrijving (1-2 zinnen)
   - **Description**: Een uitgebreide definitie
   - **External Link**: Link naar externe documentatie (optioneel)
   - **Keywords**: Trefwoorden voor betere herkenning op pagina's (optioneel)
3. Klik op **Opslaan**

:::tip Trefwoorden
Voeg synoniemen en gerelateerde termen toe als trefwoorden. Dit vergroot de kans dat het begrip automatisch wordt herkend op pagina's. Bijvoorbeeld bij "SaaS" kunt u "Software as a Service" en "cloud software" als trefwoorden toevoegen.
:::

### Een begrip bewerken

1. Klik op het begrip dat u wilt bewerken
2. Pas de gewenste velden aan
3. Klik op **Opslaan**

### Een begrip verwijderen

1. Klik op het begrip
2. Kies **Verwijderen** via de acties
3. Bevestig de verwijdering

:::caution Let op
Na het verwijderen van een begrip wordt het niet meer automatisch herkend op pagina's. Bestaande pagina's hoeven niet aangepast te worden — de herkenning stopt automatisch.
:::

## API-toegang

De begrippenlijst is ook via de API beschikbaar:

```
GET /apps/opencatalogi/api/glossary
```

Dit retourneert alle begrippen met hun titel, samenvatting, beschrijving, externe link en trefwoorden.

## Bekende aandachtspunten

- Begrippen worden **hoofdletterongevoelig** herkend op pagina's (zowel "leverancier" als "Leverancier" worden herkend).
- De herkenning werkt alleen op de publieke frontend, niet in het Nextcloud-backend.
- Bij het toevoegen van nieuwe begrippen kan het nodig zijn de pagina te vernieuwen voordat de herkenning actief wordt.
- De "Meer informatie"-link verwijst standaard naar `softwarecatalogus.nl/lexicon` — pas dit aan als uw lexicon elders wordt gehost.
