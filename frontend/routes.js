import Timer from './components/Timer.vue';
import LogIn from './components/LogIn.vue';
import Authentication from './components/Authentication.vue';

export default [
  { path: '/', component: Timer },
  { path: '/login', component: LogIn },
  { path: '/authenticate', component: Authentication },
  { path: '*', component: Timer }
]
