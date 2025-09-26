---
id: klantreis-leverancier
title: Klantreis Leverancier
sidebar_label: Leverancier
sidebar_position: 4
description: Klantreis van een leverancier in de GEMMA Softwarecatalogus
keywords:
  - klantreis
  - leverancier
  - registratie
  - applicaties
  - diensten
  - softwarecatalogus
  - GEMMA
---

# 🧭 Klantreis leverancier > GEMMA Softwarecatalogus

Dit document beschrijft de klantreis van een leverancier in de GEMMA Softwarecatalogus.

## 👤 Persona: De Ambitieuze Leverancier

**Naam**: Jan Pietersen  
**Functie**: Directeur ICT Solutions BV  
**Ervaring**: 15 jaar gemeentelijke software  
**Motivatie**: "Ik wil dat gemeenten ons gemakkelijk kunnen vinden en zien wat we te bieden hebben. We maken goede software, maar marketing is niet onze sterkste kant."

### Achtergrond
Jan runt een middelgroot ICT-bedrijf dat gespecialiseerd is in software voor gemeenten. Ze hebben een uitstekende vergunningapplicatie ontwikkeld, maar merken dat gemeenten hen niet altijd weten te vinden. Ze horen van klanten over andere leveranciers en realiseren zich dat ze meer zichtbaar moeten zijn in de markt.

### Doelen
- Zichtbaarheid vergroten bij gemeenten
- Nieuwe klanten werven
- Bestaande klanten beter bedienen
- Samenwerken met andere leveranciers

## 📖 Het Verhaal van Jan

*"We maken al jaren software voor gemeenten. Onze vergunningapplicatie draait bij 15 gemeenten en ze zijn er heel tevreden over. Maar we merken dat nieuwe gemeenten ons niet vinden. Dan horen we over de GEMMA Softwarecatalogus - één plek waar alle gemeenten kijken naar software. Dit is onze kans om echt zichtbaar te worden!"*

## Overzicht Klantreis

```mermaid
flowchart TD
    A[Start: Jan ontdekt de catalogus] --> F001[F001 - Toegang Verkrijgen]
    F001 --> PARALLEL[Parallelle Activiteiten]
    
    %% Basis inrichting
    PARALLEL --> F002[F002 - Organisatie Inrichten]
    PARALLEL --> F003[F003 - Gebruikersbeheer]
    
    %% Aanbod beheer
    F002 --> AANBOD[Aanbod Beheer]
    F003 --> AANBOD
    
    AANBOD --> F004[F004 - Aanbod Beheer]
    AANBOD --> F005[F005 - Dienstenbeheer]
    
    %% Klant beheer
    F004 --> KLANT[Klant Beheer]
    F005 --> KLANT
    KLANT --> F010[F010 - Lidmaatschapsbeheer]
    KLANT --> GEBRUIK[Gebruik Suggereren]
    
    %% Overige functionaliteiten
    F010 --> OVERIG[Overige Functionaliteiten]
    GEBRUIK --> OVERIG
    
    OVERIG --> F006[F006 - Inzichten en Aanbevelingen]
    OVERIG --> F007[F007 - Data Export en Import]
    
    F006 --> END[Jan heeft succesvolle aanwezigheid]
    F007 --> END
    
    %% Styling
    style A fill:#e1f5fe
    style END fill:#c8e6c9
    style PARALLEL fill:#fff3e0
    style AANBOD fill:#e8f5e8
    style KLANT fill:#f3e5f5
    style OVERIG fill:#ffecb3
```

---

## 🎯 Functionaliteiten voor Leveranciers

### [F001 - Toegang Verkrijgen](../Functionaliteiten/F001-toegang-verkrijgen.md)
*"Ik ga naar de website en zie een aanmeldformulier. Spannend! Ik vul alles in: onze bedrijfsgegevens, wat we doen, welke software we maken. Dan druk ik op 'verzenden' en... wachten maar. Worden we geaccepteerd?"*

Jan meldt zijn bedrijf aan via het registratieformulier, bevestigt zijn e-mail, en wacht op goedkeuring van VNG.

*"Yes! Een e-mail: 'Gefeliciteerd, u bent geaccepteerd!' Ik krijg inloggegevens en kan voor het eerst inloggen. Het voelt als de eerste dag op een nieuwe school - alles is nieuw en opwindend."*

### [F003 - Gebruikersbeheer](../Functionaliteiten/F003-gebruikersbeheer.md)
*"Ik ben niet de enige die met de catalogus gaat werken. Onze sales manager moet klanten kunnen vinden en benaderen, onze technisch directeur moet applicaties kunnen toevoegen, en onze support medewerkers moeten kunnen zien welke klanten welke software gebruiken."*

Jan nodigt zijn team uit en geeft iedereen de juiste rechten voor hun rol.

## 🎯 Aanbod Beheer

### [F002 - Organisatie Inrichten](../Functionaliteiten/F002-organisatie-inrichten.md)
*"Nu ik binnen ben, moet ik ons bedrijf goed neerzetten. Ik nodig mijn collega's uit - onze sales manager moet ook toegang hebben, en onze technisch directeur. We vullen ons profiel aan: logo, certificeringen, contactgegevens. Het is net als LinkedIn, maar dan voor gemeentelijke software!"*

Jan richt het bedrijfsprofiel in, nodigt zijn team uit, en zorgt dat alle certificeringen en kwaliteitskeurmerken zichtbaar zijn.

### [F004 - Aanbod Beheer](../Functionaliteiten/F004-applicatiebeheer.md)
*"Dit is het moment waar ik naar heb uitgekeken! Ik ga onze software toevoegen aan de catalogus. Dit gaat over het aanmaken en beheren van ons aanbod - applicaties, modules, en alles wat we ontwikkeld hebben."*

Jan beheert het software-aanbod:
- **Applicaties aanmaken**: Nieuwe software toevoegen aan de catalogus
- **Modules toevoegen**: Uitbreidingen en add-ons bij applicaties plaatsen
- **GEMMA koppeling**: Software koppelen aan relevante GEMMA componenten
- **Hosting opties**: Specificeren of software SaaS, on-premise, of hybrid is
- **Documentatie**: Handleidingen, API docs, en technische specificaties uploaden

*"Het is alsof ik een etalage inricht - alles moet perfect zijn want gemeenten gaan dit zien! Elke applicatie die we toevoegen is een kans om nieuwe klanten te werven."*

### [F005 - Dienstenbeheer](../Functionaliteiten/F005-dienstenbeheer.md)
*"Interessant! Ik zie dat er al applicaties van andere leveranciers staan waar wij diensten voor kunnen leveren. We bieden bijvoorbeeld hosting aan, dus ik ga onze hostingdiensten toevoegen bij relevante applicaties."*

Jan ontdekt dat ze niet alleen hun eigen software kunnen promoten, maar ook diensten kunnen aanbieden bij software van anderen.

## 👥 Klant Beheer
*"Nu ik mijn aanbod op orde heb, wil ik actief klanten gaan werven en bestaande klanten beter bedienen. De catalogus biedt interessante mogelijkheden om klanten te vinden en te ondersteunen."*

### Gebruik Suggereren voor Klanten
*"Ik zie dat gemeente Voorbeeldstad onze vergunningapplicatie nog niet gebruikt, maar wel een vergelijkbare oplossing heeft. Misschien kan ik hen benaderen? En voor onze bestaande klanten kan ik gebruik registreren zodat andere gemeenten zien dat onze software echt wordt gebruikt."*

Jan beheert klantrelaties:
- **Potentiële klanten identificeren**: Gemeenten vinden die baat zouden hebben bij hun software
- **Gebruik suggereren**: Voor bestaande klanten gebruik registreren in de catalogus
- **Referenties tonen**: Laten zien welke gemeenten hun software succesvol gebruiken
- **Klanten ondersteunen**: Bestaande klanten helpen bij optimaal gebruik

### [F010 - Lidmaatschapsbeheer](../Functionaliteiten/F010-lidmaatschapsbeheer.md)
*"Ik zie interessante communities die zich bezighouden met onderwerpen waar wij expertise in hebben. Als we lid worden, kunnen we kennis delen en misschien nieuwe samenwerkingen aangaan."*

Jan verkent lidmaatschappen:
- **Communities verkennen**: Zoeken naar relevante ontwikkelcommunities
- **Lidmaatschap aangeven**: Aangeven dat het bedrijf lid wil worden
- **Kennis delen**: Bijdragen aan community projecten en discussies
- **Netwerk uitbreiden**: Samenwerken met andere leveranciers en gemeenten

## 🔧 Overige Functionaliteiten
*"Nu ik de basis op orde heb en actief klanten bedien, kan ik gebruik maken van de meer geavanceerde functies voor analyse, promotie en data-uitwisseling."*

### [F006 - Inzichten en Aanbevelingen](../Functionaliteiten/F006-inzichten-en-aanbevelingen.md)
*"Een paar weken later krijg ik een melding: 'Gemeente Voorbeeld heeft interesse getoond in uw applicatie!' Dit is fantastisch - de catalogus werkt! Ik kan zien welke gemeenten naar onze software kijken en kan ze direct benaderen. Het is alsof ik een dashboard heb van potentiële klanten."*

Jan gebruikt de promotie functionaliteiten om zijn software onder de aandacht te brengen en krijgt inzicht in welke gemeenten interesse tonen.

### [F007 - Data Export en Import](../Functionaliteiten/F007-data-export-import.md)
*"Nu we actief zijn in de catalogus, willen we ook data kunnen uitwisselen. We kunnen ons applicatielandschap exporteren om te delen met partners, en we kunnen landschappen importeren van gemeenten die met ons willen samenwerken."*

Jan gebruikt de export functionaliteiten om data te delen met partners en klanten.

---

## 🎉 Resultaat

Na het doorlopen van deze reis heeft Jan:
- ✅ Zichtbaarheid bij alle Nederlandse gemeenten
- ✅ Gestructureerde manier om nieuwe klanten te werven
- ✅ Inzicht in de markt en concurrentie
- ✅ Mogelijkheden voor samenwerking met andere leveranciers
- ✅ Professionele uitstraling richting gemeenten

*"De softwarecatalogus heeft ons bedrijf echt op de kaart gezet. We krijgen nu regelmatig aanvragen van gemeenten die ons gevonden hebben via de catalogus. Het is de beste marketing investering die we ooit hebben gedaan - en het kost ons niets!"*

## 🎯 Voordelen van Parallelle Aanpak

Het parallelle model voor leveranciers biedt verschillende voordelen:

### ⚡ **Efficiëntie**
- Teams kunnen gelijktijdig werken aan verschillende aspecten
- Snellere time-to-market voor nieuwe applicaties
- Optimaal gebruik van beschikbare resources

### 🎯 **Flexibiliteit**
- Prioriteiten kunnen worden aangepast zonder andere stromen te blokkeren
- Verschillende teamleden kunnen zich focussen op hun expertise
- Iteratieve verbetering van verschillende onderdelen

### 📈 **Schaalbaarheid**
- Nieuwe applicaties kunnen worden toegevoegd zonder bestaande te verstoren
- Organisatie-informatie kan worden bijgewerkt onafhankelijk van productlanceringen
- Diensten kunnen worden uitgebreid naar meerdere applicaties tegelijk