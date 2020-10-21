<template>
  <div>
    <app-navbar></app-navbar>

    <router-view />

    <div id="notification-sound"></div>
  </div>
</template>

<script lang="ts">
import { defineComponent, } from "vue";

import Navbar from './components/Navbar.vue';

export default defineComponent({
  components: {
    'app-navbar': Navbar
  },
  setup() {}
});
</script>

<style>
  @import "assets/stylesheets/grid.css";
  @import "assets/stylesheets/utils.css";
  @import "assets/stylesheets/variables.css";

  body {
    background-color: var(--background-color);
  }
</style>
