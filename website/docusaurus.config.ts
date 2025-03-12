import type { Config } from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';
import type * as Redocusaurus from 'redocusaurus';

const config: Config = {
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

  // Add Redocusaurus plugin
  plugins: [
    [
      'redocusaurus',
      {
        // Plugin options
        specs: [
          {
            id: 'gemma',
            spec: 'static/oas/gemma.yaml',
            route: '/api/reference',
          },
        ],
        // Theme options for Redocusaurus
        theme: {
          // Change with your site colors
          primaryColor: '#0277BD',
        },
      },
    ] satisfies Redocusaurus.PresetEntry,
  ],

  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: './sidebars.js',
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  themeConfig: {
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
          label: 'API Specificatie',
          position: 'right',
          to: '/api',
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
      theme: await import('prism-react-renderer/themes/github'),
      darkTheme: await import('prism-react-renderer/themes/dracula'),
    },
  },
} as Config;

export default config;