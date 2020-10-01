import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '../views/Home.vue'
import FoxChatHome from '../views/FoxChatHome.vue'
import TestView from '../views/TestView.vue'
import WorkExperience from '../views/WorkExperience.vue'

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
  },
  {
    path: '/workexperience',
    name: 'work-experience',
    component: WorkExperience
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
