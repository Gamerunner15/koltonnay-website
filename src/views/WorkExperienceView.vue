<template>
  <div>
    <left-bar />
    <the-header />
    <work-experience />
    <the-footer />
  </div>
</template>

<script>
import TheHeader from '@/components/TheHeader.vue'
import WorkExperience from '@/components/WorkExperience.vue'
import TheFooter from '@/components/TheFooter.vue'
import LeftBar from '@/components/LeftBar.vue'


export default {
  name: 'work-experience-view',
  components: {
    TheHeader,
    WorkExperience,
    TheFooter,
    LeftBar
    
  }
}
</script>
