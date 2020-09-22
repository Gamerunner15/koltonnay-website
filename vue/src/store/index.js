import { createStore } from 'vuex'

export default createStore({
  state: {
    menuOpen: false
  },
  mutations: {
    toggleMenu(state) {
      state.menuOpen == false ? state.menuOpen = true : state.menuOpen = false;
    }
  },
  actions: {
  },
  modules: {
  }
})
