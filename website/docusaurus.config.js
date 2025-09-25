// Note: type annotations allow type checking and IDEs autocompletion

const redocusaurus = require('redocusaurus');
const presetClassic = require('@docusaurus/preset-classic');

const config = {
  title: 'Softwarecatalogus',
  tagline: 'Het centrale platform voor gemeentelijke software en architectuur informatie',
  url: 'https://vng-realisatie.github.io',
  baseUrl: '/Softwarecatalogus/',
  
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
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
        },
        blog: false,
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
    [
      'redocusaurus',
      {
        // Plugin Options for loading OpenAPI files
        specs: [
          // Pass it a path to a local OpenAPI YAML file
          {
            // Redocusaurus will automatically bundle your spec into a single file during the build
            id: 'gemma',
            spec: 'static/oas/gemma.yaml',
            route: '/api',
          },
        ],
        // Theme Options for modifying how redoc renders them
        theme: {
          // Change with your site colors
          primaryColor: '#1890ff',
        },
      },
    ]
  ],

  themes: ['@docusaurus/theme-mermaid'],
  markdown: {
    mermaid: true,
  },

  themeConfig:
    {
      mermaid: {
        theme: {light: 'neutral', dark: 'forest'},
      },
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
            href: '/api',
            label: 'API Specificatie',
            position: 'right',
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
              {
                label: 'API Specificatie',
                to: '/api',
              },
              {
                href: 'https://github.com/vng-realisatie/softwarecatalogus',
                label: 'GitHub',
                position: 'right',
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
    }
};

module.exports = config;