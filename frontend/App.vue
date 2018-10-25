<template>
  <div>
    <app-navbar></app-navbar>
    <router-view></router-view>
    <div id="notification-sound"></div>
  </div>
</template>

<script>
  import Navbar from './components/Navbar.vue';

  export default {
    components: {
      'app-navbar': Navbar
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
