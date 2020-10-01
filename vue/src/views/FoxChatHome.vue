<template>
    <div>
        <left-bar />
        <fox-chat-header />
        <fox-chat-landing />
        <fox-chat-bot />
        <fox-chat-footer />
    </div>   
</template>

<script>
import FoxChatBot from '@/components/FoxChatBot.vue';
import FoxChatLanding from '@/components/FoxChatLanding.vue';
import FoxChatHeader from '@/components/FoxChatHeader.vue';
import FoxChatFooter from '@/components/FoxChatFooter.vue';
import LeftBar from '@/components/LeftBar.vue'

export default {
    name: "foxchat-home",
    components: {
    FoxChatBot,
    FoxChatLanding,
    FoxChatHeader,
    FoxChatFooter,
    LeftBar
  }

}
</script>

<style>

</style>