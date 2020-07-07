<template>
    <div class="container">
        <div id="dragons">
            D R A G O N S
            <br>
<!--            <button @click="increment(18)">+</button>-->
            <select v-model="$store.state.startDrake">
                <option disabled value>Select a drake</option>
                <option v-for="dragon in dragons" :value="dragon.id">{{ dragon.name }}</option>
            </select>
<!--            <button @click="decrement(1)">-</button>-->
            <br>
            <button @click="randomize()">RANDOMIZE DRAKES</button>

            <pre> START DRAKE: {{getRandomDrake()}}</pre>
            <pre> NEXT DRAKE: {{ dragons[startDrake].name }}</pre>


<!--            <div id="drake-select">-->
<!--                <option v-for="dragon in dragons" :value="dragon.id">{{ dragon.name }}</option>-->
<!--            </div>-->

            <select>
                <option disabled value>Select a champion and mark it as taken</option>
                <option v-for="dragon in dragons" :value="dragon.id">{{ dragon.name }}</option>
            </select>

            <div id="first-drake">  </div>
            <div id="second-drake"> </div>
            <div id="final-drake"> </div>

            <button @click="resetDrakePanel()">RESET</button>
        </div>
    </div>
</template>

<script>
    import {mapState, mapGetters} from "vuex";
    import axios from "axios";

    export default {
        name: "Dragons",
        data() {
            return {
                dragons: [
                    {id: 81, name: 'mountain'},
                    {id: 82, name: 'cloud'},
                    {id: 83, name: 'ocean'},
                    {id: 84, name: 'infernal'}
                ],
                taken: []
            };
        },
        methods: {
            // TODO
            addDrakeBy(id) {
                axios({
                    method: 'POST',
                    url: 'http://localhost:3000/api/drake',
                    crossdomain: true,
                    data: $store.state.drakeObj
                });
            },
            defineDrake(number) {
                const object1 = $store.state.drakeObj;
                console.log(Object.values(object1).reduce((a, b) => a + b, 0));
            },
            setStartDrake(val) {
                this.$store.commit("setStartDrake", val);
            },

            getRandomDrake() {
                console.log(`${this.dragons} getRandomDrake`);
                var rand = this.dragons[Math.floor(Math.random() * this.dragons.length)];

                return rand.name;
            },
            resetDrakePanel() {
                this.dragons = [];
                this.$store.commit("resetDrakePanel");
            },
            randomize() {
                var dragons = this.dragons;
                var rand = dragons[Math.floor(Math.random() * dragons.length)];
                var dragons = this.removeByAttr(dragons, 'id', rand.id);
                var rand2 = dragons[Math.floor(Math.random() * dragons.length)];
                var dragons = this.removeByAttr(dragons, 'id', rand2.id);

                this.taken = dragons;
                console.log(dragons);
                // console.log(rand.name);
            },
            removeByAttr(arr, attr, value) {
                var i = arr.length;
                while(i--){
                    if( arr[i]
                        && arr[i].hasOwnProperty(attr)
                        && (arguments.length > 2 && arr[i][attr] === value ) ){

                        arr.splice(i,1);

                    }
                }
                return arr;
            }
        },
        computed: {
            ...mapState([
                "statSssss",
                "startDrake",
                "nextDrake",
                "level",
            ]),
            created() {
                //var startDrake = this.$store.state.startDrake;

            },
            //watch: {}
        }
    };
</script>

<style scoped>
    .container {
        max-width: 900px;
        margin-left: 20%;
        background-color: #42b983;
    }

</style>
