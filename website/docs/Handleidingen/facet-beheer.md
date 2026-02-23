---
id: facet-beheer
title: Facetbeheer (zoekfilters)
sidebar_label: Facetbeheer
sidebar_position: 4
description: Handleiding voor het configureren van zoekfacetten en filters in de Softwarecatalogus
keywords:
  - facetten
  - filters
  - zoeken
  - configuratie
  - handleiding
---

# Facetbeheer (zoekfilters)

De zoekpagina van de Softwarecatalogus toont filters (facetten) waarmee gebruikers de zoekresultaten kunnen verfijnen. Deze facetten worden automatisch gegenereerd op basis van de schema-eigenschappen in OpenRegister, maar kunnen door een functioneel beheerder worden geconfigureerd.

## Beschikbare zoekfacetten

De zoekpagina (`/zoeken`) toont de volgende standaardfacetten:

| Facet | Beschrijving | Voorbeeldwaarden |
|-------|--------------|------------------|
| **Type** | Type object (applicatie, dienst, koppeling, organisatie) | Applicatie, Dienst, Koppeling, Organisatie |
| **Samenwerkingstype** | Type samenwerking | Diverse samenwerkingsvormen |
| **Geregistreerd door** | Type organisatie dat het item registreerde | Gemeente, Leverancier, Samenwerking |
| **Leverancier** | De aanbieder van een applicatie | Naam van leveranciers |
| **Licentievorm** | Type licentie | Open source, Proprietary, SaaS |
| **Referentiecomponenten** | GEMMA-referentiecomponenten | Zaakregistratiecomponent, Gravenbeheercomponent, etc. |
| **Standaardversies** | Ondersteunde standaarden en versies | BAG Compact 1.0, DigiD SAML, StUF-BG, etc. |
| **Diensttype** | Type dienst | Implementatieondersteuning, Hosting, etc. |
| **Type koppeling** | Soort koppeling | Extern, Intern |
| **Organisatietype** | Type organisatie | Gemeente, Leverancier, Samenwerking |

## Hoe facetten werken

Facetten worden automatisch gegenereerd vanuit de **schema-eigenschappen** in OpenRegister:

1. Elk schema (applicatie, dienst, koppeling, organisatie) heeft eigenschappen (properties)
2. Eigenschappen die als **facetteerbaar** zijn gemarkeerd, verschijnen als filter op de zoekpagina
3. De waarden in het filter worden dynamisch berekend op basis van de beschikbare data
4. Achter elke filterwaarde staat een **aantal** dat aangeeft hoeveel resultaten die waarde hebben

### Filtergedrag

- **Enkele selectie**: Klik op een filterwaarde om te filteren
- **Meerdere selectie**: Selecteer meerdere waarden binnen hetzelfde facet (OR-logica)
- **Combineren**: Selecteer waarden in verschillende facetten (AND-logica)
- **Wissen**: Klik op "Wis alle filters" om alle filters te verwijderen
- **Zoeken in filter**: Bij facetten met veel waarden (zoals Leverancier met 2500+ waarden) kunt u typen om te zoeken

## Facetten configureren

Facetten worden geconfigureerd via de schema-eigenschappen in OpenRegister.

### Navigeren naar facetconfiguratie

1. Log in op het Nextcloud-backend als **admin**
2. Klik op **OpenRegister** in de linkermenubalk
3. Ga naar **Registers** in het linkermenu
4. Selecteer het **Voorzieningen**-register
5. Klik op het relevante schema (bijv. Applicatie, Dienst, Koppeling)
6. U ziet de schema-eigenschappen

### Een eigenschap als facet instellen

1. Klik op de eigenschap die u als facet wilt tonen
2. In de eigenschapsinstellingen vindt u de optie **Facetteerbaar** (of vergelijkbaar)
3. Schakel deze optie in
4. Sla de wijzigingen op

### Facetlabels aanpassen

De naam die in het filter wordt getoond, komt overeen met de **titel** van de schema-eigenschap. Om een facetlabel te wijzigen:

1. Open de eigenschap in het schema
2. Wijzig de **titel** (display name) van de eigenschap
3. Sla op

De nieuwe naam verschijnt na het vernieuwen van de zoekpagina.

:::tip Naamgeving
Gebruik duidelijke, Nederlandstalige labels die aansluiten bij het woordgebruik in de wizards en beheerpagina's. Bijvoorbeeld "Diensttype" in plaats van "serviceType".
:::

### Facetwaarden en naamresolutie

Sommige facetten bevatten verwijzingen naar andere objecten (bijv. Leverancier verwijst naar organisatie-objecten). De zoekpagina lost deze verwijzingen automatisch op naar leesbare namen. Dit proces (**naamresolutie**) kan bij de eerste keer laden enkele seconden duren bij facetten met veel waarden.

Als een waarde niet kan worden opgelost, wordt tijdelijk de technische identifier (UUID) getoond. Dit duidt meestal op:
- Een verwijzing naar een verwijderd object
- Een datafout in de import

## Performanceoverwegingen

| Situatie | Impact | Advies |
|----------|--------|--------|
| Facet met < 100 waarden | Snel | Geen actie nodig |
| Facet met 100-1000 waarden | Merkbaar | Overweeg type-to-filter zoekfunctie |
| Facet met > 1000 waarden | Langzaam bij eerste laden | Naamresolutie kan 2-5 seconden duren |

De facetresolutie voor alle waarden vindt plaats bij het eerste bezoek aan de zoekpagina. Daarna worden de namen gecacht voor snellere navigatie.

## Bekende aandachtspunten

- Het **Organisatietype**-facet kan waarden bevatten die niet tot organisatietypes behoren (zoals "Applicatie" of "extern/intern"). Dit is een bekende datakwaliteitsissue.
- Na het wijzigen van facetconfiguratie kan het nodig zijn de **cache te legen** voordat de wijzigingen zichtbaar zijn.
- Facetten met UUID-waarden die niet opgelost kunnen worden, duiden op ontbrekende objecten in het register.
- De volgorde van facetten op de zoekpagina wordt bepaald door de volgorde van de schema-eigenschappen.

## Gerelateerde functionaliteiten

- [F011 - Zoeken & Ontdekken](../Functionaliteiten/F011-zoeken-en-ontdekken.md) — Zoekfunctionaliteit
- [F009 - Beheer en Configuratie](../Functionaliteiten/F009-beheer-en-configuratie.md) — Systeemconfiguratie
