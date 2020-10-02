<template>
  <div id="full-sidebar" v-bind:class="{openSidebar: menuOpen, closedSidebar: !menuOpen}">
      <i id="closebtn" v-on:click="toggleMenu()" class="fa fa-times-circle hoverable"></i>
      <div class="projects">
        <router-link :to="{ name: 'Home' }"><img class="tiny-image hoverable" src="..\assets\MainPicture.jpg" /></router-link>
        <h1>Explore Kolton's Projects:</h1>
        <router-link :to="{ name: 'fox-chat-home' }" class="project-button hoverable"><h2>FoxChat</h2></router-link>
        <router-link :to="{ name: 'adopt-me-home' }" class="project-button hoverable"><h2>AdoptMe</h2></router-link>
        <a href="http://alumni.techelevator.com/" target="_blank" class="project-button hoverable"><h2>TE Alumni Portal</h2></a>
        <router-link :to="{ name: 'test-view' }" class="project-button hoverable"><h2>Your Case Manager</h2></router-link>
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
$midnight-purple: #702670;
$primary-font: 'Cairo', sans-serif;
$secondary-font: 'Lora', serif;
$primary-color: #fef65b;
$secondary-color: rgb(150, 161, 161);
$tertiary-color: #519483;

.tiny-image {
    width: 50px;
    border-radius: 50%;
    border: 1px solid $secondary-color;
    box-shadow: 5px 15px 25px rgba(0, 0, 0, 0.25);
    background-color: $primary-color;
    margin-top: -50px;
    margin-bottom: 20px;
}
.openSidebar {
    width: 300px;
    height: 100%;
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    background-color: $primary-color; 
    overflow-x: hidden; 
    transition: 0.5s;
    border-right: 5px solid $secondary-color;
}

.closedSidebar {
    width: 0%;
    height: 100%;
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    background-color: $secondary-color; 
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
    h2:hover, h2:focus {
        color: $tertiary-color;
        border-color: $tertiary-color;
    }
    h2{
        border: 2px solid $secondary-color;
        width: 250px;
    }
    h1 {
        font-size: 30px;
        padding-bottom: 40px;
        color: $secondary-color;
    }
}
 .project-button {
        color:$secondary-color;
        background-color: white;
        margin-bottom: 20px;
    }
</style>