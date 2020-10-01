import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '../views/Home.vue'
import FoxChatHome from '../views/FoxChatHome.vue'
import TestView from '../views/TestView.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/foxchat',
    name: 'fox-chat-home',
    component: FoxChatHome
  },
  {
    path: '/testview',
    name: 'test-view',
    component: TestView
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
