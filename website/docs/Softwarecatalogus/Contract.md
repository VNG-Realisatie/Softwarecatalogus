---
id: contract
title: Contract
sidebar_label: Contract
sidebar_position: 6
---

import ApiSchema from '@theme/ApiSchema';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Contract

Een Contract beschrijft de formele overeenkomst voor het inzetten van een VoorzieningAanbod op een VoorzieningGebruik.

<Tabs>
  <TabItem value="specificaties" label="Specificaties" default>
    <ApiSchema id="gemma" example   pointer="#/components/schemas/Contract" />
  </TabItem>
  <TabItem value="relaties" label="Relaties">
    - Een Contract is gekoppeld aan precies één [VoorzieningAanbod](./voorzieningaanbod)
    - Een Contract is gekoppeld aan precies één [VoorzieningGebruik](./voorzieninggebruik)
    - Een Contract kan gekoppeld zijn aan één of twee personen objecten als contactpersonen
  </TabItem>
</Tabs>
    