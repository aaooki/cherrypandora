<template>
  <div>
    <app-navbar></app-navbar>
    <h1>Hello from App</h1>
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
@import "stylesheets/grid.css";
@import "stylesheets/utils.css";
@import "stylesheets/variables.css";

body {
  background-color: var(--background-color);
}
</style>
