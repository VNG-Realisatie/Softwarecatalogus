---
id: f014-data-migratie
title: F014 - Data Migratie
sidebar_label: F014 - Data Migratie
sidebar_position: 14
description: Functionaliteit voor het migreren van data tussen systemen en het behouden van historische gegevens
keywords:
  - data migratie
  - legacy data
  - import
  - export
  - historische gegevens
  - systeem migratie
---

# F014 - Data Migratie

## Beschrijving
Deze functionaliteit beschrijft hoe data kan worden gemigreerd tussen verschillende systemen, hoe historische gegevens behouden blijven, en hoe organisaties hun bestaande data kunnen overzetten naar de nieuwe softwarecatalogus. Het gaat om het waarborgen van continuïteit bij systeemwisselingen en het behouden van waardevolle historische informatie.

## Toepasselijk voor
- 🏛️ **Gemeenten**: Migratie van bestaande applicatielandschap data
- 🤝 **Samenwerkingen & Communities**: Overzetten van collectieve data
- 🏢 **Leveranciers**: Migratie van klantgegevens en productinformatie
- ⚙️ **Functioneel Beheer**: Systeem migraties begeleiden en valideren

## Processtappen

### Voor Gemeenten (Applicatielandschap Migratie)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 14.1 | Bestaande data inventariseren | Overzicht maken van huidige applicatielandschap data |
| 14.2 | Migratie strategie bepalen | Kiezen tussen bulk import, gefaseerde migratie, of handmatige overdracht |
| 14.3 | Data mapping uitvoeren | Koppelen van oude data structuur aan nieuwe catalogus velden |
| 14.4 | Test migratie uitvoeren | Proefmigratie met subset van data om problemen te identificeren |
| 14.5 | Productie migratie | Definitieve overdracht van alle applicatielandschap data |
| 14.6 | Data validatie | Controleren of alle data correct is overgezet |
| 14.7 | Historische data archiveren | Oude data behouden voor referentie en compliance |

### Voor Leveranciers (Product Portfolio Migratie)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 14.1 | Product data exporteren | Huidige productinformatie uit bestaande systemen halen |
| 14.2 | Klantgegevens migreren | Overzetten van klantrelaties en contractinformatie |
| 14.3 | Documentatie overdragen | Migreren van brochures, handleidingen, en technische specs |
| 14.4 | Referenties behouden | Overzetten van klantreviews en referentie-informatie |
| 14.5 | Integratie testen | Controleren of alle systemen correct communiceren |

### Voor Functioneel Beheer (Migratie Ondersteuning)
| Stap | Actie | Beschrijving |
|------|-------|--------------|
| 14.1 | Migratie planning | Helpen bij het opstellen van migratie roadmaps |
| 14.2 | Data kwaliteit controle | Valideren van ingemigreerde data op volledigheid en correctheid |
| 14.3 | Systeem configuratie | Aanpassen van systeem instellingen voor optimale migratie |
| 14.4 | Rollback procedures | Voorbereiden van terugval scenario's bij migratie problemen |
| 14.5 | Training en ondersteuning | Gebruikers begeleiden bij overgang naar nieuwe systeem |
| 14.6 | Monitoring en optimalisatie | Prestaties bewaken en verbeteringen doorvoeren |

## Migratie Scenario's

### Legacy Systeem Migratie
- **Van**: Oude softwarecatalogus, Excel bestanden, lokale databases
- **Naar**: Nieuwe GEMMA Softwarecatalogus
- **Methode**: Geautomatiseerde import met data mapping
- **Uitdagingen**: Data inconsistenties, verschillende formaten, incomplete informatie

### Fusie en Overname Migratie
- **Situatie**: Gemeentelijke herindeling of leveranciers overname
- **Proces**: Samenvoegen van meerdere data bronnen
- **Complexiteit**: Duplicaten identificeren, data harmoniseren, relaties behouden

### Systeem Upgrade Migratie
- **Van**: Oudere versie softwarecatalogus
- **Naar**: Nieuwe versie met uitgebreide functionaliteit
- **Focus**: Behouden van bestaande data, toevoegen van nieuwe velden

## Gerelateerde Issues
- [#23](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/23) - Reeds geregistreerde gegevens weer zien in nieuwe Softwarecatalogus
- [#141](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/141) - Organisaties samenvoegen bij herindeling/overname
- [#71](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/71) - Importeren ArchiMate
- [#72](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/72) - Exporteren ArchiMate
- [#15](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/15) - Data export functionaliteit
- [#16](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/16) - AMEFF export

## Autorisatie Matrix

| Functionaliteit | Aanbod-beheerder | Gebruik-beheerder | Gebruik-raadpleger | Functioneel beheerder | VNG-raadpleger | Bezoeker |
|------------------|------------------|-------------------|--------------------|-----------------------|----------------|----------|
| **Eigen data migreren** | ✅ (eigen organisatie) | ✅ (eigen organisatie) | ❌ | ✅ (alle organisaties) | ❌ | ❌ |
| **Migratie ondersteuning** | ❌ | ❌ | ❌ | ✅ (volledig) | ❌ | ❌ |
| **Historische data inzien** | ✅ (eigen organisatie) | ✅ (eigen organisatie) | ✅ (eigen organisatie) | ✅ (alle organisaties) | ✅ (geanonimiseerd) | ❌ |
| **Organisaties samenvoegen** | ❌ | ❌ | ❌ | ✅ (volledig) | ❌ | ❌ |
| **Bulk import/export** | ✅ (eigen data) | ✅ (eigen data) | ❌ | ✅ (alle data) | ❌ | ❌ |
| **Data validatie** | ✅ (eigen data) | ✅ (eigen data) | ❌ | ✅ (alle data) | ❌ | ❌ |

## Gebruikershandleidingen

### Data Migratie Voorbereiden

1. **Inventariseer huidige data**:
   - Maak overzicht van alle applicaties en hun gegevens
   - Identificeer data kwaliteit problemen
   - Bepaal welke data essentieel is voor migratie

2. **Kies migratie strategie**:
   - **Bulk migratie**: Alle data in één keer overzetten
   - **Gefaseerde migratie**: Stap voor stap per domein/afdeling
   - **Hybride aanpak**: Combinatie van bulk en handmatige overdracht

3. **Bereid data voor**:
   - Schoon data op (duplicaten verwijderen, inconsistenties oplossen)
   - Standaardiseer formaten en terminologie
   - Maak backup van originele data

### Migratie Uitvoeren

1. **Test migratie**:
   - Start met kleine subset van data
   - Controleer resultaat grondig
   - Documenteer problemen en oplossingen

2. **Productie migratie**:
   - Plan migratie buiten kantooruren
   - Communiceer downtime naar gebruikers
   - Monitor proces real-time

3. **Validatie**:
   - Controleer volledigheid van gemigreerde data
   - Test alle functionaliteiten met nieuwe data
   - Vergelijk rapporten voor en na migratie

### Historische Data Beheren

1. **Archivering**:
   - Bewaar originele data voor referentie
   - Documenteer migratie proces en beslissingen
   - Zorg voor toegankelijkheid van gearchiveerde data

2. **Compliance**:
   - Respecteer bewaartermijnen van verschillende data types
   - Zorg voor audit trail van migratie activiteiten
   - Documenteer data lineage voor traceerbaarheid

## Vervolgfunctionaliteiten
- [F007 - Data Export en Import](./F007-data-export-import.md)
- [F009 - Beheer en Configuratie](./F009-beheer-en-configuratie.md)
- [F002 - Organisatie Inrichten](./F002-organisatie-inrichten.md)
