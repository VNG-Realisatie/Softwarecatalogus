---
id: pagina-beheer
title: Paginabeheer (CMS)
sidebar_label: Paginabeheer
sidebar_position: 1
description: Handleiding voor het aanmaken en beheren van CMS-pagina's in de Softwarecatalogus
keywords:
  - CMS
  - pagina
  - paginabeheer
  - content
  - handleiding
---

# Paginabeheer (CMS)

De Softwarecatalogus bevat een ingebouwd CMS-systeem waarmee functioneel beheerders pagina's kunnen aanmaken en bewerken. Denk hierbij aan de privacyverklaring, algemene voorwaarden, FAQ en andere informatieve pagina's.

## Overzicht

Het CMS beheert de volgende soorten pagina's:

| Pagina | Slug | Beschrijving |
|--------|------|--------------|
| Home | `home` | De voorpagina van de Softwarecatalogus |
| About | `about` | Over de Softwarecatalogus |
| Website | `website` | Informatie over de website |
| Privacyverklaring | `privacyverklaring` | Privacybeleid |
| Disclaimer | `disclaimer` | Disclaimer |
| Algemene Voorwaarden | `algemene-voorwaarden` | Gebruiksvoorwaarden |
| FAQ | `faq` | Veelgestelde vragen |

## Navigeren naar paginabeheer

1. Log in op het Nextcloud-backend
2. Klik op **OpenCatalogi** in de linkermenubalk
3. Ga naar het onderdeel **Pages** in de linker sidebar (onder Settings)
4. U ziet nu een overzicht van alle pagina's in kaartvorm

Elke kaart toont:
- De **titel** van de pagina
- De **slug** (URL-pad, bijv. `/privacyverklaring`)
- Het aantal **content items**
- De **status** (Available/Draft)

## Een nieuwe pagina aanmaken

1. Klik op de knop **Add Page** rechtsboven in het pagina-overzicht
2. Vul de volgende velden in:
   - **Title**: De titel van de pagina (wordt getoond in de browser-titelbalk en als kop)
   - **Slug**: Het URL-pad (bijv. `mijn-pagina` wordt bereikbaar op `/mijn-pagina`)
   - **Summary**: Een korte samenvatting van de pagina-inhoud
   - **Description**: De volledige pagina-inhoud
3. Klik op **Opslaan**

:::tip Slug-conventies
Gebruik voor de slug alleen kleine letters, cijfers en koppeltekens. Vermijd spaties en speciale tekens. Bijvoorbeeld: `veelgestelde-vragen` in plaats van `Veelgestelde Vragen`.
:::

## Een bestaande pagina bewerken

1. Zoek de pagina die u wilt bewerken in het pagina-overzicht
2. Klik op de **Acties**-knop (drie puntjes) op de paginakaart
3. Kies **Bewerken**
4. Pas de gewenste velden aan (titel, slug, samenvatting, beschrijving)
5. Klik op **Opslaan**

De wijzigingen zijn direct zichtbaar op de publieke website.

## Een pagina verwijderen

1. Zoek de pagina in het overzicht
2. Klik op de **Acties**-knop
3. Kies **Verwijderen**
4. Bevestig de verwijdering in het bevestigingsvenster

:::caution Let op
Verwijderde pagina's zijn niet te herstellen. Controleer of de pagina niet meer nodig is voordat u deze verwijdert. Links naar verwijderde pagina's zullen een 404-fout opleveren.
:::

## Pagina's op de publieke website

CMS-pagina's zijn publiek toegankelijk via hun slug:

```
https://{frontend-url}/{slug}
```

Bijvoorbeeld:
- `https://softwarecatalogus.nl/privacyverklaring`
- `https://softwarecatalogus.nl/faq`
- `https://softwarecatalogus.nl/algemene-voorwaarden`

De footer van de publieke website bevat automatisch links naar de privacyverklaring, algemene voorwaarden, disclaimer en FAQ.

## Publieke API

Pagina-inhoud is ook beschikbaar via de API:

```
GET /index.php/apps/opencatalogi/api/pages/{slug}
```

Dit kan handig zijn voor integraties met andere systemen.

## Bekende aandachtspunten

- De **voorpagina** (slug: `home`) heeft naast de CMS-inhoud ook onderdelen die via het thema worden geconfigureerd (zoekbalk, contentblokken, banner). Deze zijn niet via het CMS bewerkbaar.
- Zorg dat de **slug** uniek is — dubbele slugs veroorzaken conflicten.
- Na het opslaan kan het enkele seconden duren voordat de wijzigingen zichtbaar zijn op de publieke website (cache).
