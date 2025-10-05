---
id: testen
title: Testhandleiding GEMMA Softwarecatalogus
sidebar_label: Testen
sidebar_position: 15
description: Uitgebreide testflow voor het testen van de GEMMA Softwarecatalogus functionaliteiten
keywords:
  - testen
  - testflow
  - acceptatietesten
  - gebruikerstesten
  - softwarecatalogus
---

# Testhandleiding GEMMA Softwarecatalogus

Deze handleiding beschrijft de complete testflow voor het testen van de GEMMA Softwarecatalogus. Elke stap verwijst naar de relevante functionaliteiten en PvE issues die worden getest.

## 🧪 Testomgeving

- **Frontend (Publiek)**: https://softwarecatalogus.accept.opencatalogi.nl/
- **Backend (Beheer)**: https://softwarecatalogus.accept.commonground.nu/
- **Testdata**: Gebruik fictieve organisatie- en gebruikersgegevens
- **Browser**: Chrome (aanbevolen voor consistente resultaten)

## 📋 Testflow Overzicht

| Stap | Beschrijving | Functionaliteit | PvE Issues |
|------|-------------|-----------------|------------|
| 1 | Browser voorbereiding | - | - |
| 2 | Organisatie registratie | F001 - Toegang Verkrijgen | [#139](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/139) |
| 3 | Organisatie activatie | F002 - Organisatie Inrichten | [#140](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/140), [#142](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/142) |
| 4 | Eerste inlog en wachtwoord | F003 - Gebruikersbeheer | [#63](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/63), [#65](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/65) |
| 5 | Collega's uitnodigen | F003 - Gebruikersbeheer | [#73](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/73) |
| 6 | Organisatie profiel invullen | F002 - Organisatie Inrichten | [#66](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/66) |
| 7 | Product aanmaken (single module) | F004 - Aanbod Beheer | [#5](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/5), [#17](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/17) |
| 8 | Product aanmaken (multi module) | F004 - Aanbod Beheer | [#18](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/18) |
| 9 | Dienst wizard doorlopen | F005 - Dienstenbeheer | [#35](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/35) |
| 10 | Koppeling wizard doorlopen | F013 - Gebruik Beheer | [#56](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/56) |
| 11 | Zoeken en resultaten controleren | F011 - Zoeken & Ontdekken | [#21](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/21), [#144](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/144) |
| 12 | AMEFF referentie applicaties | F014 - Data Migratie | [#70](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/70) |

---

## 🚀 Gedetailleerde Testflow

### Stap 1: Browser Voorbereiding

**Doel**: Zorgen voor een schone testomgeving zonder cache-interferentie

**Acties**:
1. **Open Chrome browser**
2. **Start nieuw incognito venster**: `Ctrl+Shift+N` (Windows/Linux) of `Cmd+Shift+N` (Mac)
3. **Controleer incognito status**: 
   - Venster moet donkere kleur hebben
   - Incognito icoon moet zichtbaar zijn
   - "Je browst privé" melding moet verschijnen
4. **Extra voorzorgsmaatregelen**:
   - Sluit alle andere browser vensters
   - Controleer dat er geen extensies actief zijn die data kunnen opslaan
   - Verifieer dat cookies en lokale opslag leeg zijn (F12 → Application → Storage)

**Verwacht resultaat**: Schone browser omgeving zonder bestaande sessiedata

**Functionaliteit**: N.v.t.  
**PvE Issues**: N.v.t.

---

### Stap 2: Organisatie Registratie

**Doel**: Test het registratieproces voor nieuwe leveranciers

**Acties**:
1. **Navigeer naar**: https://softwarecatalogus.accept.opencatalogi.nl/
2. **Klik op "Registreren"** (rechtsboven in het gebruikersmenu)
3. **Vul registratieformulier in**:
   - **Organisatienaam**: "Test Leverancier [Datum]" (bijv. "Test Leverancier 2025-10-02")
   - **Contactpersoon**: Fictieve naam en e-mailadres
   - **Beschrijving**: Korte beschrijving van de test organisatie
   - **Type software**: Selecteer relevante categorie
4. **Verstuur aanmelding**
5. **Controleer bevestigingsmelding**

**Verwacht resultaat**: 
- Succesvolle registratie met bevestigingsmelding
- Organisatie krijgt status "concept" in het systeem

**Functionaliteit**: [F001 - Toegang Verkrijgen](./F001-toegang-verkrijgen.md)  
**PvE Issues**: [#139](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/139) - Organisatiegegevens in concept registreren

**Testpunten**:
- [ ] Registratieformulier is compleet en gebruiksvriendelijk
- [ ] Validatie werkt correct (verplichte velden, e-mail formaat)
- [ ] Bevestigingsmelding wordt getoond
- [ ] Geen foutmeldingen tijdens registratie

---

### Stap 3: Organisatie Activatie (Backend)

**Doel**: Test het activatieproces door functioneel beheer

**Acties**:
1. **Navigeer naar**: https://softwarecatalogus.accept.commonground.nu/
2. **Log in** met functioneel beheerder account
3. **Open Softwarecatalogus app** (klik op catalogus icoon)
4. **Ga naar Organisaties** in het menu
5. **Zoek de zojuist geregistreerde organisatie**
6. **Controleer organisatie details**:
   - Status moet "concept" zijn
   - Alle ingevoerde gegevens moeten zichtbaar zijn
7. **Activeer organisatie**:
   - Klik op organisatie card
   - Klik op "Activeren" knop
   - Wacht tot activatie voltooid is (kan enkele minuten duren)

**Verwacht resultaat**: 
- Organisatie status verandert van "concept" naar "actief"
- Organisatie is nu operationeel in het systeem

**Functionaliteit**: [F002 - Organisatie Inrichten](./F002-organisatie-inrichten.md)  
**PvE Issues**: 
- [#140](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/140) - Overzicht organisaties met status 'concept'
- [#142](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/142) - Nieuwe organisaties en gebruikersaccounts aanmaken

**Testpunten**:
- [ ] Concept organisaties zijn zichtbaar in overzicht
- [ ] Organisatie details zijn correct overgenomen
- [ ] Activatieproces verloopt zonder fouten
- [ ] Status wordt correct bijgewerkt na activatie

---

### Stap 4: Eerste Inlog en Wachtwoord Instellen

**Doel**: Test gebruikersaccount activatie en wachtwoordbeheer

**Acties**:
1. **Blijf in backend omgeving**: https://softwarecatalogus.accept.commonground.nu/
2. **Ga naar de geactiveerde organisatie**
3. **Klik op "Bekijk contactpersonen"**
4. **Selecteer de hoofdgebruiker** (aangemaakt tijdens registratie)
5. **Reset wachtwoord**:
   - Klik op gebruiker
   - Klik op "Change Password"
   - **Optie A**: Genereer automatisch wachtwoord
   - **Optie B**: Stel handmatig wachtwoord in
   - Noteer het nieuwe wachtwoord
6. **Test inlog**:
   - Ga naar beheeromgeving van de organisatie
   - Log in met e-mailadres en nieuwe wachtwoord
   - Controleer toegang tot dashboard

**Verwacht resultaat**: 
- Wachtwoord kan succesvol worden ingesteld
- Gebruiker kan inloggen op beheeromgeving
- Dashboard is toegankelijk

**Functionaliteit**: [F003 - Gebruikersbeheer](./F003-gebruikersbeheer.md)  
**PvE Issues**: 
- [#63](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/63) - Eerste (beheer)account aanmaken/fiateren
- [#65](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/65) - Collega's toegang geven tot softwarecatalogus

**Testpunten**:
- [ ] Wachtwoord reset functionaliteit werkt
- [ ] Inlogproces verloopt soepel
- [ ] Dashboard laadt correct na inlog
- [ ] Gebruiker heeft juiste rechten (aanbod-beheerder)

---

### Stap 5: Collega's Uitnodigen

**Doel**: Test gebruikersbeheer en uitnodigingsfunctionaliteit

**Acties**:
1. **Ga naar "Contactpersonen"** in het menu
2. **Klik op "Contactpersoon toevoegen"**
3. **Vul gegevens fictieve collega in**:
   - **Voornaam**: "Test"
   - **Achternaam**: "Collega"
   - **E-mailadres**: test.collega@example.com
   - **Rol**: Selecteer gewenste rol
4. **Voeg contactpersoon toe**
5. **Controleer contactpersoon in lijst**
6. **Test wachtwoord instellen** voor nieuwe gebruiker:
   - Selecteer nieuwe contactpersoon
   - Stel wachtwoord in via "Change Password"
7. **Test inlog nieuwe gebruiker** (optioneel):
   - Log uit met hoofdaccount
   - Log in met nieuwe collega account

**Verwacht resultaat**: 
- Nieuwe contactpersoon wordt succesvol toegevoegd
- Wachtwoord kan worden ingesteld
- Nieuwe gebruiker kan inloggen (indien getest)

**Functionaliteit**: [F003 - Gebruikersbeheer](./F003-gebruikersbeheer.md)  
**PvE Issues**: [#73](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/73) - Meerdere contactpersonen registreren per pakket

**Testpunten**:
- [ ] Contactpersoon toevoegen werkt correct
- [ ] Alle verplichte velden worden gevalideerd
- [ ] Contactpersoon verschijnt in overzicht
- [ ] Wachtwoordbeheer werkt voor nieuwe gebruikers
- [ ] Verschillende gebruikersrollen kunnen worden toegewezen

---

### Stap 6: Organisatie Profiel Invullen

**Doel**: Test organisatie-informatie beheer en profiel completering

**Acties**:
1. **Ga naar "Mijn Organisatie"** in het menu
2. **Vul aanvullende organisatie-informatie in**:
   - **Logo**: Upload organisatie logo
   - **Website URL**: Voeg website toe
   - **Beschrijving**: Uitgebreide beschrijving
   - **Specialisaties**: Voeg expertise gebieden toe
   - **Certificeringen**: Voeg kwaliteitskeurmerken toe
3. **Samenwerkingen en Communities**:
   - **Zoek relevante samenwerkingen** in de lijst
   - **Geef lidmaatschap aan** bij een testsamenwerkingsverband
   - **Zoek communities** die passen bij de organisatie
   - **Meld lidmaatschap aan** bij een testcommunity
4. **Sla wijzigingen op**
5. **Controleer publieke organisatiepagina**:
   - Ga naar frontend
   - Zoek organisatie in organisatieoverzicht
   - Controleer of alle informatie correct wordt weergegeven

**Verwacht resultaat**: 
- Organisatie profiel is compleet en aantrekkelijk
- Lidmaatschappen zijn zichtbaar
- Publieke pagina toont alle informatie correct

**Functionaliteit**: [F002 - Organisatie Inrichten](./F002-organisatie-inrichten.md)  
**PvE Issues**: [#66](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/66) - Aanvullende organisatie-informatie delen

**Testpunten**:
- [ ] Alle organisatie-informatie kan worden ingevoerd
- [ ] Logo upload werkt correct
- [ ] Samenwerkingen kunnen worden geselecteerd
- [ ] Communities kunnen worden gevonden en geselecteerd
- [ ] Wijzigingen worden opgeslagen
- [ ] Publieke pagina toont correcte informatie

---

### Stap 7: Product Aanmaken (Enkele Module)

**Doel**: Test product aanmaak wizard voor eenvoudige producten

**Acties**:
1. **Ga naar "Producten"** in het menu
2. **Klik op "Nieuwe Applicatie"**
3. **Doorloop Product Wizard - Stap 1: Basisinformatie**:
   - **Naam**: "Test Applicatie Single Module"
   - **Beschrijving**: Uitgebreide beschrijving van het product
   - **Categorie**: Selecteer passende categorie
   - **Status**: "Actief"
4. **Stap 2: Technische Specificaties**:
   - **GEMMA Componenten**: Selecteer relevante referentiecomponenten
   - **Hosting Type**: Kies uit SaaS, On-premise, of Hybrid
   - **Technologie Stack**: Voeg technische details toe
5. **Stap 3: Documentatie en Media**:
   - **Screenshots**: Upload product screenshots
   - **Brochures**: Upload productbrochure (PDF)
   - **Handleidingen**: Voeg links naar documentatie toe
6. **Stap 4: Prijsmodel en Licenties**:
   - **Licentie Type**: Selecteer licentiemodel
   - **Prijsmodel**: Voeg prijsinformatie toe
   - **Kosten**: Specificeer kosten per gebruiker/maand
7. **Stap 5: Contactpersoon**:
   - **Selecteer contactpersoon**: Kies de eerder aangemaakte collega
   - **Rol**: Specificeer rol (bijv. "Product Manager")
8. **Stap 6: Overzicht en Publiceren**:
   - **Controleer alle gegevens**
   - **Publiceer applicatie**

**Verwacht resultaat**: 
- Product wordt succesvol aangemaakt
- Alle stappen van wizard werken correct
- Product is zichtbaar in productoverzicht

**Functionaliteit**: [F004 - Aanbod Beheer](./F004-applicatiebeheer.md)  
**PvE Issues**: 
- [#5](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/5) - Voor elk pakket contactpersoon aanwijzen
- [#17](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/17) - Informatie invullen

**Testpunten**:
- [ ] Wizard navigatie werkt soepel
- [ ] Alle velden kunnen worden ingevuld
- [ ] GEMMA componenten zijn selecteerbaar
- [ ] Bestandsuploads werken (screenshots, brochures)
- [ ] Contactpersoon kan worden toegewezen
- [ ] Product wordt gepubliceerd en is zichtbaar

---

### Stap 8: Product Aanmaken (Meerdere Modules)

**Doel**: Test product aanmaak voor complexe producten met modules

**Acties**:
1. **Maak hoofdproduct aan** (volg stap 7):
   - **Naam**: "Test Applicatie Multi Module"
   - **Type**: Selecteer "Modulair product"
2. **Voeg modules toe na publicatie**:
   - **Ga naar het aangemaakte product**
   - **Klik op "Modules beheren"**
   - **Voeg Module 1 toe**:
     - Naam: "Basis Module"
     - Beschrijving: Kernfunctionaliteit
     - Prijs: Basisprijs
   - **Voeg Module 2 toe**:
     - Naam: "Premium Module"  
     - Beschrijving: Uitgebreide functionaliteit
     - Prijs: Premium prijs
   - **Voeg Module 3 toe**:
     - Naam: "Integratie Module"
     - Beschrijving: Koppelingen met andere systemen
     - Prijs: Integratie kosten
3. **Configureer module afhankelijkheden**:
   - **Stel in welke modules verplicht zijn**
   - **Definieer optionele modules**
   - **Configureer module combinaties**
4. **Test module weergave**:
   - **Controleer productpagina** met alle modules
   - **Verifieer prijsberekening** per module combinatie

**Verwacht resultaat**: 
- Hoofdproduct met meerdere modules wordt aangemaakt
- Module beheer functionaliteit werkt correct
- Prijsberekening per module klopt

**Functionaliteit**: [F004 - Aanbod Beheer](./F004-applicatiebeheer.md)  
**PvE Issues**: [#18](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/18) - Geregistreerde pakketten selecteren en toevoegen

**Testpunten**:
- [ ] Modulair product kan worden aangemaakt
- [ ] Meerdere modules kunnen worden toegevoegd
- [ ] Module informatie is compleet invulbaar
- [ ] Module afhankelijkheden kunnen worden ingesteld
- [ ] Prijsberekening werkt per module
- [ ] Productpagina toont alle modules correct

---

### Stap 9: Dienst Wizard Doorlopen

**Doel**: Test diensten toevoegen aan bestaande producten

**Acties**:
1. **Ga naar "Diensten"** in het menu
2. **Klik op "Nieuwe Dienst"**
3. **Selecteer product**: Kies een van de eerder aangemaakte producten
4. **Doorloop Dienst Wizard**:
   - **Stap 1: Dienst Type**:
     - Type: Hosting, Support, Implementatie, Training
     - Naam: "Premium Support Dienst"
     - Beschrijving: Uitgebreide supportdienst
   - **Stap 2: Dienst Details**:
     - **SLA**: Service Level Agreement details
     - **Beschikbaarheid**: 24/7, kantooruren, etc.
     - **Response tijd**: Maximale reactietijd
   - **Stap 3: Prijsmodel**:
     - **Prijs per maand/jaar**
     - **Setup kosten**
     - **Variabele kosten**
   - **Stap 4: Regio en Beschikbaarheid**:
     - **Geografische dekking**
     - **Taalondersteuning**
     - **Lokale aanwezigheid**
5. **Publiceer dienst**
6. **Herhaal voor verschillende dienst types**:
   - Implementatie dienst
   - Training dienst
   - Hosting dienst

**Verwacht resultaat**: 
- Verschillende diensten worden succesvol toegevoegd
- Diensten zijn gekoppeld aan juiste producten
- Prijsmodellen zijn correct geconfigureerd

**Functionaliteit**: [F005 - Dienstenbeheer](./F005-dienstenbeheer.md)  
**PvE Issues**: [#35](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/35) - Dienst toevoegen

**Testpunten**:
- [ ] Dienst wizard werkt voor alle dienst types
- [ ] Diensten kunnen aan producten worden gekoppeld
- [ ] SLA en service details kunnen worden ingevoerd
- [ ] Prijsmodellen zijn flexibel configureerbaar
- [ ] Geografische instellingen werken correct
- [ ] Diensten zijn zichtbaar bij gekoppelde producten

---

### Stap 10: Koppeling Wizard Doorlopen

**Doel**: Test koppelingen registreren tussen applicaties

**Acties**:
1. **Ga naar "Koppelingen"** in het menu
2. **Klik op "Nieuwe Koppeling"**
3. **Doorloop Koppeling Wizard**:
   - **Stap 1: Bronsysteem**:
     - Selecteer een van uw producten als bronsysteem
     - Specificeer versie en configuratie
   - **Stap 2: Doelsysteem**:
     - Zoek en selecteer doelsysteem uit catalogus
     - Of voeg extern systeem toe
   - **Stap 3: Koppeling Type**:
     - **Type**: API, Bestandsuitwisseling, Database, Webservice
     - **Richting**: Unidirectioneel of bidirectioneel
     - **Frequentie**: Real-time, batch, scheduled
   - **Stap 4: Technische Details**:
     - **Protocol**: REST, SOAP, FTP, etc.
     - **Authenticatie**: API key, OAuth, certificaten
     - **Data formaat**: JSON, XML, CSV
   - **Stap 5: Standaarden**:
     - **Gebruikt standaard**: Ja/Nee
     - **Welke standaard**: StUF, RSGB, etc.
     - **Toelichting**: Beschrijving van implementatie
4. **Registreer koppeling**
5. **Maak meerdere koppelingen** met verschillende configuraties

**Verwacht resultaat**: 
- Koppelingen worden succesvol geregistreerd
- Verschillende koppeling types werken
- Standaarden kunnen worden gespecificeerd

**Functionaliteit**: [F013 - Gebruik Beheer](./F013-gebruik-beheer.md)  
**PvE Issues**: [#56](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/56) - Koppelingen registreren tussen applicaties

**Testpunten**:
- [ ] Koppeling wizard doorloopt alle stappen
- [ ] Bron- en doelsystemen kunnen worden geselecteerd
- [ ] Verschillende koppeling types zijn beschikbaar
- [ ] Technische details kunnen worden gespecificeerd
- [ ] Standaarden kunnen worden aangegeven
- [ ] Koppelingen zijn zichtbaar in overzichten

---

### Stap 11: Zoeken en Resultaten Controleren

**Doel**: Test zoekfunctionaliteit en resultaatpagina's

**Acties**:
1. **Ga naar frontend**: https://softwarecatalogus.accept.opencatalogi.nl/
2. **Test Basis Zoeken**:
   - **Gebruik zoekbalk**: Zoek op productnaam
   - **Zoek op organisatie**: Zoek uw test organisatie
   - **Zoek op categorie**: Browse per domein
3. **Test Geavanceerd Zoeken**:
   - **Combineer filters**: Categorie + hosting type
   - **Filter op prijs**: Prijs ranges
   - **Filter op features**: Specifieke functionaliteiten
4. **Controleer Zoekresultaten**:
   - **Product resultaten**: Toon juiste informatie
   - **Organisatie resultaten**: Correct profiel
   - **Relevantie**: Resultaten zijn relevant voor zoekopdracht
5. **Test Individuele Resultaat Pagina's**:
   - **Klik op product**: Open product detail pagina
   - **Controleer alle secties**:
     - Productinformatie
     - Modules (indien van toepassing)
     - Diensten
     - Koppelingen
     - Contactinformatie
     - GEMMA componenten
     - Screenshots en documentatie
   - **Test alle links**: Interne en externe links
   - **Controleer verbanden**: Gerelateerde producten, leverancier info
6. **Test Organisatie Pagina**:
   - **Klik op organisatie**: Open organisatie profiel
   - **Controleer secties**:
     - Organisatie informatie
     - Product portfolio
     - Diensten overzicht
     - Samenwerkingen
     - Contactgegevens

**Verwacht resultaat**: 
- Zoekfunctionaliteit werkt accuraat
- Alle resultaatpagina's tonen correcte informatie
- Verbanden tussen entiteiten zijn zichtbaar
- Navigatie tussen pagina's werkt soepel

**Functionaliteit**: [F011 - Zoeken & Ontdekken](./F011-zoeken-en-ontdekken.md)  
**PvE Issues**: 
- [#21](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/21) - Zoeken en filteren in gebruikte pakketten
- [#144](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/144) - Overzicht organisaties met zoek- en filteropties

**Testpunten**:
- [ ] Basis zoekfunctionaliteit werkt
- [ ] Geavanceerde filters functioneren correct
- [ ] Zoekresultaten zijn relevant en compleet
- [ ] Product detail pagina's tonen alle informatie
- [ ] Modules worden correct weergegeven
- [ ] Diensten zijn zichtbaar bij producten
- [ ] Koppelingen worden getoond
- [ ] Organisatie pagina's zijn compleet
- [ ] Alle links en navigatie werken
- [ ] Responsive design werkt op verschillende schermformaten

---

### Stap 12: AMEFF Referentie Applicaties

**Doel**: Test GEMMA/AMEFF integratie en referentie applicatie selectie

**Acties**:
1. **Ga terug naar product wizard** of **bewerk bestaand product**
2. **Navigeer naar GEMMA/Architectuur sectie**:
   - **Open GEMMA componenten selectie**
   - **Controleer beschikbare referentie applicaties**
3. **Test Referentie Applicatie Selectie**:
   - **Browse door GEMMA lagen**:
     - Gebruikersinteractie laag
     - Bedrijfsprocessen laag  
     - Gegevens laag
   - **Selecteer relevante componenten**:
     - Kies componenten die passen bij uw product
     - Selecteer meerdere componenten indien van toepassing
   - **Controleer component details**:
     - Beschrijving van component
     - Relaties met andere componenten
     - Links naar GEMMA Online (indien beschikbaar)
4. **Test Component Filtering**:
   - **Filter op domein**: Burgerzaken, Financiën, etc.
   - **Filter op laag**: Specificeer architectuur laag
   - **Zoek componenten**: Gebruik zoekfunctionaliteit
5. **Valideer Opgeslagen Selecties**:
   - **Sla product op** met geselecteerde componenten
   - **Controleer product pagina**: GEMMA componenten zichtbaar
   - **Test publieke weergave**: Componenten tonen op frontend

**Verwacht resultaat**: 
- GEMMA referentie applicaties zijn beschikbaar
- Componenten kunnen worden geselecteerd en opgeslagen
- Filtering en zoeken in componenten werkt
- Selecties zijn zichtbaar op product pagina's

**Functionaliteit**: [F014 - Data Migratie](./F014-data-migratie.md)  
**PvE Issues**: [#70](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/70) - Ontsluiten architectuur concepten (filteren)

**Testpunten**:
- [ ] GEMMA componenten zijn beschikbaar in wizard
- [ ] Componenten kunnen worden geselecteerd
- [ ] Filtering op domein en laag werkt
- [ ] Zoeken in componenten functioneert
- [ ] Component details zijn informatief
- [ ] Selecties worden correct opgeslagen
- [ ] GEMMA componenten zijn zichtbaar op product pagina
- [ ] Links naar GEMMA Online werken (indien beschikbaar)

---

## ✅ Test Afronding

### Testresultaten Documenteren

**Acties**:
1. **Maak screenshots** van belangrijke stappen
2. **Documenteer gevonden issues** met:
   - Stap waar issue optrad
   - Verwacht vs werkelijk gedrag
   - Browser en omgeving details
3. **Controleer test coverage**:
   - Alle PvE issues getest?
   - Alle functionaliteiten doorlopen?
   - Edge cases onderzocht?

### Opruimen Testdata

**Acties**:
1. **Markeer testdata**: Voeg "TEST" prefix toe aan namen
2. **Documenteer testaccounts**: Voor hergebruik in toekomstige tests
3. **Archiveer testresultaten**: Voor referentie

---

## 📊 Test Coverage Matrix

| Functionaliteit | PvE Issues | Test Status | Opmerkingen |
|------------------|------------|-------------|-------------|
| F001 - Toegang Verkrijgen | #139 | ⏳ Te testen | Registratie flow |
| F002 - Organisatie Inrichten | #66, #140, #142 | ⏳ Te testen | Profiel + activatie |
| F003 - Gebruikersbeheer | #63, #65, #73 | ⏳ Te testen | Wachtwoord + collega's |
| F004 - Aanbod Beheer | #5, #17, #18 | ⏳ Te testen | Single + multi module |
| F005 - Dienstenbeheer | #35 | ⏳ Te testen | Dienst wizard |
| F011 - Zoeken & Ontdekken | #21, #144 | ⏳ Te testen | Zoeken + resultaten |
| F013 - Gebruik Beheer | #56 | ⏳ Te testen | Koppelingen |
| F014 - Data Migratie | #70 | ⏳ Te testen | AMEFF componenten |

---

## 🆘 Troubleshooting

### Veelvoorkomende Problemen

**Probleem**: Organisatie activatie duurt lang  
**Oplossing**: Wacht tot 5 minuten, ververs pagina, controleer systeem logs

**Probleem**: Wachtwoord reset werkt niet  
**Oplossing**: Controleer gebruiker status, probeer opnieuw genereren

**Probleem**: Uploads falen  
**Oplossing**: Controleer bestandsgrootte (<10MB), ondersteunde formaten

**Probleem**: GEMMA componenten laden niet  
**Oplossing**: Controleer internet connectie, ververs browser cache

### Contact

Voor technische problemen tijdens testen:
- **Functioneel Beheer**: Via catalogus contactformulier
- **Ontwikkelteam**: GitHub issues aanmaken
- **Documentatie**: Raadpleeg relevante functionaliteit pagina's

---

*Deze testhandleiding wordt regelmatig bijgewerkt op basis van nieuwe functionaliteiten en testresultaten.*
