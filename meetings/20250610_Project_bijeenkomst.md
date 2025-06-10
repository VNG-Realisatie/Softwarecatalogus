# Project Bijeenkomst 10/06/2025

## Agenda
- Mededelingen
    - Samenvatting bijeenkomst
    - Testen ahv klant [reizen](https://github.com/VNG-Realisatie/Softwarecatalogus/blob/documentation/docs/klantreis_leverancier.md) 
- Stand van zaken (sprint 8)
    - email templates
- Toelichting op sprintplanning print 9
    - Even goed ophalen wat nu de rest punten voor archi zijn (uberhaupt) zodat die a.s.a.p kunnen worden afgerond
    - Inplannen nieuwe frontend dag
- Informatie uitwisseling

## Issues up for review
- [Sprint 4](https://github.com/orgs/VNG-Realisatie/projects/17/views/3?filterQuery=status%3AReview+assignee%3Amarkbacker%2CMakkmetp) 

## Actiepunten

- Gebruiekrs reis gemeenten uitschrijfen (Peter)


## Notities aan de hand van review

📋 Registratieformulier
- Overal “aanmelden” gebruiken in plaats van “registreren”
- Organisatietype vooraf laten invullen op basis van een link
- Korte beschrijving: gebruik Markdown + toon het resterende aantal tekens duidelijk
- Tooltip (i’tje) bij korte beschrijving toevoegen
- Logo optioneel maken
- Website verplaatsen naar organisatiegegevens en verplicht maken
- Bij contactpersoon vermelden: waarvoor is deze persoon contactpersoon?
- Bij contactpersoon uitlegtekst opnemen (wordt aangeleverd door Peter)
- Bij versturen: “U gaat akkoord met de volgende richtlijnen” (inhoud wordt aangeleverd door Peter)
- Akkoord laten gaan met opslag van persoonsgegevens (inhoud wordt aangeleverd door Peter)
- Bij “gemeente” geen formulier tonen, maar informatieve tekst: “Neem contact op met Peter”
-Logo: toon een leeg plaatje, vervang dit bij upload door een file selector

🏢 Organisatie-inrichting
- Bij organisatiegegevens: logo upload in plaats van URL
- Contactpersonen en samenwerkingen tonen als tabbladen
- Lange beschrijving kan erg lang zijn – overwegen dit in een apart formulier op te nemen
- Korte én lange beschrijving onder organisatienaam tonen
- Organisaties hebben geen links, maar wel verklaringen (die extern zinvol zijn)
- Labels worden bepaald door Peter; richtlijn bevat: geen commerciële richtlijnen
- Kolom “status” moet hernoemd worden
- “Types” en “grootte” weglaten
- Bestandsnaam linken aan bestand, met optie publiceren / depubliceren
- Lange beschrijving in een apart formulier opnemen
- Per veld instelbaar maken of het doorzoekbaar is
- Formulier afhankelijk maken van gekozen organisatietype
- Verklaring kunnen toevoegen en verwijderen
- Deelnemingen kunnen toevoegen
- Knoppen staan nu soms links, soms rechts → harmoniseren
- In het bewerkformulier van organisaties nadenken over logische blokindeling
- Rol wordt verwijderd uit organisaties
- Sector staat nu als “doelgroep” bij applicatie → verplaatsen/hernoemen

👥 Gebruikers beheren
- Gebruikers hebben geen bestanden
- Rollen moeten overeenkomen met de VNG functiematrix
- Formulier tonen in kolommen
- Ingelogde gebruiker kan geen organisatie selecteren (tenzij admin)
- Formulier maken voor uitnodigen van gebruikers voor eigen organisatie
- Taal altijd op Nederlands
- Thema altijd op “light”
- Vinkje “aanspreekpunt” = gepubliceerd (to do)
- In formulier aangeven welke gegevens worden gepubliceerd
- Contactgegevens horen bij organisatie, maar scheiding accounts/contactgegevens parkeren
- Peter onderzoekt hoeveel accounts aan meerdere organisaties hangen
- Als je aanspreekpunt bent → overige contactgegevens verplicht maken (bv. telefoonnummer)

👤 Gebruiker personaliseren (via “My” URL)
- Thema en taal kunnen kiezen

🧩 Applicaties toevoegen
- Waar komt applicatietype vandaan? (vermoedelijk uit datamodel bij voorziening: applicatie, technologie, hosting)
- Welke waardes missen nog? Zie PowerPoint
- Bij selecteren van referentiecomponent worden standaarden gesuggereerd → keuze uit lijst of zelf toevoegen
- Categorie kan vervallen
- Functionaliteiten kunnen vervallen
- Doelgroepen vervallen
- Referentiecomponenten kunnen aan elkaar gekoppeld worden
- Bij standaarden aangeven of je compliant bent (eventueel met testrapport)
- Standaarden zijn koppelobjecten in apart tabblad
- Mogelijk als apart formulier uitwerken
- Domein toevoegen aan formulier
- Beschrijving van wat een component doet toevoegen- Klantreis van maken
- Sorteer alfabetisch + hover voor beschrijving
- Bug: “sticky contactpersoon”
- Versies als tabblad tonen
- Hostingopties toevoegen, incl. “on-premise”
- Licentietype: open source of closed source.
- Bij open source → licentie selecteren
- Bij closed source → geen keuze
- Link naar repository (optioneel)
- Knop “Bekijken in catalogus”

🌀 Versies toevoegen
- Productlevenscyclus: met in-/uitdatum per status (bv. “in gebruik”)
- Systeemvereisten vervallen
- Kwetsbaarheden ook voor nu schrappen
- Bij SaaS-applicaties automatisch een default versie aanmaken
- Voor nu geen bestanden

📑 Dienst
- Tabblad “Diensten” met alleen de diensten van de betreffende organisatie
- Welk rekencentrum wordt gebruikt voor de dienst?
- Voorziening wordt hernoemd naar “applicatie”
- Mark past informatiemodel aan, aanbiedersrol vervalt
- Geen ondersteunde standaarden meer tonen
- Certificeringen vervallen – worden “verklaringen”
- Prijsmodel kan eruit
- Licentie vervalt
- Hostingopties vervallen
-Laag verwijst naar applicatie

📊 Gebruik
- Elke status heeft een startdatum
- Geen einddatum → dat is de startdatum van de volgende status
- Peter onderzoekt of BBN en IBP scores velden moeten worden → voorlopig weglaten
- Opmerkingen zijn niet-publieke interne tekst


