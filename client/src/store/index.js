import Vuex from "vuex"
import Vue from "vue"
import cars from "./cars"

Vue.use(Vuex)

const store = new Vuex.Store({
    modules: {
        // users,
        cars
    }
})

export default store