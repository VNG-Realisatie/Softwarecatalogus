---
id: organisatie
title: Organisatie
sidebar_label: Organisatie
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Organisatie

Een organisatie is een bedrijf, overheidsinstelling of andere entiteit die betrokken is bij het ontwikkelen, aanbieden of hergebruiken van software en diensten binnen de overheids-IT-omgeving. Dit kunnen zowel commerciële leveranciers als overheidsorganisaties zijn die voorzieningen ontwikkelen, aanbieden of hergebruiken.

## Eigenschappen

| Eigenschap | Type | Beschrijving |
|------------|------|-------------|
| id | string | Unieke identificatie voor de organisatie |
| naam | string | Naam van de organisatie |
| type | string | Type organisatie (overheid, leverancier, etc.) |
| kvkNummer | string | KvK-nummer van de organisatie (optioneel voor bedrijven) |
| oidn | string | Organisatie Identificatienummer (optioneel voor overheden) |
| moederOrganisatie | string | ID van de bovenliggende organisatie (optioneel) |
| deelnemerIn | array | Lijst van organisaties waarin deze organisatie deelneemt |
| website | string (URI) | Website van de organisatie |
| adres | object | Adresgegevens van de organisatie |
| contactgegevens | object | Contactgegevens van de organisatie |
| beschrijving | string | Beschrijving van de organisatie |
| logo | string (URI) | URL naar het logo van de organisatie |
| voorzieningen | array | Lijst van voorzieningen van deze organisatie |
| gebruik | array | Lijst van voorzieningGebruik door deze organisatie |

## API Endpoint