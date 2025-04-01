---
id: voorzieningversie
title: Voorziening Versie
sidebar_label: VoorzieningVersie
sidebar_position: 7
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# VoorzieningVersie

Een voorzieningversie is een specifieke versie van een voorzieningaanbod. Het bevat informatie over de release, ondersteuningsperiode, systeemvereisten en eventuele kwetsbaarheden.

<Tabs>
  <TabItem value="specificaties" label="Specificaties" default>
    <ApiSchema id="gemma" example   pointer="#/components/schemas/VoorzieningVersie" />
  </TabItem>
  <TabItem value="relaties" label="Relaties">
   ## Relaties met andere Componenten

    Voorzieningversies hebben de volgende relaties met andere componenten:

    - Behoren tot één Voorzieningaanbod
    - Kunnen meerdere Kwetsbaarheden hebben

    ## Object Relaties

    Het Voorzieningversie object heeft de volgende relaties met andere objecten in het model:

    - **Voorzieningaanbod**: Een voorzieningversie behoort tot precies één voorzieningaanbod. Dit is een veel-op-één relatie waarbij de versie een specifieke release is van het aanbod.
    - **Kwetsbaarheid**: Een voorzieningversie kan meerdere kwetsbaarheden hebben. Dit is een één-op-veel relatie waarbij elke kwetsbaarheid een beveiligingsprobleem in de versie vertegenwoordigt.
    - **Leveranciersorganisatie**: Er is een indirecte relatie met de leveranciersorganisatie via het voorzieningaanbod. De leverancier is verantwoordelijk voor het uitbrengen en onderhouden van de versie.
    - **Voorziening**: Er is een indirecte relatie met de voorziening via het voorzieningaanbod. De versie implementeert de functionaliteit van de voorziening.
  </TabItem>
  <TabItem value="publicCode" label="PublicCode">

  In de [publiccode.yaml](https://github.com/publiccodeyml/publiccode.yaml) standaard komt het concept van een voorzieningversie overeen met versie-specifieke informatie. De volgende velden zijn relevant:

  | Voorzieningversie | publiccode.yaml | Beschrijving |
  |-------------------|-----------------|--------------|
  | versienummer | softwareVersion | Versie van de software |
  | releaseNotes | releaseDate | Datum van de release |
  | releaseDatum | releaseDate | Datum van de release |
  | status | developmentStatus | Ontwikkelingsstatus van de software |
  | systeemvereisten | dependsOn | Afhankelijkheden van de software |

  De publiccode.yaml standaard bevat minder gedetailleerde informatie over specifieke versies dan het Voorzieningversie object in de Softwarecatalogus. In publiccode.yaml wordt doorgaans alleen de huidige versie beschreven, terwijl de Softwarecatalogus informatie bijhoudt over meerdere versies, inclusief historische versies en hun ondersteuningsstatus. Ook bevat de Softwarecatalogus meer gedetailleerde informatie over systeemvereisten en kwetsbaarheden per versie. 
  </TabItem>
</Tabs>
