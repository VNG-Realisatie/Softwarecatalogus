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

![Het Add Page dialoogvenster met Title en Slug velden](./pages/addPage.jpg)

:::tip Slug-conventies
Gebruik voor de slug alleen kleine letters, cijfers en koppeltekens. Vermijd spaties en speciale tekens. Bijvoorbeeld: `veelgestelde-vragen` in plaats van `Veelgestelde Vragen`.
:::

## Een bestaande pagina bewerken

1. Zoek de pagina die u wilt bewerken in het pagina-overzicht
2. Klik op de **Acties**-knop (drie puntjes) op de paginakaart
3. Kies **Bewerken**
4. Pas de gewenste velden aan (titel, slug, samenvatting, beschrijving)
5. Klik op **Opslaan**

![Het bewerkscherm van een pagina met Content Items, Configuration en Security tabs](./pages/editPage.jpg)

De wijzigingen zijn direct zichtbaar op de publieke website.

## Een pagina verwijderen

1. Zoek de pagina in het overzicht
2. Klik op de **Acties**-knop
3. Kies **Verwijderen**
4. Bevestig de verwijdering in het bevestigingsvenster

:::caution Let op
Verwijderde pagina's zijn niet te herstellen. Controleer of de pagina niet meer nodig is voordat u deze verwijdert. Links naar verwijderde pagina's zullen een 404-fout opleveren.
:::

## Content toevoegen aan een pagina

Een pagina kan meerdere content items bevatten. Elk content item heeft een **type** en een **volgorde** (order) die bepaalt waar het op de pagina verschijnt. U voegt content toe via de knop **+ Add Content** in het bewerkscherm van een pagina.

### Beschikbare content types

| Type | Beschrijving |
|------|--------------|
| **Text** | Onopgemaakte platte tekst |
| **RichText** | Opgemaakte tekst met een toolbar voor opmaak (vet, cursief, lijsten, tabellen, afbeeldingen, links, etc.) |
| **Faq** | Veelgestelde vragen met Vraag/Antwoord-paren |

### Text content

Kies content type **Text** om een blok onopgemaakte tekst toe te voegen. Voer de tekst in het tekstveld in en stel de volgorde in.

![Text content bewerken — onopgemaakte tekst met volgorde](./pages/addPageContentText.jpg)

### RichText content

Kies content type **RichText** voor opgemaakte tekst. De editor biedt een toolbar met opties voor koppen, vet, cursief, lijsten, tabellen, afbeeldingen, links en codeblokken.

![RichText content toevoegen met opgemaakte tekst en toolbar](./pages/addPageContentRichText.jpg)

### FAQ content

Kies content type **Faq** om een lijst met veelgestelde vragen toe te voegen. Elke FAQ-entry bestaat uit een **Vraag** en een **Antwoord**. U kunt meerdere paren toevoegen.

![FAQ content toevoegen met Vraag/Antwoord-paren](./pages/addPageFaqText.jpg)

:::tip Volgorde
De volgorde (order) bepaalt de positie van het content item op de pagina. Lagere nummers verschijnen hoger op de pagina. Let op de volgorde wanneer u meerdere content items toevoegt.
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

![Voorbeeld van de publieke website van de Softwarecatalogus](./pages/WebsiteExample.png)

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
