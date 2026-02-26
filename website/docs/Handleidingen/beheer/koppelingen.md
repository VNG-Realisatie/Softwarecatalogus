---
id: beheer-koppelingen
title: Koppelingenbeheer
sidebar_label: Koppelingen
sidebar_position: 3
description: Handleiding voor het registreren en beheren van koppelingen tussen applicaties in de GEMMA Softwarecatalogus
keywords:
  - koppelingen
  - integraties
  - wizard
  - leverancier
  - gemeente
  - beheer
  - API
---

# Koppelingenbeheer

Koppelingen beschrijven de technische integraties tussen applicaties onderling en met buitengemeentelijke voorzieningen. Hetzelfde koppeling-object wordt gebruikt voor zowel het aanbod (welke koppelingen biedt een applicatie) als het gebruik (welke koppelingen heeft een gemeente geimplementeerd).

## Tabeloverzicht

### Als leverancier

Navigeer naar `/beheer/koppelingen` om het overzicht van uw geregistreerde koppelingen te zien. De tabel toont alleen koppelingen van uw eigen organisatie.

![Het koppelingenoverzicht voor leveranciers met een tabel van geregistreerde koppelingen](./koppelingen/beheer-koppelingen.png)

De tabel toont de richting van de koppeling (van applicatie A naar applicatie B), het type koppeling en de aanmaakdatum.

---

## Als leverancier: koppeling registreren

Als leverancier registreert u koppelingen via een wizard met 4 stappen. De wizard is bereikbaar via:
- Het beheerdashboard → kaart **Koppeling registreren**
- De knop **Toevoegen** in het koppelingenoverzicht
- Direct via `/forms/koppeling?type=eigen-organisatie`

### Stap 1 — Basisgegevens

Selecteer de bronapplicatie en doelapplicatie (of buitengemeentelijke voorziening) van de koppeling. Geef de richting aan.

![Stap 1 van de koppeling-wizard: bron- en doelapplicatie selecteren](./koppelingen/wizard-koppeling-step1.png)

### Stap 2 — Koppelingsdetails

Vul de details in van de koppeling: het type koppeling, het gebruikte protocol en een beschrijving.

![Stap 2 van de koppeling-wizard: koppelingsdetails invullen](./koppelingen/wizard-koppeling-step2.png)

### Stap 3 — Aanvullende informatie

Voeg eventueel aanvullende informatie toe, zoals documentatie-URL's of technische specificaties.

![Stap 3 van de koppeling-wizard: aanvullende informatie](./koppelingen/wizard-koppeling-step3-aanvullend.png)

### Stap 4 — Controleren

Controleer alle ingevoerde gegevens voordat u de koppeling registreert. U kunt teruggaan naar eerdere stappen om wijzigingen aan te brengen.

![Stap 4 van de koppeling-wizard: gegevens controleren](./koppelingen/wizard-koppeling-review.png)

### Resultaat

Na het klikken op **Koppeling registreren** wordt de koppeling opgeslagen.

![Succesbericht na het registreren van een koppeling](./koppelingen/wizard-koppeling-success.png)

---

## Als gemeente: koppelingen beheren

### Tabeloverzicht

Gemeenten zien in het koppelingenoverzicht (`/beheer/koppelingen`) de koppelingen die zijn geregistreerd voor hun applicaties.

![Het koppelingenoverzicht voor gemeenten](./koppelingen/beheer-koppelingen-gemeente.png)

### Koppeling toevoegen

Gemeenten kunnen koppelingen toevoegen via de knop **Toevoegen** in het koppelingenoverzicht. De wizard heeft 4 stappen: Koppeling zoeken, Koppeling definiëren, Aanvullende informatie en Controleren.

#### Stap 1 — Koppeling zoeken

Selecteer de applicatie waarvoor u een koppeling wilt registreren. De wizard zoekt automatisch naar bestaande koppelingen voor deze applicatie.

![Stap 1 van de gemeente koppeling-wizard: applicatie selecteren en bestaande koppelingen zoeken](./koppelingen/wizard-gemeente-koppeling-step1.png)

#### Stap 2 — Koppeling definiëren

Definieer de koppeling: selecteer de richting (A→B, B→A of bidirectioneel), de doelapplicatie of buitengemeentelijke voorziening (BGV), een naam, status en startdatum. U kunt via **Nieuwe koppeling toevoegen** meerdere koppelingen tegelijk registreren.

![Stap 2 van de gemeente koppeling-wizard: koppeling definiëren](./koppelingen/wizard-gemeente-koppeling-step2.png)

#### Stap 3 — Aanvullende informatie

Voeg per koppeling aanvullende informatie toe: beschrijving (kort en lang), standaardversies, transportprotocol en eventueel een intermediair.

![Stap 3 van de gemeente koppeling-wizard: aanvullende informatie](./koppelingen/wizard-gemeente-koppeling-step3.png)

#### Stap 4 — Controleren

Controleer het overzicht met de koppeling(en) en hun richting voordat u opslaat.

![Stap 4 van de gemeente koppeling-wizard: controleren](./koppelingen/wizard-gemeente-koppeling-review.png)

#### Resultaat

Na registratie verschijnt een succesbericht.

![Succesbericht na het registreren van een koppeling als gemeente](./koppelingen/wizard-gemeente-koppeling-success.png)

---

## Bekende aandachtspunten

- Een koppeling heeft altijd een **richting**: van een bronapplicatie naar een doelapplicatie of buitengemeentelijke voorziening
- Koppelingen die door de leverancier zijn geregistreerd beschrijven het **aanbod** (mogelijke integraties)
- Koppelingen die door een gemeente zijn geregistreerd beschrijven het **gebruik** (daadwerkelijk geimplementeerde integraties)

## Gerelateerde documentatie

- [K005 - Koppeling](/docs/Concepten/k005-koppeling) — Uitleg van het concept Koppeling
- [F008 - Externe Koppelingen](/docs/Functionaliteiten/f008-externe-koppelingen) — Functionele specificatie van koppelingen
- [Applicaties](./applicaties.md) — Handleiding voor applicatiebeheer
