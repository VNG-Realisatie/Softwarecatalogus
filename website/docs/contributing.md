# Development

Deze gids is bedoeld voor ontwikkelaars die willen bijdragen aan de Software Catalogus. Voor een diepgaand begrip van de technische architectuur, bekijk eerst de [technische architectuur documentatie](technical-architecture.md).

## Code Standaarden

### Omgevingen

Test
- Voorkant: [https://softwarecatalogus.test.opencatalogi.nl/](https://softwarecatalogus.test.opencatalogi.nl/)
- Achterkant: [https://softwarecatalogus.test.commonground.nu/](https://softwarecatalogus.test.commonground.nu/)

Acceptatie
- Voorkant: [https://softwarecatalogus.accept.opencatalogi.nl/](https://softwarecatalogus.accept.opencatalogi.nl/)
- Achterkant: [https://softwarecatalogus.accept.commonground.nu/settings/admin/openregister](https://softwarecatalogus.accept.commonground.nu/settings/admin/openregister)


### PHP Code Standaarden
- Alle PHP code moet voldoen aan PSR-12
- Gebruik van strict types is verplicht (`declare(strict_types=1);`)
- Alle code moet PHP 8.2+ compatible zijn
- PHPStan level 9 moet zonder errors passeren
- Psalm moet zonder errors passeren

### Documentatie Standaarden
- Alle classes moeten voorzien zijn van PHPDoc blocks met:
  - Class naam
  - Category
  - Package
  - Author
  - Copyright
  - License
  - Version
  - Link naar de applicatie
- Alle methods moeten voorzien zijn van PHPDoc blocks met:
  - Parameter types
  - Return types
  - Beschrijving
  - PHPStan en Psalm annotaties waar nodig

### Testing
- Alle nieuwe code moet voorzien zijn van PHPUnit tests
- Code coverage moet minimaal 80% zijn
- Tests moeten georganiseerd zijn volgens de applicatie structuur

## Documentatie

### Technische Documentatie
- Technische documentatie wordt bijgehouden in Docusaurus
- Documentatie bestanden staan in de `website/docs` directory
- Gebruik Markdown voor alle documentatie
- Gebruik enkele quotes (') in plaats van backticks (`) voor code voorbeelden

### Code Documentatie
- Voeg inline comments toe aan complexe logica
- Comments moeten uitleggen WAAROM iets gedaan wordt, niet WAT er gedaan wordt
- Houd comments up-to-date met code wijzigingen



## Support

### Hulp Krijgen
- Check bestaande issues voor bekende problemen
- Raadpleeg de technische documentatie
- Open een nieuwe issue met:
  - Duidelijke beschrijving
  - Stappen om te reproduceren
  - Verwacht vs. actueel gedrag
  - Relevante logs/screenshots

### Community
- Respecteer de code of conduct
- Help andere developers waar mogelijk
- Deel kennis en best practices
- Participeer in code reviews

## Licentie

Dit project is gelicenseerd onder de [EUPL 1.2](https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12) licentie. Zorg dat je bekend bent met de voorwaarden voordat je bijdraagt aan het project. 