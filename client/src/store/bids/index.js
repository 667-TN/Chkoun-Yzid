import axios from "axios"


const bids ={
    state: () => ({
        bids:[],
        currentBid:null
    }),
    getters:{
        getBids:(store)=>store.bids,
        getCurrentBid:(store)=>store.currentBid
    },
    mutations: {
        ADD_BID: (state, payload) => {
            state.bids.push(payload)
        },
        SET_CURRENT_BID: (state, payload) => {
            state.currentBid = payload
        },
        SET_BIDS: (state, payload) => {
            state.bids = payload
        },
    },
    actions:{
        ADD_A_BID: async ({commit}, payload) => {
            return new Promise((resolve, reject) => {
                axios.post('http://localhost:8000/api/bid', payload).then(({ data }) => {
                    commit("ADD_BID", data)
                    resolve(data)
                })
                    .catch(error => {
                        reject(error)
                    })
            })
        }
    }
}
export default bids