---
id: beoordeeling
title: K009 - Beoordeeling
sidebar_label: K009 - Beoordeeling
sidebar_position: 9
description: Beoordelingen en waarderingen van modules, diensten en koppelingen
keywords:
  - beoordeeling
  - waardering
  - review
  - feedback
  - kwaliteit
  - modules
  - diensten
  - softwarecatalogus
  - GEMMA
---

# K009 - Beoordeeling

## Beschrijving
Een beoordeling is een waardering en evaluatie van modules, diensten, koppelingen of gebruik door gebruikers. Beoordelingen helpen andere gebruikers bij het maken van geïnformeerde keuzes over software en diensten.

## Schema Eigenschappen

<ApiSchema id="swc" example pointer="#/components/schemas/beoordeeling" />

### Basis Informatie
- **Naam**: Naam van de beoordeling (verplicht)
- **Korte beschrijving**: Korte beschrijving van de beoordeling
- **Uitgebreide beschrijving**: Uitgebreide beschrijving in markdown formaat
- **Waardering**: Waardering van 1 tot en met 10 (verplicht)

### Relaties (Optioneel)
- **Modules**: Specifieke modules die beoordeeld worden
- **Diensten**: Specifieke diensten die beoordeeld worden
- **Koppelingen**: Specifieke koppelingen die beoordeeld worden
- **Gebruik**: Het specifieke gebruik dat beoordeeld wordt

## Waardering Schaal

### ⭐ 1-2: Zeer Slecht
Ernstige problemen die gebruik ontmoedigen.

**Kenmerken:**
- Fundamentele functionaliteit werkt niet
- Slechte gebruikerservaring
- Geen adequate ondersteuning
- Niet geschikt voor productie gebruik

### ⭐⭐ 3-4: Slecht
Significante problemen maar beperkt bruikbaar.

**Kenmerken:**
- Belangrijke functionaliteit ontbreekt
- Frequente problemen en bugs
- Beperkte documentatie
- Onvoldoende ondersteuning

### ⭐⭐⭐ 5-6: Gemiddeld
Voldoet aan basis verwachtingen met enkele tekortkomingen.

**Kenmerken:**
- Basis functionaliteit werkt
- Enkele bugs en beperkingen
- Adequate documentatie
- Standaard ondersteuning

### ⭐⭐⭐⭐ 7-8: Goed
Solide oplossing die goed voldoet aan behoeften.

**Kenmerken:**
- Alle belangrijke functionaliteit aanwezig
- Stabiel en betrouwbaar
- Goede documentatie
- Responsieve ondersteuning

### ⭐⭐⭐⭐⭐ 9-10: Uitstekend
Excellente oplossing die verwachtingen overtreft.

**Kenmerken:**
- Uitgebreide functionaliteit
- Zeer stabiel en performant
- Uitstekende documentatie
- Proactieve ondersteuning

## Beoordelings Categorieën

### 🔧 Functionaliteit
Beoordeling van de beschikbare features en mogelijkheden.

**Aspecten:**
- Compleetheid van functionaliteit
- Gebruiksgemak en intuïtiviteit
- Flexibiliteit en aanpasbaarheid
- Integratie mogelijkheden

### 🛡️ Betrouwbaarheid
Beoordeling van stabiliteit en beveiliging.

**Aspecten:**
- Uptime en beschikbaarheid
- Data integriteit en backup
- Security implementatie
- Error handling

### 🚀 Performance
Beoordeling van snelheid en schaalbaarheid.

**Aspecten:**
- Response tijden
- Throughput capaciteit
- Resource gebruik
- Schaalbaarheid

### 🤝 Ondersteuning
Beoordeling van service en support kwaliteit.

**Aspecten:**
- Documentatie kwaliteit
- Training beschikbaarheid
- Helpdesk responsiviteit
- Community ondersteuning

## Persona Perspectief

### 🏛️ Voor Gemeenten (Maria - ICT-coördinator)
- **Doel**: Ervaringen van andere gemeenten gebruiken voor software selectie
- **Gebruik**: Beoordelingen lezen en eigen ervaringen delen
- **Belang**: Peer feedback en lessons learned van collega gemeenten

### 🏢 Voor Leveranciers (Jan - Directeur ICT Solutions)
- **Doel**: Feedback verzamelen en reputatie opbouwen
- **Gebruik**: Klant tevredenheid monitoren en verbeteren
- **Belang**: Klanttevredenheid en marktpositie versterken

### 🤝 Voor Samenwerkingen (Linda - Samenwerking Coördinator)
- **Doel**: Gezamenlijke evaluaties voor leden
- **Gebruik**: Geconsolideerde beoordelingen namens meerdere gemeenten
- **Belang**: Collectieve ervaring en onderhandelingspositie

### 🔒 Voor Security Officers (Mark - Information Security Officer)
- **Doel**: Security aspecten van software beoordelen
- **Gebruik**: Security gerichte beoordelingen schrijven en lezen
- **Belang**: Security awareness en best practices delen

### 🏗️ Voor Architectuur Experts (Sarah - Enterprise Architect)
- **Doel**: Architectuur kwaliteit en compliance beoordelen
- **Gebruik**: Technische beoordelingen op architectuur aspecten
- **Belang**: Architectuur consistentie en GEMMA compliance

## Gerelateerde Concepten
- [K002 - Applicatie](./K002-applicatie.md): Applicaties die beoordeeld worden (inclusief compliancy)
- [K003 - Dienst](./K003-dienst.md): Diensten die beoordeeld worden
- [K004 - Gebruik](./K004-gebruik.md): Gebruik ervaringen die beoordeeld worden
- [K005 - Koppeling](./K005-koppeling.md): Koppelingen die beoordeeld worden
- [K008 - Kwetsbaarheid](./K008-kwetsbaarheid.md): Security aspecten in beoordelingen

## Gerelateerde Functionaliteiten
- [F004 - Applicatiebeheer](../Functionaliteiten/F004-applicatiebeheer.md)
- [F005 - Dienstenbeheer](../Functionaliteiten/F005-dienstenbeheer.md)
- [F006 - Inzichten en Aanbevelingen](../Functionaliteiten/F006-inzichten-en-aanbevelingen.md)
