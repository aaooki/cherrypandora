<template></template>

<script lang="ts">
import { defineComponent, onMounted } from "vue";
import { useRouter } from 'vue-router';

export default defineComponent({
  props: {
    access_token: {
      type: String,
      default: null,
    },
  },
  setup(props) {
    onMounted(() => {
      localStorage.setItem('token', props.access_token);
      useRouter().push({ name: 'home' });
    });
  }
})
</script>
