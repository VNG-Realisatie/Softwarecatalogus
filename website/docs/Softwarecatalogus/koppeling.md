---
id: koppeling
title: Koppeling
sidebar_label: Koppeling
sidebar_position: 2
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Koppeling

Een koppeling reprecenteerd een door organisatie gerealiseerde koppeling tussen een voorzieningGebruik enerzijdes en een voorzieningGebruik of landelijkeVoorziening anderzijds

:::info 
Kopeling is geen onderdeel van de voorzieningen catalaogus architectuur en toegevoegd ten behoeve van de software catalogus
:::

## API Specificatie
<Tabs>
  <TabItem value="specificaties" label="Specificaties" default>
    <ApiSchema id="gemma" pointer="#/components/schemas/Koppeling" />
  </TabItem>
  <TabItem value="relaties" label="Relaties">
    - Een Koppeling is gekoppeld aan precies één [VoorzieningGebruik](./voorzieninggebruik) (van)
    - Een Koppeling is gekoppeld aan precies één [VoorzieningGebruik](./voorzieninggebruik) (naar)
  </TabItem>
</Tabs>