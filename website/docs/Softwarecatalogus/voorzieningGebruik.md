---
id: voorzieninggebruik
title: Voorziening Gebruik
sidebar_label: Voorziening Gebruik
sidebar_position: 5
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Voorziening Gebruik

Een Voorziening Gebruik beschrijft een organisatie die een voorziening gebruikt, met optioneel de versie die gebruikt wordt en een contactpersoon.

## API Specificatie
<Tabs>
  <TabItem value="specificaties" label="Specificaties" default>
  :::note

    Het veld 'referentieComponenten' is een tijdelijke oplossing. Deze referentiecomponenten horen eigenlijk bij het [Voorziening](./voorziening) object te leven, maar omdat we momenteel nog geen gerelateerd zoeken ondersteunen, zijn ze tijdelijk hier geplaatst.

    :::
    <ApiSchema id="gemma" pointer="#/components/schemas/VoorzieningGebruik" />
  </TabItem>
  <TabItem value="relaties" label="Relaties">
    - Een VoorzieningGebruik is gekoppeld aan precies één [Organisatie](./organisatie)
    - Een VoorzieningGebruik is gekoppeld aan precies één [Voorziening](./voorziening)
    - Een VoorzieningGebruik kan gebruikt worden door meerdere [Contract](./contract) objecten
  </TabItem>
</Tabs>