const dragonModule = {
    namespaced: true,
    state: {
        count: 3
    },
    mutations: {
        increment(state) {
            state.count++
        },
        setStartDrake: (state, drake) => {
            console.log(`${drake}`)
            state.startDrake = drake
        },
        setNextDrake: (state, payload) => {
            //let myArray = ['one','two','three'];
            // let mySplicedArray = [...myArray];
            // mySplicedArray.splice(1,1);

            console.log(myArray); /// ['one', 'two', 'three']
            console.log(mySplicedArray); /// ['one', 'three']

            console.log(`DRAKE MUTATION ${drake}`)
            state.nextDrake = drake
        },
        addDrake: (state, drake) => {
            var x = state.drakeObj
            state.drakeObj.push(x[drake] + 1)
            console.log(`${drake}`)
            state.startDrake = drake
        },
        resetDrakePanel: () => {
            state.startDrake = 0
        },
    },
    getters: {
        doubleCount(state) {
            return state.count * 2
        },
        startDrake: state => {
            return state.startDrake
        },
        nextDrake: state => {
            return state.nextDrake
        },
    },
    actions: {
        incrementIfOdd({state, commit}) {
            if (state.count % 2 === 1) {
                commit('increment');
            }
        }
    }
}
