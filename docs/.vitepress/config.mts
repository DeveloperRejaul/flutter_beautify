import { defineConfig } from 'vitepress';

export default defineConfig({
  title: 'Flutter Beautify',
  description:
    'A CLI that drops production-ready Material 3 widgets into your Flutter project.',
  base: '/flutter_beautify/',
  cleanUrls: true,
  lastUpdated: true,

  markdown: {
    lineNumbers: true,
  },

  // /demo/ is the compiled Flutter Web gallery, deployed alongside this site
  // by CI (see .github/workflows/deploy-docs.yml) — it isn't part of the
  // VitePress source tree, so the dead-link checker can't resolve it.
  ignoreDeadLinks: [/^\/flutter_beautify\/demo\//],

  head: [['link', { rel: 'icon', href: '/flutter_beautify/logo.jpg' }]],

  themeConfig: {
    logo: '/logo.jpg',

    nav: [
      { text: 'Guide', link: '/guide/getting-started' },
      { text: 'Components', link: '/components/' },
      { text: 'pub.dev', link: 'https://pub.dev/packages/flutter_beautify' },
      { text: 'Changelog', link: 'https://github.com/DeveloperRejaul/flutter_beautify/blob/main/CHANGELOG.md' },
    ],

    sidebar: {
      '/guide/': [
        { text: 'Getting started', link: '/guide/getting-started' },
        {
          text: 'Concepts',
          collapsed: false,
          items: [
            { text: 'How add works', link: '/guide/how-it-works' },
            { text: 'Configuration', link: '/guide/configuration' },
          ],
        },
        {
          text: 'Guides',
          collapsed: false,
          items: [
            { text: 'Installation', link: '/guide/installation' },
            { text: 'Adding a component', link: '/guide/adding-a-component' },
            { text: 'Customizing a component', link: '/guide/customizing-a-component' },
            { text: 'Project structure', link: '/guide/project-structure' },
          ],
        },
        {
          text: 'Reference',
          collapsed: false,
          items: [
            { text: 'CLI commands', link: '/guide/cli-commands' },
            { text: 'Troubleshooting', link: '/guide/troubleshooting' },
            { text: 'Contributing', link: '/guide/contributing' },
            {
              text: 'GitHub ↗',
              link: 'https://github.com/DeveloperRejaul/flutter_beautify',
            },
            {
              text: 'pub.dev ↗',
              link: 'https://pub.dev/packages/flutter_beautify',
            },
          ],
        },
      ],
      '/components/': [
        { text: 'Overview', link: '/components/' },
        {
          text: 'Theming & layout',
          collapsed: false,
          items: [
            { text: 'Theme', link: '/components/theme' },
            { text: 'Responsive', link: '/components/responsive' },
          ],
        },
        {
          text: 'Form controls',
          collapsed: false,
          items: [
            { text: 'Button', link: '/components/button' },
            { text: 'Checkbox', link: '/components/checkbox' },
            { text: 'TextField', link: '/components/textfield' },
            { text: 'RadioButton', link: '/components/radio-button' },
            { text: 'Slider', link: '/components/slider' },
            { text: 'Switch', link: '/components/switch' },
            { text: 'Dropdown', link: '/components/dropdown' },
          ],
        },
        {
          text: 'Layout',
          collapsed: false,
          items: [
            { text: 'Card', link: '/components/card' },
            { text: 'Accordion', link: '/components/accordion' },
            { text: 'BottomSheet', link: '/components/bottom-sheet' },
            { text: 'Sidebar', link: '/components/sidebar' },
            { text: 'Breadcrumb', link: '/components/breadcrumb' },
          ],
        },
        {
          text: 'Navigation',
          collapsed: false,
          items: [
            { text: 'AppBar', link: '/components/appbar' },
            { text: 'Tabs', link: '/components/tabs' },
            { text: 'Pagination', link: '/components/pagination' },
            { text: 'BottomNavigationBar', link: '/components/bottom-navigation-bar' },
            { text: 'Avatar', link: '/components/avatar' },
          ],
        },
        {
          text: 'Progress & loading',
          collapsed: false,
          items: [
            { text: 'LinearProgress', link: '/components/linear-progress' },
            { text: 'CircularProgress', link: '/components/circular-progress' },
          ],
        },
        {
          text: 'Feedback & overlays',
          collapsed: false,
          items: [
            { text: 'Dialog', link: '/components/dialog' },
            { text: 'Snackbar', link: '/components/snackbar' },
            { text: 'Toast', link: '/components/toast' },
            { text: 'Badge', link: '/components/badge' },
            { text: 'Tooltip', link: '/components/tooltip' },
          ],
        },
        {
          text: 'Date & time',
          collapsed: false,
          items: [
            { text: 'DatePicker', link: '/components/date-picker' },
            { text: 'Calendar', link: '/components/calendar' },
          ],
        },
      ],
    },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/DeveloperRejaul/flutter_beautify' },
    ],

    editLink: {
      pattern: 'https://github.com/DeveloperRejaul/flutter_beautify/edit/main/docs/:path',
      text: 'Edit this page on GitHub',
    },

    footer: {
      message: 'Released under the MIT License.',
      copyright: 'Copyright © 2024-present DeveloperRejaul',
    },

    search: {
      provider: 'local',
    },
  },
});
