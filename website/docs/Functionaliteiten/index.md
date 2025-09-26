---
id: index
title: Overzicht Functionaliteiten
sidebar_label: Overzicht
sidebar_position: 0
description: Overzicht van alle functionaliteiten in de GEMMA Softwarecatalogus
keywords:
  - functionaliteiten
  - overzicht
  - softwarecatalogus
---

# Overzicht Functionaliteiten

De GEMMA Softwarecatalogus bestaat uit 11 hoofdfunctionaliteiten die door verschillende typen gebruikers worden gebruikt. Hieronder een overzicht:

## Functionaliteiten Matrix

| Functionaliteit | 🏛️ Gemeenten | 🤝 Samenwerkingen | 🏢 Leveranciers | ⚙️ Functioneel Beheer |
|-----------------|---------------|-------------------|------------------|----------------------|
| [F000 - Navigatie en Menustructuur](./F000-navigatie-en-menustructuur.md) | ✅ Gemeente UI | ✅ Samenwerking UI | ✅ Leverancier UI | ✅ Beheer UI |
| [F001 - Toegang Verkrijgen](./F001-toegang-verkrijgen.md) | ✅ Via VNG | ✅ Via VNG | ✅ Aanmelden | ✅ Direct |
| [F002 - Organisatie Inrichten](./F002-organisatie-inrichten.md) | ✅ Profiel | ✅ Leden werven | ✅ Bedrijfsprofiel | ✅ Organisaties beheren |
| [F003 - Gebruikersbeheer](./F003-gebruikersbeheer.md) | ✅ Collega's | ❌ N.v.t. | ✅ Team | ✅ Alle gebruikers |
| [F004 - Applicatiebeheer](./F004-applicatiebeheer.md) | ✅ Landschap | ✅ Aanbieden | ✅ Eigen apps | ✅ Concepten |
| [F005 - Dienstenbeheer](./F005-dienstenbeheer.md) | ✅ Zoeken/beoordelen | ❌ N.v.t. | ✅ Toevoegen | ❌ N.v.t. |
| [F006 - Inzichten en Aanbevelingen](./F006-inzichten-en-aanbevelingen.md) | ✅ AI/benchmarking | ❌ N.v.t. | ✅ Promotie | ✅ Rapportages |
| [F007 - Data Export en Import](./F007-data-export-import.md) | ✅ Export | ❌ N.v.t. | ✅ Export/Import | ✅ Samenvoegen |
| [F008 - Externe Koppelingen](./F008-externe-koppelingen.md) | ✅ Synchronisatie | ❌ N.v.t. | ❌ N.v.t. | ❌ N.v.t. |
| [F009 - Beheer en Configuratie](./F009-beheer-en-configuratie.md) | ❌ N.v.t. | ❌ N.v.t. | ❌ N.v.t. | ✅ Systeem beheer |
| [F010 - Lidmaatschapsbeheer](./F010-lidmaatschapsbeheer.md) | ✅ Lid worden | ✅ Leden beheren | ✅ Lid worden | ✅ Ondersteuning |

## Functionaliteiten Flow

```mermaid
flowchart TD
    F000[F000 - Navigatie en Menustructuur]
    F000 -.-> F001[F001 - Toegang Verkrijgen]
    F001 --> F002[F002 - Organisatie Inrichten]
    F002 --> F003[F003 - Gebruikersbeheer]
    
    F003 --> PARALLEL[Parallelle Functionaliteiten]
    PARALLEL --> F004[F004 - Applicatiebeheer]
    PARALLEL --> F005[F005 - Dienstenbeheer]
    PARALLEL --> F006[F006 - Inzichten en Aanbevelingen]
    PARALLEL --> F010[F010 - Lidmaatschapsbeheer]
    
    F004 --> F007[F007 - Data Export en Import]
    F005 --> F007
    F006 --> F007
    
    F007 --> F008[F008 - Externe Koppelingen]
    
    F009[F009 - Beheer en Configuratie]
    F009 -.-> F000
    F009 -.-> F001
    F009 -.-> F002
    F009 -.-> F003
    F009 -.-> F004
    F009 -.-> F005
    F009 -.-> F006
    F009 -.-> F007
    F009 -.-> F008
    F009 -.-> F010
    
    style F000 fill:#f3e5f5
    style F001 fill:#e1f5fe
    style F008 fill:#c8e6c9
    style F009 fill:#ffecb3
    style PARALLEL fill:#fff3e0
```

## Gebruikerstypen

### 🏛️ Gemeenten
Gemeenten gebruiken de catalogus om hun applicatielandschap te beheren, software te zoeken, en inzichten te verkrijgen over hun ICT-omgeving.

**Primaire functionaliteiten**: F000, F001, F002, F003, F004, F005, F006, F007, F008, F010

### 🤝 Samenwerkingen & Communities
Samenwerkingen hebben een unieke positie als zowel aanbieder als afnemer van software voor hun leden.

**Primaire functionaliteiten**: F000, F001, F002, F004, F010

### 🏢 Leveranciers
Leveranciers gebruiken de catalogus om hun software zichtbaar te maken voor gemeenten en diensten aan te bieden.

**Primaire functionaliteiten**: F000, F001, F002, F003, F004, F005, F006, F007, F010

### ⚙️ Functioneel Beheer
VNG medewerkers die de catalogus beheren en organisaties ondersteunen.

**Primaire functionaliteiten**: F000, F001, F002, F003, F004, F006, F007, F009, F010

## Implementatie Volgorde

1. **Interface** (F000): Navigatie en menustructuur
2. **Basis** (F001-F003): Toegang, organisatie en gebruikers
3. **Kern** (F004-F005): Applicaties en diensten
4. **Samenwerking** (F010): Lidmaatschapsbeheer
5. **Toegevoegde Waarde** (F006): Inzichten en aanbevelingen
6. **Integratie** (F007-F008): Export en externe koppelingen
7. **Beheer** (F009): Systeem beheer en configuratie

## Autorisatie Rollen

De autorisatie matrix gebruikt de volgende rollen:

- **Aanbod-beheerder**: Leveranciers die hun software aanbieden
- **Gebruik-beheerder**: Gemeentelijke beheerders die software gebruik beheren
- **Gebruik-raadpleger**: Gemeentelijke medewerkers die alleen kunnen kijken
- **Functioneel beheerder**: VNG medewerkers die de catalogus beheren
- **VNG-raadpleger**: VNG medewerkers met alleen lees-toegang
- **Bezoeker**: Publieke bezoekers zonder account
