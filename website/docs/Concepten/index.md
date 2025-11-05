---
id: concepten-overzicht
title: Kern Concepten Overzicht
sidebar_label: Overzicht
sidebar_position: 0
description: Overzicht van de 7 kern concepten in de GEMMA Softwarecatalogus en hun onderlinge relaties
keywords:
  - kern concepten
  - overzicht
  - relaties
  - softwarecatalogus
---

# Kern Concepten Overzicht

De GEMMA Softwarecatalogus is gebaseerd op **7 kern concepten** die samen het complete ecosysteem van gemeentelijke software beschrijven. Elk concept heeft zijn eigen specifieke rol en relaties met andere concepten.

## Concepten Relatie Diagram

```mermaid
graph TB
    %% Kern Concepten
    K001[K001 - Organisatie<br/>🏛️ Leveranciers, Gemeenten<br/>Samenwerkingsverbanden]
    K002[K002 - Applicatie<br/>💻 Software Producten<br/>en Modules]
    K003[K003 - Dienst<br/>🔌 Services en API's<br/>die applicaties bieden]
    K004[K004 - Gebruik<br/>📊 Hoe organisaties<br/>applicaties inzetten]
    K005[K005 - Koppeling<br/>🔗 Technische integraties<br/>tussen applicaties]
    K006[K006 - Suite<br/>📦 Verzameling van<br/>gerelateerde applicaties]
    K007[K007 - Component<br/>🧩 Herbruikbare bouwstenen<br/>van applicaties]

    %% Primaire Relaties
    K001 -.->|"biedt aan"| K002
    K001 -.->|"gebruikt"| K002
    K002 -->|"biedt"| K003
    K002 -->|"bevat"| K007
    K002 -->|"onderdeel van"| K006
    K001 -->|"registreert"| K004
    K004 -->|"van applicatie"| K002
    K005 -->|"verbindt"| K002
    K005 -->|"gebruikt"| K003
    K007 -->|"implementeert"| K003

    %% Secundaire Relaties
    K006 -.->|"deelt"| K007
    K004 -.->|"gebruikt"| K003
    K004 -.->|"via"| K005

    %% Styling
    classDef organisatie fill:#e1f5fe,stroke:#01579b,stroke-width:2px
    classDef applicatie fill:#f3e5f5,stroke:#4a148c,stroke-width:2px
    classDef dienst fill:#e8f5e8,stroke:#1b5e20,stroke-width:2px
    classDef gebruik fill:#fff3e0,stroke:#e65100,stroke-width:2px
    classDef koppeling fill:#fce4ec,stroke:#880e4f,stroke-width:2px
    classDef suite fill:#f1f8e9,stroke:#33691e,stroke-width:2px
    classDef component fill:#e0f2f1,stroke:#004d40,stroke-width:2px

    class K001 organisatie
    class K002 applicatie
    class K003 dienst
    class K004 gebruik
    class K005 koppeling
    class K006 suite
    class K007 component
```

## Concepten Overzicht

| Concept | Beschrijving | Primaire Functie | Status |
|---------|--------------|------------------|--------|
| **[K001 - Organisatie](./K001-organisatie.md)** | Leveranciers, gemeenten en samenwerkingsverbanden | Basis voor alle andere concepten | ✅ Geïmplementeerd |
| **[K002 - Applicatie](./K002-applicatie.md)** | Software producten en modules | Centrale software catalogus | ✅ Geïmplementeerd |
| **[K003 - Dienst](./K003-dienst.md)** | Services die leveranciers aanbieden op applicaties | Ondersteuning en service verlening | ✅ Geïmplementeerd |
| **[K004 - Gebruik](./K004-gebruik.md)** | Hoe organisaties applicaties gebruiken | Implementatie en adoptie | ✅ Geïmplementeerd |
| **[K005 - Koppeling](./K005-koppeling.md)** | Integraties tussen applicaties | Technische koppelingen | ✅ Geïmplementeerd |
| **[K006 - Suite](./K006-suite.md)** | Verzameling van gerelateerde applicaties | Geïntegreerde pakketten | 🚧 **Concept** |
| **[K007 - Component](./K007-component.md)** | Herbruikbare onderdelen van applicaties | Modulaire architectuur | 🚧 **Concept** |

:::warning Concept Status
**K006 - Suite** en **K007 - Component** zijn conceptuele uitbreidingen die nog niet volledig zijn geïmplementeerd in de GEMMA Softwarecatalogus. De wizards en functionaliteiten zijn in ontwikkeling.
:::

## Relatie Types

### 🔗 Directe Relaties (doorgetrokken lijnen)
- **Organisatie → Applicatie**: Organisaties bieden applicaties aan of gebruiken ze
- **Applicatie → Dienst**: Leveranciers bieden diensten aan op applicaties
- **Applicatie → Component**: Applicaties bevatten componenten
- **Applicatie → Suite**: Applicaties kunnen onderdeel zijn van suites
- **Gebruik → Applicatie**: Gebruik beschrijft hoe een applicatie wordt ingezet
- **Koppeling → Applicatie**: Koppelingen verbinden applicaties
- **Component → Dienst**: Componenten implementeren diensten

### ⚡ Indirecte Relaties (stippellijnen)
- **Suite ↔ Component**: Suites kunnen componenten delen
- **Gebruik ↔ Dienst**: Gebruik kan specifieke diensten betreffen
- **Gebruik ↔ Koppeling**: Gebruik kan koppelingen bevatten
- **Koppeling ↔ Dienst**: Koppelingen gebruiken diensten

## Wizard Flow Overzicht

Alle concepten hebben hun eigen wizard voor registratie:

### 🎯 Primaire Wizards (Standalone)
- **K001 - Organisatie**: Volledig zelfstandige wizard
- **K002 - Applicatie**: Meest uitgebreide wizard (7-8 stappen)

### 🔄 Afhankelijke Wizards (Vereisen Applicatie)
- **K003 - Dienst**: Start met applicatie selectie
- **K004 - Gebruik**: Start met applicatie selectie  
- **K005 - Koppeling**: Start met twee applicatie selecties

### 📦 Compositie Wizards (Verzamelen) - 🚧 In Ontwikkeling
- **K006 - Suite**: Verzamelt meerdere applicaties *(concept)*
- **K007 - Component**: Kan aan meerdere applicaties gekoppeld worden *(concept)*

## Navigatie

Gebruik de sidebar om naar specifieke concepten te navigeren, of klik op de links in de tabel hierboven voor gedetailleerde informatie over elk concept, inclusief hun wizard sequence diagrammen.
