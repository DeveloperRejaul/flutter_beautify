import DefaultTheme from 'vitepress/theme';
import type { Theme } from 'vitepress';
import ComponentPreview from './ComponentPreview.vue';
import CliBlock from './CliBlock.vue';
import HeroShowcase from './HeroShowcase.vue';
import CommandBox from './CommandBox.vue';
import './custom.css';

export default {
  extends: DefaultTheme,
  enhanceApp({ app }) {
    app.component('ComponentPreview', ComponentPreview);
    app.component('CliBlock', CliBlock);
    app.component('HeroShowcase', HeroShowcase);
    app.component('CommandBox', CommandBox);
  },
} satisfies Theme;
