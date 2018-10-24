import Timer from './components/Timer.vue';
import LogIn from './components/LogIn.vue';
import Logout from './components/Logout.vue';
import Authentication from './components/Authentication.vue';
import Tracker from './components/Tracker.vue';

export default [
  { path: '/', component: Timer },
  { path: '/login', component: LogIn },
  { path: '/logout', component: Logout },
  { path: '/authenticate', component: Authentication },
  { path: '/tracker', component: Tracker },
  { path: '*', component: Timer }
]
