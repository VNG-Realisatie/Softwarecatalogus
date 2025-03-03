---
id: leveranciersorganisatie
title: Leveranciersorganisatie
sidebar_label: Leveranciersorganisatie
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Leveranciersorganisatie

Een leveranciersorganisatie is een bedrijf of instelling die software of diensten aanbiedt binnen de gemeentelijke IT-omgeving. Deze organisaties leveren voorzieningen aan gemeenten en andere overheidsinstanties.

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| id | string | Unieke identificatie voor de leveranciersorganisatie |
| naam | string | Naam van de organisatie |
| kvkNummer | string | KvK-nummer van de organisatie |
| website | string (URI) | Website van de organisatie |
| adres | object | Adresgegevens van de organisatie |
| contactgegevens | object | Contactgegevens van de organisatie |
| beschrijving | string | Beschrijving van de organisatie |
| logo | string (URI) | URL naar het logo van de organisatie |
| aanbiedingen | array | Lijst van voorzieningaanbiedingen van deze leverancier |

## API Endpoint

```
GET /leveranciersorganisaties
```

Voor een specifieke leveranciersorganisatie:

```
GET /leveranciersorganisaties/{id}
```

## Voorbeeld Response

```json
{
  "id": "l1",
  "naam": "Voorbeeld Software B.V.",
  "kvkNummer": "12345678",
  "website": "https://www.voorbeeldsoftware.nl",
  "adres": {
    "straat": "Voorbeeldstraat 123",
    "postcode": "1234 AB",
    "plaats": "Amsterdam",
    "land": "Nederland"
  },
  "contactgegevens": {
    "telefoon": "020-1234567",
    "email": "info@voorbeeldsoftware.nl"
  },
  "beschrijving": "Voorbeeld Software B.V. is een toonaangevende leverancier van gemeentelijke software.",
  "logo": "https://www.voorbeeldsoftware.nl/logo.png",
  "aanbiedingen": [
    {
      "id": "va1",
      "voorzieningId": "v1",
      "naam": "Zaaksysteem Pro"
    }
  ]
}
```

## Relaties met andere Componenten

Leveranciersorganisaties hebben de volgende relaties met andere componenten:

- Bieden één of meerdere Voorzieningaanbiedingen aan
- Zijn gekoppeld aan Voorzieningen via Voorzieningaanbiedingen

## Object Relaties

Het Leveranciersorganisatie object heeft de volgende relaties met andere objecten in het model:

- **Voorzieningaanbod**: Een leveranciersorganisatie kan meerdere voorzieningaanbiedingen hebben. Dit is een één-op-veel relatie waarbij de leveranciersorganisatie de aanbieder is van specifieke voorzieningen.
- **Voorziening**: Er is een indirecte relatie met voorzieningen via de voorzieningaanbiedingen. Een leveranciersorganisatie biedt specifieke voorzieningen aan via hun aanbiedingen.

## Relatie tot PublicCode.yaml

In de [publiccode.yaml](https://github.com/publiccodeyml/publiccode.yaml) standaard komt het concept van een leveranciersorganisatie overeen met de volgende velden:

| Leveranciersorganisatie | publiccode.yaml | Beschrijving |
|-------------------------|-----------------|--------------|
| naam | legal.mainCopyrightOwner | De naam van de organisatie die eigenaar is van de software |
| website | legal.repoOwner | De eigenaar van de repository |
| contactgegevens | maintenance.contacts | Contactgegevens voor onderhoud en ondersteuning |
| beschrijving | description | Beschrijving van de software en de organisatie |
| logo | logo | URL naar het logo van de software of organisatie |

De publiccode.yaml standaard richt zich meer op de software zelf dan op de leverancier, maar bevat wel informatie over de organisatie die de software ontwikkelt en onderhoudt. In de Softwarecatalogus is de Leveranciersorganisatie een apart object met meer gedetailleerde informatie over de leverancier. 