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
| 3 | Organisatie activatie + gebruikersbeheer | F002 - Organisatie Inrichten, F003 - Gebruikersbeheer | [#140](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/140), [#142](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/142), [#63](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/63), [#64](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/64), [#65](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/65) |
| 4 | Eerste inlog en wachtwoord | F003 - Gebruikersbeheer | [#63](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/63), [#65](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/65) |
| 5 | Collega's uitnodigen | F003 - Gebruikersbeheer | [#73](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/73) |
| 6 | Organisatie profiel invullen | F002 - Organisatie Inrichten | [#66](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/66) |
| 7 | Product aanmaken (single module) | F004 - Aanbod Beheer | [#5](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/5), [#17](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/17) |
| 8 | Product aanmaken (multi module) | F004 - Aanbod Beheer | [#18](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/18) |
| 9 | Dienst wizard doorlopen | F005 - Dienstenbeheer | [#35](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/35) |
| 10 | Koppeling wizard doorlopen | F013 - Gebruik Beheer | [#56](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/56) |
| 11 | Excel export testen | F007 - Data Export en Import | [#15](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/15) |
| 12 | Zoeken en resultaten controleren | F011 - Zoeken & Ontdekken | [#21](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/21), [#144](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/144) |
| 13 | AMEFF referentie applicaties | F014 - Data Migratie | [#70](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/70) |

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

### Stap 3: Organisatie Activatie en Gebruikersbeheer (Backend)

**Doel**: Test het activatieproces en volledige organisatie/gebruikersbeheer functionaliteiten

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
8. **Test Organisatie Beheer Functionaliteiten**:
   - **Ga naar de geactiveerde organisatie**
   - **Klik op "Bekijk contactpersonen"**
   
   **A. Gebruiker Wachtwoord Beheer:**
   - Selecteer de hoofdgebruiker (aangemaakt tijdens registratie)
   - Klik op "Change Password"
   - Stel nieuw wachtwoord in (bijvoorbeeld: "Test123!")
   - Noteer het wachtwoord voor stap 4
   
   **B. Nieuwe Gebruikers Toevoegen:**
   - Klik op "Nieuwe contactpersoon toevoegen"
   - Vul gegevens in:
     - Voornaam: "Backend"
     - Achternaam: "Testgebruiker"
     - Email: "backend.test@example.com"
     - Telefoonnummer: "+31612345678"
   - Sla contactpersoon op
   - **Converteer naar gebruiker**:
     - Selecteer de nieuwe contactpersoon
     - Klik op "Omzetten naar gebruiker"
     - Stel wachtwoord in
     - Selecteer gebruikersgroep/rol
   
   **C. Gebruiker Status Beheer:**
   - **Activeren gebruiker**: Zet status op "Actief"
   - **Deactiveren gebruiker**: Test status wijziging naar "Inactief"
   - **Heractiveren**: Zet terug naar "Actief" voor verdere tests
   
   **D. Groepen en Rollen Beheer:**
   - **Bekijk beschikbare groepen**: Admin, Gebruiker, etc.
   - **Wijzig gebruikersgroep**: Test verschillende rollen
   - **Controleer rechten**: Verifieer dat rechten correct worden toegewezen
   
   **E. Organisatie Status Beheer:**
   - **Test organisatie deactiveren**: Zet organisatie status op "Inactief"
   - **Controleer gevolgen**: Gebruikers kunnen niet meer inloggen
   - **Heractiveer organisatie**: Zet terug naar "Actief" voor verdere tests

**Verwacht resultaat**: 
- Organisatie status verandert van "concept" naar "actief"
- Organisatie is nu operationeel in het systeem
- Gebruiker wachtwoord is succesvol ingesteld
- Nieuwe gebruikers kunnen worden toegevoegd en geconverteerd
- Gebruiker status beheer werkt correct (activeren/deactiveren)
- Groepen en rollen kunnen worden toegewezen
- Organisatie kan worden gedeactiveerd en hergeactiveerd

**Functionaliteit**: [F002 - Organisatie Inrichten](./F002-organisatie-inrichten.md), [F003 - Gebruikersbeheer](./F003-gebruikersbeheer.md)  
**PvE Issues**: 
- [#140](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/140) - Overzicht organisaties met status 'concept'
- [#142](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/142) - Nieuwe organisaties en gebruikersaccounts aanmaken
- [#63](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/63) - Eerste (beheer)account aanmaken/fiateren
- [#64](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/64) - Meerdere type gebruikersrollen met rechten
- [#65](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/65) - Collega's toegang geven tot softwarecatalogus

**Testpunten**:
- [ ] Concept organisaties zijn zichtbaar in overzicht
- [ ] Organisatie details zijn correct overgenomen
- [ ] Activatieproces verloopt zonder fouten
- [ ] Status wordt correct bijgewerkt na activatie
- [ ] Gebruiker wachtwoord kan worden ingesteld
- [ ] Nieuwe contactpersonen kunnen worden toegevoegd
- [ ] Contactpersonen kunnen worden omgezet naar gebruikers
- [ ] Gebruikers kunnen worden geactiveerd en gedeactiveerd
- [ ] Verschillende gebruikersgroepen/rollen zijn beschikbaar
- [ ] Groepen kunnen worden toegewezen aan gebruikers
- [ ] Organisatie kan worden gedeactiveerd
- [ ] Gedeactiveerde organisatie voorkomt gebruiker inlog
- [ ] Organisatie kan worden hergeactiveerd

---

### Stap 4: Eerste Inlog

**Doel**: Test eerste inlog met het in stap 3 ingestelde wachtwoord

**Acties**:
1. **Ga naar frontend**: https://softwarecatalogus.accept.opencatalogi.nl/
2. **Klik op "Inloggen"** (rechtsboven)
3. **Voer credentials in**:
   - **E-mailadres**: Het geregistreerde e-mailadres uit stap 2
   - **Wachtwoord**: Het wachtwoord dat in stap 3 is ingesteld
4. **Controleer inlog**:
   - Dashboard moet laden
   - Gebruikersnaam moet zichtbaar zijn rechtsboven
   - Menu opties moeten beschikbaar zijn
5. **Verken dashboard**: Bekijk beschikbare functionaliteiten

**Verwacht resultaat**: 
- Inlog verloopt succesvol
- Dashboard is toegankelijk
- Gebruiker heeft juiste rechten (aanbod-beheerder)

**Functionaliteit**: [F003 - Gebruikersbeheer](./F003-gebruikersbeheer.md)  
**PvE Issues**: 
- [#63](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/63) - Eerste (beheer)account aanmaken/fiateren
- [#65](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/65) - Collega's toegang geven tot softwarecatalogus

**Testpunten**:
- [ ] Inlogproces verloopt soepel
- [ ] Dashboard laadt correct na inlog
- [ ] Gebruiker heeft juiste rechten (aanbod-beheerder)
- [ ] Menu opties zijn zichtbaar en toegankelijk

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
6. **Wachtwoord instellen voor collega's** (indien nodig voor test inloggen):
   - **Belangrijk**: Wachtwoorden kunnen NIET direct worden ingesteld in de frontend
   - **Security feature**: Dit is een beveiligingsmaatregel
   - **Procedure**:
     - Ga terug naar backend: https://softwarecatalogus.accept.commonground.nu/
     - Zoek de organisatie en bijbehorende gebruikers
     - Stel wachtwoorden in voor de nieuwe gebruikers via "Change Password"
     - Noteer de inloggegevens voor later gebruik
7. **Test inlog nieuwe gebruiker** (optioneel):
   - Log uit met hoofdaccount
   - Log in met nieuwe collega account en ingesteld wachtwoord

**Verwacht resultaat**: 
- Nieuwe contactpersoon wordt succesvol toegevoegd
- Wachtwoord kan worden ingesteld via backend (security feature)
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
   - **Voeg Module 2 toe**:
     - Naam: "Premium Module"  
     - Beschrijving: Uitgebreide functionaliteit
   - **Voeg Module 3 toe**:
     - Naam: "Integratie Module"
     - Beschrijving: Koppelingen met andere systemen
3. **Configureer module afhankelijkheden**:
   - **Stel in welke modules verplicht zijn**
   - **Definieer optionele modules**
   - **Configureer module combinaties**
4. **Test module weergave**:
   - **Controleer productpagina** met alle modules
   - **Verifieer module relaties** en afhankelijkheden

**Verwacht resultaat**: 
- Hoofdproduct met meerdere modules wordt aangemaakt
- Module beheer functionaliteit werkt correct
- Module relaties worden correct weergegeven

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
   - **Stap 3: Regio en Beschikbaarheid**:
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

### Stap 11: Excel Export Testen

**Doel**: Test data export functionaliteit vanuit dashboard

**Acties**:
1. **Ga naar Dashboard** in de beheeromgeving
2. **Navigeer naar "Producten"** overzicht
3. **Test Excel Export**:
   - **Zoek export knop**: "Download als Excel" of "Exporteren"
   - **Klik op export functie**
   - **Controleer download**: Bestand wordt gedownload naar Downloads folder
4. **Valideer Excel Bestand**:
   - **Open gedownload bestand** in Excel of LibreOffice
   - **Controleer kolommen**: Alle product velden aanwezig
   - **Controleer data**: Juiste product informatie
   - **Controleer formatting**: Leesbare opmaak
5. **Test Andere Export Opties** (indien beschikbaar):
   - **CSV export**: Test alternatieve formaten
   - **Gefilterde export**: Export met actieve filters
   - **Selectieve export**: Alleen geselecteerde items

**Verwacht resultaat**: 
- Excel bestand wordt succesvol gedownload
- Alle product data is correct geëxporteerd
- Bestand is bruikbaar voor verdere verwerking

**Functionaliteit**: [F007 - Data Export en Import](./F007-data-export-import.md)  
**PvE Issues**: [#15](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/15) - Data vanuit softwarecatalogus exporteren

**Testpunten**:
- [ ] Export knop is zichtbaar en toegankelijk
- [ ] Download proces werkt zonder fouten
- [ ] Excel bestand opent correct
- [ ] Alle product velden zijn geëxporteerd
- [ ] Data integriteit is behouden
- [ ] Bestandsnaam is logisch en informatief
- [ ] Verschillende export formaten werken (indien beschikbaar)

---

### Stap 12: Zoeken en Resultaten Controleren

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

---

### Stap 13: AMEFF Referentie Applicaties

**Doel**: Test GEMMA/AMEFF integratie en referentie applicatie selectie

**Acties**:
1. **Ga terug naar product wizard** of **bewerk bestaand product**
2. **Navigeer naar GEMMA/Architectuur sectie**:
   - **Open GEMMA componenten selectie**
   - **Controleer beschikbare referentie applicaties**
3. **Test Referentie Applicatie Selectie**:
   - **Bekijk beschikbare componenten**: Volledige lijst van GEMMA componenten
   - **Selecteer relevante componenten**:
     - Kies componenten die passen bij uw product
     - Selecteer meerdere componenten indien van toepassing
   - **Controleer component details**:
     - Beschrijving van component
     - Relaties met andere componenten
     - Links naar GEMMA Online (indien beschikbaar)
4. **Valideer Opgeslagen Selecties**:
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
- [ ] Componentenlijst wordt correct geladen
- [ ] Componenten kunnen worden geselecteerd
- [ ] Meerdere componenten kunnen worden gekozen
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
| F001 - Toegang Verkrijgen | #139 | ✅ Getest | Stap 2: Registratie |
| F002 - Organisatie Inrichten | #66, #140, #142 | ✅ Getest | Stap 3, 6: Activatie + gebruikersbeheer + profiel |
| F003 - Gebruikersbeheer | #63, #64, #65, #73 | ✅ Getest | Stap 3, 4, 5: Backend beheer + frontend beheer |
| F004 - Aanbod Beheer | #5, #17, #18 | ✅ Getest | Stap 7, 8: Single + multi module |
| F005 - Dienstenbeheer | #35 | ✅ Getest | Stap 9: Dienst wizard |
| F007 - Data Export en Import | #15 | ✅ Getest | Stap 11: Excel export |
| F011 - Zoeken & Ontdekken | #21, #144 | ✅ Getest | Stap 12: Zoeken + resultaten |
| F013 - Gebruik Beheer | #56 | ✅ Getest | Stap 10: Koppelingen |
| F014 - Data Migratie | #70 | ✅ Getest | Stap 13: AMEFF componenten |

## ⚠️ PvE Issues Niet Gedekt in Huidige Testflow

De volgende PvE eis issues worden **niet getest** in de huidige testflow. Deze kunnen worden toegevoegd aan toekomstige testscenario's of specifieke test cases:

| Issue | Titel | Onderdeel | Reden Niet Getest | Aanbeveling |
|-------|-------|-----------|-------------------|-------------|
| [#3](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/3) | Pakketten zoeken/filteren op standaarden ondersteuning | Aanbod | Specifieke standaarden filtering | Toevoegen aan zoek tests |
| [#6](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/6) | Registreren welke standaarden door pakket worden ondersteund | Aanbod | Standaarden registratie in product | Uitbreiden product wizard |
| [#7](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/7) | Licentievorm per pakket registreren | Aanbod | Wordt getest in stap 7 | ✅ Eigenlijk wel getest |
| [#8](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/8) | Door gebruik-beheerders toegevoegde pakketten zien | Aanbod | Leverancier perspectief op gebruik | Toevoegen leverancier view test |
| [#9](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/9) | Aangeven of applicatie on-premise of Cloud wordt aangeboden | Aanbod | Wordt getest in stap 7 | ✅ Eigenlijk wel getest |
| [#10](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/10) | Registreren welke organisaties pakket gebruiken | Aanbod | Gebruik registratie door leverancier | Toevoegen gebruik voorstellen test |
| [#11](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/11) | Overzicht door gebruik-beheerders geregistreerde pakketten | Beheer | Functioneel beheer perspectief | Toevoegen admin overzicht test |
| [#12](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/12) | Namens aanbieder pakketten opvoeren die ontbreken | Gebruik | Gemeente registreert missende software | Toevoegen gemeente gebruik test |
| [#16](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/16) | AMEFF export | Datamigratie | Specifiek AMEFF export formaat | Uitbreiden export tests |
| [#19](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/19) | Zien welke gemeenten pakket gebruiken | Gebruik | "Gluren bij de buren" functionaliteit | Toevoegen gemeente overzicht test |
| [#20](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/20) | 'Gluren bij de buren' - pakketten andere gemeenten | Gebruik | Benchmarking functionaliteit | Toevoegen benchmarking test |
| [#22](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/22) | Pakketoverzicht filteren op eigenschappen | Gebruik | Geavanceerde filter opties | Uitbreiden zoek tests |
| [#23](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/23) | Reeds geregistreerde gegevens weer zien in nieuwe catalogus | Datamigratie | Legacy data migratie | Toevoegen migratie test |
| [#28](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/28) | Verschillende soorten content publiceren | Beheer | Content management systeem | Toevoegen CMS test |
| [#29](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/29) | Toelichtende teksten en foutmeldingen maken/wijzigen | Beheer | Systeem configuratie | Toevoegen config test |
| [#30](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/30) | Menustructuur kunnen aanpassen | Beheer | Menu beheer functionaliteit | Toevoegen menu config test |
| [#52](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/52) | Externe bronnen | Datamigratie | API koppelingen met externe systemen | Toevoegen integratie test |
| [#54](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/54) | Statistieken over pakketoverzicht | Gebruik | Dashboard statistieken | Toevoegen analytics test |
| [#55](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/55) | Bij koppeling aangeven of standaard wordt gebruikt | Gebruik | Standaarden bij koppelingen | Uitbreiden koppeling test |
| [#57](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/57) | Samenwerkingsverband pakketten opvoeren voor gemeenten | Gebruik | Samenwerking namens leden | Toevoegen samenwerking test |
| [#58](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/58) | Pakketten door aanbod-beheerders koppelen aan applicatielandschap | Gebruik | Leverancier stelt gebruik voor | Toevoegen gebruik voorstel test |
| [#59](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/59) | Alle informatie over applicaties invoeren | Gebruik | Complete applicatie informatie | Uitbreiden product tests |
| [#60](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/60) | Voor meerdere organisaties pakketoverzichten bewerken | Gebruik | Multi-organisatie beheer | Toevoegen multi-org test |
| [#61](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/61) | Nieuwe gebruikers aanmelden bij bestaande organisatie | Beheer | Zelf-registratie bij organisatie | Toevoegen zelf-registratie test |
| [#62](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/62) | Gebruikers gekoppeld aan organisatie | Beheer | Organisatie-gebruiker relaties | Wordt getest in stap 3, 4, 5 |
| [#68](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/68) | Plotten op views | Gebruik | Architectuur visualisatie | Toevoegen visualisatie test |
| [#69](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/69) | Doorverwijzing naar GEMMA online vanuit architectuurconcepten | Aanbod | GEMMA Online integratie | Wordt getest in stap 13 |
| [#71](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/71) | Importeren ArchiMate | Datamigratie | ArchiMate model import | Toevoegen import test |
| [#72](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/72) | Exporteren ArchiMate | Datamigratie | ArchiMate model export | Toevoegen export test |
| [#74](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/74) | Overzicht organisaties die pakketten/diensten gebruiken | Gebruik | Gebruik overzicht per organisatie | Toevoegen gebruik overzicht test |
| [#75](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/75) | Rapportages maken over catalogus data | Beheer | Rapportage functionaliteit | Toevoegen rapportage test |
| [#105](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/105) | Aanbieders zien geen applicatielandschappen van gebruikers | Gebruik | Privacy en toegangscontrole | Toevoegen privacy test |
| [#106](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/106) | Tonen beschrijving bij concept (tooltip/glossary) | Aanbod | UI/UX help functionaliteit | Toevoegen tooltip test |
| [#141](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/141) | Organisaties samenvoegen bij herindeling/overname | Datamigratie | Organisatie fusie functionaliteit | Toevoegen fusie test |
| [#143](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/143) | Aanbieder registreren die nog niet bestaat | Aanbod | Wordt getest in stap 2 | ✅ Eigenlijk wel getest |

### 📈 Coverage Statistieken
- **Totaal PvE eis issues**: 45 functionele issues
- **Getest in huidige flow**: 14 issues (31%)
- **Niet getest**: 31 issues (69%)
- **Eigenlijk wel getest**: 4 issues kunnen worden gemarkeerd als getest

### 🎯 Aanbevelingen voor Uitbreiding Testflow
1. **Prioriteit Hoog**: Issues #6, #10, #12, #19, #20 (core functionaliteit)
2. **Prioriteit Gemiddeld**: Issues #54, #55, #57, #58, #59 (gebruikerservaring)
3. **Prioriteit Laag**: Issues #28, #29, #30 (admin functionaliteit)

---

## 🆘 Troubleshooting

### Veelvoorkomende Problemen

**Probleem**: Organisatie activatie duurt lang  
**Oplossing**: Wacht tot 5 minuten, ververs pagina, controleer systeem logs

**Probleem**: Wachtwoord reset werkt niet  
**Oplossing**: Controleer gebruiker status, probeer opnieuw genereren

**Probleem**: Uploads falen  
**Oplossing**: Controleer bestandsgrootte (&lt;10MB), ondersteunde formaten

**Probleem**: GEMMA componenten laden niet  
**Oplossing**: Controleer internet connectie, ververs browser cache

### Contact

Voor technische problemen tijdens testen:
- **Functioneel Beheer**: Via catalogus contactformulier
- **Ontwikkelteam**: GitHub issues aanmaken
- **Documentatie**: Raadpleeg relevante functionaliteit pagina's

---

*Deze testhandleiding wordt regelmatig bijgewerkt op basis van nieuwe functionaliteiten en testresultaten.*
