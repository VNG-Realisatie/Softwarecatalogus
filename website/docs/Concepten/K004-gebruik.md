---
id: k004-gebruik
title: K004 - Gebruik
sidebar_label: K004 - Gebruik
sidebar_position: 4
description: Kern concept Gebruik - Hoe organisaties applicaties inzetten in hun ICT-landschap
keywords:
  - gebruik
  - implementatie
  - applicatielandschap
  - deployment
  - kern concept
  - K004
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# K004 - Gebruik

## Beschrijving
Gebruik beschrijft hoe organisaties applicaties inzetten in hun ICT-landschap. Dit omvat zowel de technische als functionele aspecten van het gebruik, inclusief implementatie details, gebruikerservaring en bedrijfswaarde realisatie.

## Schema Eigenschappen

<ApiSchema id="swc" example pointer="#/components/schemas/gebruik" />

## Relaties

### Organisatorisch
- **Gebruikt door**: Organisatie (gemeente, leverancier, samenwerking)
- **Van applicatie**: Specifieke applicatie die wordt gebruikt
- **Beheerd door**: IT afdeling of externe partij
- **Ondersteund door**: Leverancier of support organisatie

### Technisch
- **Gekoppeld aan**: Andere applicaties in het landschap
- **Afhankelijk van**: Infrastructuur en platforms
- **Integreert met**: Externe systemen en diensten
- **Gebruikt diensten**: Specifieke services van de applicatie

### Functioneel
- **Ondersteunt processen**: Bedrijfsprocessen die worden ondersteund
- **Gebruikt door afdelingen**: Welke afdelingen maken gebruik
- **Vervult rollen**: Functionele rollen in de organisatie
- **Levert waarde**: Meetbare business value

## Gebruik Status

Het gebruik van een applicatie doorloopt verschillende statussen die de levenscyclus van de implementatie weergeven:

### 🔍 Verwerving
De organisatie onderzoekt en evalueert de applicatie voor mogelijke implementatie.

**Kenmerken:**
- Marktonderzoek en evaluatie
- Proof of concept activiteiten
- Business case ontwikkeling
- Leverancier selectie

### 📋 Gepland
De beslissing is genomen om de applicatie te implementeren en er is een implementatieplan.

**Kenmerken:**
- Goedgekeurde business case
- Projectplan en tijdlijn
- Budget toegewezen
- Contractonderhandelingen

### ✅ In productie
De applicatie is actief in gebruik binnen de organisatie.

**Kenmerken:**
- Live omgeving operationeel
- Gebruikers zijn getraind
- Support processen actief
- Monitoring en beheer ingesteld

### ⚠️ Uit te faseren
De organisatie heeft besloten om het gebruik van de applicatie te beëindigen.

**Kenmerken:**
- End-of-life planning
- Migratiestrategie bepaald
- Data archivering voorbereid
- Gebruikers geïnformeerd

### 🔚 Uitgefaseerd
Het gebruik van de applicatie is volledig beëindigd.

**Kenmerken:**
- Applicatie is uitgeschakeld
- Data is gemigreerd of gearchiveerd
- Licenties zijn opgezegd
- Documentatie is bijgewerkt

## Gebruik Eigenschappen

### 🏢 Organisatie Gegevens
- **Afnemer**: De organisatie die de applicatie gebruikt
- **Contactpersoon**: Verantwoordelijke persoon voor dit gebruik
- **Deelnemers**: Andere organisaties die deelnemen (bij samenwerkingen)
- **Interne Aantekening**: Aanvullende interne informatie

### 📅 Tijdlijn Gegevens
- **Startdatum Verwerving**: Wanneer de evaluatie is gestart
- **Startdatum Gepland**: Geplande implementatiedatum
- **Startdatum In Productie**: Wanneer de applicatie live is gegaan
- **Startdatum Uit Te Faseren**: Wanneer uitfasering begint
- **Startdatum Uitgefaseerd**: Wanneer gebruik definitief is beëindigd

### 🔗 Applicatie Koppelingen
- **Module**: De specifieke applicatie die wordt gebruikt
- **Module Versie**: De specifieke versie van de applicatie
- **Referentiecomponenten**: GEMMA componenten waarvoor de applicatie wordt gebruikt
- **AMEF Elementen**: Architectuur elementen die worden ondersteund

### 🤝 Diensten en Koppelingen
- **Diensten**: Services die worden afgenomen bij dit gebruik
- **Koppelingen**: Integraties die worden gebruikt binnen dit gebruik

## Gerelateerde Concepten
- [K001 - Organisatie](./K001-organisatie.md): Organisaties die applicaties gebruiken
- [K002 - Applicatie](./K002-applicatie.md): Applicaties die worden gebruikt
- [K003 - Dienst](./K003-dienst.md): Diensten die worden afgenomen
- [K005 - Koppeling](./K005-koppeling.md): Integraties in het gebruik
- [K007 - Component](./K007-component.md): Componenten die worden gebruikt

## Persona Perspectief

### 🏛️ Voor Gemeenten (Maria - ICT-coördinator)
- **Doel**: Compleet overzicht van eigen applicatielandschap
- **Gebruik**: Registreren van alle applicaties die de gemeente gebruikt
- **Belang**: Inzicht in kosten, afhankelijkheden en lifecycle planning

### 🏢 Voor Leveranciers (Jan - Directeur ICT Solutions)
- **Doel**: Inzicht in wie hun software gebruikt
- **Gebruik**: Gebruik melden van eigen applicaties bij gemeenten
- **Belang**: Klantenbeheer en referentie cases

### 🤝 Voor Samenwerkingen (Linda - Samenwerking Coördinator)
- **Doel**: Gebruik namens leden registreren en beheren
- **Gebruik**: Centraal overzicht van software gebruik door alle leden
- **Belang**: Gezamenlijke inkoop en beheer optimalisatie

### ⚙️ Voor Functioneel Beheer (Peter - Functioneel Beheerder)
- **Doel**: Overzicht van software gebruik in gemeentelijke sector
- **Gebruik**: Valideren en analyseren van gebruik registraties
- **Belang**: Marktinzichten en trend analyse

### 🏗️ Voor Architectuur Experts (Sarah - Enterprise Architect)
- **Doel**: Architectuur compliance en standaarden gebruik monitoren
- **Gebruik**: Analyseren welke referentie componenten en standaarden gebruikt worden
- **Belang**: GEMMA adoptie en compliance monitoring

## Gerelateerde Functionaliteiten
- [F013 - Gebruik Beheer](../Functionaliteiten/F013-gebruik-beheer.md)
- [F004 - Applicatiebeheer](../Functionaliteiten/F004-applicatiebeheer.md)
- [F006 - Inzichten en Aanbevelingen](../Functionaliteiten/F006-inzichten-en-aanbevelingen.md)

## Gebruik Wizard

De Gebruik wizard begeleidt gebruikers door het proces van het registreren van applicatie gebruik in de GEMMA Softwarecatalogus.

<Tabs>
  <TabItem value="specificaties" label="Sequence Diagram" default>

```mermaid
sequenceDiagram
    participant U as Gebruiker
    participant S0 as Stap 0: Organisatie Selectie
    participant S1 as Stap 1: Applicatie Selectie
    participant S1b as Stap 1b: Versie Selectie
    participant S2 as Stap 2: Gebruik Informatie
    participant S3 as Stap 3: Referentie Componenten
    participant S4 as Stap 4: Standaarden
    participant S5 as Stap 5: Diensten
    participant S6 as Stap 6: Controleren
    participant AW as Applicatie Wizard

    Note over U,S6: Gebruik Wizard - Gebruiker Flow

    %% Entry Point Keuze
    U->>S0: Start gebruik wizard
    S0-->>U: Toon entry point keuze
    Note over U: Keuze: 'Gebruik registreren' (eigen org) of 'Gebruik melden' (andere org)
    
    alt Gebruik melden (voor andere organisatie)
        U->>S0: Kies 'Gebruik melden'
        
        %% Stap 0: Aanbieder Selectie
        S0-->>U: Stap 0 - Organisatie selectie formulier
        Note over U: Invoer: Zoek bestaande organisatie of 'Nieuwe organisatie'
        
        alt Bestaande organisatie selecteren
            U->>S0: Selecteer bestaande organisatie uit lijst
            S0-->>U: Toon applicaties van geselecteerde organisatie (controle)
            Note over U: Overzicht: Bestaande applicaties ter verificatie
            U->>S0: Bevestig organisatie keuze
        else Nieuwe organisatie aanmaken
            U->>S0: Klik 'Ik kan de gewenste organisatie niet vinden'
            S0-->>U: Nieuwe organisatie formulier
            Note over U: Invoer: Naam organisatie + Website URL
        end
        
    else Gebruik registreren (eigen organisatie)
        U->>S0: Kies 'Gebruik registreren'
        Note over S0: Sla organisatie selectie over - gebruik eigen organisatie
    end

    %% Stap 1: Applicatie Selectie
    S0->>S1: Ga naar Stap 1
    S1-->>U: Stap 1 - Applicatie selectie
    Note over U: Overzicht: Lijst van beschikbare applicaties in catalogus
    
    alt Applicatie selecteren
        U->>S1: Selecteer applicatie uit lijst
        Note over U: Invoer: Kies applicatie waarvan gebruik wordt geregistreerd
        
        alt Gebruik al geregistreerd voor organisatie
            S1-->>U: Waarschuwing - gebruik al geregistreerd
            U->>S1: Bewerk bestaand gebruik of kies andere applicatie
        else Nieuw gebruik
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
        end
        
    else Geen geschikte applicatie
        U->>S1: Klik 'Applicatie niet gevonden'
        S1->>AW: Redirect naar Applicatie wizard
        Note over U: Wizard wordt afgebroken - ga naar Applicatie wizard (gegevens worden NIET opgeslagen)
    end

    %% Stap 2: Gebruik Informatie
    S2-->>U: Stap 2 - Gebruik informatie
    Note over U: Invoer: Status, Startdata per status, Contactpersoon, Deelnemers, Interne aantekening
    U->>S2: Vul alle gebruik gegevens in
    S2->>S3: Ga naar Stap 3

    %% Stap 3: Referentie Componenten
    S3-->>U: Stap 3 - Referentie componenten selectie
    Note over U: Overzicht: Keuze lijst van referentie componenten die voor de applicatie zijn opgegeven
    
    loop Voor elk referentie component
        S3-->>U: Toon referentie component (van applicatie)
        Note over U: Invoer: Wordt dit component daadwerkelijk gebruikt? (ja/nee)
        U->>S3: Selecteer component als gebruikt of niet gebruikt
    end
    
    alt Extra referentie componenten toevoegen
        U->>S3: Klik 'Extra referentie componenten toevoegen'
        S3-->>U: Zoek en selecteer extra componenten
        U->>S3: Voeg extra componenten toe
    end
    
    S3->>S4: Ga naar Stap 4

    %% Stap 4: Standaarden
    S4-->>U: Stap 4 - Standaarden selectie
    Note over U: Overzicht: Standaarden gekoppeld aan geselecteerde referentie componenten
    
    loop Voor elke standaard
        S4-->>U: Toon standaard (gekoppeld aan referentie component)
        Note over U: Invoer: Wordt deze standaard gebruikt in de implementatie? (ja/nee)
        U->>S4: Selecteer standaard als gebruikt of niet gebruikt
    end
    
    alt Extra standaarden toevoegen
        U->>S4: Klik 'Extra standaarden toevoegen'
        S4-->>U: Zoek en selecteer extra standaarden
        U->>S4: Voeg extra standaarden toe
    end
    
    S4->>S5: Ga naar Stap 5

    %% Stap 5: Diensten
    S5-->>U: Stap 5 - Diensten selectie
    Note over U: Overzicht: Tabel van alle diensten die betrekking hebben op de gekozen applicatie
    
    loop Voor elke dienst van de applicatie
        S5-->>U: Toon dienst in tabel (naam, type, beschrijving)
        Note over U: Invoer: Wordt deze dienst gebruikt? (checkbox)
        U->>S5: Vink dienst aan als gebruikt
    end
    
    S5->>S6: Ga naar Stap 6

    %% Stap 6: Controleren
    S6-->>U: Stap 6 - Overzicht en controle
    Note over U: Overzicht: Alle ingevoerde gebruik informatie ter controle
    
    alt Gebruiker wil wijzigingen maken
        U->>S6: Klik 'Vorige' naar specifieke stap
        Note over S6: Navigeer terug naar gewenste stap
        alt Terug naar Stap 2
            S6->>S2: Ga terug naar Stap 2
        else Terug naar andere stap
            Note over S6: Navigeer naar gewenste stap
        end
    else Gebruiker bevestigt
        U->>S6: Klik 'Gebruik registreren'
        S6-->>U: Bevestiging - Gebruik succesvol geregistreerd
        Note over U: Gebruik is toegevoegd aan applicatielandschap van organisatie
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
    ![img_6.png](img_6.png)
  </TabItem>
  <TabItem value="stap1b" label="Stap 1b: Versie Selectie">
    <ul>
      <li>Versie Selectie (optioneel - alleen bij meerdere versies): Selecteer specifieke versie van de applicatie</li>
    </ul>
    ![](img_5.png)
  </TabItem>
  <TabItem value="stap2" label="Stap 2: Gebruik Informatie">
    <ul>
      <li>Gebruik Informatie: Status, Startdata per status, Contactpersoon, Deelnemers, Interne aantekening</li>
      <li>Status keuze bepaalt welke startdata velden relevant zijn</li>
      <li>Deelnemers alleen relevant bij samenwerkingsverbanden</li>
    </ul>
   ![](img_2.png)
  </TabItem>
  <TabItem value="stap3" label="Stap 3: Referentie Componenten">
    <ul>
      <li>Referentie Componenten: Selecteer welke referentie componenten daadwerkelijk worden gebruikt, met optie om extra componenten toe te voegen</li>
      <li>deze mist in de huidige wizard, mag worden weergegeven als een tabel met checkboxes</li>
      <li>Er kunnen door gebruiker ook referentie componenten worden toegeveogd die geen onderdeel van de applicaite</li>
    </ul>
    ![img_10.png](img_10.png)
  </TabItem>
  <TabItem value="stap4" label="Stap 4: Standaarden">
    <ul>
      <li>Standaarden: Selecteer welke standaarden worden gebruikt in de implementatie, met optie om extra standaarden toe te voegen</li>
    </ul>
    ![](../Functionaliteiten/img_10.png)
  </TabItem>
  <TabItem value="stap5" label="Stap 5: Diensten">
    <ul>
      <li>Diensten: Tabel van alle diensten van de applicatie met checkboxes om aan te geven welke worden gebruikt</li>
    </ul>
    ![img_7.png](img_7.png)
  </TabItem>
  <TabItem value="stap6" label="Stap 6: Controleren">
    <ul>
      <li>Controleren: Overzicht en bevestiging van alle gegevens</li>
    </ul>
    ![img_8.png](img_8.png)
  </TabItem>
</Tabs>
