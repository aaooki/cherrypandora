import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import VueResource from 'vue-resource';

import App from './App.vue';
import Routes from './routes.js';

Vue.use(VueRouter)
Vue.use(VueResource)

const router = new VueRouter({
  routes: Routes
});

var app = new Vue({
  el: '#app',
  render: h => h(App),
  router: router
});
