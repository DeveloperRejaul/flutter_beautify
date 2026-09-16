<script setup lang="ts">
import { ref, computed, watch } from 'vue';
import { useData } from 'vitepress';
import CommandBox from './CommandBox.vue';

const items = [
  { slug: 'button', label: 'Button' },
  { slug: 'card', label: 'Card' },
  { slug: 'dialog', label: 'Dialog' },
  { slug: 'accordion', label: 'Accordion' },
  { slug: 'slider', label: 'Slider' },
  { slug: 'avatar', label: 'Avatar' },
  { slug: 'date-picker', label: 'DatePicker' },
];

const { isDark } = useData();
const active = ref(items[0].slug);
const loaded = ref(false);

// The theme query param comes before the route hash, so it survives
// hash-only tab switches but changes — and reloads the iframe — when the
// site's color mode toggles. See ComponentPreview.vue for the same pattern.
const demoSrc = computed(
  () => `/flutter_beautify/demo/?theme=${isDark.value ? 'dark' : 'light'}#/${active.value}`,
);

// Switching tabs only changes the iframe's URL hash (client-side routing
// inside the Flutter app), which doesn't refire the iframe's `load` event —
// so `loaded` is only meaningful for the very first paint / a theme change,
// not a tab switch.
function select(slug: string) {
  active.value = slug;
}

watch(isDark, () => {
  loaded.value = false;
});
</script>

<template>
  <div class="hs">
    <div class="hs__tabs" role="tablist">
      <button
        v-for="item in items"
        :key="item.slug"
        class="hs__tab"
        :class="{ 'hs__tab--active': active === item.slug }"
        role="tab"
        @click="select(item.slug)"
      >
        {{ item.label }}
      </button>
    </div>

    <div class="hs__frame">
      <div v-if="!loaded" class="hs__loading">
        <span class="hs__spinner" />
      </div>
      <iframe
        class="hs__iframe"
        :src="demoSrc"
        loading="lazy"
        title="Live component preview"
        @load="loaded = true"
      />
    </div>

    <div class="hs__caption">
      <CommandBox :command="`flutter_beautify add ${active}`" />
      <a class="hs__caption-link" href="/flutter_beautify/demo/" target="_blank" rel="noreferrer">
        Open full gallery ↗
      </a>
    </div>
  </div>
</template>

<style scoped>
.hs {
  max-width: 880px;
  margin: 8px auto 64px;
  padding: 0 24px;
}

.hs__tabs {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
  justify-content: center;
  margin-bottom: 16px;
}

.hs__tab {
  padding: 7px 14px;
  font-size: 13px;
  font-weight: 500;
  color: var(--vp-c-text-2);
  background: var(--vp-c-bg-soft);
  border: 1px solid var(--vp-c-divider);
  border-radius: 999px;
  cursor: pointer;
}

.hs__tab--active {
  color: var(--vp-c-bg);
  background: var(--vp-c-brand-1);
  border-color: var(--vp-c-brand-1);
}

.hs__frame {
  position: relative;
  height: 460px;
  border: 1px solid var(--vp-c-divider);
  border-radius: 12px;
  overflow: hidden;
  background: var(--vp-c-bg);
}

.hs__iframe {
  width: 100%;
  height: 100%;
  border: none;
  /* See ComponentPreview.vue: browsers don't reliably clip an <iframe> via
     an ancestor's overflow:hidden + border-radius, so round it directly. */
  border-radius: 12px;
}

.hs__loading {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--vp-c-bg);
}

.hs__spinner {
  width: 28px;
  height: 28px;
  border-radius: 50%;
  border: 3px solid var(--vp-c-divider);
  border-top-color: var(--vp-c-brand-1);
  animation: hs-spin 0.7s linear infinite;
}

@keyframes hs-spin {
  to {
    transform: rotate(360deg);
  }
}

.hs__caption {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-top: 12px;
}

.hs__caption .cmdbox {
  flex: 1;
}

.hs__caption-link {
  flex-shrink: 0;
  font-size: 13px;
  color: var(--vp-c-text-2);
}
.hs__caption-link:hover {
  color: var(--vp-c-brand-1);
}
</style>
