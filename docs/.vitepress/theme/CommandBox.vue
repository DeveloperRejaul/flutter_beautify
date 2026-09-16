<script setup lang="ts">
import { ref } from 'vue';

const props = defineProps<{ command: string }>();

const copied = ref(false);

function copy() {
  navigator.clipboard?.writeText(props.command);
  copied.value = true;
  setTimeout(() => (copied.value = false), 1500);
}
</script>

<template>
  <div class="cmdbox">
    <span class="cmdbox__prompt">$</span>
    <code class="cmdbox__text">{{ command }}</code>
    <button
      class="cmdbox__copy"
      :class="{ 'cmdbox__copy--done': copied }"
      :title="copied ? 'Copied' : 'Copy to clipboard'"
      @click="copy"
    >
      <svg
        v-if="!copied"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        stroke-width="1.8"
      >
        <rect x="8" y="8" width="12" height="12" rx="2" stroke-linejoin="round" />
        <path
          d="M16 8V6a2 2 0 00-2-2H6a2 2 0 00-2 2v8a2 2 0 002 2h2"
          stroke-linecap="round"
          stroke-linejoin="round"
        />
      </svg>
      <svg v-else viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M5 13l4 4L19 7" stroke-linecap="round" stroke-linejoin="round" />
      </svg>
    </button>
  </div>
</template>

<style scoped>
/* Follows the site's light/dark theme like every other surface — a
   fixed-dark "terminal" look was tried here before and looked wrong
   sitting in a light-mode page, so this uses the same tokens as
   ComponentPreview's code panel instead of hardcoded colors. */
.cmdbox {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 11px 12px 11px 16px;
  border-radius: 10px;
  background: var(--vp-c-bg-soft);
  border: 1px solid var(--vp-c-divider);
}

.cmdbox__prompt {
  font-family: var(--vp-font-family-mono);
  font-size: 13px;
  color: var(--vp-c-text-3);
  user-select: none;
}

.cmdbox__text {
  flex: 1;
  font-family: var(--vp-font-family-mono);
  font-size: 13px;
  color: var(--vp-c-text-1);
  white-space: nowrap;
  overflow-x: auto;
}

.cmdbox__copy {
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 28px;
  height: 28px;
  padding: 0;
  border: none;
  border-radius: 6px;
  background: transparent;
  color: var(--vp-c-text-2);
  cursor: pointer;
}
.cmdbox__copy svg {
  width: 15px;
  height: 15px;
}
.cmdbox__copy:hover {
  background: var(--vp-c-bg);
  color: var(--vp-c-text-1);
}
.cmdbox__copy--done {
  color: var(--vp-c-brand-1);
}
</style>
