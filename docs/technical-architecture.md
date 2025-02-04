# Technische Architectuur

De Softwarecatalogus is opgebouwd uit verschillende Common Ground componenten die samen een complete oplossing vormen. Hieronder volgt een overzicht van de belangrijkste componenten en hun functies.

![Component Diagram](diagrams/components.svg)

## Componenten

### Publicatie Voorziening (Frontend)
De frontend van de Softwarecatalogus wordt verzorgd door de Publicatie Voorziening. Deze component:
- Biedt een gebruiksvriendelijke interface voor eindgebruikers
- Zorgt voor een toegankelijke presentatie van de catalogusgegevens
- Implementeert de gebruikersinteractie en zoekfunctionaliteit
- Visualiseert GEMMA-views met ArchiMate symbolen
- Ondersteunt SVG export van architectuurviews
- Biedt interactieve definitieweergave (Glossary functionaliteit)

### Open Catalogi
Dit component is verantwoordelijk voor:
- Het inrichten van de catalogusstructuur
- Zoekfunctionaliteit en filtering
- Metadata management
- Categorisering en tagging van software
- GEMMA ArchiMate model importeren en verwerken
- Beheer van relaties tussen pakketten en GEMMA architectuur
- API voor GEMMA architectuurconcepten

### Open Registers
De datalaag wordt verzorgd door Open Registers, die:
- Fungeert als centrale dataopslag
- Beheert de basisregistraties van software en organisaties
- Zorgt voor data-integriteit en versioning
- Biedt een API voor data-toegang
- Slaat GEMMA architectuurconcepten op
- Beheert versies van het GEMMA ArchiMate model

### Open Connector
De Open Connector component:
- Verzamelt data uit externe bronnen (zoals CMDB's)
- Aggregeert en transformeert data naar het juiste formaat
- Synchroniseert data tussen verschillende systemen
- Implementeert de benodigde koppelingen met externe systemen
- Verzorgt AMEFF import/export functionaliteit
- Koppelt met GEMMA Online voor detailinformatie

## Referentiearchitectuur Functionaliteit

### ArchiMate Integratie
![ArchiMate Integration](diagrams/archimate_integration.svg)

De oplossing ondersteunt:
1. AMEFF bestandsimport (< 2 minuten voor 14MB)
2. Versie management van GEMMA modellen
3. Behoud van bestaande relaties bij updates
4. Automatische rollback bij importfouten
5. AMEFF export van pakketoverzichten

### GEMMA Architectuur Ontsluiting
- REST API voor GEMMA architectuurconcepten
- Zoek- en filterfunctionaliteit op architectuurconcepten
- Linked Data API voor definities
- Directe koppelingen naar GEMMA Online
- Configureerbare basis-URLs voor verschillende omgevingen

### Visualisatie
- Interactieve GEMMA-views
- ArchiMate symbolenondersteuning
- SVG export functionaliteit
- Inzoombare views
- Hover-functionaliteit voor definities
- Consistente styling met GEMMA Online

## Interactie tussen Componenten

De componenten werken samen volgens Common Ground principes:
1. Data wordt bij de bron opgehaald
2. Componenten communiceren via gestandaardiseerde API's
3. Er is een duidelijke scheiding tussen data en functionaliteit

## GEMMA ArchiMate Model

De Softwarecatalogus maakt gebruik van het officiële [GEMMA ArchiMate model](https://www.gemmaonline.nl/index.php?title=Download_GEMMA_ArchiMate-repository). Dit model:
- Is beschikbaar als AMEFF (ArchiMate Model Exchange File Format) export
- Wordt regelmatig geactualiseerd en doorontwikkeld
- Bevat de complete GEMMA referentiearchitectuur
- Kan worden geïmporteerd in architectuurtools zoals Archi

Het model wordt gebruikt voor:
- Het importeren van nieuwe GEMMA releases
- Het koppelen van software aan referentiecomponenten
- Het exporteren van gemeentelijke architectuuroverzichten
- Het visualiseren van architectuurviews 