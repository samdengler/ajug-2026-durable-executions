<script setup>
// Persistent forward/back buttons rendered on every slide.
// nextSlide/prevSlide jump whole slides, skipping per-click steps
// (e.g. sequence diagrams) so you can page past them without clicking through.
import { useNav } from '@slidev/client'

const { nextSlide, prevSlide } = useNav()
</script>

<template>
  <div class="slide-jump print:hidden">
    <button class="slide-jump-btn" title="Previous slide" @click.stop="prevSlide()">&#8249;</button>
    <button class="slide-jump-btn" title="Next slide" @click.stop="nextSlide()">&#8250;</button>
  </div>
</template>

<style scoped>
.slide-jump {
  position: absolute;
  top: 8px;
  right: 8px;
  display: flex;
  gap: 6px;
  z-index: 100;
}
.slide-jump-btn {
  width: 26px;
  height: 26px;
  line-height: 1;
  font-size: 16px;
  font-weight: 600;
  color: #94a3b8;
  background: #1e293b;
  border: 1px solid #334155;
  border-radius: 4px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0.25;
  transition: opacity 0.15s, color 0.15s, border-color 0.15s;
}
.slide-jump-btn:hover {
  opacity: 1;
  color: #38bdf8;
  border-color: #38bdf8;
}
</style>

