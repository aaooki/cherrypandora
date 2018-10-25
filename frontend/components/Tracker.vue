<template>
  <div class="row">
    <div class="col-12 col-m-12">
      <table>
        <thead>
          <tr>
            <th>Seconds</th>
            <th>Ended at</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="entry in entries">
            <td>{{ entry.length }}</td>
            <td>{{ entry.created_at }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        entries: []
      }
    },
    created() {
      let access_token = localStorage.getItem('token');
      this.$http.get('/api/tracker', { headers: { 'Authorization': `Bearer ${access_token}` } })
        .then((response) => {
          this.entries = response.data.entries;
        });
    }
  }
</script>

<style scoped>
  :root {
    --header-cell-color: white;
    --header-cell-background-color: #5a6673;
    --cell-width: 50%;
    --cell-background-color: white;
    --border-width: 4px;
    --border-color: #ECECEC;
  }

  table {
    width: var(--cell-width);
    margin: 0 auto;
    border-collapse: collapse;
    border-spacing: var(--border-width);
    background-color: var(--cell-background-color);

    & th, & td {
      text-align: center;
      box-sizing: border-box;
      flex-grow: 1;
      width: var(--cell-width);
      padding: 0.8em 1.2em;
      border: solid var(--border-width) var(--border-color);

    }

    & th {
      background-color: var(--header-cell-background-color);
      color: var(--header-cell-color);
    }
  }
</style>
