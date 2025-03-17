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
  </TabItem>
</Tabs>
    

## Relaties

- Een Contract is gekoppeld aan precies één [VoorzieningAanbod](./voorzieningaanbod)
- Een Contract is gekoppeld aan precies één [VoorzieningGebruik](./voorzieninggebruik)
- Een Contract kan gekoppeld zijn aan één of twee personen objecten als contactpersonen

## Voorbeeld

```json
{
  "id": "CON-2023-001",
  "voorzieningAanbod": {
    "id": "VA-001",
    "naam": "DigiD Basis"
  },
  "voorzieningGebruik": {
    "id": "VG-2023-001",
    "organisatie": {
      "id": "ORG-001",
      "naam": "Gemeente Amsterdam"
    },
    "voorziening": {
      "id": "VZ-001",
      "naam": "DigiD"
    }
  },
  "startDatum": "2023-01-15",
  "eindDatum": "2024-01-14",
  "contractNummer": "DIGID-AMS-2023-001",
  "contractType": "SLA",
  "kosten": 5000,
  "kostenPeriode": "Jaarlijks",
  "contactpersoonAanbieder": {
    "id": "PER-002",
    "naam": "Piet Pietersen",
    "email": "p.pietersen@logius.nl"
  },
  "contactpersoonGebruiker": {
    "id": "PER-001",
    "naam": "Jan Jansen",
    "email": "j.jansen@amsterdam.nl"
  },
  "documentReferentie": "DOCS/CONTRACTEN/DIGID-AMS-2023-001.pdf",
  "status": "Actief",
  "opmerkingen": "Inclusief 24/7 support"
} 