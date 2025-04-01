import React from 'react';
import clsx from 'clsx';
import styles from './styles.module.css';
import Link from '@docusaurus/Link';

/**
 * Lijst van features die op de homepage worden weergegeven
 * Elke feature vertegenwoordigt een hoofdsectie van de documentatie
 */
const FeatureList = [
  {
    title: 'Missie en visie',
    description: (
      <>
        De VNG werkt aan een krachtige lokale overheid en daarmee aan een betere samenleving. 
        Binnen de vereniging richt VNG Realisatie zich op het organiseren van gezamenlijke 
        oplossingen voor de maatschappelijke opgaven waarvoor gemeenten staan.
      </>
    ),
    link: '/docs/intro',
    buttonText: 'Lees meer',
  },
  {
    title: 'Organisatie',
    description: (
      <>
        VNG Realisatie werkt ontwikkelgericht. We zijn geordend volgens de stappen in de 
        ontwikkelcyclus van weten, proberen, maken en beheren. Op die manier werken we stap 
        voor stap van goede ideeën naar staande dienstverlening voor alle gemeenten.
      </>
    ),
    link: '/docs/intro',
    buttonText: 'Bekijk organisatie',
  },
  {
    title: 'Realisatie',
    description: (
      <>
        Door decentralisatie van taken, ketensamenwerking en digitalisering is de gemeentelijke 
        uitvoering en dienstverlening een flinke opgave. VNG Realisatie werkt aan een krachtige, 
        lokale uitvoeringspraktijk voor alle gemeenten.
      </>
    ),
    link: '/docs/intro',
    buttonText: 'Ontdek meer',
  },
];

/**
 * Component om een enkele feature weer te geven
 * @param {string} title - De titel van de feature
 * @param {JSX.Element} description - De beschrijving van de feature
 * @param {string} link - De URL waarnaar genavigeerd wordt bij het klikken op de knop
 * @param {string} buttonText - De tekst die op de knop wordt weergegeven
 * @returns {JSX.Element} Feature component
 */
function Feature({title, description, link, buttonText}) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
        <Link
          className="button button--secondary button--lg"
          to={link}>
          {buttonText}
        </Link>
      </div>
    </div>
  );
}

/**
 * Hoofdcomponent die alle features op de homepage weergeeft
 * @returns {JSX.Element} HomepageFeatures component
 */
export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}