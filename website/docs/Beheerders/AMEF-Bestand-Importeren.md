# AMEF-Bestand Importeren

Deze handleiding beschrijft het proces voor het importeren van AMEF-bestanden in het systeem.

## Inleiding

AMEF-bestanden (Archimate Model Exchange Format) bevatten modelelementen, relaties en diagrammen die geïmporteerd kunnen worden in de applicatie. Het importeren gebeurt via een speciaal scherm waar de benodigde URL's opgegeven kunnen worden.

## Stappen voor het importeren van een AMEF-bestand

### 1. Inloggen op het platform

1. Open de applicatie in uw webbrowser
2. Klik op de inlogknop rechtsboven in het scherm
3. Voer uw inloggegevens in
4. U wordt doorgestuurd naar uw dashboard

### 2. Navigeren naar AMEF importeren

1. Zoek in het dashboard naar de knop 'AMEF importeren'
2. Klik op deze knop om het importeervenster te openen

### 3. Invoeren van de benodigde URL's

![AMEF Import Scherm](/img/amef-import-screen.png)

In het importvenster moet u twee URL's opgeven:

1. **URL Gemma**: Dit is de URL naar de detailpagina's van Gemma Online
   - Bijvoorbeeld: 'https://www.gemmaonline.nl/index.php?title=...'
   - Deze URL wordt gebruikt in de views om door te verwijzen naar externe bronnen met gedetailleerde informatie

2. **URL naar Archimate(XML)**:
   - Dit moet een URL zijn naar een AMEF-bestand dat beschikbaar is op een weblocatie
   - Bijvoorbeeld: 'https://raw.githubusercontent.com/VNG-Realisatie/...'

:::note
Op dit moment kunnen alleen AMEF-bestanden uit de VNG-catalogus worden geïmporteerd. De applicatie ondersteunt nog geen uploads van lokale bestanden.
:::

### 4. Starten van de import

Nadat u beide URL's heeft ingevoerd:

1. Klik op de blauwe knop 'Gemma inlezen'
2. Het systeem start het importeren van het AMEF-bestand

### 5. Voortgang van de import

![Voortgang Import](/img/amef-import-progress.png)

Na het starten van de import verschijnt een nieuw scherm dat de voortgang toont:

- De applicatie toont welke onderdelen worden geïmporteerd:
  - Relations (relaties)
  - Model (modelstructuur)
  - Views (diagrammen)
  - Elements (objecten)
- Een vinkje geeft aan welke onderdelen succesvol zijn geïmporteerd

## Resultaten en logging

De gebruikersinterface voor gedetailleerde resultaten is momenteel in ontwikkeling. Om toch inzicht te krijgen in de resultaten kunt u de browser-inspector gebruiken:

1. Open de developer tools in uw browser (meestal F12 of rechtermuisknop → Inspecteren)
2. Navigeer naar het tabblad 'Network' of 'Netwerk'
3. Zoek naar API-requests gerelateerd aan de import
4. Bekijk de response van deze requests

In de API-resultaten vindt u een log met de volgende informatie:
- Aantal objecten gevonden
- Aantal objecten aangemaakt
- Aantal objecten bijgewerkt
- Aantal objecten verwijderd
- Het log-ID van de synchronisatie-acties

## Rollbacks en ongedaan maken van imports

Als er problemen zijn met een import, kan deze ongedaan gemaakt worden:

- Volledige rollbacks van een synchronisatie kunnen via de backend worden uitgevoerd
- Rollbacks van individuele objecten zijn ook mogelijk via de backend

:::note
Deze rollback-functionaliteit is alleen beschikbaar voor beheerders met toegang tot de backend.
:::

## Voorbeeld

1. Log in op het platform
2. Navigeer naar uw dashboard
3. Klik op 'AMEF importeren'
4. Vul de Gemma URL in: 'https://www.gemmaonline.nl/index.php?title=...'
5. Vul de Archimate(XML) URL in: 'https://raw.githubusercontent.com/VNG-Realisatie/...'
6. Klik op 'Gemma inlezen'
7. Volg de voortgang op het volgende scherm

Na afronding van de import kunt u de geïmporteerde elementen in de applicatie gebruiken.