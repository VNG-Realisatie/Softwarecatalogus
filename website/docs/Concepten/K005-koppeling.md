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
Koppelingen beschrijven de technische integraties tussen applicaties (modules) onderling en/of met buitengemeentelijke voorzieningen. Hetzelfde koppeling object wordt gebruikt voor zowel het aanbod (welke koppelingen zijn beschikbaar voor een applicatie) als voor het gebruik (welke koppelingen hebben afnemers daadwerkelijk geïmplementeerd).

## Schema Eigenschappen

<ApiSchema id="swc" example pointer="#/components/schemas/koppeling" />

## Relaties

### Modules (Applicaties)
- **Module A**: De bron module waarvan gegevens worden uitgewisseld
- **Module B**: De doel module waarnaar gegevens worden uitgewisseld (optioneel)
- **Intermediair Module**: Module die wordt gebruikt voor realisatie van de koppeling

### Buitengemeentelijke Voorzieningen
- **Buitengemeentelijke Voorziening**: Externe voorziening waarmee wordt gekoppeld (alternatief voor Module B)

### Organisatie en Diensten
- **Aanbieder**: De organisatie die de koppeling aanbiedt
- **Dienst**: De dienst die deze koppeling gebruikt

### Standaarden
- **Standaardversies**: Standaarden die door deze koppeling worden geïmplementeerd

## Koppeling Types

Het schema ondersteunt de volgende koppeling types:

### 🔌 API
Moderne REST of GraphQL API koppelingen voor real-time data uitwisseling.

### 🌐 Webservices
SOAP-gebaseerde webservice koppelingen, vaak gebruikt voor overheidsstandaarden.

### 📁 Bestandsoverdracht
Batch-gebaseerde uitwisseling via bestanden (CSV, XML, etc.).

### 🔗 DigiKoppeling
Overheidsstandaard voor veilige gegevensuitwisseling tussen overheden.

### 📨 Message Queue
Asynchrone berichtuitwisseling via message brokers.

### 🌐 Upload naar portaal
Handmatige of geautomatiseerde upload naar webportalen.

### ❓ N.v.t.
Voor koppelingen waar het type niet van toepassing is of onbekend.

## Koppeling Status

De koppeling doorloopt verschillende statussen die de levenscyclus weergeven:

### 🛠️ In ontwikkeling
De koppeling wordt ontwikkeld en getest.

**Kenmerken:**
- Technische specificatie wordt uitgewerkt
- Ontwikkeling en testing in gang
- Nog niet beschikbaar voor productie gebruik

### ✅ In gebruik
De koppeling is operationeel en beschikbaar voor gebruik.

**Kenmerken:**
- Volledig getest en goedgekeurd
- Beschikbaar voor implementatie door afnemers
- Documentatie en support beschikbaar

### ⚠️ Einde ondersteuning
De koppeling wordt niet meer actief ondersteund maar is nog beschikbaar.

**Kenmerken:**
- Geen nieuwe features of updates
- Beperkte support beschikbaar
- Migratie naar alternatief wordt aanbevolen

### 🔚 Teruggetrokken
De koppeling is niet meer beschikbaar.

**Kenmerken:**
- Volledig uitgefaseerd
- Geen ondersteuning meer
- Alternatieve oplossing vereist

## Gegevensuitwisseling Richting

### A naar B
Gegevens stromen van Module A naar Module B (of buitengemeentelijke voorziening).

### B naar A  
Gegevens stromen van Module B (of buitengemeentelijke voorziening) naar Module A.

### Bi-directioneel
Gegevens kunnen in beide richtingen stromen.

## Gerelateerde Concepten
- [K002 - Applicatie](./K002-applicatie.md): Applicaties die worden gekoppeld
- [K003 - Dienst](./K003-dienst.md): Diensten die worden gebruikt in koppelingen
- [K004 - Gebruik](./K004-gebruik.md): Gebruik context van koppelingen
- [K007 - Component](./K007-component.md): Componenten die koppelingen implementeren

## Persona Perspectief

### 🏛️ Voor Gemeenten (Maria - ICT-coördinator)
- **Doel**: Overzicht van alle integraties in het applicatielandschap
- **Gebruik**: Inzicht in afhankelijkheden en risico's van koppelingen
- **Belang**: Impact analyse bij wijzigingen en uitval scenario's

### 🏢 Voor Leveranciers (Jan - Directeur ICT Solutions)
- **Doel**: Koppelingen aanbieden en beschikbaar stellen
- **Gebruik**: Integratie mogelijkheden van eigen applicaties registreren
- **Belang**: Interoperabiliteit en ecosysteem participatie

### 🤝 Voor Samenwerkingen (Linda - Samenwerking Coördinator)
- **Doel**: Gestandaardiseerde koppelingen voor leden
- **Gebruik**: Koppelingen definiëren die door meerdere leden gebruikt worden
- **Belang**: Efficiëntie en consistentie in integraties

### 🔒 Voor Security Officers (Mark - Information Security Officer)
- **Doel**: Security aspecten van data uitwisseling beoordelen
- **Gebruik**: Koppelingen controleren op veilige data overdracht
- **Belang**: Data beveiliging en compliance waarborgen

### 🏗️ Voor Architectuur Experts (Sarah - Enterprise Architect)
- **Doel**: Architectuur compliance van integraties valideren
- **Gebruik**: Standaarden en protocollen van koppelingen beoordelen
- **Belang**: Interoperabiliteit en architectuur consistentie

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
    Note over U: Invoer: Naam, Beschrijving, Type (api/webservices/bestandsoverdracht/digikoppeling/message que/upload naar portaal), Status, Datums per status, Richting (AnaarB/BnaarA/bi-directioneel), Standaardversies, Intermediair module
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
      <li>Koppeling Informatie: Naam, Beschrijving, Type, Status, Datums per status, Gegevensuitwisseling richting</li>
      <li>Optioneel: Standaardversies die worden geïmplementeerd</li>
      <li>Optioneel: Intermediaire module voor realisatie van de koppeling</li>
    </ul>
  </TabItem>
  <TabItem value="stap4" label="Stap 4: Controleren">
    <ul>
      <li>Controleren: Overzicht en bevestiging van alle gegevens</li>
    </ul>
  </TabItem>
</Tabs>
