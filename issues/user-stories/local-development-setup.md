# Lokale Ontwikkelomgeving Setup

Als ontwikkelaar wil ik een lokale ontwikkelomgeving kunnen opzetten zodat ik kan ontwikkelen.

## Context
Voor effectieve ontwikkeling is een reproduceerbare lokale ontwikkelomgeving essentieel. Deze moet alle componenten (Open Catalogi, Open Registers, Open Connector, Publicatie Voorziening) lokaal kunnen draaien.

## Zodat
- Ontwikkelaars direct kunnen starten met ontwikkelen
- Changes lokaal getest kunnen worden
- We niet afhankelijk zijn van externe omgevingen
- De setup reproduceerbaar is voor nieuwe teamleden

## Acceptatiecriteria
- [ ] Docker compose configuratie voor alle componenten
- [ ] Documentatie voor lokale setup
- [ ] Voorbeeld data beschikbaar
- [ ] Development configuratie bestanden aanwezig
- [ ] Hot-reload voor development
- [ ] Lokale AMEFF test bestanden beschikbaar
- [ ] Debug mogelijkheden geconfigureerd
- [ ] Setup werkt op Windows, Mac en Linux

## Technische Details
- Docker compose setup
- Environment variabelen configuratie
- Volume mapping voor lokale development
- Network configuratie voor component communicatie
- Debug port configuratie

## Referenties
- [Docker Compose docs](https://docs.docker.com/compose/)
- [Common Ground componenten](https://componentencatalogus.commonground.nl/) 