---
id: organisatie
title: Organisatie
sidebar_label: Organisatie
sidebar_position: 2
---

# Organisatie

Een organisatie is een bedrijf, overheidsinstelling of andere entiteit die betrokken is bij het ontwikkelen, aanbieden of gebruiken van software en diensten binnen de overheids-IT-omgeving. Dit kunnen zowel commerciële leveranciers als overheidsorganisaties zijn.

## API Specificatie

De volledige API specificatie voor Organisatie is beschikbaar op de [VNG API Specificatie pagina](https://vng-realisatie.github.io/Softwarecatalogus/api#tag/Software-Catalogus/operation/getLeveranciersorganisaties).

## Eigenschappen

| Eigenschap | Type | Verplicht | Beschrijving |
|------------|------|-----------|--------------|
| id | string | Ja | Unieke identificatie voor de organisatie |
| naam | string | Ja | Naam van de organisatie |
| type | string | Ja | Type organisatie (overheid, leverancier, etc.) |
| kvkNummer | string | Nee | KvK-nummer van de organisatie (voor bedrijven) |
| oidn | string | Nee | Organisatie Identificatienummer (voor overheden) |
| moederOrganisatie | string | Nee | ID van de bovenliggende organisatie |
| sector | string | Nee | Sector waartoe de organisatie behoort |
| organisatietype | string | Nee | Type van de organisatie |
| website | string (URI) | Nee | Website van de organisatie |
| adres | object | Nee | Adresgegevens van de organisatie |
| contactgegevens | object | Nee | Contactgegevens van de organisatie |
| beschrijving | string | Nee | Beschrijving van de organisatie |
| logo | string (URI) | Nee | URL naar het logo van de organisatie |
| voorzieningen | array | Nee | Lijst van voorzieningen van deze organisatie |
| gebruik | array | Nee | Lijst van voorzieningGebruik door deze organisatie |
| deelnemerIn | array | Nee | Lijst van organisaties waarin deze organisatie deelneemt |

### Adres object

| Eigenschap | Type | Verplicht | Beschrijving |
|------------|------|-----------|--------------|
| straat | string | Ja | Straatnaam |
| huisnummer | string | Ja | Huisnummer |
| postcode | string | Ja | Postcode |
| plaats | string | Ja | Plaatsnaam |
| land | string | Ja | Land |

### Contactgegevens object

| Eigenschap | Type | Verplicht | Beschrijving |
|------------|------|-----------|--------------|
| telefoon | string | Nee | Telefoonnummer |
| email | string | Nee | E-mailadres |
| contactpersoon | string | Nee | Naam van de contactpersoon |

## Relaties

- Een Organisatie kan meerdere [VoorzieningAanbod](./voorzieningaanbod) objecten aanbieden
- Een Organisatie kan meerdere [VoorzieningGebruik](./voorzieninggebruik) objecten hebben
- Een Organisatie kan een moederorganisatie hebben (hiërarchische relatie)

## Voorbeeld

```json
{
  "id": "ORG-001",
  "naam": "Gemeente Amsterdam",
  "type": "overheid",
  "oidn": "0363",
  "sector": {
    "id": "SEC-001",
    "naam": "Gemeenten"
  },
  "organisatietype": {
    "id": "OT-001",
    "naam": "Gemeente"
  },
  "website": "https://www.amsterdam.nl",
  "adres": {
    "straat": "Amstel",
    "huisnummer": "1",
    "postcode": "1011 PN",
    "plaats": "Amsterdam",
    "land": "Nederland"
  },
  "contactgegevens": {
    "telefoon": "14020",
    "email": "info@amsterdam.nl",
    "contactpersoon": "Jan Jansen"
  },
  "beschrijving": "De gemeente Amsterdam is de hoofdstad van Nederland",
  "logo": "https://www.amsterdam.nl/logo.png",
  "voorzieningen": [],
  "gebruik": [
    {
      "id": "VG-2023-001",
      "voorziening": {
        "id": "VZ-001",
        "naam": "DigiD"
      }
    }
  ],
  "deelnemerIn": []
}
``` 