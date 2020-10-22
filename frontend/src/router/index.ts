import { createRouter, createWebHashHistory } from 'vue-router';

import Timer from '../components/Timer.vue';
import LogIn from '../components/LogIn.vue';
import Logout from '../components/Logout.vue';
import Authentication from '../components/Authentication.vue';
import Tracker from '../components/Tracker.vue';

const router = createRouter({
  history: createWebHashHistory(),
  routes: [
    {
      path: '/',
      component: Timer,
      name: 'home'
    },
    {
      path: '/login',
      component: LogIn,
      name: 'login'
    },
    {
      path: '/logout',
      component: Logout,
      name: 'logout'
    },
    {
      path: '/authenticate',
      component: Authentication,
      name: 'authentication',
      props: route => ({ access_token: route.query.access_token }),
    },
    {
      path: '/tracker',
      component: Tracker,
      name: 'tracker'
    },
  ],
});

export default router;
