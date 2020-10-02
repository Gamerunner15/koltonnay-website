import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '../views/Home.vue'
import FoxChatHome from '../views/FoxChatHome.vue'
import TestView from '../views/TestView.vue'
import WorkExperienceView from '../views/WorkExperienceView.vue'
import AboutView from '../views/AboutView.vue'

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
    name: 'work-experience-view',
    component: WorkExperienceView
  },
  {
    path: '/about',
    name: 'about-view',
    component: AboutView
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
