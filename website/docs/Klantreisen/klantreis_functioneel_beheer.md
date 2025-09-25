---
id: klantreis-functioneel-beheer
title: Klantreis Functioneel Beheer
sidebar_label: Functioneel Beheer
sidebar_position: 2
description: Klantreis van functioneel beheer in de GEMMA Softwarecatalogus
keywords:
  - klantreis
  - functioneel beheer
  - beheerders
  - organisaties
  - gebruikers
  - softwarecatalogus
  - GEMMA
---

# 🧭 Klantreis functioneel beheer > GEMMA Softwarecatalogus

Dit document beschrijft de klantreis van functioneel beheer in de GEMMA Softwarecatalogus. Per stap kun je een GitHub issue koppelen (bijv. voor feedback, verbeteringen of bugs).

## Overzicht Klantreis

```mermaid
flowchart TD
    A[Start: Functioneel Beheer] --> B[Fase 1: Registratie en beheer]
    B --> B1[1.1 Beoordeel aangemelde organisaties]
    B1 --> B2[1.2 Voeg samenwerking toe]
    B2 --> B3[1.3 Verwijder organisatie uit samenwerking]
    B3 --> B4[1.4 Voeg gebruikers toe]
    B4 --> C[Fase 2: Organisaties samenvoegen]
    C --> C1[2.1 Voeg gefuseerde organisaties samen]
    C1 --> C2[2.2 Voeg applicaties samen]
    C2 --> D[Fase 3: Inzicht en monitoring]
    D --> D1[3.1 Controleer conceptpakketten]
    D1 --> D2[3.2 Genereer rapportages]
    D2 --> D3[3.3 Raadpleeg gebruikersoverzicht]
    D3 --> D4[3.4 Menu items en teksten bewerken]
    D4 --> E[Einde: Beheer voltooid]
    
    style A fill:#e1f5fe
    style E fill:#c8e6c9
    style B fill:#fff3e0
    style C fill:#f3e5f5
    style D fill:#e8f5e8
```

---

## 🔹 Fase 1: Registratie en beheer van organisaties en gebruikers

| Stapnr | Actie                              | Beschrijving                                                      | Gerelateerd issue |
|--------|------------------------------------|-------------------------------------------------------------------|-------------------|
| 1.1    | Beoordeel aangemelde organisaties  | Beoordeel nieuw aangemelde leveranciers                          | [#140](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/140) |
| 1.2    | Voeg samenwerking of bijzondere organisatie toe | Voeg een samenwerking, aanbieder of bijzondere gemeente toe     | [#142](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/142), [#143](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/143) |
| 1.3    | Verwijder organisatie uit samenwerking | Verwijder de organisatie uit een bestaande samenwerking         | – |
| 1.4    | Voeg gebruikers toe                | Voeg gebruikers toe aan gemeenten, leveranciers of samenwerkingen | [#63](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/63), [#64](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/64) |

---

## 🔹 Fase 2: Organisaties samenvoegen

| Stapnr | Actie                              | Beschrijving                                                    | Gerelateerd issue |
|--------|------------------------------------|-----------------------------------------------------------------|-------------------|
| 2.1    | Voeg gefuseerde organisaties samen | Verwerk herindelingen of fusies van gemeenten of leveranciers   | [#141](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/141) |
| 2.2    | Voeg applicaties samen | (Concept) applicaties samenvoegen   | [#141](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/141) |

---

## 🔹 Fase 3: Inzicht en monitoring

| Stapnr | Actie                              | Beschrijving                                                      | Gerelateerd issue |
|--------|------------------------------------|-------------------------------------------------------------------|-------------------|
| 3.1    | Controleer conceptpakketten        | Controleer en valideer door gemeenten of samenwerkingen aangeleverde pakketten  | [#11](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/11) |
| 3.2    | Genereer rapportages               | Maak rapportages over het gebruik en de datakwaliteit            | [#75](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/75) |
| 3.3    | Raadpleeg gebruikersoverzicht      | Raadpleeg en beheer gebruikers per organisatie                   | [#62](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/62) |
| 3.3    | Menu items en teksten bewerken    | Bewerken van menu's, pagina's en teksten  | [#28](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/28) , [#29](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/29) , [#30](https://github.com/VNG-Realisatie/Softwarecatalogus/issues/30) , [ |
