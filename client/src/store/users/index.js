import { axios } from "vue/types/umd"

const users = {
    state: () => ({
        currentUser: null,
        token: window.localStorage.getItem('token') || ""
    }),
    getters: {
        getCurrentUser: (store) => store.currentUser,
        isLoggedIn: (store) => !!store.currentUser,
        getToken: (store) => store.getToken
    },
    mutations: {
        AUTH_SUCCESS: (state, {user, token}) => {
            window.localStorage.setItem('token', token)
            state.token = token
            state.currentUser = user
        },
        LOGOUT: (state) => {
            state.token = ""
            state.currentUser = null
        }
    },
    actions: {
        LOGIN: async ({commit}, payload) => {
            return new Promise((resolve, reject) => {
                axios.post("http://localhost:8000/api/users/login", payload)
                .then(({data}) => {
                    commit("AUTH_SUCCESS", data)
                    resolve(data)
                })
                .catch(error => {
                    commit("LOGOUT")
                    reject(error)
                })
            })
        },
        SIGNUP: async ({commit}, payload) => {
            return new Promise((resolve, reject) => {
                axios.post("http://localhost:8000/api/users/signup", payload)
                .then(({data}) => {
                    commit("AUTH_SUCCESS", data)
                    resolve(data)
                })
                .catch(error => {
                    commit("LOGOUT")
                    reject(error)
                })
            })
        },
        LOGOUT: async ({commit}) => {
            return new Promise ((resolve) => {
                commit("LOGOUT")
                resolve("User Logged Out");
            })
        },
        VERIFY_AUTH: async ({commit}) => {
            return new Promise ((resolve, reject) => {
                const token = window.localStorage.getItem('token') || ""
                if (!token) {
                    commit('LOGOUT')
                    reject({error: "No Token"})
                } else {
                    axios.post("http://localhost:8000/api/users/verify", {token})
                    .then(({data}) => {
                        if (data.user) {
                            commit("AUTH_SUCCESS", {user: data.user, token})
                            resolve({user: data.user, token})
                        } else {
                            commit ("LOGOUT")
                            reject({error: "Unvalid Token"})
                        }
                    })
                }
            })
        }
    }
}

export default users