---
id: k003-dienst
title: K003 - Dienst
sidebar_label: K003 - Dienst
sidebar_position: 3
description: Kern concept Dienst - Services en functionaliteiten die applicaties bieden in de GEMMA Softwarecatalogus
keywords:
  - dienst
  - service
  - API
  - functionaliteit
  - kern concept
  - K003
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# K003 - Dienst

## Beschrijving
Diensten zijn specifieke services of functionaliteiten die door applicaties worden aangeboden. Een applicatie kan meerdere diensten bieden, zoals API's, webservices, interfaces of geautomatiseerde processen. Diensten vormen de brug tussen applicaties en hun gebruikers.

## Schema Eigenschappen

<ApiSchema id="swc" example pointer="#/components/schemas/dienst" />

## Relaties

### Aanbod
- **Aangeboden door**: Applicatie die de dienst levert
- **Eigendom van**: Organisatie (leverancier)
- **Onderhouden door**: Ontwikkel- en supportteam
- **Gehost op**: Infrastructuur en platform

### Gebruik
- **Gebruikt door**: Organisaties en applicaties
- **Geïntegreerd in**: Andere systemen en processen
- **Afhankelijk van**: Andere diensten of componenten
- **Monitored door**: Monitoring en alerting systemen

### Standaarden
- **Voldoet aan**: Technische standaarden en protocollen
- **Implementeert**: Interface specificaties
- **Ondersteunt**: Data uitwisseling standaarden
- **Gecertificeerd voor**: Compliance vereisten

## Dienst Types

### 🔌 API Services
Programmatische interfaces voor data en functionaliteit toegang.

**Kenmerken:**
- RESTful of GraphQL endpoints
- JSON/XML data uitwisseling
- Authenticatie en autorisatie
- Rate limiting en throttling
- Uitgebreide documentatie

**Voorbeelden:**
- Zaakgegevens API
- Personen registratie API
- Document management API
- Notificatie service API

### 🌐 Web Services
SOAP-gebaseerde services voor enterprise integratie.

**Kenmerken:**
- WSDL service beschrijvingen
- XML message formaat
- WS-Security standaarden
- Enterprise service bus integratie
- Transactionele ondersteuning

**Voorbeelden:**
- Betalingsverwerking service
- Identity management service
- Workflow orchestration service
- Data synchronisatie service

### 📊 Rapportage Services
Geautomatiseerde rapportage en data analyse diensten.

**Kenmerken:**
- Scheduled report generatie
- Verschillende output formaten
- Parameteriseerbare rapporten
- Dashboard integraties
- Data visualisatie

**Voorbeelden:**
- Financiële rapportage
- Performance dashboards
- Compliance rapporten
- Gebruiksstatistieken

### 🔄 Batch Processen
Geautomatiseerde achtergrond processen voor data verwerking.

**Kenmerken:**
- Scheduled execution
- Grote data volumes
- Error recovery mechanismen
- Progress monitoring
- Result notifications

**Voorbeelden:**
- Data import/export
- Backup processen
- Data cleaning routines
- Archivering processen

### 📱 User Interfaces
Webgebaseerde interfaces voor eindgebruiker interactie.

**Kenmerken:**
- Responsive design
- Gebruiksvriendelijke interface
- Toegankelijkheidsondersteuning
- Multi-language support
- Mobile optimalisatie

**Voorbeelden:**
- Self-service portalen
- Administrative interfaces
- Citizen service portals
- Mobile applications

## Service Lifecycle

### 🚀 Ontwikkeling
- **Requirements analyse**: Functionele en technische vereisten
- **API design**: Interface ontwerp en specificatie
- **Implementatie**: Ontwikkeling en unit testing
- **Documentatie**: API documentatie en gebruikershandleidingen

### 🧪 Testing
- **Unit testing**: Individuele functie tests
- **Integration testing**: Koppeling met andere systemen
- **Performance testing**: Load en stress testing
- **Security testing**: Penetratie en vulnerability tests

### 📦 Deployment
- **Staging deployment**: Test omgeving uitrol
- **Production deployment**: Live omgeving uitrol
- **Monitoring setup**: Performance en error monitoring
- **Documentation publishing**: Publieke documentatie

### 🔄 Operatie
- **Monitoring**: Continue bewaking van performance
- **Maintenance**: Regulier onderhoud en updates
- **Support**: Gebruikersondersteuning en troubleshooting
- **Optimization**: Performance en functionaliteit verbeteringen

### 📈 Evolutie
- **Version management**: Nieuwe versies en backward compatibility
- **Feature enhancement**: Uitbreiding van functionaliteit
- **Integration expansion**: Nieuwe koppelingen en integraties
- **Scaling**: Capaciteit uitbreiding bij groeiend gebruik

### 🔚 Retirement
- **Deprecation notice**: Aankondiging van uitfasering
- **Migration support**: Ondersteuning bij overgang naar alternatief
- **Sunset period**: Geleidelijke afbouw van ondersteuning
- **Service termination**: Definitieve beëindiging van dienst

## Gerelateerde Concepten
- [K001 - Organisatie](./K001-organisatie.md): Leveranciers en gebruikers van diensten
- [K002 - Applicatie](./K002-applicatie.md): Applicaties die diensten aanbieden
- [K004 - Gebruik](./K004-gebruik.md): Hoe diensten worden gebruikt
- [K005 - Koppeling](./K005-koppeling.md): Technische integraties via diensten
- [K007 - Component](./K007-component.md): Componenten die diensten implementeren

## Gerelateerde Functionaliteiten
- [F005 - Dienstenbeheer](../Functionaliteiten/F005-dienstenbeheer.md)
- [F004 - Applicatiebeheer](../Functionaliteiten/F004-applicatiebeheer.md)
- [F008 - Externe Koppelingen](../Functionaliteiten/F008-externe-koppelingen.md)

## Dienst Wizard

De Dienst wizard begeleidt gebruikers door het proces van het registreren van een nieuwe dienst in de GEMMA Softwarecatalogus.

<Tabs>
  <TabItem value="specificaties" label="Sequence Diagram" default>

```mermaid
sequenceDiagram
    participant U as Gebruiker
    participant S0 as Stap 0: Organisatie Selectie
    participant S1 as Stap 1: Applicatie Selectie
    participant S1b as Stap 1b: Versie Selectie
    participant S2 as Stap 2: Dienst Informatie
    participant S3 as Stap 3: Controleren
    participant AW as Applicatie Wizard

    Note over U,S3: Dienst Wizard - Gebruiker Flow

    %% Entry Point Keuze
    U->>S0: Start dienst wizard
    S0-->>U: Toon entry point keuze
    Note over U: Keuze: 'Dienst registreren' (eigen org) of 'Dienst melden' (andere org)
    
    alt Dienst melden (voor andere organisatie)
        U->>S0: Kies 'Dienst melden'
        
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
        
    else Dienst registreren (eigen organisatie)
        U->>S0: Kies 'Dienst registreren'
        Note over S0: Sla aanbieder selectie over - gebruik eigen organisatie
    end

    %% Stap 1: Applicatie Selectie
    S0->>S1: Ga naar Stap 1
    S1-->>U: Stap 1 - Applicatie selectie
    Note over U: Overzicht: Lijst van beschikbare applicaties van geselecteerde aanbieder
    
    alt Applicatie selecteren
        U->>S1: Selecteer applicatie uit lijst
        Note over U: Invoer: Kies applicatie die de dienst gaat aanbieden
        
        %% Controleer of applicatie meerdere versies heeft
        alt Applicatie heeft meerdere versies
            S1->>S1b: Ga naar Versie selectie
            S1b-->>U: Stap 1b - Versie selectie (optioneel)
            Note over U: Overzicht: Lijst van beschikbare versies van de applicatie
            U->>S1b: Selecteer versie
            S1b->>S2: Ga naar Stap 2
        else Applicatie heeft één versie
            S1->>S2: Ga naar Stap 2
        end
        
    else Geen geschikte applicatie
        U->>S1: Klik 'Applicatie niet gevonden'
        S1->>AW: Redirect naar Applicatie wizard
        Note over U: Wizard wordt afgebroken - ga naar Applicatie wizard (gegevens worden NIET opgeslagen)
    end

    %% Stap 2: Dienst Informatie
    S2-->>U: Stap 2 - Dienst informatie
    Note over U: Invoer: Naam, Type (API/Webservice/Interface/Proces), Beschrijving, Categorie, Protocol, Data formaat, Endpoint URL, Zichtbaarheid, Prijsmodel, Documentatie links
    U->>S2: Vul alle dienst gegevens in
    
    alt Naam al in gebruik binnen applicatie
        S2-->>U: Foutmelding - naam al in gebruik
        U->>S2: Pas naam aan
    else Naam beschikbaar
        S2->>S3: Ga naar Stap 3
    end

    %% Stap 3: Controleren
    S3-->>U: Stap 3 - Overzicht en controle
    Note over U: Overzicht: Alle ingevoerde dienst informatie ter controle
    
    alt Gebruiker wil wijzigingen maken
        U->>S3: Klik 'Vorige' naar specifieke stap
        Note over S3: Navigeer terug naar gewenste stap
        alt Terug naar Stap 1
            S3->>S1: Ga terug naar Stap 1
        else Terug naar Stap 2
            S3->>S2: Ga terug naar Stap 2
        end
    else Gebruiker bevestigt
        U->>S3: Klik 'Dienst registreren'
        S3-->>U: Bevestiging - Dienst succesvol geregistreerd
        Note over U: Dienst is gekoppeld aan applicatie en beschikbaar in catalogus
    end
```
  </TabItem>
  <TabItem value="stap0" label="Stap 0: Organisatie Selectie">
    <ul>
      <li>Organisatie Selectie (optioneel - alleen bij melden voor anderen): Selecteer aanbieder of maak nieuwe aan</li>
    </ul>
  </TabItem>
  <TabItem value="stap1" label="Stap 1: Applicatie Selectie">
    <ul>
      <li>Applicatie Selectie: Welke applicatie biedt de dienst aan</li>
    </ul>
  </TabItem>
  <TabItem value="stap1b" label="Stap 1b: Versie Selectie">
    <ul>
      <li>Versie Selectie (optioneel - alleen bij meerdere versies): Selecteer specifieke versie van de applicatie</li>
    </ul>
  </TabItem>
  <TabItem value="stap2" label="Stap 2: Dienst Informatie">
    <ul>
      <li>Dienst Informatie: Alle dienst eigenschappen in één uitgebreide stap (naam, type, beschrijving, technische specs, toegang, prijsmodel, documentatie)</li>
    </ul>
  </TabItem>
  <TabItem value="stap3" label="Stap 3: Controleren">
    <ul>
      <li>Controleren: Overzicht en bevestiging van alle gegevens</li>
    </ul>
  </TabItem>
</Tabs>
