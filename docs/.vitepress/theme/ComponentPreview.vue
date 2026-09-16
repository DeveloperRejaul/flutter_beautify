<script setup lang="ts">
import { ref, computed, watch } from 'vue';
import { useData } from 'vitepress';

const props = defineProps<{
  /** The `add` command slug, e.g. "avatar", "date-picker". Doubles as the
   *  gallery route: /flutter_beautify/demo/#/<slug> */
  slug: string;
  /** Preview iframe height in px. */
  height?: number;
}>();

const { isDark } = useData();
const tab = ref<'preview' | 'code'>('preview');
const loaded = ref(false);

// The theme query param (read by the Flutter app in example/lib/main.dart)
// comes before the route hash, so it survives hash-only navigation but
// changes — and reloads the iframe — when the site's color mode toggles.
const demoSrc = computed(
  () => `/flutter_beautify/demo/?theme=${isDark.value ? 'dark' : 'light'}#/${props.slug}`,
);

watch(isDark, () => {
  loaded.value = false;
});
</script>

<template>
  <div class="cp">
    <div class="cp__tabs" role="tablist">
      <button
        class="cp__tab"
        :class="{ 'cp__tab--active': tab === 'preview' }"
        role="tab"
        @click="tab = 'preview'"
      >
        Preview
      </button>
      <button
        class="cp__tab"
        :class="{ 'cp__tab--active': tab === 'code' }"
        role="tab"
        @click="tab = 'code'"
      >
        Code
      </button>
    </div>

    <div class="cp__panel">
      <div v-show="tab === 'preview'" class="cp__preview" :style="{ height: (height ?? 380) + 'px' }">
        <div v-if="!loaded" class="cp__loading">
          <span class="cp__spinner" />
        </div>
        <iframe
          class="cp__iframe"
          :src="demoSrc"
          loading="lazy"
          title="Live component preview"
          @load="loaded = true"
        />
      </div>
      <div v-show="tab === 'code'" class="cp__code-wrap">
        <div class="cp__code">
          <slot />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.cp {
  margin: 24px 0;
  border: 1px solid var(--vp-c-divider);
  border-radius: 12px;
  overflow: hidden;
  background: var(--vp-c-bg-soft);
}

.cp__tabs {
  display: flex;
  gap: 4px;
  padding: 8px 8px 0;
  background: var(--vp-c-bg-soft);
}

.cp__tab {
  padding: 8px 16px;
  font-size: 14px;
  font-weight: 500;
  color: var(--vp-c-text-2);
  background: transparent;
  border: none;
  border-radius: 8px 8px 0 0;
  cursor: pointer;
}

.cp__tab--active {
  color: var(--vp-c-brand-1);
  background: var(--vp-c-bg);
}

.cp__panel {
  background: var(--vp-c-bg);
  border-top: 1px solid var(--vp-c-divider);
}

.cp__preview {
  position: relative;
  display: flex;
}

.cp__iframe {
  width: 100%;
  height: 100%;
  border: none;
  /* Browsers don't always respect an ancestor's overflow:hidden +
     border-radius clipping for an <iframe> (its own compositing layer) —
     round it directly so the light iframe content doesn't square off
     against the panel's rounded bottom corners. */
  border-radius: 0 0 12px 12px;
}

.cp__loading {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--vp-c-bg);
}

.cp__spinner {
  width: 26px;
  height: 26px;
  border-radius: 50%;
  border: 3px solid var(--vp-c-divider);
  border-top-color: var(--vp-c-brand-1);
  animation: cp-spin 0.7s linear infinite;
}

@keyframes cp-spin {
  to {
    transform: rotate(360deg);
  }
}

/* Code tab: a light gray tray with a white, rounded, bordered code card
   inset inside it — matching the reference docs' code panel look. */
.cp__code-wrap {
  background: var(--vp-c-bg-soft);
  padding: 16px;
}

.cp__code :deep(div[class*='language-']) {
  margin: 0;
  border-radius: 10px;
  border: 1px solid var(--vp-c-divider);
  background: var(--vp-c-bg) !important;
}
</style>
