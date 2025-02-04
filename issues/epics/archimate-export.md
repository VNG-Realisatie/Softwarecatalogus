# Epic: ArchiMate Export

Als gebruik-raadpleger wil ik mijn gebruiksdata (pakketoverzicht en koppelingen gelinkt aan de referentiearchitectuur) als AMEFF-bestand exporteren, zodat ik deze kan inlezen in een architectuurtool.

## User Stories

### Data Verzameling
- [ ] Als ontwikkelaar wil ik alle relevante objecten kunnen verzamelen uit Open Registers
- [ ] Als ontwikkelaar wil ik relaties tussen objecten correct kunnen mappen
- [ ] Als ontwikkelaar wil ik organisatie- en softwaregegevens kunnen integreren

### AMEFF Generatie
- [ ] Als ontwikkelaar wil ik valide AMEFF XML kunnen genereren
- [ ] Als ontwikkelaar wil ik metadata kunnen toevoegen aan exports
- [ ] Als ontwikkelaar wil ik exports kunnen valideren tegen het ArchiMate schema

### Gebruikersinterface
- [ ] Als gebruiker wil ik eenvoudig een export kunnen starten
- [ ] Als gebruiker wil ik kunnen selecteren welke elementen worden geëxporteerd
- [ ] Als gebruiker wil ik feedback over de export status

## Acceptatiecriteria
- Export bevat alle geselecteerde elementen en relaties
- Export is compatibel met Archi tool
- Export bevat correcte metadata (datum, GEMMA-versie)
- Export bevat organisatie- en softwaregegevens
- Export is conform Softwarecatalogus_AMEFF_export specificaties
- Gebruiksvriendelijke export interface
- Duidelijke voortgangsindicatie tijdens export

## Technische Details
1. Data Extractie:
   - Ophalen van geselecteerde elementen
   - Verzamelen van gerelateerde objecten
   - Mapping van interne relaties

2. AMEFF Generatie:
   - XML structuur conform ArchiMate standaard
   - Metadata toevoeging
   - Validatie van output

## Afhankelijkheden
- Werkende ArchiMate import functionaliteit
- Volledig geïmplementeerd datamodel in Open Registers
- Beschikbaarheid van organisatie- en softwaregegevens 