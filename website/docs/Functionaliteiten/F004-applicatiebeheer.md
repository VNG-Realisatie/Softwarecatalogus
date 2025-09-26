---
id: f004-applicatiebeheer
title: F004 - Applicatiebeheer
sidebar_label: F004 - Applicatiebeheer
sidebar_position: 4
description: Functionaliteit voor het beheren van applicaties en software
keywords:
  - applicaties
  - software
  - beheer
  - GEMMA
---

# F004 - Applicatiebeheer

## Beschrijving
Deze functionaliteit beschrijft hoe applicaties kunnen worden toegevoegd, beheerd en gekoppeld in de GEMMA Softwarecatalogus.

## Toepasselijk voor
- 🏛️ **Gemeenten**: Applicatielandschap beheren, software zoeken en toevoegen
- 🤝 **Samenwerkingen & Communities**: Software aanbieden en gebruik aanmelden voor leden
- 🏢 **Leveranciers**: Eigen applicaties toevoegen en promoten
- ⚙️ **Functioneel Beheer**: Conceptpakketten controleren

## Processtappen

### Voor Gemeenten
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 4.1 | Applicatie zoeken | Vind applicaties in de catalogus |
| 4.2 | Applicaties vergelijken | Vergelijk eigenschappen en gebruik van applicaties |
| 4.3 | Applicatie toevoegen | Voeg een nieuwe applicatie toe en vul informatie in |
| 4.4 | Niet-geregistreerde app opvoeren | Voeg een applicatie toe als concept voor een aanbieder |
| 4.5 | Versie beheren | Beheer versies van applicaties |
| 4.6 | Koppeling maken | Leg koppelingen vast met andere applicaties of voorzieningen |
| 4.7 | Koppeling verwijderen | Verwijder bestaande koppelingen |
| 4.8 | Applicatie verwijderen | Verwijder applicatie uit het applicatielandschap |

### Voor Samenwerkingen & Communities
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 4.1 | Software/diensten aanbieden | Samenwerking biedt eigen software, modules en diensten aan |
| 4.2 | Gebruik aanmelden voor leden | Samenwerking meldt gebruik aan namens hun leden |
| 4.3 | Applicatielandschap beheren | Beheer van applicaties voor de gehele samenwerking |
| 4.4 | Koppelingen maken | Koppelingen tussen applicaties van verschillende leden |

### Voor Leveranciers
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 4.1 | Applicatie aanmaken | Nieuwe applicatie toevoegen aan het overzicht |
| 4.2 | Koppelen aan GEMMA | Applicatie relateren aan GEMMA referentiecomponenten |
| 4.3 | Versies aanmaken | Versie aanmaken voor on premise |
| 4.4 | Hostingtype specificeren | SaaS, lokaal, hybride etc. + jurisdictie |
| 4.5 | Licentietype kiezen | Open source, commercieel, etc. |
| 4.6 | Documenten uploaden | Verwerkersovereenkomsten, TPM-verklaringen, et cetera |

### Voor Functioneel Beheer
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 4.1 | Controleer conceptpakketten | Controleer en valideer door gemeenten of samenwerkingen aangeleverde pakketten |
| 4.2 | Voeg applicaties samen | (Concept) applicaties samenvoegen |

## Gerelateerde Issues
- [#144](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/144) - Applicatie zoeken
- [#21](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/21) - Zoekfunctionaliteit
- [#31](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/31) - Applicaties vergelijken
- [#18](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/18) - Applicatie toevoegen
- [#17](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/17) - Informatie invullen
- [#56](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/56) - Koppelingen maken
- [#5](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/5) - Applicatie aanmaken
- [#4](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/4) - GEMMA koppeling
- [#9](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/9) - Hostingtype
- [#7](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/7) - Licentietype
- [#11](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/11) - Conceptpakketten

## Autorisatie Matrix

| Functionaliteit | Aanbod-beheerder | Gebruik-beheerder | Gebruik-raadpleger | Functioneel beheerder | VNG-raadpleger | Bezoeker |
|------------------|------------------|-------------------|--------------------|-----------------------|----------------|----------|
| **Registreren gebruikte pakketten** | ❌ | ✅ | ❌ | ✅ | ❌ | ❌ |
| **Registreren koppelingen** | ❌ | ✅ | ❌ | ✅ | ❌ | ❌ |
| **Registreren aangeboden pakketten** | ✅ | ✅ | ❌ | ✅ | ❌ | ❌ |
| **Raadplegen gebruik** | ❌ | ✅ | ✅ | ✅ | ❌ | ❌ |
| **Raadplegen aanbod** | ✅ | ✅ | ❌ | ✅ | ❌ | ❌ |
| **Plotten op views** | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ |

### Detailering
- [Gebruik View](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/id-5af2e6f1-0ffa-403a-b8e5-1bf6153acfe1/views/id-8f3fd01f6b974c0f85e43f514225e973.html)
- [Aanbod View](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/id-5af2e6f1-0ffa-403a-b8e5-1bf6153acfe1/views/id-0a04a95fc8b743089aa04706580e0dc3.html)
- [Referentiearchitectuur View](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/id-5af2e6f1-0ffa-403a-b8e5-1bf6153acfe1/views/id-00da0c7e38764f8f82a57792dcddab00.html)

## Vervolgfunctionaliteiten
- [F005 - Dienstenbeheer](./F005-dienstenbeheer.md)
- [F006 - Inzichten-en-aanbevelingen](./F006-inzichten-en-aanbevelingen.md)
