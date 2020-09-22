<template>
  <div id="all-header">
      <header>
          <div id="left">
            <i v-bind:class="{iHide: menuOpen}" v-on:click="toggleMenu()" class="fa fa-angle-double-right hoverable" style="font-size:40px;"></i>
            <h1>Kolton Nay</h1>
          </div>
          <div id="right">
            <h2 class="hoverable" v-on:click="toggleMenu()">Technical Projects</h2>
            <h2 class="hoverable">Work Experience</h2>
            <h2 class="hoverable">About</h2>
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
$teal: #5affd5;
$midnight-purple: #702670;
$primary-font: 'Cairo', sans-serif;
$secondary-font: 'Lora', serif;

// #all-header {
//     position: fixed;
//     width: 100%;
// }

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
    background-color:$midnight-purple;
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
    color:$dodie-yellow !important;
}

.hoverable {
    color: $midnight-purple;
    transition: all .2s ease-in-out;
    cursor: pointer;
}

.hoverable:hover, .hoverable:focus {
    color:$teal;
    transform: scale(1.1);
}

</style>