---
id: k001-organisatie
title: K001 - Organisatie
sidebar_label: K001 - Organisatie
sidebar_position: 1
description: Kern concept Organisatie - Leveranciers, gemeenten en samenwerkingsverbanden in de GEMMA Softwarecatalogus
keywords:
  - organisatie
  - leverancier
  - gemeente
  - samenwerking
  - kern concept
  - K001
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# K001 - Organisatie

## Beschrijving
Organisaties zijn de verschillende partijen die betrokken zijn bij de softwarecatalogus. Dit kunnen leveranciers, gemeenten, samenwerkingsverbanden of andere overheidsorganisaties zijn. Organisaties vormen de basis voor alle andere concepten in de catalogus.

## Schema Eigenschappen

<ApiSchema id="swc" example pointer="#/components/schemas/organisatie" />

## Relaties

### Heeft
- **Applicaties**: Software die de organisatie aanbiedt
- **Diensten**: Services die worden geleverd
- **Gebruikers**: Medewerkers met toegang tot de catalogus
- **Contactpersonen**: Aangewezen vertegenwoordigers

### Gebruikt
- **Applicaties**: Software van andere organisaties
- **Diensten**: Services van andere leveranciers
- **Standaarden**: Gehanteerde normen en protocollen

### Participatie
- **Lid van**: Samenwerkingsverbanden en communities
- **Partner van**: Andere organisaties in samenwerkingen
- **Leverancier voor**: Organisaties die hun software gebruiken

## Organisatie Types

### 🏢 Leveranciers
Commerciële bedrijven die software ontwikkelen en aanbieden aan overheidsorganisaties.

**Kenmerken:**
- Eigen software portfolio
- Commerciële doelstellingen
- Klantrelaties met gemeenten
- Ondersteuning en service verlening

### 🏛️ Gemeenten
Lokale overheidsorganisaties die software gebruiken voor hun dienstverlening.

**Kenmerken:**
- Applicatielandschap beheer
- Publieke dienstverlening
- Compliance met overheidsstandaarden
- Samenwerking met andere gemeenten

### 🤝 Samenwerkingsverbanden
Organisaties die meerdere gemeenten vertegenwoordigen of ondersteunen.

**Kenmerken:**
- Collectieve inkoop
- Gedeelde software oplossingen
- Kennisdeling en best practices
- Schaalvoordelen voor leden

### ⚙️ Overheidsorganisaties
Provincies, ministeries en andere overheidsinstanties.

**Kenmerken:**
- Specifieke overheidssoftware
- Regelgeving en compliance
- Interoperabiliteit vereisten
- Publieke verantwoording

## Contactpersonen 

<ApiSchema id="swc" example pointer="#/components/schemas/contactpersoon" />

## Autorisatie en Toegang

### Organisatie Rollen
- **Eigenaar**: Volledige controle over organisatie gegevens
- **Beheerder**: Kan gebruikers en applicaties beheren
- **Medewerker**: Kan organisatie gegevens bekijken en beperkt bewerken
- **Gast**: Alleen lees toegang tot publieke informatie

### Toegangsrechten
| Functionaliteit | Eigenaar | Beheerder | Medewerker | Gast |
|------------------|----------|-----------|------------|------|
| **Organisatie gegevens wijzigen** | ✅ | ✅ | ❌ | ❌ |
| **Gebruikers beheren** | ✅ | ✅ | ❌ | ❌ |
| **Applicaties toevoegen** | ✅ | ✅ | ✅ | ❌ |
| **Gegevens bekijken** | ✅ | ✅ | ✅ | ✅ (publiek) |
| **Rapportages genereren** | ✅ | ✅ | ✅ | ❌ |

## Gerelateerde Concepten
- [K002 - Applicatie](./K002-applicatie.md): Software die organisaties aanbieden of gebruiken
- [K003 - Dienst](./K003-dienst.md): Services die organisaties leveren
- [K004 - Gebruik](./K004-gebruik.md): Hoe organisaties applicaties gebruiken
- [K005 - Koppeling](./K005-koppeling.md): Integraties tussen applicaties
- [K006 - Suite](./K006-suite.md): Verzamelingen van applicaties
- [K007 - Component](./K007-component.md): Onderdelen van applicaties

## Persona Perspectief

### 🏛️ Voor Gemeenten (Maria - ICT-coördinator)
- **Doel**: Overzicht van leveranciers en hun betrouwbaarheid
- **Gebruik**: Zoeken naar geschikte leveranciers voor nieuwe software
- **Belang**: Verificatie van leverancier gegevens en referenties

### 🏢 Voor Leveranciers (Jan - Directeur ICT Solutions)
- **Doel**: Zichtbaarheid creëren voor alle gemeenten
- **Gebruik**: Organisatie profiel optimaliseren voor betere vindbaarheid
- **Belang**: Contactgegevens en bedrijfsinformatie actueel houden

### 🤝 Voor Samenwerkingen (Linda - Samenwerking Coördinator)
- **Doel**: Namens leden gemeenten software inkopen en beheren
- **Gebruik**: Samenwerking registreren met juridisch kader
- **Belang**: Duidelijke rol en bevoegdheden vastleggen

### ⚙️ Voor Functioneel Beheer (Peter - Functioneel Beheerder)
- **Doel**: Organisaties valideren en goedkeuren
- **Gebruik**: Nieuwe organisaties beoordelen en status toekennen
- **Belang**: Data kwaliteit en betrouwbaarheid waarborgen

## Gerelateerde Functionaliteiten
- [F002 - Organisatie Inrichten](../Functionaliteiten/F002-organisatie-inrichten.md)
- [F003 - Gebruikersbeheer](../Functionaliteiten/F003-gebruikersbeheer.md)
- [F010 - Lidmaatschapsbeheer](../Functionaliteiten/F010-lidmaatschapsbeheer.md)

## Organisatie Wizard

De Organisatie wizard begeleidt gebruikers door het proces van het registreren van een nieuwe organisatie in de GEMMA Softwarecatalogus.

<Tabs>
  <TabItem value="specificaties" label="Sequence Diagram" default>

```mermaid
sequenceDiagram
    participant U as Gebruiker
    participant S1 as Stap 1: Organisatie Type
    participant S2 as Stap 2: Basisgegevens
    participant S3 as Stap 3: Contactgegevens
    participant S4 as Stap 4: Juridische Informatie
    participant S5 as Stap 5: Contactpersonen
    participant S6 as Stap 6: Verificatie
    participant S7 as Stap 7: Controleren

    Note over U,S7: Organisatie Wizard - Gebruiker Flow

    %% Stap 1: Organisatie Type
    U->>S1: Start organisatie wizard
    S1-->>U: Stap 1 - Organisatie type selectie
    Note over U: Invoer: Type organisatie (Leverancier, Gemeente, Samenwerking, Overheid)
    U->>S1: Selecteer organisatie type
    S1->>S2: Ga naar Stap 2

    %% Stap 2: Basisgegevens
    S2-->>U: Stap 2 - Basisgegevens formulier
    Note over U: Invoer: Naam, beschrijving, website, logo upload
    U->>S2: Vul basisgegevens in
    
    alt Naam al in gebruik
        S2-->>U: Foutmelding - naam al in gebruik
        U->>S2: Pas naam aan
    else Naam beschikbaar
        S2->>S3: Ga naar Stap 3
    end

    %% Stap 3: Contactgegevens
    S3-->>U: Stap 3 - Contactgegevens formulier
    Note over U: Invoer: Adres, telefoon, e-mail, vestigingsland
    U->>S3: Vul contactgegevens in
    S3->>S4: Ga naar Stap 4

    %% Stap 4: Juridische Informatie (Conditioneel)
    alt Organisatie type vereist juridische info
        S4-->>U: Stap 4 - Juridische informatie formulier
        Note over U: Invoer: KvK nummer, BTW nummer, rechtsvorm
        U->>S4: Vul juridische gegevens in
        
        alt KvK nummer validatie mislukt
            S4-->>U: Foutmelding - ongeldig KvK nummer
            U->>S4: Corrigeer KvK nummer
        else KvK nummer geldig
            S4->>S5: Ga naar Stap 5
        end
        
    else Geen juridische info vereist
        Note over S4: Sla juridische stap over
        S3->>S5: Ga direct naar Stap 5
    end

    %% Stap 5: Contactpersonen
    S5-->>U: Stap 5 - Contactpersonen formulier
    Note over U: Invoer: Primaire contactpersoon, secundaire contacten
    U->>S5: Voeg contactpersonen toe
    S5->>S6: Ga naar Stap 6

    %% Stap 6: Verificatie
    S6-->>U: Stap 6 - Verificatie formulier
    Note over U: Invoer: Upload documenten, verificatie methode
    U->>S6: Upload verificatie documenten
    S6->>S7: Ga naar Stap 7

    %% Stap 7: Controleren
    S7-->>U: Stap 7 - Overzicht en controle
    Note over U: Overzicht: Alle ingevoerde organisatie informatie ter controle
    
    alt Gebruiker wil wijzigingen maken
        U->>S7: Klik 'Vorige' naar specifieke stap
        Note over S7: Navigeer terug naar gewenste stap
        alt Terug naar Stap 1
            S7->>S1: Ga terug naar Stap 1
        else Terug naar andere stap
            Note over S7: Navigeer naar gewenste stap
        end
    else Gebruiker bevestigt
        U->>S7: Klik 'Organisatie registreren'
        S7-->>U: Bevestiging - Organisatie succesvol geregistreerd
        Note over U: Verificatie proces is gestart, wacht op goedkeuring
    end
```
  </TabItem>
  <TabItem value="stap1" label="Stap 1: Organisatie Type">
    <ul>
      <li>Organisatie Type: Selecteer type organisatie (Leverancier, Gemeente, Samenwerking, Overheid)</li>
    </ul>
  </TabItem>
  <TabItem value="stap2" label="Stap 2: Basisgegevens">
    <ul>
      <li>Basisgegevens: Naam, beschrijving, website, logo</li>
    </ul>
  </TabItem>
  <TabItem value="stap3" label="Stap 3: Contactgegevens">
    <ul>
      <li>Contactgegevens: Adres, telefoon, e-mail</li>
    </ul>
  </TabItem>
  <TabItem value="stap4" label="Stap 4: Juridische Informatie">
    <ul>
      <li>Juridische Informatie: KvK, BTW, rechtsvorm (indien van toepassing)</li>
    </ul>
  </TabItem>
  <TabItem value="stap5" label="Stap 5: Contactpersonen">
    <ul>
      <li>Contactpersonen: Primaire en secundaire contacten aanwijzen</li>
    </ul>
  </TabItem>
  <TabItem value="stap6" label="Stap 6: Verificatie">
    <ul>
      <li>Verificatie: Documenten uploaden voor verificatie</li>
    </ul>
  </TabItem>
  <TabItem value="stap7" label="Stap 7: Controleren">
    <ul>
      <li>Controleren: Overzicht en bevestiging van alle gegevens</li>
    </ul>
  </TabItem>
</Tabs>
