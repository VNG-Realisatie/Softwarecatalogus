# Developers

Deze gids is bedoeld voor ontwikkelaars die willen bijdragen aan de Software Catalogus. Voor een diepgaand begrip van de technische architectuur, bekijk eerst de [technische architectuur documentatie](technical-architecture.md).

## Code Standaarden

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

### Type Hints en Return Types
- Gebruik altijd expliciete type hints voor parameters
- Gebruik altijd expliciete return types
- Gebruik waar mogelijk readonly properties
- Geef default waardes aan parameters waar logisch

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

## Versiebeheer

### Git Workflow
- Gebruik feature branches voor nieuwe functionaliteit
- Branch namen moeten descriptief zijn en beginnen met het type:
  - feature/
  - bugfix/
  - hotfix/
  - release/
- Commit messages moeten duidelijk en descriptief zijn
- Squash commits voor een merge request waar logisch

### Pull Requests
- Zorg voor een duidelijke beschrijving van de wijzigingen
- Link gerelateerde issues
- Voeg unit tests toe voor nieuwe functionaliteit
- Zorg dat alle CI checks passeren
- Update documentatie waar nodig

## Development Setup

### Vereisten
- PHP 8.2 of hoger
- Composer
- Node.js (voor frontend development)
- Docker (voor lokale development)

### Lokale Ontwikkeling
1. Clone de repository
2. Installeer dependencies via Composer
3. Kopieer `.env.example` naar `.env`
4. Configureer lokale environment variables
5. Start de development servers
6. Run database migraties

## Continuous Integration

### Automatische Checks
- PHPUnit tests
- PHPStan analyse
- Psalm analyse
- Code style checks (PHP_CodeSniffer)
- Frontend builds
- Documentatie builds

### Release Process
1. Update versie nummer
2. Update changelog
3. Create release branch
4. Run full test suite
5. Build productie assets
6. Tag release
7. Deploy naar acceptatie
8. Na goedkeuring, deploy naar productie

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