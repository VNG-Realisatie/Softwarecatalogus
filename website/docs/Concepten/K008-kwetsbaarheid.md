---
id: kwetsbaarheid
title: K008 - Kwetsbaarheid
sidebar_label: K008 - Kwetsbaarheid
sidebar_position: 8
description: Kwetsbaarheden in applicaties en modules
keywords:
  - kwetsbaarheid
  - security
  - CVE
  - CVSS
  - beveiliging
  - modules
  - applicaties
  - softwarecatalogus
  - GEMMA
---

# K008 - Kwetsbaarheid

## Beschrijving
Een kwetsbaarheid is een beveiligingslek of zwakte in een applicatie of module die door kwaadwillenden kan worden misbruikt. Kwetsbaarheden worden geregistreerd met CVE-codes en CVSS-scores om de ernst en impact te beoordelen.

## Schema Eigenschappen

<ApiSchema id="swc" example pointer="#/components/schemas/kwetsbaarheid" />

### Basis Informatie
- **Naam**: Naam van de kwetsbaarheid (verplicht)
- **Korte beschrijving**: Korte beschrijving van de kwetsbaarheid (verplicht)
- **Uitgebreide beschrijving**: Uitgebreide beschrijving in markdown formaat
- **CVE Code**: CVE (Common Vulnerabilities and Exposures) identificatiecode
- **CVSS Score**: CVSS (Common Vulnerability Scoring System) score van 0.0 tot 10.0

### Relaties
- **Getroffen Modules**: De modules (applicaties) die door deze kwetsbaarheid getroffen worden (verplicht)

## CVSS Score Classificatie

### 🟢 Laag (0.1 - 3.9)
Beperkte impact op de beveiliging van het systeem.

**Kenmerken:**
- Minimale schade bij misbruik
- Beperkte toegang tot gevoelige informatie
- Lokale exploitatie vereist
- Geen significante impact op beschikbaarheid

### 🟡 Gemiddeld (4.0 - 6.9)
Matige impact die aandacht vereist.

**Kenmerken:**
- Gedeeltelijke toegang tot systeem of data
- Mogelijk verlies van integriteit
- Remote exploitatie mogelijk
- Beperkte impact op beschikbaarheid

### 🟠 Hoog (7.0 - 8.9)
Ernstige kwetsbaarheid die prioriteit heeft.

**Kenmerken:**
- Significante impact op confidentialiteit
- Mogelijk volledig verlies van integriteit
- Remote exploitatie waarschijnlijk
- Merkbare impact op beschikbaarheid

### 🔴 Kritiek (9.0 - 10.0)
Zeer ernstige kwetsbaarheid die onmiddellijke actie vereist.

**Kenmerken:**
- Volledig verlies van confidentialiteit
- Totaal verlies van integriteit
- Volledige remote controle mogelijk
- Totale impact op beschikbaarheid

## Voorbeelden van Kwetsbaarheden

### 🌐 Web Applicatie Kwetsbaarheden
- **SQL Injection**: Ongevalideerde database queries
- **Cross-Site Scripting (XSS)**: Malicious scripts in web pagina's
- **Cross-Site Request Forgery (CSRF)**: Ongeautoriseerde acties via andere sites

### 🔐 Authenticatie Kwetsbaarheden
- **Weak Password Policy**: Zwakke wachtwoord vereisten
- **Session Fixation**: Sessie hijacking mogelijkheden
- **Broken Authentication**: Gebroken authenticatie mechanismen

### 📊 Data Kwetsbaarheden
- **Sensitive Data Exposure**: Onbeschermde gevoelige data
- **Insufficient Logging**: Onvoldoende audit trails
- **Data Injection**: Ongevalideerde data input

## Persona Perspectief

### 🔒 Voor Security Officers (Mark - Information Security Officer)
- **Doel**: Kwetsbaarheden identificeren en prioriteren voor remediation
- **Gebruik**: CVSS scores gebruiken voor risico beoordeling en planning
- **Belang**: Proactieve beveiliging en compliance met security standaarden

### 🏛️ Voor Gemeenten (Maria - ICT-coördinator)
- **Doel**: Inzicht in beveiligingsrisico's van gebruikte applicaties
- **Gebruik**: Kwetsbaarheden controleren bij software selectie
- **Belang**: Veilige ICT-omgeving en risicomanagement

### 🏢 Voor Leveranciers (Jan - Directeur ICT Solutions)
- **Doel**: Transparantie over bekende kwetsbaarheden en fixes
- **Gebruik**: Kwetsbaarheden registreren en updates communiceren
- **Belang**: Vertrouwen en verantwoordelijkheid tonen

### ⚙️ Voor Functioneel Beheer (Peter - Functioneel Beheerder)
- **Doel**: Overzicht van security status in de catalogus
- **Gebruik**: Kwetsbaarheden valideren en categoriseren
- **Belang**: Data kwaliteit en betrouwbaarheid van security informatie

## Gerelateerde Concepten
- [K002 - Applicatie](./K002-applicatie.md): Applicaties die kwetsbaarheden kunnen hebben
- [K004 - Gebruik](./K004-gebruik.md): Impact van kwetsbaarheden op gebruik
- [K009 - Beoordeeling](./K009-beoordeeling.md): Security beoordelingen van applicaties

## Gerelateerde Functionaliteiten
- [F004 - Applicatiebeheer](../Functionaliteiten/F004-applicatiebeheer.md)
- [F006 - Inzichten en Aanbevelingen](../Functionaliteiten/F006-inzichten-en-aanbevelingen.md)
