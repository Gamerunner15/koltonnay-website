<template>
  <div id="full-sidebar" v-bind:class="{openSidebar: menuOpen, closedSidebar: !menuOpen}">
      <i id="closebtn" v-on:click="toggleMenu()" class="fa fa-times-circle hoverable"></i>
      <div class="projects">
        <a href="#"><img class="tiny-image" src="..\assets\MainPicture.jpg" /></a>
        <h1>Explore Kolton's Projects:</h1>
        <router-link :to="{ name: 'fox-chat-home' }" class="hoverable"><h2>FoxChat</h2></router-link>
        <router-link :to="{ name: 'test-view' }" class="hoverable"><h2>AdoptMe</h2></router-link>
        <a class="hoverable" href="#"><h2>TE Alumni Portal</h2></a>
        <a class="hoverable" href="#"><h2>Your Case Manager</h2></a>
      </div>
  </div>
</template>

<script>
export default {
    name: "left-bar",
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

.tiny-image {
    width: 50px;
    border-radius: 50%;
    border: 1px solid $teal;
    box-shadow: 5px 15px 25px rgba(0, 0, 0, 0.25);
}
.openSidebar {
    width: 300px;
    height: 100%;
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    background-color: rgba(246, 255, 126, 0.719); 
    overflow-x: hidden; 
    transition: 0.5s;
}

.closedSidebar {
    width: 0%;
    height: 100%;
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    background-color: rgba(101, 0, 110, 0.719); 
    overflow-x: hidden; 
    transition: 0.5s;
}

#closebtn {
        position: absolute;
        font-size: 50px;
        top: 18px;
        left: 20px;
        padding: 10px;
        cursor: pointer;
    }

.projects {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
    top: 25%; 
    text-align: center;
    a {
        color:$midnight-purple;
        padding-bottom: 20px;
    }
    h2:hover, h2:focus {
        color:$teal;
        border-color: $teal;
    }
    h2{
        border: 2px solid $midnight-purple;
        width: 250px;
    }
    h1 {
        font-size: 30px;
        padding-bottom: 40px;
    }
}
</style>