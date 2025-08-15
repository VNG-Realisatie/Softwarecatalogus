| Eigenaar | Ingevuld door |
| --- | --- |
| Kennis Centrum Architectuur | Mark Backer, Peter Makkes |
<hr/>

# Softwarecatalogus
De Softwarecatalogus van de VNG helpt gemeenten haar applicatielandschap in kaart te brengen, te relateren aan de GEMeentelijke Model Architectuur, inzicht te geven in het softwareaanbod van de aangemelde aanbieders.
Gemeenten gebruiken de GEMMA Softwarecatalogus bij ICT-vervangings- of investeringsvraagstukken. Zij vergelijken hun ingevoerde applicatielandschap en koppelingen met anderen en zoeken contact met vergelijkbare gemeenten.  
Deze nieuwe versie van de softwarecatalogus gaat aansluiten bij nieuwe vraagstukken. De basis blijft intact. 

Gemeenten gebruiken de softwarecatalogus voor:

- Marktoriëntatie voor nieuwe of vervangende software;
- Vergelijken met andere gemeenten;
- Contact leggen met gemeenten met vergelijkbaar of interessant productportfolio;
- Het plannen van ICT-vervangingen;
- Het opstellen van een Programma van Eisen;
- Het beoordelen van offertes.

## Project overzicht
- [Project planning](https://github.com/orgs/VNG-Realisatie/projects/17)
- [Meetings](https://github.com/VNG-Realisatie/softwarecatalogus/tree/main/meetings)
- [Issues](https://github.com/VNG-Realisatie/softwarecatalogus/issues)

## Projectafspraken
Het project is opgedeeld in 4 blokken:

### Component referentie-architectuur (5 februari - 18 maart)
Focus op het GEMMA ArchiMate-model
- Importeren en exporteren ArchiMate
- Ontsluiten GEMMA met API 
- Plotten op GEMMA views

### Component organisaties (19 maart - 15 april)
Focus op organisatiebeheer en gebruikersfunctionaliteit
- Beheren organisaties
- Ontsluiten organisaties  
- Registreren extra organisatie informatie
- Beheren gebruikers en rollen

### Component aanbod (16 april - 13 mei)
Focus op aanbod en gebruiksstatistieken
- Raadplegen aanbod
- Raadplegen gebruik
- Filteren
- Tonen statistieken gebruik
- Registreren aangeboden pakketten

### Component gebruik (14 mei - 10 juni)
Focus op gebruikerservaring en functionaliteit
- Exporteren
- Beheren configuratie
- Beheren Content
- Migratie
- Registreren koppelingen
- Registreren gebruikte pakketten
- Standaarden
- Gebruikersvriendelijk
- Toegankelijkheid

## Sprint Planning
| Sprint | Onderwerp | Begindatum | Einddatum |
|--------|-----------|------------|------------|
| 1 | Component referentie-architectuur | 5 februari | 18 februari |
| 2 | Component referentie-architectuur | 19 februari | 4 maart |
| 3 | Component referentie-architectuur | 5 maart | 18 maart |
| 4 | Component organisaties | 19 maart | 1 april |
| 5 | Component organisaties | 2 april | 15 april |
| 6 | Component aanbod | 16 april | 29 april |
| 7 | Component aanbod | 30 april | 13 mei |
| 8 | Component gebruik | 14 mei | 27 mei |
| 9 | Component gebruik | 28 mei | 10 juni |

Iedere twee weken op de dinsdag is een gezamenlijke bijeenkomst in Utrecht. Meetings die dan plaatsvinden zijn:
- Sprintreview​s (eerste periode besloten, later op uitnodiging)
- Toelichting op sprintplanning
- Informatie uitwisseling​

Eens in de maand komt de stuurgroep bijeen. Zij focussen zich vooral op voortgang.
De stuurgroep bestaat uit:
- de opdrachtgever en de projectleider namens de VNG
- ..​

## Architectuur en ontwerp

Als onderdeel van het bestek is een **Pakket van Eisen (PvE)** opgesteld, beschikbaar als document en spreadsheet. Dit PvE is verder uitgewerkt in een reeks **ArchiMate-views**.  

Doelen van de ArchiMate-views:
- Toegankelijk maken van het PvE voor gebruik bij sprintbesprekingen en refinement van user stories.  
- Weergeven van de technische architectuur en de realisatie van de **Softwarecatalogus**.  

De views zijn toegankelijk via het [Softwarecatalogus rapport](https://vng-realisatie.github.io/Softwarecatalogus-Archi-repository/?view=id-59dac597ac234451bba4c8246e8c701e), gemaakt met Archi.

## Omgevingen
Voor deze fase van het poject gebruiken we alleen nog een test en acceptatie omgeving, na fase
* [Acc omgeving (frontend)](https://vng.opencatalogi.nl/)
* [Acc omgeving (backend)](vng.accept.commonground.nu)
* [Test omgeving (frontend)](https://vng.test.opencatalogi.nl/)
* [Test omgeving (backend)](vng.test.commonground.nu)
* [Project Inrichting](https://github.com/VNG-Realisatie/softwarecatalogus/projects?query=is%3Aopen)

### Contactgegevens betrokkenen:

Contact kan worden opgenomen via softwarecatalogus@vng.nl

#### VNG
* Peter Makkes (Productowner)
* Mark Backer (Solution Architect)
* Jeroen de Ruig (Projectleider)
* Nils Verhoeven (Projectmedewerker)
* John van Dijk (Opdrachtgever)

#### Conduction
* [Ruben van der Linde](https://github.com/rubenvdlinde)(Product lead/Owner)
* [Matthias Oliveiro](https://github.com/matthiasoliveiro) (Scrum & Testen)
* [Remco Damhuis](https://github.com/Rem-Dam) (Commercieel & Contractbeheer)
* [Mark Westerweel](https://github.com/MWest2020) (Implementatie, Beheer en Ondersteuning)
* [Remko Huisman](https://github.com/remko48), [Thijn Douwma](https://github.com/SudoThijn) (Frontend Development)
* [Robert Zondervan](https://github.com/rjzondervan), [Wilco Louwerse](https://github.com/WilcoLouwerse), [Barry Brands](https://github.com/bbrands02) (Backend Development)

# Project Inrichting

## Organisatiestructuur

Het project kent twee belangrijke overlegstructuren:

### Stuurgroep
De stuurgroep komt ieder kwartaal bijeen om de algemene projectvoortgang te bespreken. De stuurgroep bestaat uit:
- Ruben
- John
- Remco
- Jeroen

### Projectgroep
De projectgroep komt elke twee weken op dinsdag bijeen voor sprint planning en issue management.

## Project Documentatie
Voor meer informatie over het project, raadpleeg de volgende documenten:

### Technische Documentatie
- [Technische Architectuur](docs/technical-architecture.md) - Overzicht van de componenten en hun samenhang
- [Security](docs/security.md) - Security maatregelen en procedures
- [Contributing Guidelines](CONTRIBUTING.md) - Richtlijnen voor het bijdragen aan het project

De [Technische documentatie](https://vng-realisatie.github.io/Softwarecatalogus/) is dankzij DocuSaurus overzichtelijker en eenvoudiger toegankelijk.
