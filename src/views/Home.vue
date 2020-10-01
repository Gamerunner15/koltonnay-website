<template>
  <div class="home">
    <left-bar />
    <the-header />
    <main-body />
    <the-footer />
  </div>
</template>

<script>
import TheHeader from '@/components/TheHeader.vue'
import MainBody from '@/components/MainBody.vue'
import TheFooter from '@/components/TheFooter.vue'
import LeftBar from '@/components/LeftBar.vue'


export default {
  name: 'Home',
  components: {
    TheHeader,
    MainBody,
    TheFooter,
    LeftBar
    
  }
}
</script>
