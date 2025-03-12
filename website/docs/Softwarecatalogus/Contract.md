---
id: contract
title: Contract
sidebar_label: Contract
sidebar_position: 6
---

# Contract

Een Contract beschrijft de formele overeenkomst voor het inzetten van een VoorzieningAanbod op een VoorzieningGebruik.

## API Specificatie

De volledige API specificatie voor Contract is beschikbaar op de [VNG API Specificatie pagina](https://vng-realisatie.github.io/Softwarecatalogus/api#tag/Software-Catalogus).

## Eigenschappen

| Naam | Type | Verplicht | Beschrijving |
|------|------|-----------|--------------|
| id | string | Ja | Unieke identifier van het Contract |
| voorzieningAanbod | [VoorzieningAanbod](./VoorzieningAanbod) | Ja | Het aanbod van de voorziening waarop dit contract betrekking heeft |
| voorzieningGebruik | [VoorzieningGebruik](./VoorzieningGebruik) | Ja | Het gebruik van de voorziening waarop dit contract betrekking heeft |
| startDatum | date | Ja | De startdatum van het contract |
| eindDatum | date | Nee | De einddatum van het contract (indien van toepassing) |
| contractNummer | string | Ja | Het referentienummer van het contract |
| contractType | enum | Ja | Het type contract (bijv. 'SLA', 'Licentie', 'Onderhoud') |
| kosten | number | Nee | De kosten verbonden aan het contract |
| kostenPeriode | enum | Nee | De periode waarop de kosten betrekking hebben (bijv. 'Maandelijks', 'Jaarlijks', 'Eenmalig') |
| contactpersoonAanbieder | [Persoon](./Persoon) | Nee | De contactpersoon bij de aanbieder |
| contactpersoonGebruiker | [Persoon](./Persoon) | Nee | De contactpersoon bij de gebruiker |
| documentReferentie | string | Nee | Referentie naar het contractdocument |
| status | enum | Ja | De status van het contract (bijv. 'Actief', 'Verlopen', 'In onderhandeling') |
| opmerkingen | string | Nee | Aanvullende informatie over het contract |

## Relaties

- Een Contract is gekoppeld aan precies één [VoorzieningAanbod](./VoorzieningAanbod)
- Een Contract is gekoppeld aan precies één [VoorzieningGebruik](./VoorzieningGebruik)
- Een Contract kan gekoppeld zijn aan één of twee [Persoon](./Persoon) objecten als contactpersonen

## Voorbeeld

```json
{
  "id": "CON-2023-001",
  "voorzieningAanbod": {
    "id": "VA-001",
    "naam": "DigiD Basis"
  },
  "voorzieningGebruik": {
    "id": "VG-2023-001",
    "organisatie": {
      "id": "ORG-001",
      "naam": "Gemeente Amsterdam"
    },
    "voorziening": {
      "id": "VZ-001",
      "naam": "DigiD"
    }
  },
  "startDatum": "2023-01-15",
  "eindDatum": "2024-01-14",
  "contractNummer": "DIGID-AMS-2023-001",
  "contractType": "SLA",
  "kosten": 5000,
  "kostenPeriode": "Jaarlijks",
  "contactpersoonAanbieder": {
    "id": "PER-002",
    "naam": "Piet Pietersen",
    "email": "p.pietersen@logius.nl"
  },
  "contactpersoonGebruiker": {
    "id": "PER-001",
    "naam": "Jan Jansen",
    "email": "j.jansen@amsterdam.nl"
  },
  "documentReferentie": "DOCS/CONTRACTEN/DIGID-AMS-2023-001.pdf",
  "status": "Actief",
  "opmerkingen": "Inclusief 24/7 support"
} 