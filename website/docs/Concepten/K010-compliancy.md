---
id: compliancy
title: K010 - Compliancy
sidebar_label: K010 - Compliancy
sidebar_position: 10
description: Compliance en standaard ondersteuning van modules
keywords:
  - compliancy
  - compliance
  - standaarden
  - certificering
  - modules
  - applicaties
  - GEMMA
  - standaardversie
  - bewijs
  - softwarecatalogus
---

# K010 - Compliancy

## Beschrijving
Compliancy registreert de naleving van standaarden door modules (applicaties). Het toont aan welke standaardversies een module ondersteunt en biedt bewijs van compliance door middel van documenten of URL's naar testresultaten en certificaten.

## Schema Eigenschappen

<ApiSchema id="swc" example pointer="#/components/schemas/compliancy" />

### Basis Informatie
- **Standaard Versie**: Standaardversie die door deze compliance wordt ondersteund
- **Standaard Gemma**: Het GEMMA ID van de standaardversie
- **Module**: De module waarvan de compliance wordt geregistreerd

### Bewijs Materiaal
- **Bewijs**: Bewijsstuk voor de compliance (PDF, afbeelding, Word document)
- **URL**: URL naar het bewijs van de compliance (online testrapport, certificaat)

## Compliance Types

### 📋 GEMMA Standaarden
Compliance met GEMMA referentie architectuur standaarden.

**Voorbeelden:**
- GEMMA Referentiecomponenten
- GEMMA Informatiemodel
- GEMMA Procesmodel
- GEMMA Technische Architectuur

### 🌐 Technische Standaarden
Compliance met technische en interoperabiliteit standaarden.

**Voorbeelden:**
- REST API specificaties
- SOAP Webservice standaarden
- DigiKoppeling profielen
- StUF standaarden

### 🔒 Security Standaarden
Compliance met beveiligings- en privacy standaarden.

**Voorbeelden:**
- ISO 27001 certificering
- NEN 7510 compliance
- AVG/GDPR compliance
- Baseline Informatiebeveiliging Overheid (BIO)

### 🏛️ Overheids Standaarden
Compliance met overheidsspecifieke standaarden en richtlijnen.

**Voorbeelden:**
- NORA (Nederlandse Overheid Referentie Architectuur)
- Common Ground principes
- Wet Digitale Overheid (WDO)
- Archiefwet compliance

## Bewijs Materiaal Types

### 📄 Testrapport
Officiële testresultaten die compliance aantonen.

**Kenmerken:**
- Gedetailleerde test resultaten
- Datum van testing
- Testorganisatie informatie
- Specifieke standaard versie

### 🏆 Certificaat
Formele certificering door erkende instantie.

**Kenmerken:**
- Certificering autoriteit
- Geldigheidsperiode
- Certificaat nummer
- Scope van certificering

### 📊 Conformance Statement
Verklaring van leverancier over standaard ondersteuning.

**Kenmerken:**
- Ondersteunde features
- Bekende beperkingen
- Implementatie details
- Versie informatie

### 🔗 Online Validatie
Link naar online validatie tools of portalen.

**Kenmerken:**
- Real-time validatie
- Publiek toegankelijk
- Automatische updates
- Traceability

## Persona Perspectief

### 🏗️ Voor Architectuur Experts (Sarah - Enterprise Architect)
- **Doel**: GEMMA compliance van applicaties valideren en monitoren
- **Gebruik**: Compliance registraties beoordelen en goedkeuren
- **Belang**: Architectuur consistentie en standaarden adoptie

### 🔒 Voor Security Officers (Mark - Information Security Officer)
- **Doel**: Security compliance en certificeringen controleren
- **Gebruik**: Bewijs materiaal valideren voor security standaarden
- **Belang**: Risicomanagement en compliance assurance

### 🏛️ Voor Gemeenten (Maria - ICT-coördinator)
- **Doel**: Compliance status van applicaties controleren bij inkoop
- **Gebruik**: Standaarden ondersteuning verifiëren voor besluitvorming
- **Belang**: Interoperabiliteit en toekomstbestendigheid

### 🏢 Voor Leveranciers (Jan - Directeur ICT Solutions)
- **Doel**: Compliance claims onderbouwen met bewijs materiaal
- **Gebruik**: Certificaten en testrapporten uploaden en onderhouden
- **Belang**: Geloofwaardigheid en marktpositie versterken

### ⚙️ Voor Functioneel Beheer (Peter - Functioneel Beheerder)
- **Doel**: Kwaliteit van compliance registraties bewaken
- **Gebruik**: Bewijs materiaal controleren en valideren
- **Belang**: Data integriteit en betrouwbaarheid van compliance informatie

## Compliance Lifecycle

### 📋 Registratie
- Standaard identificatie
- Module koppeling
- Bewijs materiaal upload
- Initiële validatie

### ✅ Validatie
- Bewijs controle
- Technische verificatie
- Goedkeuring proces
- Status toekenning

### 🔄 Onderhoud
- Periodieke hervalidatie
- Bewijs materiaal updates
- Standaard versie migratie
- Status monitoring

### 📊 Rapportage
- Compliance overzichten
- Trend analyse
- Gap identificatie
- Improvement planning

## Gerelateerde Concepten
- [K002 - Applicatie](./K002-applicatie.md): Applicaties waarvan compliance wordt geregistreerd
- [K008 - Kwetsbaarheid](./K008-kwetsbaarheid.md): Security aspecten van compliance
- [K009 - Beoordeeling](./K009-beoordeeling.md): Kwaliteit beoordelingen inclusief compliance

## Gerelateerde Functionaliteiten
- [F004 - Applicatiebeheer](../Functionaliteiten/F004-applicatiebeheer.md)
- [F006 - Inzichten en Aanbevelingen](../Functionaliteiten/F006-inzichten-en-aanbevelingen.md)
