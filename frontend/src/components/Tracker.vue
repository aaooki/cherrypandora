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
          <tr v-for="entry in state.entries" v-bind:key="entry.create_at">
            <td>{{ entry.length }}</td>
            <td>{{ entry.created_at }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive, onMounted } from "vue";

import { SessionEntry } from '../types';

import UserAuthenticationService from '../services/user-authentication.service';
import EntryDataService from '../services/entry-data.service';

export default defineComponent({
  setup() {
    let state = reactive<{entries: SessionEntry[]}>({
      entries: [],
    });

    onMounted(() => {
      EntryDataService.getAll(UserAuthenticationService.token).then((data) => {
        state.entries = data.entries;
      });
    });
  }
})
</script>

<style scoped>
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
