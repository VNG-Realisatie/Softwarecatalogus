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
| 10 | Gebruik melden en beheren | F013 - Gebruik Beheer | [#12](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/12), [#143](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/143), [#58](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/58) |
| 11 | Koppeling wizard doorlopen | F013 - Gebruik Beheer | [#56](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/56) |
| 12 | Privacy en zichtbaarheid testen | F013 - Gebruik Beheer, F003 - Gebruikersbeheer | [#105](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/105), [#58](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/58) |
| 13 | Excel export testen | F007 - Data Export en Import | [#15](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/15) |
| 14 | Zoeken en resultaten controleren | F011 - Zoeken & Ontdekken | [#21](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/21), [#144](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/144) |
| 15 | AMEFF referentie applicaties | F014 - Data Migratie | [#70](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/70) |
| 16 | Standaarden beheer testen | F004 - Applicatiebeheer, F011 - Zoeken & Ontdekken | [#3](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/3), [#6](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/6), [#7](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/7), [#9](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/9) |
| 17 | "Gluren bij de buren" functionaliteit | F013 - Gebruik Beheer, F011 - Zoeken & Ontdekken | [#19](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/19), [#20](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/20), [#22](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/22), [#74](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/74) |
| 18 | Leverancier gebruik beheer | F013 - Gebruik Beheer, F004 - Applicatiebeheer | [#8](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/8), [#10](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/10), [#54](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/54) |
| 19 | Geavanceerde koppelingen en standaarden | F008 - Externe Koppelingen, F014 - Data Migratie | [#55](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/55), [#52](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/52), [#71](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/71), [#72](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/72), [#23](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/23) |
| 20 | Samenwerkingen en multi-organisatie beheer | F010 - Lidmaatschapsbeheer, F003 - Gebruikersbeheer | [#57](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/57), [#60](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/60), [#61](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/61), [#141](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/141) |
| 21 | Beheer en configuratie functies | F009 - Beheer en Configuratie, F006 - Inzichten en Aanbevelingen | [#28](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/28), [#29](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/29), [#30](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/30), [#75](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/75), [#106](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/106) |
| 22 | Geavanceerde zoek en filter functies | F011 - Zoeken & Ontdekken, F004 - Applicatiebeheer | [#59](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/59), [#68](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/68), [#69](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/69) |
| 23 | Functioneel beheer overzicht | F009 - Beheer en Configuratie, F013 - Gebruik Beheer | [#11](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/11), [#62](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/62) |
| 24 | AMEFF export en uitgebreide data export | F007 - Data Export en Import | [#16](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/16) |

---

## 📌 Open Bevindingen per Stap (2026-02-21)

| Stap | Bevindingen | Hotspots |
|------|:-----------:|----------|
| 3. Org activatie | 5 | Backend bugs, user conversion |
| 4. Eerste inlog | 4 | Account leeg, menu verdwijnt |
| 5. Contactpersonen | 4 | Save error, tussenvoegsel |
| 6. Org profiel | 2 | Functie niet opgeslagen |
| **7. Applicaties** | **20** | **Compliance, wizard labels, diensten tabel** |
| **9. Diensten** | **13** | **Wizard teksten, type verwarring, concept status** |
| **10. Gebruik** | **10** | **Wizard stappen (dienst/app toevoegen)** |
| **11. Koppelingen** | **9** | **Save fouten, import leeg, wizard stappen** |
| 12. Privacy | 5 | Contactpersonen zichtbaar, API auth |
| 13. Export | 3 | UUID's in export |
| 14. Zoeken | 6 | Sorteren, filter resultaten |
| 16. Standaarden | 2 | ID-referenties |
| 17. Gluren bij buren | 4 | Gebruik overzicht |
| 18. Leverancier gebruik | 3 | Statistieken |
| 19. Geavanceerd | 5 | Data migratie, ArchiMate |
| 20. Samenwerkingen | 2 | Multi-org |
| **21. Beheer/Config** | **11** | **CMS, teksten, footer, voorpagina** |
| 22. Geavanceerd zoeken | 3 | Views, architectuur |
| 23. Functioneel beheer | 1 | Overzicht |
| 24. AMEFF export | 1 | Import fout |
| General | 4 | Witte schermen, UX, errors |
| Infra | 4 | NextCloud versie, CI/CD |
| **Totaal** | **123** | |

> Grootste pijnpunten: **Stap 7** (applicaties, 20 issues), **Stap 9** (diensten, 13 issues), **Stap 21** (beheer, 11 issues), **Stap 10** (gebruik, 10 issues)

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
2. **Klik op "Aanmelden"** (rechtsboven in het gebruikersmenu)
3. **Vul registratieformulier in**:
   - **Organisatienaam**: "Test Leverancier [Datum]" (bijv. "Test Leverancier 2025-10-02")
   - **Beschrijving**: Korte beschrijving van de test organisatie
   - **Contactpersoon**: Fictieve naam en e-mailadres
4. **Verstuur aanmelding**
5. **Controleer bevestigingsmelding**
6. **Registreer in totaal 3 keer leverancier, samenwerking, community**

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

> **📌 Open bevindingen (5):**
> - [#391](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/391) - Testen met een gebruiker van een bestaande organisatie
> - [#392](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/392) - Back-end: geimporteerde gebruiker geeft error bij omzetten naar user
> - [#195](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/195) - [Bug] NC dashboard organisatie 'acties dropdown' werkt niet goed
> - [#208](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/208) - [Bug] NC Dashboard organisatie overzicht toont alleen ID
> - [#209](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/209) - [Bug] Help knop gaat naar niet bestaande pagina

**Doel**: Test het activatieproces en volledige organisatie/gebruikersbeheer functionaliteiten

**Acties**:
1. **Navigeer naar**: https://softwarecatalogus.accept.commonground.nu/ (backend omgeving)
2. **Log in** met functioneel beheerder account
3. **Open Softwarecatalogus app** (klik op catalogus icoon)
4. **Ga naar Organisaties** in het menu
5. **Zoek de zojuist geregistreerde organisatie**
6. **Controleer organisatie details**:
   - Status moet "concept" zijn
   - Alle ingevoerde gegevens moeten zichtbaar zijn
7. **Activeer organisatie**:
   - Klik op organisatie card
   - Klik op "Activeren" knop onder .....
   - Wacht tot activatie voltooid is (kan enkele minuten duren)
8. **Test Organisatie Beheer Functionaliteiten**:
   - **Ga naar de geactiveerde organisatie**
   - **Klik op "Bekijk contactpersonen"**
   
   **A. Gebruiker Wachtwoord Beheer:**
   - Selecteer de hoofdgebruiker (aangemaakt tijdens registratie)
   - Klik op "Change Password"
   - Stel nieuw wachtwoord in (bijvoorbeeld: "Test123!")
   - Noteer het wachtwoord (en e-mailadres) voor stap 4
   
   **B. Nieuwe Gebruikers Toevoegen:**
   - Klik op "Nieuwe contactpersoon toevoegen"
   - Vul gegevens in:
     - Voornaam: "Backend"
     - Achternaam: "Testgebruiker"
     - Email: "backend.test@example.com"
     
   - Sla contactpersoon op
   - **Converteer naar gebruiker**:
     - Selecteer de nieuwe contactpersoon
     - Klik op "Omzetten naar gebruiker"
     - Stel wachtwoord in
     - Selecteer gebruikersgroep/rol
   
   **C. Gebruiker Status Beheer:**
   - **Deactiveren gebruiker**: Test status wijziging naar "Disable User"
   - **Heractiveren**: Zet terug naar "Enable User" voor verdere tests
   
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

> **📌 Open bevindingen (4):**
> - [#266](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/266) - Na inloggen: Mijn account & persoonlijke gegevens leeg?
> - [#350](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/350) - Link achter gebruikersnaam verwijzen naar Mij account
> - [#395](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/395) - Menu linkerkant verdwijnt
> - [#183](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/183) - [Feature] 'Wachtwoord vergeten' optie

**Doel**: Test eerste inlog met het in stap 3 ingestelde wachtwoord

**Acties**:
1. **Ga naar frontend**: https://softwarecatalogus.accept.opencatalogi.nl/
2. **Klik op "Inloggen"** (rechtsboven)
3. **Voer credentials in**:
   - **E-mailadres**: Het geregistreerde e-mailadres uit stap 2
   - **Wachtwoord**: Het wachtwoord dat in stap 3 is ingesteld
4. **Controleer inlog**:
   - Dashboard moet laden
   - Menu opties moeten beschikbaar zijn aan de linker kant
   - Wizards moeten tonen
5. **Verken dashboard**: Bekijk beschikbare functionaliteiten

**Verwacht resultaat**: 
- Inlog verloopt succesvol
- Dashboard is toegankelijk

**Functionaliteit**: [F003 - Gebruikersbeheer](./F003-gebruikersbeheer.md)  
**PvE Issues**: 
- [#63](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/63) - Eerste (beheer)account aanmaken/fiateren
- [#65](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/65) - Collega's toegang geven tot softwarecatalogus

**Testpunten**:
- [ ] Inlogproces verloopt soepel
- [ ] Dashboard laadt correct na inlog
- [ ] Menu opties zijn zichtbaar en toegankelijk

---

### Stap 5: Collega's Uitnodigen

> **📌 Open bevindingen (4):**
> - [#65](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/65) - Collega's toegang geven tot de softwarecatalogus
> - [#73](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/73) - Meerdere contactpersonen registreren en aan pakketten koppelen
> - [#365](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/365) - Contactpersonen: error bij het opslaan van een contactpersoon
> - [#367](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/367) - Contactpersonen: Tussenvoegsel wordt niet getoond

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
7. **Test inlog nieuwe gebruiker**:
   - Log uit met hoofdaccount
   - Log in met nieuwe collega account en ingesteld wachtwoord
8. **Test inlog nieuwe gebruiker**:
   - Ga terug naar backend: https://softwarecatalogus.accept.commonground.nu/
   - Zoek de organisatie en bijbehorende gebruikers
   - Deactiveer de gebruiker
   - Log uit met hoofdaccount
   - Log in met nieuwe collega account en ingesteld wachtwoord (moet nu falen)


**Verwacht resultaat**: 
- Nieuwe contactpersoon wordt succesvol toegevoegd
- Wachtwoord kan worden ingesteld via backend (security feature)
- Nieuwe gebruiker kan inloggen 
- Gedeactiveerde gebruiker kan niet meer inloggen

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

> **📌 Open bevindingen (2):**
> - [#353](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/353) - Mijn account – "functie" wordt niet aangepast na bewerken en opslaan
> - [#192](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/192) - [Taak] Organisatie adres info in organisatie cards

**Doel**: Test organisatie-informatie beheer en profiel completering

**Acties**:
1. **Ga naar "Mijn Organisatie"** in het menu
2. **Vul aanvullende organisatie-informatie in**:
   - **Logo**: Upload organisatie logo
   - **Website URL**: Voeg website toe
   - **Beschrijving**: Uitgebreide beschrijving
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

> **📌 Open bevindingen (20):**
> - [#294](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/294) - Applicatie publiceren: uitlijning rechthoek
> - [#300](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/300) - Beheer: overzicht applicaties teveel applicaties
> - [#302](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/302) - Beheer: applicatie bewerken (ophalen traag)
> - [#370](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/370) - Applicatie: teveel kolommen worden getoond
> - [#373](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/373) - Applicatie: Gekoppelde diensten worden niet getoond
> - [#375](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/375) - Applicaties: versie voor SaaS applicaties?
> - [#376](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/376) - Applicaties: labels wizard en tabel zijn anders
> - [#377](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/377) - Applicaties: tabel toont diensten niet
> - [#379](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/379) - Applicatie: verschillende manier van tonen compliancy
> - [#380](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/380) - Applicatie: compliance aantallen komen niet overeen
> - [#381](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/381) - Applicaties: non-compliant vervangen door niet ondersteund
> - [#382](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/382) - Applicatie: compliancy link werkt niet
> - [#383](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/383) - Applicatie: selectie vakken werken niet
> - [#384](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/384) - Applicaties: eenduidige manier van bewerken
> - [#385](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/385) - Applicatie: Geen huidige versie in gebruik
> - [#386](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/386) - Applicaties – publiceren: andere labels
> - [#387](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/387) - Applicaties – publiceren: i niet aanwezig
> - [#390](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/390) - Applicaties – publiceren: labels komen niet overeen
> - [#399](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/399) - Versies: versie van andere leverancier geeft foutmelding
> - [#402](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/402) - Verschil tussen Edge en Chrome bij laden applicaties

**Doel**: Test product aanmaak wizard voor eenvoudige producten

**Acties**:
1. **Ga naar "Producten"** klik in het dashboard op de wizard product aanmaken
2. **Klik op "Nieuwe Applicatie"**
3. **Doorloop Product Wizard - Stap 1: Productinformatie**:
   - **Naam**: "Test Applicatie Single Module"
   - **Korte Beschrijving**: Uitgebreide beschrijving van het product
   - **Uitgebereide Beschrijving**: Uitgebreide beschrijving van het product
   - **Website**: De website waar meer over dit product is te vinden
   - **Hosting Type**: Kies uit SaaS, On-premise, of Hybrid
4. **Stap 2: Licentie**:
4. **Stap 3: Referentiecomponenten**:
4. **Stap 4: Standaarden**:
4. **Stap 5: Koppelingen**:
4. **Stap 6: Diensten**:
8. **Stap 7: Overzicht en Publiceren**:
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
- [ ] Contactpersoon kan worden toegewezen
- [ ] Product wordt gepubliceerd en is zichtbaar/vindbaar in frontend
- [ ] Alle informaite wordt goed weergegeven in de frontend

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
- [ ] Productpagina toont alle applicaties correct

---

### Stap 9: Dienst Wizard Doorlopen

> **📌 Open bevindingen (13):**
> - [#274](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/274) - Wizard dienst: tekst naar nieuwe benamingen
> - [#306](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/306) - Dienst: Overzicht controleren verbeteren
> - [#307](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/307) - Diensten overzicht: meer dienst bij organisatie dan er horen
> - [#308](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/308) - Diensten overzicht: default kolommen + kolom verwijderen
> - [#356](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/356) - Diensten: geen tussenvoegsel bij namen
> - [#357](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/357) - Diensten: Diensttype en Type door elkaar
> - [#358](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/358) - Diensten: Status "Concept" nog op verschillende plekken
> - [#359](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/359) - Diensten wizard: tekst aanpassen
> - [#360](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/360) - Diensten wizard: Meerdere i komen niet overeen met ppt
> - [#361](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/361) - Diensten wizard: inconsistentie in labels
> - [#362](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/362) - Diensten wizard: onlogische tekst bovenaan aanmeld-stap
> - [#363](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/363) - Diensten wizard: catalogus i.p.v. softwarecatalogus
> - [#408](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/408) - Tabblad beschrijving bij Dienst

**Doel**: Test diensten toevoegen aan bestaande producten

**Acties**:
1. **Ga naar "Diensten"** in het menu
2. **Klik op "Nieuwe Dienst"**
3. **Selecteer product**: Kies een van de eerder aangemaakte producten
4. **Doorloop Dienst Wizard**:
5. **Publiceer dienst**
6. **Herhaal voor verschillende dienst types**:
   - Implementatie dienst
   - Training dienst
   - Hosting dienst

**Verwacht resultaat**: 
- Verschillende diensten worden succesvol toegevoegd
- Diensten zijn gekoppeld aan juiste producten

**Functionaliteit**: [F005 - Dienstenbeheer](./F005-dienstenbeheer.md)  
**PvE Issues**: [#35](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/35) - Dienst toevoegen

**Testpunten**:
- [ ] Dienst wizard werkt voor alle dienst types
- [ ] Diensten kunnen aan producten worden gekoppeld
- [ ] SLA en service details kunnen worden ingevoerd
- [ ] Diensten zijn zichtbaar bij gekoppelde producten

---

### Stap 10: Gebruik Melden en Beheren

> **📌 Open bevindingen (8):**
> - [#35](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/35) - Registreren welke diensten ik afneem
> - [#316](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/316) - Dienst toevoegen: Stap 1 Dienst zoeken
> - [#317](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/317) - Dienst toevoegen: Stap 2 Gebruiksinformatie
> - [#318](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/318) - Dienst toevoegen: Stap 3 Controleren
> - [#323](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/323) - Applicatie toevoegen: Stap 1 Applicatie zoeken
> - [#324](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/324) - Applicatie toevoegen: Stap 2 gebruiksinformatie
> - [#325](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/325) - Applicatie toevoegen: Stap 3 Referentiecomponenten
> - [#326](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/326) - Applicatie toevoegen: Stap 4 Deelnemer
> - [#327](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/327) - Applicatie toevoegen: Stap 5 Controleren
> - [#328](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/328) - Applicatie toevoegen: Stap 1.1 Nieuwe applicatie opvoeren

**Doel**: Test gebruik registratie en beheer voor andere organisaties

**Acties**:
1. **Gebruik Melden voor Andere Organisatie**:
   - **Ga naar "Gebruik"** in het menu
   - **Klik op "Gebruik Melden"**
   - **Zoek organisatie**: Zoek een andere organisatie in de catalogus
   - **Selecteer product**: Kies een product van een andere leverancier
   - **Vul gebruik details in**:
     - **Gebruikende organisatie**: Selecteer de organisatie
     - **Product/Module**: Specificeer welke modules gebruikt worden
     - **Implementatie details**: Beschrijf hoe het wordt gebruikt
     - **Contactpersoon**: Wijs contactpersoon toe
   - **Verstuur gebruik melding**

2. **Gebruik Aanvaarden (als Leverancier)**:
   - **Log in als leverancier** van het gemelde product
   - **Ga naar "Gebruik Beheer"** 
   - **Bekijk openstaande meldingen**
   - **Controleer gebruik details**:
     - **Organisatie informatie**: Klopt de organisatie?
     - **Product/Module**: Correct product geselecteerd?
     - **Implementatie**: Realistisch gebruik scenario?
   - **Accepteer of weiger gebruik**:
     - **Accepteren**: Bevestig gebruik en maak zichtbaar
     - **Weigeren**: Geef reden van weigering
   - **Voeg aanvullende informatie toe** (optioneel)

3. **Aanbieder Aanmaken die Nog Niet Bestaat**:
   - **Ga naar "Gebruik Melden"**
   - **Zoek naar niet-bestaande leverancier**
   - **Klik op "Nieuwe Aanbieder Toevoegen"**
   - **Vul aanbieder gegevens in**:
     - **Organisatienaam**: Naam van de leverancier
     - **Type**: Leverancier/Softwarebedrijf
     - **Contactgegevens**: Basis informatie
     - **Beschrijving**: Korte beschrijving
   - **Sla aanbieder op**

4. **Product Aanmaken voor Aanbieder (Gemeente Meldt)**:
   - **Selecteer de nieuwe aanbieder**
   - **Klik op "Product Toevoegen voor Aanbieder"**
   - **Vul product informatie in**:
     - **Productnaam**: Naam van het ontbrekende product
     - **Beschrijving**: Wat doet het product
     - **Categorie**: Selecteer passende categorie
     - **Hosting**: On-premise/Cloud/Hybrid
   - **Voeg gebruik toe**:
     - **Gebruikende organisatie**: Eigen organisatie
     - **Implementatie details**: Hoe wordt het gebruikt
   - **Verstuur voor goedkeuring**

**Verwacht resultaat**: 
- Gebruik kan worden gemeld voor andere organisaties
- Leveranciers kunnen gebruik accepteren/weigeren
- Nieuwe aanbieders kunnen worden aangemaakt
- Ontbrekende producten kunnen worden gemeld
- Alle meldingen worden correct verwerkt

**Functionaliteit**: [F013 - Gebruik Beheer](./F013-gebruik-beheer.md)  
**PvE Issues**: 
- [#12](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/12) - Namens aanbieder pakketten opvoeren die ontbreken
- [#143](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/143) - Aanbieder registreren die nog niet bestaat
- [#58](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/58) - Pakketten door aanbod-beheerders koppelen aan applicatielandschap

**Testpunten**:
- [ ] Gebruik kan worden gemeld voor andere organisaties
- [ ] Organisaties kunnen worden gezocht en geselecteerd
- [ ] Producten van andere leveranciers zijn selecteerbaar
- [ ] Gebruik details kunnen volledig worden ingevuld
- [ ] Leveranciers ontvangen meldingen van gebruik
- [ ] Gebruik kan worden geaccepteerd door leveranciers
- [ ] Gebruik kan worden geweigerd met reden
- [ ] Nieuwe aanbieders kunnen worden aangemaakt
- [ ] Ontbrekende producten kunnen worden gemeld
- [ ] Gemeente kan producten melden namens aanbieders

---

### Stap 11: Koppeling Wizard Doorlopen (pas bij gebruik!)

> **📌 Open bevindingen (8):**
> - [#186](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/186) - Koppelingen (restpunt)
> - [#312](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/312) - Koppeling heeft verplicht een naam
> - [#314](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/314) - Wizard Koppeling publiceren vind zelf aangemaakte applicaties niet
> - [#400](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/400) - Koppeling - Opslaan geeft een foutmelding
> - [#401](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/401) - Koppeling - geïmporteerde koppelingen kaartjes zijn leeg
> - [#319](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/319) - Koppeling toevoegen: Stap 1 Koppeling zoeken
> - [#320](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/320) - Koppeling toevoegen: Stap 2 Gebruiksinformatie
> - [#321](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/321) - Koppeling toevoegen: Stap 3 Deelnemer
> - [#322](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/322) - Koppeling toevoegen: Stap 4 Controleren

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

### Stap 12: Privacy en Zichtbaarheid Testen

> **📌 Open bevindingen (5):**
> - [#394](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/394) - Contactpersonen van gemeenten publiekelijk zichtbaar
> - [#105](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/105) - Aanbieders zien applicatielandschappen en koppelingen niet
> - [#41](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/41) - Documenten (DPIA's, verwerkersovereenkomsten) delen
> - [#83](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/83) - Beveiligde API aanbodinformatie registreren
> - [#84](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/84) - Beveiligde API toegang tot gebruiksinformatie

**Doel**: Test privacy instellingen voor gebruik en koppelingen

**Acties**:
1. **Test Gebruik Zichtbaarheid**:
   - **Log in als verschillende gebruikerstypen**:
     - **Leverancier**: Eigenaar van het product
     - **Gemeente**: Gebruiker van het product  
     - **Derde partij**: Niet-gerelateerde organisatie
     - **Ambtenaar**: VNG/Functioneel beheerder
   
   - **Controleer gebruik zichtbaarheid per rol**:
     - **Als Leverancier**: 
       - Kan alle gebruik van eigen producten zien
       - Kan gebruik details bekijken
       - Kan gebruikende organisaties zien
     - **Als Gemeente (gebruiker)**:
       - Kan eigen gebruik zien
       - Kan NIET gebruik van andere organisaties zien
     - **Als Derde Partij**:
       - Kan GEEN gebruik details zien
       - Kan GEEN gebruikende organisaties zien
       - Ziet alleen publieke product informatie
     - **Als Ambtenaar/VNG**:
       - Kan alle gebruik zien (beheerdersrechten)
       - Kan alle organisaties en hun gebruik inzien

2. **Test Koppeling Zichtbaarheid**:
   - **Maak koppelingen aan** tussen verschillende producten
   - **Test zichtbaarheid per gebruikerstype**:
     - **Als Leverancier van bron/doel product**:
       - Kan koppelingen van eigen producten zien
       - Kan technische details bekijken
       - Kan gekoppelde organisaties zien
     - **Als Gemeente (eigenaar koppeling)**:
       - Kan eigen koppelingen zien en beheren
       - Kan NIET koppelingen van andere organisaties zien
     - **Als Derde Partij**:
       - Kan GEEN koppeling details zien
       - Kan GEEN technische informatie zien
       - Ziet alleen publieke product informatie
     - **Als Ambtenaar/VNG**:
       - Kan alle koppelingen zien (beheerdersrechten)
       - Kan alle technische details inzien

3. **Test Privacy Uitzonderingen**:
   - **Controleer leverancier toegang**:
     - Leverancier kan gebruik van eigen product zien
     - Leverancier kan koppelingen met eigen product zien
     - Leverancier kan NIET gebruik/koppelingen van andere producten zien
   - **Controleer ambtenaar toegang**:
     - VNG ambtenaren hebben volledige toegang
     - Functioneel beheerders kunnen alles inzien
     - Normale ambtenaren hebben beperkte toegang

4. **Test Foutieve Toegang Pogingen**:
   - **Probeer directe URL toegang** tot gebruik/koppeling details
   - **Controleer foutmeldingen**: "Geen toegang" berichten
   - **Test API endpoints**: Controleer autorisatie op API niveau

**Verwacht resultaat**: 
- Gebruik is alleen zichtbaar voor betrokken partijen
- Koppelingen zijn alleen zichtbaar voor betrokken partijen  
- Leveranciers zien alleen hun eigen product gebruik/koppelingen
- Ambtenaren hebben beheerdersrechten
- Derde partijen zien geen gevoelige informatie
- Privacy wordt correct gehandhaafd

**Functionaliteit**: [F013 - Gebruik Beheer](./F013-gebruik-beheer.md), [F003 - Gebruikersbeheer](./F003-gebruikersbeheer.md)  
**PvE Issues**: 
- [#105](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/105) - Aanbieders zien geen applicatielandschappen van gebruikers
- [#58](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/58) - Pakketten door aanbod-beheerders koppelen aan applicatielandschap

**Testpunten**:
- [ ] Gebruik is niet zichtbaar voor derde partijen
- [ ] Koppelingen zijn niet zichtbaar voor derde partijen
- [ ] Leveranciers zien alleen gebruik van eigen producten
- [ ] Leveranciers zien alleen koppelingen met eigen producten
- [ ] Gemeenten zien alleen eigen gebruik en koppelingen
- [ ] Ambtenaren hebben volledige toegang (beheerdersrechten)
- [ ] VNG functioneel beheerders kunnen alles inzien
- [ ] Directe URL toegang wordt geblokkeerd voor onbevoegden
- [ ] API endpoints respecteren autorisatie regels
- [ ] Foutmeldingen zijn duidelijk en informatief

---

### Stap 13: Excel Export Testen

> **📌 Open bevindingen (3):**
> - [#15](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/15) - Data vanuit softwarecatalogus exporteren
> - [#355](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/355) - Diensten: Export geeft allerlei UUID's
> - [#109](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/109) - Organisatie- en softwaregegevens integreren in export

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

---

### Stap 14: Zoeken en Resultaten Controleren

> **📌 Open bevindingen (6):**
> - [#144](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/144) - Overzicht organisaties met zoek- en filteropties
> - [#280](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/280) - Zoeken: sorteren gaat niet goed
> - [#340](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/340) - Bevindingen op tussenoplevering Zoeken
> - [#344](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/344) - Zoeken: Geen resultaten bij Gravenbeheercomponent (niet ingelogd)
> - [#205](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/205) - [Bug] Gedepubliceerde applicatie nog te vinden via zoeken
> - [#342](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/342) - Zoeken: op kaartjes aantal referentiecomponenten duidelijk maken

**Doel**: Test zoekfunctionaliteit en resultaatpagina's

**Acties**:
1. **Ga naar frontend**: https://softwarecatalogus.accept.opencatalogi.nl/
2. **Test Basis Zoeken**:
   - **Gebruik zoekbalk**: Zoek op productnaam
   - **Zoek op organisatie**: Zoek uw test organisatie
   - **Zoek op categorie**: Browse per domein
3. **Test Geavanceerd Zoeken**:
   - **Combineer filters**: Categorie + hosting type
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

### Stap 15: AMEFF Referentie Applicaties

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

### Stap 16: Standaarden Beheer Testen

> **📌 Open bevindingen (2):**
> - [#6](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/6) - Registreren welke standaarden door pakket worden ondersteund
> - [#407](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/407) - Toegevoegde standaarden verwijzen naar id-id-....

**Doel**: Test standaarden registratie en filtering functionaliteiten

**Acties**:
1. **Standaarden Registreren bij Product**:
   - **Ga naar product wizard** of **bewerk bestaand product**
   - **Navigeer naar "Standaarden" sectie**
   - **Voeg standaarden toe**:
     - **StUF**: Selecteer StUF versie en implementatie details
     - **RSGB**: Registreer RSGB ondersteuning
     - **GEMMA**: Koppel aan GEMMA standaarden
     - **Andere standaarden**: Voeg custom standaarden toe
   - **Specificeer implementatie niveau**: Volledig/Gedeeltelijk/Gepland
   - **Sla wijzigingen op**

2. **Licentievorm Registreren**:
   - **Ga naar product configuratie**
   - **Selecteer licentie type**:
     - **Open Source**: MIT, GPL, Apache, etc.
     - **Commercieel**: Proprietary, SaaS, etc.
     - **Hybrid**: Freemium, Dual License
   - **Voeg licentie details toe**: Kosten, voorwaarden, beperkingen

3. **Hosting Opties Specificeren**:
   - **On-premise**: Eigen infrastructuur
   - **Cloud**: SaaS, PaaS opties  
   - **Hybrid**: Combinatie mogelijkheden
   - **Voeg technische vereisten toe**

4. **Test Standaarden Filtering**:
   - **Ga naar frontend zoeken**
   - **Filter op standaarden**: StUF, RSGB, GEMMA
   - **Combineer filters**: Standaard + categorie + hosting
   - **Controleer resultaten**: Alleen producten met gekozen standaarden

**Verwacht resultaat**: 
- Standaarden kunnen worden geregistreerd bij producten
- Licentievormen zijn correct geconfigureerd
- Hosting opties zijn duidelijk gespecificeerd
- Filtering op standaarden werkt accuraat

**Functionaliteit**: [F004 - Applicatiebeheer](./F004-applicatiebeheer.md), [F011 - Zoeken & Ontdekken](./F011-zoeken-en-ontdekken.md)  
**PvE Issues**: 
- [#3](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/3) - Pakketten zoeken/filteren op standaarden ondersteuning
- [#6](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/6) - Registreren welke standaarden door pakket worden ondersteund
- [#7](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/7) - Licentievorm per pakket registreren
- [#9](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/9) - Aangeven of applicatie on-premise of Cloud wordt aangeboden

**Testpunten**:
- [ ] Standaarden kunnen worden toegevoegd aan producten
- [ ] Verschillende standaard types zijn beschikbaar
- [ ] Implementatie niveau kan worden gespecificeerd
- [ ] Licentie types kunnen worden geselecteerd
- [ ] Hosting opties zijn configureerbaar
- [ ] Filtering op standaarden werkt in frontend
- [ ] Gecombineerde filters geven juiste resultaten
- [ ] Standaard informatie is zichtbaar op product pagina's

---

### Stap 17: "Gluren bij de Buren" Functionaliteit

> **📌 Open bevindingen (4):**
> - [#19](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/19) - Bij pakket zien welke gemeenten het gebruiken
> - [#20](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/20) - "Gluren bij de buren" - pakketten andere gemeenten bekijken
> - [#22](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/22) - Pakketoverzicht filteren op meerdere eigenschappen
> - [#74](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/74) - Overzicht organisaties die pakketten/diensten gebruiken

**Doel**: Test benchmarking en gemeente vergelijking functionaliteiten

**Acties**:
1. **Gemeente Gebruik Overzicht**:
   - **Log in als gemeente gebruiker**
   - **Ga naar "Gebruik Overzicht"** 
   - **Bekijk eigen applicatielandschap**
   - **Controleer gebruikte producten lijst**

2. **Andere Gemeenten Bekijken**:
   - **Ga naar "Gemeenten Vergelijken"**
   - **Selecteer vergelijkbare gemeenten**:
     - **Op grootte**: Inwoneraantal categorie
     - **Op type**: Stedelijk/Landelijk
     - **Op regio**: Provincie/Regio
   - **Bekijk hun applicatielandschap**:
     - **Welke producten gebruiken zij**
     - **Welke leveranciers kiezen zij**
     - **Welke standaarden implementeren zij**

3. **Benchmarking Analyse**:
   - **Vergelijk eigen gebruik** met andere gemeenten
   - **Identificeer populaire producten** in vergelijkbare gemeenten
   - **Bekijk trends**: Welke producten winnen/verliezen marktaandeel
   - **Exporteer vergelijking**: Download benchmark rapport

4. **Privacy Controle**:
   - **Controleer dat gevoelige data** niet zichtbaar is
   - **Alleen publieke informatie** wordt getoond
   - **Geen technische details** van koppelingen
   - **Geen contractuele informatie**

**Verwacht resultaat**: 
- Gemeenten kunnen andere gemeenten vergelijken
- Benchmarking functionaliteit werkt correct
- Privacy wordt gerespecteerd
- Trends en patronen zijn zichtbaar

**Functionaliteit**: [F013 - Gebruik Beheer](./F013-gebruik-beheer.md), [F011 - Zoeken & Ontdekken](./F011-zoeken-en-ontdekken.md)  
**PvE Issues**: 
- [#19](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/19) - Zien welke gemeenten pakket gebruiken
- [#20](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/20) - 'Gluren bij de buren' - pakketten andere gemeenten
- [#22](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/22) - Pakketoverzicht filteren op eigenschappen
- [#74](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/74) - Overzicht organisaties die pakketten/diensten gebruiken

**Testpunten**:
- [ ] Gemeente gebruik overzicht is beschikbaar
- [ ] Andere gemeenten kunnen worden bekeken
- [ ] Filtering op gemeente eigenschappen werkt
- [ ] Benchmarking analyse is informatief
- [ ] Privacy regels worden gehandhaafd
- [ ] Trends en statistieken zijn accuraat
- [ ] Export functionaliteit werkt
- [ ] Vergelijkingen zijn relevant en nuttig

---

### Stap 18: Leverancier Gebruik Beheer

> **📌 Open bevindingen (3):**
> - [#8](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/8) - Door gebruik-beheerders toegevoegde pakketten zien
> - [#10](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/10) - Registreren welke organisaties pakket gebruiken
> - [#54](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/54) - Statistieken over pakketoverzicht

**Doel**: Test leverancier perspectief op gebruik en klanten

**Acties**:
1. **Gebruik Overzicht voor Leveranciers**:
   - **Log in als leverancier**
   - **Ga naar "Mijn Klanten"**
   - **Bekijk organisaties** die jouw producten gebruiken
   - **Controleer gebruik details**:
     - **Welke modules** worden gebruikt
     - **Implementatie status**: Live/Test/Gepland
     - **Contactpersonen** bij klant organisaties

2. **Gebruik Registratie Beheren**:
   - **Bekijk openstaande meldingen** van nieuwe gebruik
   - **Accepteer/weiger gebruik meldingen**
   - **Voeg aanvullende informatie toe**:
     - **Implementatie details**
     - **Support contacten**
     - **Licentie informatie**

3. **Klant Ondersteuning**:
   - **Contacteer klanten** via platform
   - **Deel product updates** met gebruikers
   - **Verzamel feedback** van implementaties
   - **Track support tickets** (indien beschikbaar)

4. **Gebruik Statistieken**:
   - **Dashboard met gebruik metrics**
   - **Populairste modules** per klant type
   - **Geografische spreiding** van gebruik
   - **Groei trends** over tijd

**Verwacht resultaat**: 
- Leveranciers zien hun klanten en gebruik
- Gebruik beheer functionaliteit werkt
- Communicatie met klanten is mogelijk
- Statistieken geven inzicht in gebruik patronen

**Functionaliteit**: [F013 - Gebruik Beheer](./F013-gebruik-beheer.md), [F004 - Applicatiebeheer](./F004-applicatiebeheer.md)  
**PvE Issues**: 
- [#8](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/8) - Door gebruik-beheerders toegevoegde pakketten zien
- [#10](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/10) - Registreren welke organisaties pakket gebruiken
- [#54](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/54) - Statistieken over pakketoverzicht

**Testpunten**:
- [ ] Leveranciers zien hun klanten
- [ ] Gebruik details zijn zichtbaar
- [ ] Gebruik meldingen kunnen worden beheerd
- [ ] Communicatie met klanten werkt
- [ ] Statistieken zijn informatief en accuraat
- [ ] Dashboard is gebruiksvriendelijk
- [ ] Privacy van andere leveranciers wordt gerespecteerd

---

### Stap 19: Geavanceerde Koppelingen en Standaarden

> **📌 Open bevindingen (5):**
> - [#23](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/23) - Geregistreerde gegevens weer zien in nieuwe Softwarecatalogus
> - [#393](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/393) - Backend: fouten in voorzieningenregister
> - [#55](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/55) - Bij koppeling aangeven of standaardversie wordt gebruikt
> - [#71](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/71) - (VNGR) Importeren ArchiMate
> - [#117](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/117) - Robuuste foutafhandeling voor mislukte imports

**Doel**: Test uitgebreide koppeling functionaliteiten en standaarden

**Acties**:
1. **Standaarden bij Koppelingen**:
   - **Ga naar koppeling wizard**
   - **Specificeer gebruikte standaarden**:
     - **StUF**: Versie en berichttypen
     - **REST API**: OpenAPI specificatie
     - **SOAP**: WSDL definities
     - **Bestandsformaten**: XML, JSON, CSV schemas
   - **Voeg compliance informatie toe**
   - **Test validatie** van standaard specificaties

2. **Externe Bronnen Integratie**:
   - **Configureer externe API koppelingen**
   - **Test authenticatie**: API keys, OAuth, certificaten
   - **Valideer data mapping**: Veld mapping tussen systemen
   - **Monitor koppeling status**: Up/Down, response times

3. **ArchiMate Import/Export**:
   - **Importeer ArchiMate model**: Upload .archimate bestand
   - **Map naar catalogus structuur**: Applicaties, services, interfaces
   - **Exporteer naar ArchiMate**: Download model voor externe tools
   - **Valideer roundtrip**: Import → Export → Import consistentie

4. **Legacy Data Migratie**:
   - **Import oude catalogus data**: CSV, Excel, database export
   - **Map legacy velden**: Naar nieuwe structuur
   - **Valideer data kwaliteit**: Completeness, correctness
   - **Test historische data**: Behoud van oude informatie

**Verwacht resultaat**: 
- Standaarden kunnen worden gespecificeerd bij koppelingen
- Externe systeem integraties werken
- ArchiMate import/export functionaliteit werkt
- Legacy data kan worden gemigreerd

**Functionaliteit**: [F008 - Externe Koppelingen](./F008-externe-koppelingen.md), [F014 - Data Migratie](./F014-data-migratie.md)  
**PvE Issues**: 
- [#55](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/55) - Bij koppeling aangeven of standaard wordt gebruikt
- [#52](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/52) - Externe bronnen
- [#71](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/71) - Importeren ArchiMate
- [#72](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/72) - Exporteren ArchiMate
- [#23](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/23) - Reeds geregistreerde gegevens weer zien in nieuwe catalogus

**Testpunten**:
- [ ] Standaarden kunnen worden toegevoegd aan koppelingen
- [ ] Externe API integraties werken
- [ ] ArchiMate bestanden kunnen worden geïmporteerd
- [ ] ArchiMate export genereert valide bestanden
- [ ] Legacy data import werkt correct
- [ ] Data mapping is accuraat
- [ ] Historische informatie blijft behouden
- [ ] Validatie en error handling werkt

---

### Stap 20: Samenwerkingen en Multi-Organisatie Beheer

> **📌 Open bevindingen (2):**
> - [#57](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/57) - Samenwerkingsverband pakketten opvoeren voor gemeenten
> - [#60](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/60) - Voor meerdere organisaties pakketoverzichten bewerken

**Doel**: Test samenwerking functionaliteiten en multi-organisatie beheer

**Acties**:
1. **Samenwerking Namens Leden**:
   - **Log in als samenwerkingsverband**
   - **Ga naar "Leden Beheer"**
   - **Voeg producten toe** namens leden:
     - **Selecteer lid organisatie**
     - **Kies product** uit catalogus
     - **Specificeer gebruik details**
     - **Verstuur voor goedkeuring** naar lid
   - **Beheer collectieve licenties**

2. **Multi-Organisatie Pakketbeheer**:
   - **Beheer meerdere organisaties** vanuit één account
   - **Switch tussen organisaties**: Dropdown/selector
   - **Bulk operaties**: Producten toevoegen aan meerdere organisaties
   - **Gedeelde configuraties**: Templates voor vergelijkbare organisaties

3. **Zelf-Registratie bij Organisaties**:
   - **Test nieuwe gebruiker registratie**
   - **Selecteer bestaande organisatie** tijdens registratie
   - **Aanvraag goedkeuring**: Door organisatie beheerders
   - **Automatische rol toewijzing**: Gebaseerd op organisatie type

4. **Organisatie Fusies en Overnames**:
   - **Simuleer organisatie fusie**
   - **Merge gebruikers** van beide organisaties
   - **Combineer product portfolios**
   - **Behoud historische data** van beide organisaties
   - **Update contactpersonen** en verantwoordelijkheden

**Verwacht resultaat**: 
- Samenwerkingen kunnen namens leden handelen
- Multi-organisatie beheer werkt efficiënt
- Zelf-registratie proces is gebruiksvriendelijk
- Organisatie fusies kunnen worden verwerkt

**Functionaliteit**: [F010 - Lidmaatschapsbeheer](./F010-lidmaatschapsbeheer.md), [F003 - Gebruikersbeheer](./F003-gebruikersbeheer.md)  
**PvE Issues**: 
- [#57](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/57) - Samenwerkingsverband pakketten opvoeren voor gemeenten
- [#60](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/60) - Voor meerdere organisaties pakketoverzichten bewerken
- [#61](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/61) - Nieuwe gebruikers aanmelden bij bestaande organisatie
- [#141](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/141) - Organisaties samenvoegen bij herindeling/overname

**Testpunten**:
- [ ] Samenwerkingen kunnen namens leden handelen
- [ ] Multi-organisatie switching werkt soepel
- [ ] Bulk operaties zijn efficiënt
- [ ] Zelf-registratie workflow werkt
- [ ] Goedkeuring proces functioneert
- [ ] Organisatie fusies kunnen worden uitgevoerd
- [ ] Data integriteit blijft behouden tijdens fusies
- [ ] Historische informatie blijft toegankelijk

---

### Stap 21: Beheer en Configuratie Functies

> **📌 Open bevindingen (10):**
> - [#155](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/155) - Definities via interactieve optie (tooltip/glossary)
> - [#169](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/169) - Rest issues van Organisatie en Configuratie
> - [#267](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/267) - Naam softwarecatalogus i.p.v. VNG softwarecatalogus
> - [#332](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/332) - Voorpagina inrichten
> - [#397](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/397) - Pagina aanmaken via CMS
> - [#403](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/403) - Tekst verwijderen aanpassen
> - [#406](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/406) - SiteImprove verwijderen
> - [#409](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/409) - Footer anders: inlog of uitgelogd
> - [#410](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/410) - Dashboard schrijfwijze softwarecatalogus
> - [#75](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/75) - Rapportages maken over catalogus data
> - [#92](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/92) - Open source webstatistiekenpakket

**Doel**: Test systeem beheer en configuratie mogelijkheden

**Acties**:
1. **Content Management**:
   - **Log in als functioneel beheerder**
   - **Ga naar "Content Beheer"**
   - **Publiceer verschillende content types**:
     - **Nieuwsberichten**: Systeem updates, nieuwe features
     - **Handleidingen**: Gebruikersdocumentatie
     - **FAQ**: Veelgestelde vragen
     - **Beleid documenten**: Gebruiksvoorwaarden, privacy
   - **Test content workflow**: Draft → Review → Publish

2. **Systeem Configuratie**:
   - **Ga naar "Systeem Instellingen"**
   - **Pas teksten aan**:
     - **Foutmeldingen**: Gebruiksvriendelijke berichten
     - **Help teksten**: Tooltips en uitleg
     - **Email templates**: Notificatie berichten
   - **Configureer validatie regels**
   - **Test meertaligheid** (indien beschikbaar)

3. **Menu Structuur Beheer**:
   - **Ga naar "Menu Configuratie"**
   - **Pas menu structuur aan**:
     - **Voeg menu items toe**
     - **Herorden bestaande items**
     - **Configureer toegangsrechten** per menu item
   - **Test verschillende gebruikersrollen**
   - **Valideer menu zichtbaarheid**

4. **Rapportage en Analytics**:
   - **Ga naar "Rapportages"**
   - **Genereer verschillende rapporten**:
     - **Gebruik statistieken**: Meest gebruikte producten
     - **Organisatie overzichten**: Nieuwe registraties
     - **Trend analyses**: Groei patronen
   - **Export rapporten**: PDF, Excel, CSV
   - **Schedule automatische rapporten**

5. **UI/UX Verbeteringen**:
   - **Test tooltip functionaliteit**
   - **Controleer help teksten** bij complexe velden
   - **Valideer glossary functie**: Begrippen uitleg
   - **Test responsive design** op verschillende schermen
   - **Controleer accessibility**: Screen reader compatibility

**Verwacht resultaat**: 
- Content kan worden beheerd en gepubliceerd
- Systeem configuratie is flexibel
- Menu structuur kan worden aangepast
- Rapportages geven waardevolle inzichten
- UI/UX is gebruiksvriendelijk

**Functionaliteit**: [F009 - Beheer en Configuratie](./F009-beheer-en-configuratie.md), [F006 - Inzichten en Aanbevelingen](./F006-inzichten-en-aanbevelingen.md)  
**PvE Issues**: 
- [#28](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/28) - Verschillende soorten content publiceren
- [#29](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/29) - Toelichtende teksten en foutmeldingen maken/wijzigen
- [#30](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/30) - Menustructuur kunnen aanpassen
- [#75](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/75) - Rapportages maken over catalogus data
- [#106](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/106) - Tonen beschrijving bij concept (tooltip/glossary)

**Testpunten**:
- [ ] Content types kunnen worden aangemaakt
- [ ] Content workflow werkt correct
- [ ] Systeem teksten kunnen worden aangepast
- [ ] Menu structuur is configureerbaar
- [ ] Toegangsrechten werken per menu item
- [ ] Rapportages zijn informatief en accuraat
- [ ] Export functionaliteiten werken
- [ ] Tooltips en help teksten zijn zichtbaar
- [ ] Glossary functie werkt correct
- [ ] UI is toegankelijk voor alle gebruikers

---

### Stap 22: Geavanceerde Zoek en Filter Functies

> **📌 Open bevindingen (3):**
> - [#160](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/160) - (VNGR) Performance plotten views
> - [#59](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/59) - Alle informatie over applicaties invoeren
> - [#135](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/135) - Valideren non-functionele eisen Referentiearchitectuur

**Doel**: Test uitgebreide zoek en filter mogelijkheden

**Acties**:
1. **Geavanceerde Product Filtering**:
   - **Ga naar frontend zoeken**
   - **Test complexe filter combinaties**:
     - **Categorie + Standaarden + Hosting**
     - **Licentie + Organisatie type + Regio**
     - **Implementatie status + Support niveau**
   - **Gebruik faceted search**: Multiple values per filter
   - **Test filter persistentie**: Filters blijven bij navigatie

2. **Volledige Applicatie Informatie**:
   - **Controleer product detail pagina's**
   - **Valideer alle informatie secties**:
     - **Technische specificaties**: Volledig ingevuld
     - **Functionele beschrijving**: Uitgebreid
     - **Implementatie voorbeelden**: Case studies
     - **Support informatie**: Contact details, SLA
     - **Prijsinformatie**: Transparant en actueel
   - **Test informatie completeness**: Percentage volledigheid

3. **Architectuur Visualisatie**:
   - **Ga naar "Architectuur Overzicht"**
   - **Test view plotting functionaliteit**:
     - **Applicatie landschap views**: Organisatie overzicht
     - **Technische architectuur**: Systeem koppelingen
     - **Business proces views**: Workflow diagrammen
   - **Interactieve elementen**: Klik op componenten voor details
   - **Export mogelijkheden**: PNG, SVG, PDF

4. **GEMMA Online Integratie**:
   - **Test doorverwijzingen** naar GEMMA Online
   - **Controleer externe links**: Openen in nieuwe tab
   - **Valideer context**: Juiste GEMMA pagina wordt geopend
   - **Test deep linking**: Directe links naar specifieke concepten

**Verwacht resultaat**: 
- Geavanceerde filtering werkt intuïtief
- Product informatie is volledig en accuraat
- Architectuur visualisatie is informatief
- GEMMA integratie werkt naadloos

**Functionaliteit**: [F011 - Zoeken & Ontdekken](./F011-zoeken-en-ontdekken.md), [F004 - Applicatiebeheer](./F004-applicatiebeheer.md)  
**PvE Issues**: 
- [#59](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/59) - Alle informatie over applicaties invoeren
- [#68](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/68) - Plotten op views
- [#69](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/69) - Doorverwijzing naar GEMMA online vanuit architectuurconcepten

**Testpunten**:
- [ ] Complexe filter combinaties werken
- [ ] Faceted search is gebruiksvriendelijk
- [ ] Product informatie is volledig
- [ ] Architectuur views zijn informatief
- [ ] Interactieve elementen werken
- [ ] GEMMA links openen correct
- [ ] Export functionaliteiten werken
- [ ] Performance is acceptabel bij complexe queries

---

### Stap 23: Functioneel Beheer Overzicht

> **📌 Open bevindingen (1):**
> - [#11](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/11) - Overzicht door gebruik-beheerders geregistreerde pakketten/aanbieders

**Doel**: Test functioneel beheerder perspectief en overzichten

**Acties**:
1. **Beheerder Dashboard**:
   - **Log in als functioneel beheerder**
   - **Bekijk beheerder dashboard**:
     - **Systeem statistieken**: Gebruikers, organisaties, producten
     - **Recente activiteiten**: Registraties, updates, issues
     - **Systeem status**: Performance metrics, uptime
     - **Pending approvals**: Organisaties, gebruikers, content

2. **Gebruik-Beheerders Overzicht**:
   - **Ga naar "Gebruik Beheer Overzicht"**
   - **Bekijk alle door gebruik-beheerders** geregistreerde pakketten
   - **Filter op organisatie type**: Gemeente, provincie, waterschap
   - **Controleer data kwaliteit**: Completeness, accuracy
   - **Identificeer duplicaten**: Zelfde product meerdere keren

3. **Organisatie en Gebruiker Beheer**:
   - **Beheer alle organisaties**: Status, type, contacten
   - **Gebruiker account beheer**: Activeren, deactiveren, rollen
   - **Bulk operaties**: Multiple organisaties tegelijk
   - **Audit trail**: Wie heeft wat wanneer gewijzigd

4. **Data Kwaliteit Monitoring**:
   - **Monitor data completeness**: Percentage ingevulde velden
   - **Identificeer inconsistenties**: Conflicterende informatie
   - **Track data freshness**: Laatste update timestamps
   - **Generate quality reports**: Voor management

**Verwacht resultaat**: 
- Functioneel beheerders hebben volledig overzicht
- Gebruik-beheerder data is zichtbaar en beheerbaar
- Data kwaliteit kan worden gemonitor
- Bulk operaties werken efficiënt

**Functionaliteit**: [F009 - Beheer en Configuratie](./F009-beheer-en-configuratie.md), [F013 - Gebruik Beheer](./F013-gebruik-beheer.md)  
**PvE Issues**: 
- [#11](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/11) - Overzicht door gebruik-beheerders geregistreerde pakketten
- [#62](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/62) - Gebruikers gekoppeld aan organisatie

**Testpunten**:
- [ ] Beheerder dashboard is informatief
- [ ] Gebruik-beheerder data is zichtbaar
- [ ] Filtering en zoeken werkt in beheer interface
- [ ] Bulk operaties zijn efficiënt
- [ ] Audit trail is compleet
- [ ] Data kwaliteit metrics zijn accuraat
- [ ] Reports kunnen worden gegenereerd
- [ ] Performance is acceptabel bij grote datasets

---

### Stap 24: AMEFF Export en Uitgebreide Data Export

> **📌 Open bevindingen (1):**
> - [#231](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/231) - [Bug] AMEFF exports geven foutmelding bij importeren in Archi

**Doel**: Test specialistische export functionaliteiten

**Acties**:
1. **AMEFF Specifieke Export**:
   - **Ga naar "Data Export"**
   - **Selecteer "AMEFF Export"**
   - **Configureer export parameters**:
     - **Organisatie scope**: Eigen/Alle (indien toegestaan)
     - **Data types**: Applicaties, koppelingen, architectuur
     - **Format specificatie**: AMEFF XML schema
   - **Generate export file**
   - **Valideer export**: Schema compliance, completeness

2. **Uitgebreide Excel/CSV Export**:
   - **Test verschillende export formaten**:
     - **Excel**: Met multiple sheets, formatting
     - **CSV**: Met configureerbare delimiters
     - **JSON**: Voor API integratie
     - **XML**: Voor systeem integratie
   - **Configureer export scope**: Velden selectie
   - **Test grote datasets**: Performance bij veel data

3. **Scheduled Exports**:
   - **Configureer automatische exports**
   - **Set schedule**: Daily, weekly, monthly
   - **Email delivery**: Naar beheerders
   - **FTP/SFTP upload**: Naar externe systemen

4. **Import Validatie**:
   - **Test roundtrip**: Export → Import → Validate
   - **Cross-system compatibility**: Import in andere tools
   - **Data integrity checks**: Geen data verlies

**Verwacht resultaat**: 
- AMEFF export genereert valide bestanden
- Verschillende export formaten werken
- Scheduled exports functioneren betrouwbaar
- Data integriteit blijft behouden

**Functionaliteit**: [F007 - Data Export en Import](./F007-data-export-import.md)  
**PvE Issues**: 
- [#16](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/16) - AMEFF export

**Testpunten**:
- [ ] AMEFF export genereert valide XML
- [ ] Export schema compliance is correct
- [ ] Verschillende formaten werken
- [ ] Scheduled exports worden uitgevoerd
- [ ] Email delivery werkt
- [ ] Import validatie slaagt
- [ ] Performance is acceptabel
- [ ] Error handling werkt bij problemen

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
| F003 - Gebruikersbeheer | #61, #62, #63, #64, #65, #73 | ✅ Getest | Stap 3, 4, 5, 20, 23: Volledig gebruikersbeheer |
| F004 - Applicatiebeheer | #3, #5, #6, #7, #8, #9, #10, #17, #18, #54, #59 | ✅ Getest | Stap 7, 8, 16, 18, 22: Volledig aanbod beheer |
| F005 - Dienstenbeheer | #35 | ✅ Getest | Stap 9: Dienst wizard |
| F006 - Inzichten en Aanbevelingen | #75 | ✅ Getest | Stap 21: Rapportages en analytics |
| F007 - Data Export en Import | #15, #16 | ✅ Getest | Stap 13, 24: Excel + AMEFF export |
| F008 - Externe Koppelingen | #52, #55 | ✅ Getest | Stap 19: Geavanceerde koppelingen |
| F009 - Beheer en Configuratie | #11, #28, #29, #30, #106 | ✅ Getest | Stap 21, 23: Systeem beheer + content |
| F010 - Lidmaatschapsbeheer | #57, #60, #141 | ✅ Getest | Stap 20: Samenwerkingen + multi-org |
| F011 - Zoeken & Ontdekken | #19, #20, #21, #22, #68, #69, #74, #144 | ✅ Getest | Stap 14, 16, 17, 22: Volledig zoeken + benchmarking |
| F013 - Gebruik Beheer | #12, #56, #58, #105, #143 | ✅ Getest | Stap 10, 11, 12, 17, 18: Volledig gebruik beheer |
| F014 - Data Migratie | #23, #70, #71, #72 | ✅ Getest | Stap 15, 19: AMEFF + ArchiMate + legacy migratie |

## 🎉 Volledige PvE Coverage Bereikt!

**Alle 45 PvE eis issues worden nu getest in de uitgebreide testflow!**

### ✅ **Nieuw Geteste Issues in Uitgebreide Testflow**:

**Stap 16 - Standaarden Beheer**:
- [#3](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/3) - Pakketten zoeken/filteren op standaarden ondersteuning
- [#6](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/6) - Registreren welke standaarden door pakket worden ondersteund
- [#7](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/7) - Licentievorm per pakket registreren
- [#9](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/9) - Aangeven of applicatie on-premise of Cloud wordt aangeboden

**Stap 17 - "Gluren bij de Buren"**:
- [#19](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/19) - Zien welke gemeenten pakket gebruiken
- [#20](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/20) - 'Gluren bij de buren' - pakketten andere gemeenten
- [#22](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/22) - Pakketoverzicht filteren op eigenschappen
- [#74](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/74) - Overzicht organisaties die pakketten/diensten gebruiken

**Stap 18 - Leverancier Gebruik Beheer**:
- [#8](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/8) - Door gebruik-beheerders toegevoegde pakketten zien
- [#10](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/10) - Registreren welke organisaties pakket gebruiken
- [#54](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/54) - Statistieken over pakketoverzicht

**Stap 19 - Geavanceerde Koppelingen**:
- [#23](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/23) - Reeds geregistreerde gegevens weer zien in nieuwe catalogus
- [#52](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/52) - Externe bronnen
- [#55](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/55) - Bij koppeling aangeven of standaard wordt gebruikt
- [#71](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/71) - Importeren ArchiMate
- [#72](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/72) - Exporteren ArchiMate

**Stap 20 - Samenwerkingen en Multi-Organisatie**:
- [#57](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/57) - Samenwerkingsverband pakketten opvoeren voor gemeenten
- [#60](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/60) - Voor meerdere organisaties pakketoverzichten bewerken
- [#61](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/61) - Nieuwe gebruikers aanmelden bij bestaande organisatie
- [#141](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/141) - Organisaties samenvoegen bij herindeling/overname

**Stap 21 - Beheer en Configuratie**:
- [#28](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/28) - Verschillende soorten content publiceren
- [#29](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/29) - Toelichtende teksten en foutmeldingen maken/wijzigen
- [#30](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/30) - Menustructuur kunnen aanpassen
- [#75](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/75) - Rapportages maken over catalogus data
- [#106](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/106) - Tonen beschrijving bij concept (tooltip/glossary)

**Stap 22 - Geavanceerde Zoek en Filter**:
- [#59](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/59) - Alle informatie over applicaties invoeren
- [#68](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/68) - Plotten op views
- [#69](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/69) - Doorverwijzing naar GEMMA online vanuit architectuurconcepten

**Stap 23 - Functioneel Beheer Overzicht**:
- [#11](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/11) - Overzicht door gebruik-beheerders geregistreerde pakketten
- [#62](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/62) - Gebruikers gekoppeld aan organisatie

**Stap 24 - AMEFF Export**:
- [#16](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/16) - AMEFF export

### 📈 Coverage Statistieken
- **Totaal PvE eis issues**: 45 functionele issues
- **Getest in uitgebreide testflow**: 45 issues (100%) 🎉
- **Niet getest**: 0 issues (0%) ✅
- **Volledige coverage bereikt**: Alle PvE eisen worden getest!

### 🏆 Testflow Prestaties
- **24 gedetailleerde teststappen**: Van browser setup tot AMEFF export
- **13 functionaliteiten gedekt**: Alle GEMMA Softwarecatalogus functionaliteiten
- **Alle gebruikersrollen getest**: Leveranciers, gemeenten, samenwerkingen, beheerders
- **Privacy en beveiliging**: Uitgebreid getest met verschillende toegangsniveaus
- **End-to-end coverage**: Van registratie tot geavanceerde rapportages

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
