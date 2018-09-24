<template>
  <div>
    <app-navbar></app-navbar>
    <timer></timer>
  </div>
</template>

<script>
  import Navbar from './components/Navbar.vue';
  import Timer  from './components/Timer.vue';

  export default {
    components: {
      'app-navbar': Navbar,
      'timer': Timer
    }
  }
</script>

<style>
  @import "normalize.css/normalize.css";

  @import "stylesheets/grid.css";
  @import "stylesheets/utils.css";
  @import "stylesheets/variables.css";

  body {
    background-color: var(--background-color);
  }
</style>
