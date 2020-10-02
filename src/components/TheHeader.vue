<template>
  <div id="all-header">
      <header>
          <div id="left">
            <i v-bind:class="{iHide: menuOpen}" v-on:click="toggleMenu()" class="fa fa-angle-double-right hoverable" style="font-size:40px;"></i>
            <router-link :to="{ name: 'Home' }" class="hoverable"><h1>Kolton Nay</h1></router-link>
          </div>
          <div id="right">
            <h2 class="hoverable" v-on:click="toggleMenu()">Technical Projects</h2>
            <router-link :to="{ name: 'work-experience-view' }"><h2 class="hoverable">Work Experience</h2></router-link>
            <router-link :to="{ name: 'about-view' }"><h2 class="hoverable">About</h2></router-link>
          </div>
      </header>
      <div class="banner">
          <h2>Full Stack Java Developer - Currently Seeking Work - Columbus, OH</h2>
      </div>
  </div>
</template>

<script>
export default {
    name: "the-header",
    computed: {
        menuOpen () {
            return this.$store.state.menuOpen;
        }
    },
    methods: {
        toggleMenu() {
            this.$store.commit('toggleMenu');
        }
    }
}
</script>

<style lang="scss">
$dodie-yellow: #fef65b;
$midnight-purple: #702670;
$primary-font: 'Cairo', sans-serif;
$secondary-font: 'Lora', serif;
$primary-color: #fef65b;
$secondary-color: rgb(150, 161, 161);
$tertiary-color: #31d1a9;

header {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    height: 100px;
    background-color: $dodie-yellow;
    color:$midnight-purple;
}

#left {
    display: flex;
    flex-direction: row;
    align-items: center;
    i {
        padding-left: 40px;
        padding-right: 40px;
    }
}

#right {
    display: flex;
    flex-direction: row;
    align-items: center;
    padding-right: 40px;
    h2 {
        padding-left: 40px;
        cursor: pointer;
    }
}

.banner {
    height: 50px;
    background-color:$secondary-color;
    color:$dodie-yellow;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-evenly;
}

h1 {
    font-size: 60px;
}

.iHide {
    color: $primary-color !important;
}

.hoverable {
    color: $secondary-color;
    transition: all .2s ease-in-out;
    cursor: pointer;
}

.hoverable:hover {
    color:$tertiary-color;
    transform: scale(1.1);
}

</style>