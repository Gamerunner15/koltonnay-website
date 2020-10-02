<template>
  <div>
    <left-bar />
    <the-header />
    <about-page />
    <the-footer />
  </div>
</template>

<script>
import TheHeader from '@/components/TheHeader.vue'
import AboutPage from '@/components/AboutPage.vue'
import TheFooter from '@/components/TheFooter.vue'
import LeftBar from '@/components/LeftBar.vue'


export default {
  name: 'about-view',
  components: {
    TheHeader,
    AboutPage,
    TheFooter,
    LeftBar
    
  }
}
</script>