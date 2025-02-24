// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'VNG Softwarecatalogus',
  tagline: 'Het centrale platform voor gemeentelijke software en architectuur informatie',
  url: 'https://vng-realisatie.github.io',
  baseUrl: '/softwarecatalogus/',
  
  // GitHub pages deployment config
  organizationName: 'VNG-Realisatie', 
  projectName: 'softwarecatalogus',
  trailingSlash: false,

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internalization, you can use this field to set useful
  // metadata like html lang
  i18n: {
    defaultLocale: 'nl',
    locales: ['nl'],
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
        },
        blog: false,
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: 'VNG Softwarecatalogus',
        logo: {
          alt: 'VNG Logo',
          src: 'img/logo.svg',
        },
        items: [
          {
            type: 'docSidebar',
            sidebarId: 'tutorialSidebar',
            position: 'left',
            label: 'Documentatie',
          },
          {
            href: 'https://github.com/VNG-Realisatie/softwarecatalogus',
            label: 'GitHub',
            position: 'right',
          },
          {
            href: 'https://www.vng.nl',
            label: 'VNG Website',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Documentatie',
            items: [
              {
                label: 'Handleiding',
                to: '/docs/intro',
              },
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'VNG Forum',
                href: 'https://forum.vng.nl',
              },
              {
                label: 'GitHub',
                href: 'https://github.com/VNG-Realisatie/softwarecatalogus',
              }
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} VNG Realisatie. Gebouwd met Docusaurus.`,
      },
      prism: {
        theme: require('prism-react-renderer/themes/github'),
        darkTheme: require('prism-react-renderer/themes/dracula'),
      },
    })
};

module.exports = config;