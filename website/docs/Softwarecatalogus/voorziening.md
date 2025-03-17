---
id: voorziening
title: Voorziening
sidebar_label: Voorziening
sidebar_position: 3
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Voorziening

Een voorziening is een softwareproduct of dienst die functionaliteit biedt voor gemeentelijke of andere overheidsprocessen. Voorzieningen vormen de basis van de informatievoorziening en kunnen door verschillende leveranciers worden aangeboden.

## API Specificatie
<Tabs>
  <TabItem value="specificaties" label="Specificaties" default>
    <ApiSchema id="gemma" pointer="#/components/schemas/Voorziening" />
  </TabItem>
  <TabItem value="relaties" label="Relaties">
  - Een Voorziening kan van een bepaald [Voorzieningstype](./voorzieningstype) zijn
  - Een Voorziening kan worden aangeboden via meerdere [VoorzieningAanbod](./voorzieningaanbod) objecten
  - Een Voorziening kan worden gebruikt via meerdere [VoorzieningGebruik](./voorzieninggebruik) objecten

  ## Object Relaties

  Het Voorziening object heeft de volgende relaties met andere objecten in het model:

  - **Voorzieningaanbod**: Een voorziening kan via meerdere voorzieningaanbiedingen worden aangeboden. Dit is een één-op-veel relatie waarbij de voorziening het product is dat wordt aangeboden.
  - **Leveranciersorganisatie**: Er is een indirecte relatie met leveranciersorganisaties via de voorzieningaanbiedingen. Een voorziening kan door meerdere leveranciers worden aangeboden.
  - **GEMMA Referentiecomponenten**: Een voorziening kan één of meerdere GEMMA referentiecomponenten implementeren, wat aangeeft hoe de voorziening past binnen de GEMMA architectuur.
  </TabItem>
  <TabItem value="publicCode" label="PublicCode">
  In de [publiccode.yaml](https://github.com/publiccodeyml/publiccode.yaml) standaard komt het concept van een voorziening overeen met de hoofdbeschrijving van de software. De volgende velden zijn relevant:

  | Voorziening | publiccode.yaml | Beschrijving |
  |-------------|-----------------|--------------|
  | naam | name | Naam van de software |
  | beschrijving | description.* | Beschrijving van de software in verschillende talen |
  | categorie | categories | Categorieën waartoe de software behoort |
  | functionaliteiten | description.features | Functionaliteiten die de software biedt |
  | doelgroep | usedBy | Organisaties die de software gebruiken |
  | standaarden | intendedAudience.scope | Beoogde gebruikers en toepassingsgebied |
  | gemmaReferentieComponenten | localisation.availableLanguages | Ondersteunde talen en lokalisaties |

  De publiccode.yaml standaard is primair gericht op het beschrijven van de software zelf, wat overeenkomt met het Voorziening object in de Softwarecatalogus. Het biedt gedetailleerde informatie over de functionaliteit, doelgroep en technische aspecten van de software. 
</Tabs>
