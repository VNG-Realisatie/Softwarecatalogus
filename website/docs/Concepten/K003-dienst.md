---
id: k003-dienst
title: K003 - Dienst
sidebar_label: K003 - Dienst
sidebar_position: 3
description: Kern concept Dienst - Services en ondersteuning die leveranciers aanbieden op applicaties in de GEMMA Softwarecatalogus
keywords:
  - dienst
  - service
  - ondersteuning
  - functioneel beheer
  - applicatiebeheer
  - technisch beheer
  - implementatieondersteuning
  - opleidingen
  - licentiereseller
  - kern concept
  - K003
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# K003 - Dienst

## Beschrijving
Diensten zijn specifieke services die door leveranciers of samenwerkingen worden aangeboden op één of meerdere applicaties. Dit betreft het aanbod van verschillende soorten ondersteuning en services rondom software, zoals functioneel beheer, technische ondersteuning, implementatie en training. Diensten vormen de brug tussen leveranciers en organisaties die hun software gebruiken.

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

### 🎯 Functioneel Beheer
Ondersteuning bij het functioneel gebruik en beheer van de applicatie.

**Kenmerken:**
- Advies over optimaal gebruik
- Configuratie ondersteuning
- Proces optimalisatie
- Best practices begeleiding
- Gebruikers ondersteuning

**Voorbeelden:**
- Workflow configuratie
- Rapportage inrichting
- Gebruikersrechten beheer
- Proces optimalisatie advies

### ⚙️ Applicatiebeheer
Technische ondersteuning en beheer van de applicatie zelf.

**Kenmerken:**
- Technische configuratie
- Performance monitoring
- Update management
- Backup en recovery
- Integratie ondersteuning

**Voorbeelden:**
- Systeem configuratie
- Database beheer
- API configuratie
- Performance tuning

### 🔧 Technisch Beheer
Infrastructurele en technische ondersteuning van de onderliggende systemen.

**Kenmerken:**
- Server beheer
- Netwerk configuratie
- Beveiliging management
- Monitoring en alerting
- Disaster recovery

**Voorbeelden:**
- Hosting services
- Security management
- Backup services
- Monitoring dashboards

### 🚀 Implementatieondersteuning
Begeleiding bij de implementatie en uitrol van de applicatie.

**Kenmerken:**
- Project management
- Migratie ondersteuning
- Go-live begeleiding
- Integratie realisatie
- Change management

**Voorbeelden:**
- Data migratie
- Systeem integratie
- Gebruikers migratie
- Pilot begeleiding

### 📚 Opleidingen
Training en kennisoverdracht voor gebruikers en beheerders.

**Kenmerken:**
- Gebruikerstraining
- Beheerders cursussen
- Online learning platforms
- Certificering programma's
- Kennisbank toegang

**Voorbeelden:**
- Eindgebruiker training
- Administrator cursus
- E-learning modules
- Certificering trajecten

### 💼 Licentiereseller
Verkoop en beheer van software licenties en abonnementen.

**Kenmerken:**
- Licentie verkoop
- Volume kortingen
- Licentie beheer tools
- Compliance monitoring
- Renewal management

**Voorbeelden:**
- Software licenties
- SaaS abonnementen
- Volume licensing
- Enterprise agreements

## Dienst Aanbod

### 📋 Aanbod Definitie
Leveranciers en samenwerkingen definiëren hun diensten aanbod per applicatie.

- **Service portfolio**: Overzicht van alle aangeboden diensten
- **Applicatie koppeling**: Welke diensten bij welke applicaties horen
- **Service levels**: Verschillende niveaus van ondersteuning
- **Prijsmodellen**: Kosten en facturatie per dienst type

### 🎯 Service Scoping
Bepaling van de omvang en dekking van elke dienst.

- **Functionaliteit dekking**: Welke onderdelen worden ondersteund
- **Gebruikersgroepen**: Voor wie de dienst beschikbaar is
- **Geografische dekking**: Waar de dienst wordt aangeboden
- **Tijdsvensters**: Wanneer de dienst beschikbaar is

### 💰 Commerciële Aspecten
Prijsstelling en commerciële voorwaarden van diensten.

- **Prijsmodellen**: Vast tarief, per uur, abonnement
- **Volume kortingen**: Schaalvoordelen bij grotere afname
- **Contract voorwaarden**: SLA's en service garanties
- **Facturatie**: Hoe en wanneer wordt gefactureerd

### 📞 Service Delivery
Hoe diensten worden geleverd aan klanten.

- **Delivery kanalen**: Online, telefoon, on-site
- **Response tijden**: Hoe snel wordt gereageerd
- **Escalatie procedures**: Wat gebeurt bij problemen
- **Kwaliteitsborging**: Hoe wordt kwaliteit gewaarborgd

### 📊 Service Management
Beheer en monitoring van het diensten aanbod.

- **Performance monitoring**: Meting van service kwaliteit
- **Customer satisfaction**: Klant tevredenheid metingen
- **Service improvement**: Continue verbetering van diensten
- **Capacity planning**: Zorgen voor voldoende capaciteit

:::info Lifecycle Management
Het **aanbod** van diensten heeft geen lifecycle management. De **afname** van diensten door organisaties wordt beheerd via [K004 - Gebruik](./K004-gebruik.md), waar wel lifecycle management van toepassing is.
:::

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
    Note over U: Invoer: Naam, Type (Functioneel beheer/Applicatiebeheer/Technisch beheer/Implementatieondersteuning/Opleidingen/Licentiereseller), Beschrijving, Service level, Prijsmodel, Delivery kanalen, Response tijden, Documentatie links
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
      <li>Organisatie Selectie (optioneel - alleen bij melden voor anderen)</li>
      <li>Wens: Na selecteren Organisatie tonen van applicaties van die organisatie zodert er minder doubleurs worden aangemaakt</li>
    </ul>
    ![img_17.png](../Functionaliteiten/img_17.png)
    <ul>
      <li>Organisatie opvoeren (optioneel - alleen ná klikken op "Ik kan de gewenste leverancier niet vinden")</li>
      <li>Wens: Organisatie formulier terugbrengen tot naam + website</li>
      <li>Wens: Organisatie naam controleren op doubleurs</li>
    </ul>
    ![img_16.png](../Functionaliteiten/img_16.png)
  </TabItem>
  <TabItem value="stap1" label="Stap 1: Applicatie Selectie">
    <ul>
      <li>Applicatie Selectie: Welke applicatie biedt de dienst aan</li>
    </ul>
    ![img_6.png](img_6.png)
  </TabItem>
  <TabItem value="stap1b" label="Stap 1b: Versie Selectie">
    <ul>
      <li>Versie Selectie (optioneel - alleen bij meerdere versies): Selecteer specifieke versie van de applicatie</li>
    </ul>
    ![img_5.png](img_5.png)
  </TabItem>
  <TabItem value="stap2" label="Stap 2: Dienst Informatie">
    <ul>
      <li>Dienst Informatie: Alle dienst eigenschappen in één uitgebreide stap (naam, type service, beschrijving, service level, prijsmodel, delivery kanalen, response tijden, documentatie)</li>
    </ul>
    ![](img.png)
  </TabItem>
  <TabItem value="stap3" label="Stap 3: Controleren">
    <ul>
      <li>Controleren: Overzicht en bevestiging van alle gegevens</li>
    </ul>
    ![img_11.png](img_11.png)
  </TabItem>  
</Tabs>
