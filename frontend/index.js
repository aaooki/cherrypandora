import Vue from 'vue/dist/vue.esm'
import HelloComponent from './components/HelloComponent.vue'

var app = new Vue({
  el: '#app',
  render: h => h(HelloComponent)
})
