import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import axios from 'axios'
import VueAxios from 'vue-axios'

import App from './App.vue';
import Routes from './routes.js';

Vue.use(VueRouter)
Vue.use(VueAxios, axios)

const router = new VueRouter({
  routes: Routes
});

var app = new Vue({
  el: '#app',
  render: h => h(App),
  router: router
});
