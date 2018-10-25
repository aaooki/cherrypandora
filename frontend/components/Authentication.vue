<template></template>

<script>
  export default {
    created() {
      localStorage.setItem('token', this.$route.query.access_token);

      this.$router.push('/');
      location.reload();
    }
  }
</script>
