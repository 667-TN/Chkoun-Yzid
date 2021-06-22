import axios from "axios"

const cars = {
    state: () => ({
        cars: [],
        currentCar: null
    }),
    getters: {
        getCars: (store) => store.cars,
        getCurrentCar: (store) => store.currentCar
    },
    mutations: {
        SET_CARS: (state, payload) => {
            state.cars = payload
        },
        ADD_CAR: (state, payload) => {
            state.cars.push(payload)
        },
        DELETE_CAR: (state, payload) => {
            state.cars = state.cars.filter(car => car.id !== payload.id)
        },
        UPDATE_CAR: (state, payload) => {
            state.cars = state.cars.forEach((car, index) => {
                if (car.id === payload.id) {
                    state.cars[index] = payload
                }
            })
        },
        SET_CURRENT_CAR: (state, payload) => {
            state.currentCar = payload
        }
    },

    actions: {
        GET_ALL_CARS: async ({ commit }) => {
            return new Promise((resolve, reject) => {
                axios.get('http://localhost:8000/api/cars').then(({ data }) => {
                    commit("SET_CARS", data)
                    console.log(data)
                    resolve(data)
                })
                    .catch(error => {
                        reject(error)
                    })
            })
        },
        ADD_A_CAR: async ({commit}, payload) => {
            return new Promise((resolve, reject) => {
                axios.post('http://localhost:8000/api/cars', payload).then(({ data }) => {
                    commit("ADD_CAR", data)
                    resolve(data)
                })
                    .catch(error => {
                        reject(error)
                    })
            })
        },
        DELETE_A_CAR: async ({commit}, payload) => {
            return new Promise((resolve, reject) => {
                axios.delete(`http://localhost:8000/api/cars/${payload.id}`).then(({ data }) => {
                    commit("DELETE_CAR", data)
                    resolve(data)
                })
                    .catch(error => {
                        reject(error)
                    })
            })
        },
        UPDATE_A_CAR: async ({commit}, payload) => {
            return new Promise((resolve, reject) => {
                axios.put(`http://localhost:8000/api/cars/${payload.id}`, payload).then(({ data }) => {
                    commit("UPDATE_CAR", data)
                    resolve(data)
                })
                    .catch(error => {
                        reject(error)
                    })
            }) 
        },
        GET_A_CAR: async ({commit}, id) => {
            return new Promise((resolve, reject) => {
                axios.get(`http://localhost:8000/api/cars/${id}`).then(({ data }) => {
                    commit("SET_CURRENT_CAR", data)
                    resolve(data)
                })
                    .catch(error => {
                        reject(error)
                    })
            }) 
        }
    }
}

export default cars