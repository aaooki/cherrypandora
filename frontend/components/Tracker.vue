<template>
  <h1>Hello</h1>
</template>

<script>
  export default {
    created() {
      let access_token = localStorage.getItem('token');
      this.$http.get('/api', { headers: { 'Authorization': `Bearer ${access_token}` } })
        .then(function(response) {
          console.log(response.body.msg);
        });
    }
  }
</script>
