<script setup lang="ts">
import CommandBox from './CommandBox.vue';

const props = defineProps<{
  /** The `add` command slug, e.g. "avatar", "date-picker". */
  slug: string;
  /** Label shown above the command. Defaults to the slug. */
  label?: string;
}>();
</script>

<template>
  <div class="cli">
    <div class="cli__tab">{{ label ?? slug }}</div>
    <CommandBox :command="`flutter_beautify add ${slug}`" />
  </div>
</template>

<style scoped>
.cli {
  margin: 16px 0 24px;
}

.cli__tab {
  display: inline-block;
  margin-bottom: 8px;
  font-size: 13px;
  font-weight: 600;
  color: var(--vp-c-brand-1);
  border-bottom: 2px solid var(--vp-c-brand-1);
  padding-bottom: 4px;
}
</style>
