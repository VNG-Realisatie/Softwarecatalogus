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
  :::info 
  
    Toegevoegde waardes ten opzichte van voorzieningen catalogus

    - Status: Deze is gabseerd op https://yml.publiccode.tools/schema.core.html#key-developmentstatus en behelst status van het object. Objecten die inter organsiatie worden aangemaakt kunnen alleen worden aangemaakt op de status concept. Objecten onder de status concept komen niet terug in de zoek resultaten van open catalogi. En kan bevatten -> concept, development, beta, stable, obsolete
    = Contact: verwijzing (username) naar een gebruiker voor contact gegevens
    - hosting: in lijn met https://github.com/VNG-Realisatie/Softwarecatalogus/issues/9 zijn daarovoor de volgende opties toegestaan    
      - none
      - cloud (bij leverancier)
      - on-premise (bij afnemer)
      - amazon
      - azure
      - aws
      - google
      - other
    - deelneming: in het geval dat het gebruik is aangemaakt door een samenwerkings verband (ofwel voor een gemeente) dient hier het id van de aanmakende organisatie te worden ingevuld    

  :::

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