
import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import axios from "axios";
import VueAxios from "vue-axios";
import store from "./store";


import MaterialKit from "./plugins/material-kit";

Vue.config.productionTip = false;
Vue.use(VueAxios, axios);
Vue.use(MaterialKit);


const NavbarStore = {
  showNavbar: false
};

Vue.mixin({
  data() {
    return {
      NavbarStore
    };
  }
});

new Vue({
  store,
  router,
  render: h => h(App)
}).$mount("#app");
