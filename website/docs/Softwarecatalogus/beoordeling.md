---
id: beoordeeling
title: Beoordeeling
sidebar_label: Beoordeeling
sidebar_position: 2
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Beoordeeling

Een koppeling reprecenteerd een door organisatie gerealiseerde koppeling tussen een voorzieningGebruik enerzijdes en een voorzieningGebruik of landelijkeVoorziening anderzijds

:::info 
Beoordeeling is geen onderdeel van de voorzieningen catalaogus architectuur en toegevoegd ten behoeve van de software catalogus
:::

## API Specificatie
<Tabs>
  <TabItem value="specificaties" label="Specificaties" default>
    {/* <ApiSchema id="gemma" pointer="#/components/schemas/Beoordeeling" /> */}
    <p><em>API specificatie voor Beoordeeling is nog niet beschikbaar in het GEMMA schema.</em></p>
  </TabItem>
  <TabItem value="relaties" label="Relaties">
    - Een Beoordeeling is gekoppeld aan precies één [VoorzieningAanbod](./voorzieningaanbod)
    - Een Beoordeeling is gekoppeld aan precies één [VoorzieningGebruik](./voorzieninggebruik)
  </TabItem>
</Tabs>