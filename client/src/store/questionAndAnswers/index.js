import axios from "axios"


const QuestionAndAnswers ={
    state: () => ({
        QuestionAndAnswers:[],
        currentQuestionAndAnswer:null
    }),
    getters:{
        getQuestionAndAnswers:(store)=>store.QuestionAndAnswers,
        getCurrentQuestionAndAnswer:(store)=>store.currentQuestionAndAnswer
    },
    mutations: {
        ADD_QUESTION_AND_ANSWER: (state, payload) => {
            state.QuestionAndAnswers.push(payload)
        },
        SET_CURRENT_QUESTION_AND_ANSWER: (state, payload) => {
            state.currentQuestionAndAnswer = payload
        },
        SET_QUESTION_AND_ANSWERS: (state, payload) => {
            state.QuestionAndAnswers = payload
        },
    },
    actions:{
        ADD_A_QUESTION_AND_ANSWER: async ({commit}, payload) => {
            return new Promise((resolve, reject) => {
                axios.post('http://localhost:8000/api/QuestionAndAnswer', payload).then(({ data }) => {
                    commit("ADD_QUESTION_AND_ANSWER", data)
                    resolve(data)
                })
                    .catch(error => {
                        reject(error)
                    })
            })
        },
        GET_ALL_QUESTION_AND_ANSWERS: async ({ commit }) => {
            return new Promise((resolve, reject) => {
                axios.get('http://localhost:8000/api/QuestionAndAnswer').then(({ data }) => {
                    commit("SET_QUESTION_AND_ANSWERS", data)
                    resolve(data)
                })
                    .catch(error => {
                        reject(error)
                    })
            })
        }
    }
}
export default QuestionAndAnswers