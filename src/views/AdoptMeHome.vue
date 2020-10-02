<template>
  <div>
      <left-bar />
      <adopt-me-header />
      <adopt-me-body />
      <adopt-me-footer />
  </div>
</template>

<script>
import AdoptMeHeader from '@/components/AdoptMeHeader.vue'
import AdoptMeBody from '@/components/AdoptMeBody.vue'
import AdoptMeFooter from '@/components/AdoptMeFooter.vue'
import LeftBar from '@/components/LeftBar.vue'
export default {
    name: 'adopt-me-home',
    components: {
        AdoptMeHeader,
        AdoptMeBody,
        AdoptMeFooter,
        LeftBar
    }

}
</script>

<style>

</style>