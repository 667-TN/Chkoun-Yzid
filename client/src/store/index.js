import Vuex from "vuex";
import Vue from "vue";
import cars from "./cars";
import users from "./users";
import bids from "./bids";

Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    users,
    cars,
    bids
  }
});

export default store;
