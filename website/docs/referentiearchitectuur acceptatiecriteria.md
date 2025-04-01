# Acceptatiecriteria SWC component referentiearchitectuur

## Inleiding

Dit document beschrijft de acceptatiecriteria voor de realisatie van de functionaliteitgroep ‘referentiearchitectuur’, zoals gedefinieerd in het Programma van Eisen.

## Voorstel planning

In overleg met de leverancier **Conduction** wordt een planning opgesteld. Onderstaand voorstel is opgedeeld in drie sprints van elk **twee weken**:

- 0 sprint
  - Gezamenlijk opstellen
    - definition of done
    - design decision
      - toepassing informatiemodel voorzieningencatalogus verder uitwerken
      - ..
  - user stories refinen
    - user stories bespreken en voorzien van ontwerpen
    - toelichten en uitwerken acceptatiecriteria per user story
  - techniek
    - toelichting op de door Conduction te gebruiken componenten
    - initiele inrichting repositories, framework, etc
    - ...
  - start met user story 1
- sprint 1, importeren en ontsluiten
- sprint 2, plotten en export

## Aanzet Definition of Done (DoD)

1. De functionaliteit is geïmplementeerd en getest conform de requirements.
2. Er is een succesvolle demonstratie van de functionaliteit aan stakeholders.
3. De oplossing is geïntegreerd en functioneert binnen de softwarecatalogus.
4. Er is documentatie beschikbaar
5. Er zijn geen openstaande bugs of blokkades die het gebruik belemmeren.
6. ..

## Acceptatiecriteria epic referentiearchitectuur

In de onderstaande tabel zijn de acceptatiecriteria per user story binnen de _‘referentiearchitectuur’_\-epic uitgewerkt. Deze criteria zijn aanvullend op de non-functionele eisen uit het Programma van Eisen, die voor alle user stories van toepassing zijn.

In het [informatiemodel voorzieningencatalogus](https://alliantie.github.io/voorzieningencatalogus/) wordt het objecttype [Referentieconcept](https://alliantie.github.io/voorzieningencatalogus/#global_class_Referentiearchitectuur_Referentieconcept) gedefinieerd. Voor de acceptatiecriteria geldt dat de oplossing voorbereid moet zijn op meerdere invullingen van Referentieconcept, met als startpunt de **referentiecomponent**.

<table><tbody><tr><th><p>ID</p></th><th><p>User story</p></th><th><p>Acceptatiecriteria</p></th></tr><tr><td><p>73</p></td><td><p><strong>Importeren ArchiMate</strong></p><p>Als functioneel beheerder wil ik dat een nieuwe release van het GEMMA ArchiMate-model gebruiksvriendelijk ingelezen kan worden in de softwarecatalogus, waarbij de relaties die al zijn gemaakt tussen pakketten en de GEMMA blijven bestaan, opdat gemeenten overal dezelfde GEMMA versie zien. Ga naar <a href="https://www.gemmaonline.nl/wiki/Download_GEMMA_ArchiMate-repository">Download_GEMMA_ArchiMate-repository</a> voor meer informatie over het AMEFF bestand.</p></td><td><ul><li>De functioneel beheerder kan met behulp van documentatie zelfstandig een nieuwe versie van het GEMMA AMEFF-bestand importeren</li><li>Bij fouten krijgt de functioneel een duidelijke foutmelding, inclusief aanwijzingen wat gecorrigeerd moet worden.</li><li>De bestaande relaties tussen pakketten, koppelingen en de GEMMA blijven behouden.</li><li>Bij een mislukte import wordt automatisch teruggeschakeld naar de vorige GEMMA-versie zonder gegevensverlies.</li><li>De GEMMA versie van een succesvol ingelezen AMEFF-bestand is zichtbaar</li><li>Alle elementen, relaties en views uit het GEMMA AMEFF-bestand worden bijgewerkt, dus ook verwijderingen</li><li>Uitzondering is het verwijderen van relaties tussen pakketten, koppelingen en de GEMMA-architectuur. Deze zijn altijd te herstellen door dezelfde referentiecomponent (met hetzelfde Object ID) opnieuw aan te bieden.</li><li>Het importeren van het GEMMA AMEFF-bestand duurt niet langer dan 2 minuten (grootte nu 14MB)</li></ul></td></tr><tr><td><p>74</p></td><td><p><strong>Ontsluiten architectuur concepten</strong></p><p>Als gebruiker van de Softwarecatalogus wil ik beschikken over de GEMMA architectuurconcepten (referentiecomponenten, standaarden, applicatieservices, etc), opdat deze beschikbaar zijn voor het meta-dateren, zoeken en filteren van pakketten en diensten.</p></td><td><ul><li>De GEMMA-architectuur is opvraagbaar met een API</li><li>De API is testbaar</li><li>Gebruikers kunnen zoeken en filteren op basis van GEMMA-architectuur, zoals referentiecomponenten, standaarden, applicatieservices en/of domeinen.</li></ul></td></tr><tr><td><p>75</p></td><td><p><strong>Ontsluiten architectuur concepten</strong></p><p>Als gebruiker van de Softwarecatalogus wil ik waar GEMMA-concepten worden getoond, wil ik dat GEMMA-concepten worden uitgelegd of verklaard, zodat ik in één keer kan zien wat deze inhoud. (Glossary)</p></td><td><ul><li>Onderdelen van de GEMMA-architectuur en de definitie zijn met een (linked data) API opvraagbaar.</li><li>Definities worden weergegeven via een interactieve optie binnen de softwarecatalogus</li></ul></td></tr><tr><td><p>76</p></td><td><p><strong>Ontsluiten architectuur concepten</strong></p><p>Als gebruiker van de Softwarecatalogus wil ik vanuit de GEMMA architectuurconcepten (referentiecomponenten, standaarden, etc) worden doorverwezen naar GEMMA online, opdat ik direct toegang heb tot de detail architectuurinformatie.</p></td><td><ul><li>De basis-URL naar GEMMA online is door functioneel beheerder te definiëren.</li><li>De acceptatieomgeving en de productieomgeving hebben ieder een eigen basis-URL die respectievelijk naar de staging- en productieomgeving van GEMMA online verwijst</li><li>Elk element uit de GEMMA-architectuur bevat een link naar de relevante detailpagina op GEMMA online. Wanneer men op de link klikt opent in een nieuw tabblad de gekoppelde detailpagina.</li></ul></td></tr><tr><td><p>77</p></td><td><p><strong>Plotten op views</strong></p><p>Als gebruiker wil ik de pakketoverzichten of portfolio’s die ik mag inzien, kunnen plotten op een GEMMA-view waarop ik kan inzoomen en die ik kan downloaden als SVG, zodat ik een duidelijk overzicht heb en deze kan gebruiken ter ondersteuning van gesprekken.</p></td><td><ul><li>Gebruikers kunnen de pakketoverzichten of portfolio’s die zij mogen inzien, visualiseren op een GEMMA-view.</li><li>De GEMMA-view toont de relaties tussen pakketten en referentiecomponenten. De oplossing is voorbereid op het tonen van de relaties met andere referentieconcepten zoals applicatieservices of diensten.</li><li>Gebruikers selecteren eerst de GEMMA-view waarop ze het pakketoverzicht geplot willen hebben.</li><li>De GEMMA-views maken gebruik van de ArchiMate-symbolen, zoals beschreven op <a href="https://www.gemmaonline.nl/wiki/DisplayArchiMateGlossary">DisplayArchiMateGlossary</a></li><li>De GEMMA-view kan worden gedownload als SVG-bestand.</li><li>De gedownloade SVG bevat duidelijke en correcte informatie.</li><li>De SVG bevat de definities van de getoonde elementen en toont deze als over een element wordt gehovered.</li><li>Gebruikers kunnen inzoomen op specifieke delen.</li><li>De SVG moet consistent zijn met de visuele stijl en structuur van GEMMA Online.</li></ul></td></tr><tr><td><p>72</p></td><td><p><strong>Exporteren ArchiMate</strong></p><p>Als gebruik-raadpleger wil ik mijn gebruiksdata (pakketoverzicht en koppelingen gelinkt aan de referentiearchitectuur) als AMEFF-bestand exporteren, opdat ik deze kan inlezen in een architectuurtool en kan gebruiken voor mijn gemeentelijke architectuur. Op GEMMA online wordt in een ArchiMate view weergegeven wat nu de relaties zijn tussen de pakketten en het GEMMA model. Zie hiervoor de pagina <a href="https://www.gemmaonline.nl/wiki/Softwarecatalogus_AMEFF_export">Softwarecatalogus_AMEFF_export</a>.</p></td><td><ul><li>Gebruiker kunnen hun pakketoverzicht en koppelingen exporteren als een AMEFF-bestand via een duidelijke call-to-action.</li><li>De exportfunctionaliteit kan worden aangeroepen met als parameter een lijst van in te voegen pakketten en koppelingen</li><li>Het exportbestand bevat de elementen en relaties zoals beschreven op de pagina <a href="https://www.gemmaonline.nl/wiki/Softwarecatalogus_AMEFF_export">Softwarecatalogus_AMEFF_export</a>.</li><li>Het exportbestand bevat metadata zoals datum en GEMMA-versie</li><li>De architectuurtool Archi importeert het AMEFF-exportbestand zonder foutmeldingen en toont de toegevoegde views met geplotte pakketten correct.</li></ul></td></tr></tbody></table>