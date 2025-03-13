---
id: standaardtype
title: Standaardtype
sidebar_label: Standaardtype
sidebar_position: 8
---

# Standaardtype

Een Standaardtype is een categorisering van standaarden op basis van hun functie of toepassingsgebied. Het helpt bij het organiseren en zoeken van standaarden binnen de catalogus.

## Eigenschappen

| Naam | Type | Verplicht | Beschrijving |
|------|------|-----------|--------------|
| id | string | Ja | Unieke identifier van het Standaardtype |
| naam | string | Ja | Naam van het standaardtype |
| beschrijving | string | Nee | Beschrijving van het standaardtype |

## Relaties

- Een Standaardtype kan aan meerdere [Standaard](./standaard) objecten worden gekoppeld

- Een Standaardtype kan aan meerdere [Standaar 