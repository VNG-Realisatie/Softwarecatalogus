---
id: api-introductie
title: GEMMA API Documentatie
sidebar_label: Introductie
sidebar_position: 1
---

# GEMMA API Documentatie

De GEMMA API biedt toegang tot het Nederlandse gemeentelijke architectuurmodel (Gemeentelijke Model Architectuur). Via deze API kunt u het complete architectuurmodel opvragen en verkennen, inclusief alle elementen, relaties, views en eigenschapsdefinities.

## Belangrijkste functies

- Toegang tot het complete architectuurmodel
- Specifieke views, elementen, relaties en eigenschapsdefinities opvragen
- De relaties tussen architectuurcomponenten verkennen
- De architectuur visualiseren via voorgedefinieerde views

## Aan de slag

Om te beginnen met de GEMMA API kunt u:

1. De [API Specificatie](/api) bekijken voor gedetailleerde endpoint documentatie
2. De basis URL gebruiken: 'https://vng.accept.commonground.nu/apps/openconnector/api/endpoint'

## Authenticatie

Momenteel is de API publiek toegankelijk zonder authenticatie-vereisten.

## Voorbeeld gebruik

Hier is een eenvoudig voorbeeld van hoe u alle views van de API kunt ophalen:

```javascript
fetch('https://vng.accept.commonground.nu/apps/openconnector/api/endpoint/views')
  .then(response => response.json())
  .then(data => console.log(data));
```

Voor meer gedetailleerde voorbeelden en gebruikssituaties, raadpleeg de [API Specificatie](/api). 