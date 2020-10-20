<template>
  <div>
    <div class="main-head">
      <i v-bind:class="{iHide: menuOpen}" v-on:click="toggleMenu()" class="fa fa-angle-double-right menu-opener"></i>
      <router-link :to="{ name: 'fox-chat-home' }">
        <div id="logo-title">
          <img class="logo" src="../assets/foxtrot_t.png" />
          <div class="title">Foxchat</div>
        </div>
      </router-link>
      <div id="menus" v-if="!loggedIn">
        <div class="menu-div dropdown">
          <div class="dropbtn">
            Product
            <i class="fa fa-caret-down"></i>
          </div>
          <div class="dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
          </div>
        </div>
        <div class="menu-div dropdown">
          <div class="dropbtn">
            Solutions
            <i class="fa fa-caret-down"></i>
          </div>
          <div class="dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
          </div>
        </div>
        <div class="menu-div dropdown">
          <div class="dropbtn">
            Help
            <i class="fa fa-caret-down"></i>
          </div>
          <div class="dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
          </div>
        </div>
        <div
          class="menu-div menu-click"
          v-on:click="registerHidden = !registerHidden, loginHidden = true"
        >Register</div>
        <div
          class="menu-div menu-click"
          v-on:click="loginHidden = !loginHidden, registerHidden = true"
        >Login</div>
      </div>
      <div class="admin-menus" v-if="loggedIn">
        <div class="menu-div menu-click">
          <router-link :to="{ name: 'admin-page' }">Dashboard</router-link>
        </div>
        <div class="menu-div menu-click">
          <router-link :to="{ name: 'admin-tools' }">Admin Tools</router-link>
        </div>
        <div class="menu-div menu-click" @click="logout">Logout</div>
      </div>
      <div id="mobileMenuButton" v-if="mobileHidden" v-on:click="mobileHidden = false">
        <p>
          <i class="fa fa-bars"></i>
        </p>
      </div>
      <div
        id="mobileMenuButton"
        v-if="!mobileHidden"
        v-on:click="mobileHidden = true, loginHidden = true, registerHidden = true"
      >
        <p>
          <i class="fa fa-times"></i>
        </p>
      </div>
    </div>
    <transition name="slide">
      <div>
        <div v-if="!loginHidden" id="login">
          <fox-chat-login />
        </div>
        <div v-if="!registerHidden" id="login">
          <fox-chat-register @registered="closeRegister"></fox-chat-register>
        </div>
      </div>
    </transition>
    <transition name="slide">
      <div>
        <div v-if="!mobileHidden && !loggedIn" id="mobile-menu">
          <div
            class="mobile-menu-div"
            v-on:click="loginHidden = !loginHidden, registerHidden = true"
          >
            <p>Login</p>
          </div>
          <div
            class="mobile-menu-div"
            v-on:click="registerHidden = !registerHidden, loginHidden = true"
          >
            <p>Register</p>
          </div>
          <div class="mobile-menu-div">
            <p>Product</p>
          </div>
          <div class="mobile-menu-div">
            <p>Solutions</p>
          </div>
          <div class="mobile-menu-div">
            <p>Help</p>
          </div>
        </div>
        <div v-if="!mobileHidden && loggedIn" id="mobile-menu">
          <div class="mobile-menu-div" v-on:click="loginHidden = !loginHidden" @click="logout">
            <p>Logout</p>
          </div>
          <router-link :to="{ name: 'admin-page' }">
            <div class="mobile-menu-div">Dashboard</div>
          </router-link>
          <router-link :to="{ name: 'admin-tools' }">
            <div class="mobile-menu-div">Admin Tools</div>
          </router-link>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
import FoxChatLogin from "@/components/FoxChatLogin.vue";
import FoxChatRegister from "@/components/FoxChatRegister.vue";

export default {
  name: "fox-chat-header",
  components: {
    FoxChatLogin,
    FoxChatRegister,
  },
  computed: {
    loggedIn() {
      return this.$store.state.token != "";
    },
    menuOpen () {
            return this.$store.state.menuOpen;
        }
  },
  data() {
    return {
      mobileHidden: true,
      loginHidden: true,
      registerHidden: true,
    };
  },
  methods: {
    logout() {
      this.$store.commit("LOGOUT");
      this.$swal({
        icon: "success",
        title: "Logout Successful",
        toast: true,
        timer: 3000,
        timerProgressBar: true,
        position: "top",
        showConfirmButton: false,
      });
      this.$router.push("/");
    },
    closeRegister() {
      this.registerHidden = true;
      this.loginHidden = false;
    },
    toggleMenu() {
            this.$store.commit('toggleMenu');
        }
  },
};
</script>

<style lang="scss">

* {
  font-family: Avenir, Helvetica, Arial, sans-serif;
}

.menu-opener {
    color: white;
    transition: all .2s ease-in-out;
    cursor: pointer;
}

#login {
  position: absolute;
  right: 0;
  background-color: var(--secondary-color);
  border-bottom: 2px solid var(--main-color);
  border-left: 2px solid var(--main-color);
  width: 25%;
  height: fit-content;
  border-bottom-left-radius: 10px;
  padding: 30px 50px;
}

#mobileMenuButton {
  display: flex;
  justify-content: center;
  align-content: center;
  width: 20%;
  max-height: 100%;
  box-sizing: border-box;
}

#mobileMenuButton p {
  margin: auto;
  font-size: 50px;
  color: var(--secondary-color);
}

#mobile-menu {
  border-bottom: 1px solid var(--border-color);
}
.slide-enter,
.slide-leave-to {
  visibility: hidden;
  height: 0;
  margin: 0;
  padding: 0;
  opacity: 0;
}

.slide-enter-active,
.slide-leave-active {
  transition: all 0.6s;
}

.mobile-menu-div {
  display: flex;
  justify-content: flex-start;
  align-content: center;
  height: 90px;
  font-size: 40px;
  width: 100%;
  border-top: 1px solid var();
  color: var(--main-color);
  background-color: var(--secondary-color);
}

.mobile-menu-div p {
  margin: auto;
}

.main-head {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  justify-content: space-between;
  width: 100%;
  height: 90px;
  background-color: var(--main-color);
  .menu-opener {
    padding: 10px 10px 10px 20px;
    font-size: 40px;
  }
}

#logo-title {
  height: 100%;
  padding: 0 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  justify-self: flex-start;
  flex-grow: 0;
  min-width: fit-content;
  flex-wrap: nowrap;
}
.logo {
  width: auto;
  height: 80px;
}

.main-head a {
  text-decoration: none;
}

.title {
  color: var(--secondary-color);
  font-size: 55px;
  white-space: nowrap;
  padding-left: 15px;
}

#menus {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  margin-left: auto;
  flex: 1;
  font-size: 20px;
  max-width: 1200px;
}

.admin-menus {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  margin-left: auto;
  flex: 1;
  font-size: 20px;
  max-width: 1200px;
}

.admin-menus a {
  color: var(--secondary-color);
}

.admin-menus a:visited {
  color: var(--secondary-color);
}

.menu-div {
  color: var(--secondary-color);
  display: flex;
  min-width: fit-content;
  max-width: 150px;
  justify-content: center;
  align-items: center;
  height: 70%;
  flex-grow: 1;
}

.dropdown {
  position: relative;
  display: inline-block;
  cursor: default;
}

.dropbtn {
  display: flex;
  min-width: fit-content;
  align-items: center;
  justify-content: center;
  height: 100%;
  i {
    padding-left: 10px;
  }
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: var(--secondary-color);
  min-width: 160px;
  width: 100%;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 1;
  text-align: center;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: var(--main-color);
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  background-color: var(--secondary-color);
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
  background-color: var(--main-color);
  color: var(--secondary-color);
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
  background-color: var(--secondary-color);
  color: var(--main-color);
}

.dropdown:hover .dropbtn #down-tri {
  background-color: var(--secondary-color);
  color: var(--main-color);
  border-top: 8px solid var(--main-color);
}

#down-tri {
  margin-left: 5px;
  width: 0;
  height: 0;
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-top: 8px solid var(--secondary-color);
}

.caret-down {
  margin-left: 7px;
}

.menu-click {
  cursor: pointer;
}

@media screen and (min-width: 900px) {
  #mobileMenuButton {
    display: none;
  }
  #mobile-menu {
    display: none;
  }
}

@media screen and (max-width: 900px) {
  #menus {
    display: none;
  }

  #login {
    box-sizing: border-box;
    border: none;
    position: unset;
    width: 100%;
    height: fit-content;
    padding: 20px;
  }
}

@media screen and (max-width: 400px) {
  .main-head {
    #left {
      i {
        padding: 0px 0px 0px 0px;
      }
    }
  }
  .logo {
  width: auto;
  height: 60px;
  padding-right: 10px;
}
  #logo-title {
  height: 100%;
  padding: 0 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  justify-self: flex-start;
  flex-grow: 0;
  min-width: fit-content;
  flex-wrap: nowrap;
}
  .title {
  font-size: 40px;
  white-space: nowrap;
  padding-left: 0px;
}
}
</style>