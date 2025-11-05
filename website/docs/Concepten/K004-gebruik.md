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

## Gebruik Types

### 🏛️ Productie Gebruik
Volledig operationeel gebruik in de dagelijkse bedrijfsvoering.

**Kenmerken:**
- Live omgeving met echte data
- Volledige gebruikersbasis
- 24/7 beschikbaarheid vereist
- Formele support overeenkomsten
- Backup en disaster recovery

**Voorbeelden:**
- Zaaksysteem voor burgerzaken
- Financieel systeem voor boekhouding
- HR systeem voor personeelsbeheer
- CRM voor klantrelatiebeheer

### 🧪 Pilot Gebruik
Beperkte test implementatie om geschiktheid te evalueren.

**Kenmerken:**
- Beperkte gebruikersgroep
- Gecontroleerde omgeving
- Evaluatie criteria en KPI's
- Tijdelijke implementatie
- Intensieve begeleiding

**Voorbeelden:**
- Nieuwe workflow tool in één afdeling
- Innovatieve citizen service in één wijk
- Cloud migratie van één applicatie
- Nieuwe rapportage tool voor management

### 🔄 Migratie Gebruik
Overgang van oude naar nieuwe applicatie of versie.

**Kenmerken:**
- Parallelle systemen
- Data migratie processen
- Gebruikerstraining
- Rollback procedures
- Gefaseerde uitrol

**Voorbeelden:**
- Migratie van legacy systeem naar cloud
- Upgrade naar nieuwe versie
- Consolidatie van meerdere systemen
- Platform modernisering

### 📊 Analytische Gebruik
Gebruik voor rapportage, analyse en business intelligence.

**Kenmerken:**
- Read-only toegang tot data
- Batch processing
- Scheduled reports
- Dashboard integraties
- Data warehouse koppelingen

**Voorbeelden:**
- BI dashboards voor management
- Compliance rapportage
- Performance monitoring
- Trend analyse tools

### 🔧 Ontwikkeling Gebruik
Gebruik voor ontwikkeling, test en configuratie doeleinden.

**Kenmerken:**
- Ontwikkel en test omgevingen
- Sandbox configuraties
- API testing tools
- Prototype development
- Integration testing

**Voorbeelden:**
- API development platforms
- Test automation tools
- Configuration management
- Integration testing suites

## Gebruik Lifecycle

### 📋 Planning
- **Behoefteanalyse**: Identificatie van functionele requirements
- **Marktonderzoek**: Evaluatie van beschikbare oplossingen
- **Business case**: Kosten-baten analyse en ROI berekening
- **Projectplan**: Implementatie roadmap en mijlpalen

### 🚀 Implementatie
- **Procurement**: Aanschaf en contractering
- **Setup**: Technische installatie en configuratie
- **Integratie**: Koppeling met bestaande systemen
- **Training**: Gebruikerstraining en change management

### 📈 Adoptie
- **Rollout**: Gefaseerde uitrol naar gebruikers
- **Support**: Helpdesk en gebruikersondersteuning
- **Monitoring**: Performance en gebruiksmonitoring
- **Optimalisatie**: Aanpassingen en verbeteringen

### 🔄 Operatie
- **Dagelijks beheer**: Routine onderhoud en monitoring
- **Incident management**: Probleem oplossing en escalatie
- **Change management**: Wijzigingen en updates
- **Capacity management**: Capaciteitsplanning en scaling

### 📊 Evaluatie
- **Performance review**: Evaluatie van KPI's en doelstellingen
- **User satisfaction**: Gebruikerstevredenheid onderzoek
- **Cost analysis**: Kosten analyse en optimalisatie
- **Future planning**: Roadmap voor toekomstige ontwikkelingen

### 🔚 Uitfasering
- **End-of-life planning**: Voorbereiding op vervanging
- **Data migratie**: Overzetten van gegevens naar opvolger
- **User transition**: Overgang gebruikers naar nieuwe oplossing
- **Decommissioning**: Definitieve uitschakeling van systeem

## Gerelateerde Concepten
- [K001 - Organisatie](./K001-organisatie.md): Organisaties die applicaties gebruiken
- [K002 - Applicatie](./K002-applicatie.md): Applicaties die worden gebruikt
- [K003 - Dienst](./K003-dienst.md): Diensten die worden afgenomen
- [K005 - Koppeling](./K005-koppeling.md): Integraties in het gebruik
- [K007 - Component](./K007-component.md): Componenten die worden gebruikt

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
    Note over U: Invoer: Implementatie datum, Go-live datum, Status, Fase, Licentie info, Technische configuratie, Gebruikers info, Evaluatie gegevens
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
      <li>Gebruik Informatie: Alle gebruik eigenschappen in één uitgebreide stap (implementatie details, licentie info, technische configuratie, gebruikers info, evaluatie gegevens)</li>
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
