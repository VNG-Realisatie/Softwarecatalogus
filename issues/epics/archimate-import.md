# Epic: ArchiMate Import

Als functioneel beheerder wil ik dat een nieuwe release van het GEMMA ArchiMate-model gebruiksvriendelijk ingelezen kan worden in de softwarecatalogus, waarbij de relaties die al zijn gemaakt tussen pakketten en de GEMMA blijven bestaan.

Zie ook uitwerking [Pakket van Eisen](https://vng-realisatie.github.io/Over-GEMMA-Archi-repository/?view=id-3f2d018b38fb4e008d7c142248459b29), domein [Referentiearchitectuur](https://vng-realisatie.github.io/Over-GEMMA-Archi-repository/?view=id-00da0c7e38764f8f82a57792dcddab00)

## User Stories

### XML Import Framework
- [ ] Als ontwikkelaar wil ik een robuust XML import framework in Open Connector zodat we AMEFF bestanden kunnen verwerken
- [ ] Als ontwikkelaar wil ik foutafhandeling implementeren zodat mislukte imports netjes worden afgehandeld
- [ ] Als ontwikkelaar wil ik performance optimalisatie zodat grote bestanden (14MB+) binnen 2 minuten worden verwerkt

### Data Transformatie
- [ ] Als ontwikkelaar wil ik AMEFF elementen kunnen mappen naar Open Registers objecten zodat de data gestructureerd wordt opgeslagen
- [ ] Als ontwikkelaar wil ik relaties tussen elementen behouden zodat de architectuurstructuur intact blijft
- [ ] Als ontwikkelaar wil ik versioning implementeren zodat we kunnen rollbacken bij problemen

### Visualisatie
- [ ] Als gebruiker wil ik geïmporteerde architectuur kunnen bekijken in verschillende views
- [ ] Als gebruiker wil ik kunnen inzoomen op specifieke onderdelen van de architectuur
- [ ] Als gebruiker wil ik definities zien bij hover over elementen

## Acceptatiecriteria
- Import verwerkt het [GEMMA AMEFF bestand](https://github.com/VNG-Realisatie/GEMMA-Archi-repository/blob/master/export/GEMMA%20release.xml) < 2 minuten
- Bestaande relaties blijven behouden
- Automatische rollback bij fouten
- Import kan gestart worden door de functioneel beheerder
- Duidelijke foutmeldingen voor de functioneel beheerder
- Succesvolle imports tonen GEMMA versie
- Alle elementen, relaties en views worden correct bijgewerkt
- Verwijderde elementen worden correct verwerkt
- Relaties tussen pakketten/koppelingen en GEMMA blijven herstelbaar

## Algemene acceptatiecriteria
- Database-schema voldoet aan het [CIM Voorzieningencatalogus, Domein Referentiearchitectuur](https://alliantie.github.io/voorzieningencatalogus/#global_package_Referentiearchitectuur)
- Database is toegankelijk en bruikbaar voor een [management informatietool](https://vng-realisatie.github.io/Over-GEMMA-Archi-repository/?view=id-6071c57cc54647b8b82a29df8c170bcf)

## Technische Details
1. Open Connector:
   - Implementatie van XML parser voor AMEFF
   - Validatie van bestandsstructuur
   - Performance optimalisatie voor grote bestanden
   - Foutafhandeling en logging

2. Open Registers:
   - Object model voor architectuurelementen
   - Versioning systeem
   - Relatie management
   - API endpoints voor data toegang

## Afhankelijkheden
- XML import capaciteit in Open Connector
- Stabiele versie van GEMMA ArchiMate model
- Voldoende storage capaciteit voor versioning 