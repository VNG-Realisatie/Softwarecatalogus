---
id: kwetsbaarheid
title: Kwetsbaarheid
sidebar_label: Kwetsbaarheid
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Kwetsbaarheid

Een kwetsbaarheid is een beveiligingsprobleem in een voorzieningversie. Het beschrijft een zwakke plek in de software die mogelijk kan worden misbruikt.

<Tabs>
  <TabItem value="specificaties" label="Specificaties" default>
    <ApiSchema id="gemma" example   pointer="#/components/schemas/Kwetsbaarheid" />
  </TabItem>
  <TabItem value="relaties" label="Relaties">
    ## Relaties met andere Componenten

    Kwetsbaarheden hebben de volgende relaties met andere componenten:

    - Zijn gekoppeld aan één Voorzieningversie
    - Kunnen worden opgelost in een nieuwere Voorzieningversie

    ## Object Relaties

    Het Kwetsbaarheid object heeft de volgende relaties met andere objecten in het model:

    - **Voorzieningversie**: Een kwetsbaarheid is gekoppeld aan precies één voorzieningversie. Dit is een veel-op-één relatie waarbij de kwetsbaarheid een beveiligingsprobleem in de specifieke versie vertegenwoordigt.
    - **Voorzieningaanbod**: Er is een indirecte relatie met het voorzieningaanbod via de voorzieningversie. De kwetsbaarheid beïnvloedt de beveiliging van het aanbod.
    - **Voorziening**: Er is een indirecte relatie met de voorziening via het voorzieningaanbod. De kwetsbaarheid kan impact hebben op de functionaliteit of beveiliging van de voorziening.
    - **Leveranciersorganisatie**: Er is een indirecte relatie met de leveranciersorganisatie via het voorzieningaanbod. De leverancier is verantwoordelijk voor het oplossen van de kwetsbaarheid.
  </TabItem>
  <TabItem value="publicCode" label="PublicCode">
  In de [publiccode.yaml](https://github.com/publiccodeyml/publiccode.yaml) standaard is er geen directe tegenhanger voor het Kwetsbaarheid object. De publiccode.yaml standaard richt zich primair op het beschrijven van de software en niet op het bijhouden van beveiligingskwetsbaarheden. Echter, de volgende aspecten kunnen relevant zijn:

  | Kwetsbaarheid | publiccode.yaml | Beschrijving |
  |---------------|-----------------|--------------|
  | referenties | legal.mainCopyrightOwner | Eigenaar die verantwoordelijk is voor het oplossen van kwetsbaarheden |
  | mitigatie | maintenance.contacts | Contactgegevens voor het melden van kwetsbaarheden |

  De Softwarecatalogus biedt met het Kwetsbaarheid object een gestructureerde manier om beveiligingsproblemen bij te houden en te communiceren, wat niet expliciet wordt ondersteund in de publiccode.yaml standaard. Dit is een belangrijke aanvulling voor gemeenten die de beveiliging van hun software willen beoordelen en monitoren.
</Tabs>
