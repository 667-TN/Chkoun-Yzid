import Vuex from "vuex"
import Vue from "vue"
import cars from "./cars"
import users from "./users"

Vue.use(Vuex)

const store = new Vuex.Store({
    modules: {
        users,
        cars
    }
})

export default store