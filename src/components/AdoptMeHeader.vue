/* eslint-disable indent */
<template>
<div class="container adoptme">
    <div class="header">
      <i v-bind:class="{iHide: menuOpen}" v-on:click="toggleMenu()" class="fa fa-angle-double-right menu-opener" style="font-size:40px;"></i>
        <div id="pup-left">
                <img id="logo" src="..\assets\logo.png" alt="Puppy Logo">
                <h1 id="title">Adoptme.Org</h1>
        </div>
        <div id="pup-right">
                <img src="..\assets\down-caret.png" id='hamburger' v-on:click="toggleMobileMenu()">
                <a class="menu-button" ><h2>What We Do</h2></a>
                <a class="menu-button" ><h2>Who We Are</h2></a>
                <a class="menu-button" ><h2>Adoption Events</h2></a>
        </div>
    </div>
    <div class="mobile-menu" v-if="showMenu">
        <div class="button-row">
            <a class="mobile-button"><h2>What We Do</h2></a>
            <a class="mobile-button"><h2>Who We Are</h2></a>
            <a class="mobile-button"><h2>Adoption Events</h2></a>
        </div>
    </div>
</div>
</template>

<script>
export default {
  name: 'adopt-me-header',
  data () {
    return {
      showMenu: false
    }
  },
  methods: {
    toggleMobileMenu () {
      this.showMenu === false ? this.showMenu = true : this.showMenu = false
    },
    toggleMenu() {
            this.$store.commit('toggleMenu');
        }
  }

}
</script>

<style lang="scss">
$color-red: #ef3e42;
$color-blue: #332982;
$color-gray: #777;
$adopt-me-font-primary: "Open Sans Condensed", sans-serif;
$adopt-me-font-secondary: "Lora", serif;
$adopt-me-font-tertiary: "Open Sans", sans-serif;
$font-weight-h1: 300;
$font-weight-h2: bold;
$font-weight-h3: bold;
.adoptme {
  h1 {
    color: white;
    font-size: 30px;
    font-family: $adopt-me-font-primary;
    font-weight: $font-weight-h1;
  }
  h2 {
    font-size: 20px;
    font-family: $adopt-me-font-primary;
    font-weight: $font-weight-h2;
  }
  h3 {
    font-size: 12px;
    font-family: $adopt-me-font-tertiary;
    font-weight: $font-weight-h3;
  }
  p {
    font-family: $adopt-me-font-secondary;
  }
}

.container {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.header {
    display: flex;
    flex: 1;
    flex-direction: row;
    justify-content: flex-start;
    background-color: $color-red;
    height: 100px;
    text-align: center;
    align-items: center;
    padding-top: 10px;
    padding-bottom: 10px;
    i {
      padding-left: 20px;
      padding-right: 10px;
    }
    #left {
      h1 {
      font-size: 20px;
    }
    }
}
#pup-left {
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
    margin-left: 10px;
}
#logo {
    width: 40px;
    height: 40px;
}
.menu-button {
    display: none;
}
#title {
    color: white;
    padding-left: 10px;
}
#hamburger {
    width: 30px;
    filter: invert(100%);
    margin-left: 20px;
    margin-right: 20px;
    cursor: pointer;
}
.mobile-menu {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    flex: 2;
    float: right;
}
.empty-space {
    flex: 1;
    flex-grow: 3;
}
.button-row {
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    align-items: center;
    flex: 2;
    flex-grow: 2;
    background-color: $color-red;
    text-align: center;
}
.mobile-button {
    text-decoration: none;
    color: white;
    padding-bottom: 10px;
}
//Large Screens
@media screen and (min-width: 900px) {
    .header {
        padding-right: 60px;
        padding-left: 60px;
        align-items: center;
    }
    .menu-button {
        display: inline-block;
        padding-right: 30px;
        text-decoration: none;
        color: white;
    }
    #hamburger {
        display: none;
    }
    #right {
        display: flex;
        flex: 2;
        flex-direction: row;
        justify-content: flex-end;
        align-items: center;
        margin-right: 20px;
    }
    #title {
    padding-left: 10px;
}
    #logo {
    width: 50px;
    height: 50px;
    }
}
@media screen and (min-width: 900px) {
  .adoptme {
    h1 {
      color: white;
      font-size: 40px;
      font-family: $adopt-me-font-primary;
      font-weight: $font-weight-h1;
    }
    h2 {
      font-size: 30px;
      font-family: $adopt-me-font-primary;
      font-weight: $font-weight-h2;
    }
    h3 {
      font-size: 15px;
      font-family: $adopt-me-font-tertiary;
      font-weight: $font-weight-h3;
    }
    p {
      font-family: $adopt-me-font-secondary;
    }
  }
}
</style>
