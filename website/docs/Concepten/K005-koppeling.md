---
id: k005-koppeling
title: K005 - Koppeling
sidebar_label: K005 - Koppeling
sidebar_position: 5
description: Kern concept Koppeling - Technische integraties tussen applicaties in de GEMMA Softwarecatalogus
keywords:
  - koppeling
  - integratie
  - API
  - data uitwisseling
  - kern concept
  - K005
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# K005 - Koppeling

## Beschrijving
Koppelingen beschrijven de technische integraties tussen verschillende applicaties. Dit kunnen API-koppelingen, bestandsuitwisselingen, database koppelingen of andere vormen van data-uitwisseling zijn. Koppelingen zijn essentieel voor een geïntegreerd applicatielandschap.

## Schema Eigenschappen

<ApiSchema id="swc" example pointer="#/components/schemas/koppeling" />

## Relaties

### Applicaties
- **Verbindt**: Twee of meer applicaties
- **Gebruikt door**: Organisaties die de applicaties gebruiken
- **Beheerd door**: IT teams of externe partijen
- **Ondersteund door**: Leveranciers van de gekoppelde applicaties

### Standaarden
- **Implementeert**: Technische standaarden
- **Voldoet aan**: Compliance vereisten
- **Gebruikt**: Data uitwisseling protocollen
- **Ondersteunt**: Interoperabiliteit frameworks

### Infrastructuur
- **Loopt over**: Netwerk infrastructuur
- **Gebruikt**: Middleware en integration platforms
- **Afhankelijk van**: Database en storage systemen
- **Monitored door**: Monitoring en alerting systemen

## Koppeling Types

### 🔌 API Koppelingen
Real-time programmatische integraties via REST of GraphQL APIs.

**Kenmerken:**
- Synchrone communicatie
- JSON/XML data uitwisseling
- HTTP/HTTPS protocol
- Real-time data toegang
- Stateless architectuur

**Voorbeelden:**
- BRP koppeling voor persoongegevens
- BAG koppeling voor adresgegevens
- Zaaksysteem naar DMS koppeling
- CRM naar e-mail marketing integratie

### 🌐 Webservice Koppelingen
SOAP-gebaseerde enterprise integraties met uitgebreide functionaliteit.

**Kenmerken:**
- WSDL service definities
- XML message formaat
- WS-Security standaarden
- Transactionele ondersteuning
- Enterprise service bus integratie

**Voorbeelden:**
- StUF-ZKN zaakservices
- DigiKoppeling services
- Suwinet koppelingen
- GBA/BRP webservices

### 📁 Bestandsuitwisseling
Batch-gebaseerde data uitwisseling via bestanden.

**Kenmerken:**
- Asynchrone verwerking
- Grote data volumes
- Scheduled transfers
- FTP/SFTP protocol
- Verschillende bestandsformaten

**Voorbeelden:**
- Salarisverwerking export
- Factuur import/export
- Backup data transfers
- Rapportage distributie

### 🗄️ Database Koppelingen
Directe database toegang en synchronisatie.

**Kenmerken:**
- SQL-gebaseerde toegang
- Real-time of batch sync
- Transactionele integriteit
- Database triggers
- Replicatie mechanismen

**Voorbeelden:**
- Data warehouse ETL
- Master data synchronisatie
- Backup en archivering
- Business intelligence feeds

### 📨 Message Queue Koppelingen
Asynchrone berichtuitwisseling via message brokers.

**Kenmerken:**
- Publish/subscribe patronen
- Message persistence
- Load balancing
- Error recovery
- Scalable architectuur

**Voorbeelden:**
- Event-driven architectuur
- Workflow orchestration
- Notification services
- Integration patterns

## Koppeling Lifecycle

### 📋 Analyse en Design
- **Requirements analyse**: Functionele en technische vereisten
- **Architectuur design**: Integratie patronen en technologie keuzes
- **Data mapping**: Mapping tussen verschillende data modellen
- **Security design**: Beveiliging en toegangscontrole ontwerp

### 🛠️ Ontwikkeling
- **Interface development**: API of service ontwikkeling
- **Data transformation**: Implementatie van data conversie logica
- **Error handling**: Foutafhandeling en recovery mechanismen
- **Testing**: Unit, integration en performance testing

### 🚀 Deployment
- **Environment setup**: Configuratie van test en productie omgevingen
- **Security configuration**: Implementatie van beveiliging
- **Monitoring setup**: Performance en health monitoring
- **Documentation**: Technische en gebruikersdocumentatie

### 🔄 Operatie
- **Monitoring**: Continue bewaking van performance en beschikbaarheid
- **Maintenance**: Regulier onderhoud en updates
- **Support**: Incident management en troubleshooting
- **Optimization**: Performance tuning en capacity planning

### 📈 Evolutie
- **Version management**: Nieuwe versies en backward compatibility
- **Enhancement**: Uitbreiding van functionaliteit
- **Migration**: Overgang naar nieuwe technologieën
- **Scaling**: Capaciteit uitbreiding bij groeiend gebruik

### 🔚 Retirement
- **Deprecation**: Aankondiging van uitfasering
- **Migration planning**: Overgang naar vervangend systeem
- **Data preservation**: Behoud van historische gegevens
- **Decommissioning**: Definitieve uitschakeling

## Gerelateerde Concepten
- [K002 - Applicatie](./K002-applicatie.md): Applicaties die worden gekoppeld
- [K003 - Dienst](./K003-dienst.md): Diensten die worden gebruikt in koppelingen
- [K004 - Gebruik](./K004-gebruik.md): Gebruik context van koppelingen
- [K007 - Component](./K007-component.md): Componenten die koppelingen implementeren

## Gerelateerde Functionaliteiten
- [F008 - Externe Koppelingen](../Functionaliteiten/F008-externe-koppelingen.md)
- [F004 - Applicatiebeheer](../Functionaliteiten/F004-applicatiebeheer.md)
- [F013 - Gebruik Beheer](../Functionaliteiten/F013-gebruik-beheer.md)

## Koppeling Wizard

De Koppeling wizard begeleidt gebruikers door het proces van het definiëren van een nieuwe integratie tussen applicaties.

<Tabs>
  <TabItem value="specificaties" label="Sequence Diagram" default>

```mermaid
sequenceDiagram
    participant U as Gebruiker
    participant S0 as Stap 0: Organisatie Selectie
    participant S1 as Stap 1: Applicatie A Selectie
    participant S1b as Stap 1b: Versie A Selectie
    participant S2 as Stap 2: Applicatie B Selectie
    participant S2b as Stap 2b: Versie B Selectie
    participant S3 as Stap 3: Koppeling Informatie
    participant S4 as Stap 4: Controleren
    participant AW as Applicatie Wizard

    Note over U,S4: Koppeling Wizard - Gebruiker Flow

    %% Entry Point Keuze
    U->>S0: Start koppeling wizard
    S0-->>U: Toon entry point keuze
    Note over U: Keuze: 'Koppeling registreren' (eigen org) of 'Koppeling melden' (andere org)
    
    alt Koppeling melden (voor andere organisatie)
        U->>S0: Kies 'Koppeling melden'
        
        %% Stap 0: Aanbieder Selectie
        S0-->>U: Stap 0 - Aanbieder selectie formulier
        Note over U: Invoer: Zoek bestaande aanbieder of 'Nieuwe aanbieder'
        
        alt Bestaande aanbieder selecteren
            U->>S0: Selecteer bestaande aanbieder uit lijst
            S0-->>U: Toon applicaties van geselecteerde aanbieder (controle)
            Note over U: Overzicht: Bestaande applicaties ter verificatie
            U->>S0: Bevestig aanbieder keuze
        else Nieuwe aanbieder aanmaken
            U->>S0: Klik 'Ik kan de gewenste leverancier niet vinden'
            S0-->>U: Nieuwe aanbieder formulier
            Note over U: Invoer: Naam aanbieder + Website URL
        end
        
    else Koppeling registreren (eigen organisatie)
        U->>S0: Kies 'Koppeling registreren'
        Note over S0: Sla aanbieder selectie over - gebruik eigen organisatie
    end

    %% Stap 1: Applicatie A Selectie
    S0->>S1: Ga naar Stap 1
    S1-->>U: Stap 1 - Applicatie A selectie (bron)
    Note over U: Overzicht: Lijst van beschikbare applicaties van geselecteerde aanbieder
    
    alt Applicatie A selecteren
        U->>S1: Selecteer Applicatie A uit lijst
        Note over U: Invoer: Kies bron applicatie voor de koppeling
        
        %% Controleer of applicatie A meerdere versies heeft
        alt Applicatie A heeft meerdere versies
            S1->>S1b: Ga naar Versie A selectie
            S1b-->>U: Stap 1b - Versie A selectie (optioneel)
            Note over U: Overzicht: Lijst van beschikbare versies van Applicatie A
            U->>S1b: Selecteer versie A
            S1b->>S2: Ga naar Stap 2
        else Applicatie A heeft één versie
            S1->>S2: Ga naar Stap 2
        end
        
    else Geen geschikte applicatie A
        U->>S1: Klik 'Applicatie niet gevonden'
        S1->>AW: Redirect naar Applicatie wizard
        Note over U: Wizard wordt afgebroken - ga naar Applicatie wizard (gegevens worden NIET opgeslagen)
    end

    %% Stap 2: Applicatie B Selectie
    S2-->>U: Stap 2 - Applicatie B selectie (doel)
    Note over U: Overzicht: Lijst van beschikbare applicaties (exclusief Applicatie A)
    
    alt Applicatie B selecteren
        U->>S2: Selecteer Applicatie B uit lijst
        Note over U: Invoer: Kies doel applicatie voor de koppeling
        
        alt Koppeling bestaat al tussen A en B
            S2-->>U: Waarschuwing - koppeling bestaat al
            U->>S2: Bewerk bestaande koppeling of kies andere applicatie
        else Nieuwe koppeling
            %% Controleer of applicatie B meerdere versies heeft
            alt Applicatie B heeft meerdere versies
                S2->>S2b: Ga naar Versie B selectie
                S2b-->>U: Stap 2b - Versie B selectie (optioneel)
                Note over U: Overzicht: Lijst van beschikbare versies van Applicatie B
                U->>S2b: Selecteer versie B
                S2b->>S3: Ga naar Stap 3
            else Applicatie B heeft één versie
                S2->>S3: Ga naar Stap 3
            end
        end
        
    else Geen geschikte applicatie B
        U->>S2: Klik 'Applicatie niet gevonden'
        S2->>AW: Redirect naar Applicatie wizard
        Note over U: Wizard wordt afgebroken - ga naar Applicatie wizard (gegevens worden NIET opgeslagen)
    end

    %% Stap 3: Koppeling Informatie
    S3-->>U: Stap 3 - Koppeling informatie
    Note over U: Invoer: Type (API/Webservice/Bestand/Database), Richting (A→B/B→A/A↔B), Protocol, Data formaat, Authenticatie, Data mapping, Standaarden, Performance eisen, Beveiliging, Test aanpak
    U->>S3: Vul alle koppeling gegevens in
    S3->>S4: Ga naar Stap 4

    %% Stap 4: Controleren
    S4-->>U: Stap 4 - Overzicht en controle
    Note over U: Overzicht: Alle ingevoerde koppeling informatie ter controle
    
    alt Gebruiker wil wijzigingen maken
        U->>S4: Klik 'Vorige' naar specifieke stap
        Note over S4: Navigeer terug naar gewenste stap
        alt Terug naar Stap 1
            S4->>S1: Ga terug naar Stap 1
        else Terug naar andere stap
            Note over S4: Navigeer naar gewenste stap
        end
    else Gebruiker bevestigt
        U->>S4: Klik 'Koppeling registreren'
        S4-->>U: Bevestiging - Koppeling succesvol geregistreerd
        Note over U: Koppeling is gedefinieerd en gereed voor implementatie
    end
```
  </TabItem>
  <TabItem value="stap0" label="Stap 0: Organisatie Selectie">
    <ul>
      <li>Organisatie Selectie (optioneel - alleen bij melden voor anderen): Selecteer aanbieder of maak nieuwe aan</li>
    </ul>
  </TabItem>
  <TabItem value="stap1" label="Stap 1: Applicatie A Selectie">
    <ul>
      <li>Applicatie A Selectie: Bron applicatie voor de koppeling</li>
    </ul>
  </TabItem>
  <TabItem value="stap1b" label="Stap 1b: Versie A Selectie">
    <ul>
      <li>Versie A Selectie (optioneel - alleen bij meerdere versies): Selecteer specifieke versie van Applicatie A</li>
    </ul>
  </TabItem>
  <TabItem value="stap2" label="Stap 2: Applicatie B Selectie">
    <ul>
      <li>Applicatie B Selectie: Doel applicatie voor de koppeling</li>
    </ul>
  </TabItem>
  <TabItem value="stap2b" label="Stap 2b: Versie B Selectie">
    <ul>
      <li>Versie B Selectie (optioneel - alleen bij meerdere versies): Selecteer specifieke versie van Applicatie B</li>
    </ul>
  </TabItem>
  <TabItem value="stap3" label="Stap 3: Koppeling Informatie">
    <ul>
      <li>Koppeling Informatie: Alle koppeling eigenschappen in één uitgebreide stap (type, richting, protocol, data mapping, standaarden, performance, beveiliging, testing)</li>
    </ul>
  </TabItem>
  <TabItem value="stap4" label="Stap 4: Controleren">
    <ul>
      <li>Controleren: Overzicht en bevestiging van alle gegevens</li>
    </ul>
  </TabItem>
</Tabs>
