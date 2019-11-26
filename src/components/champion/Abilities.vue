<template>
    <div id="abilities">
        <div class="container">
            <table>
                <tbody>
                <tr>
                    <td>
                        <div class="ability-img">

                            <img v-if="this.p != undefined" :src="imxgNameP">


                            <!--                    <img :src="imxgNameP">-->
                        </div>
                    </td>
                    <td><h1 class="ability-name">PASSIVE: {{ p.name }}</h1></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><p class="description">{{passive}}</p></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <div class="ability-img">
                            <img :src="imxgNameQ">
                        </div>
                    </td>
                    <td>
                        <div class="ability-name">
                            {{ q.name }}
                        </div>
                    </td>
                    <td>
                        <p>cost {{ q.cost[`${qRank - 1}`] + q.costType }}</p>
                    </td>

                    <td>
                        <p>cooldown {{ q.cooldown[`${qRank - 1}`] * (1 - cooldownReduction) }}</p>
                    </td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <button @click="incrementRank(q.maxrank)">+</button>
                        <button @click="decrementRank(0)">-</button>
                        <pre> CURRENT RANK IS {{ qRank }}</pre>

                        <div class="ability-desc">
                            <p class="description">{{q.tooltip}}</p>
                        </div>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>


                <tr>
                    <td>
                        <div class="ability-img">
                            <img :src="imxgNameW">
                        </div>
                    </td>
                    <td><h1 class="ability-name">{{ w.name }}</h1></td>
                    <td><h3>cost {{ w.cost[`${wRank - 1}`] + w.costType}}</h3></td>
                    <td><h2>cooldown {{ w.cooldown[`${wRank - 1}`] * (1 - cooldownReduction) }}</h2></td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <div class="ability-desc">
                            <p class="description">{{w.tooltip}}</p>
                        </div>
                    </td>
                    <td>
                        <div class="ability-header">
                            <p>Maxrank is {{ w.maxrank }}</p>
                            <button @click="incrementWRank(w.maxrank)">+</button>
                            <button @click="decrementWRank(0)">-</button>
                            <pre> CURRENT RANK IS {{ wRank }}</pre>
                        </div>
                    </td>
                    <td>&nbsp;</td>
                </tr>


                <tr>
                    <td>
                        <div class="ability-img">
                            <img :src="imxgNameE">
                        </div>
                    </td>
                    <td><h1 class="ability-name">{{ e.name }}</h1></td>
                    <td><h3>cost {{ e.cost[`${eRank - 1}`] }}</h3></td>
                    <td><h2>cooldown {{ e.cooldown[`${eRank - 1}`] * (1 - cooldownReduction) }}</h2></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <div class="ability-desc">
                            <p class="description">{{e.tooltip}}</p>
                        </div>
                    </td>
                    <td>
                        <div class="ability-header">


                            <p>Maxrank is {{ e.maxrank }}</p>
                            <button @click="incrementERank(e.maxrank)">+</button>
                            <button @click="decrementERank(0)">-</button>
                            <pre> CURRENT RANK IS {{ eRank }}</pre>
                        </div>


                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <div class="ability-img">
                            <img :src="imxgNameR">
                        </div>
                    </td>
                    <td><h1 class="ability-name">{{ R.name }}</h1></td>
                    <td><h3>cost {{ R.cost[`${rRank - 1}`] }}</h3></td>
                    <td><h2>cooldown {{R.cooldown[`${rRank - 1}`] * (1 - cooldownReduction) }}</h2></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <div class="ability-desc">
                            <p class="description">{{R.tooltip}}</p>
                        </div>
                    </td>
                    <td><p>Maxrank is {{ R.maxrank }}</p>
                        <button @click="incrementUltimateRank(R.maxrank)">+</button>
                        <button @click="decrementUltimateRank(0)">-</button>
                        <pre> CURRENT RANK IS {{ rRank }}</pre>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</template>

<script>
    import {mapState, mapGetters} from "vuex";
    import axios from "axios";

    export default {
        name: "Abilities",
        data() {
            return {
                p: {},
                passive: {},
                q: {
                    id: "VayneTumble",
                    name: "Tumble",
                    description:
                        "Vayne tumbles, maneuvering to carefully place her next shot. Her next attack deals bonus damage.",
                    tooltip:
                        "Vayne rolls a short distance, and deals <scaleAD>{{ f1 }}</scaleAD> bonus physical damage on her next basic attack within {{ e3 }} seconds.<br /><br /><rules>Tumble's bonus damage is equal to {{ e1 }}% of Vayne's total attack damage.</rules>",
                    leveltip: {
                        label: ["Damage", "Cooldown"],
                        effect: [
                            "{{ e1 }}% -> {{ e1NL }}%",
                            "{{ cooldown }} -> {{ cooldownNL }}"
                        ]
                    },
                    maxrank: 5,
                    cooldown: [4, 3.5, 3, 2.5, 2],
                    cooldownBurn: "4/3.5/3/2.5/2",
                    cost: [30, 30, 30, 30, 30],
                    costBurn: "30",
                    datavalues: {},
                    effect: [
                        null,
                        [50, 55, 60, 65, 70],
                        [0, 0, 0, 0, 0],
                        [7, 7, 7, 7, 7],
                        [0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0]
                    ],
                    effectBurn: [
                        null,
                        "50/55/60/65/70",
                        "0",
                        "7",
                        "0",
                        "0",
                        "0",
                        "0",
                        "0",
                        "0",
                        "0"
                    ],
                    vars: [
                        {
                            link: "attackdamage",
                            coeff: [0.3, 0.35, 0.4, 0.45, 0.5],
                            key: "f1"
                        }
                    ],
                    costType: " Mana",
                    maxammo: "-1",
                    range: [300, 300, 300, 300, 300],
                    rangeBurn: "300",
                    image: {
                        full: "VayneTumble.png",
                        sprite: "spell12.png",
                        group: "spell",
                        x: 336,
                        y: 144,
                        w: 48,
                        h: 48
                    },
                    resource: "{{ cost }} Mana"
                },
                w: {},
                e: {},
                R: {},
                qRank: 1,
                wRank: 1,
                eRank: 1,
                rRank: 1,
                // currentRank: 1
            };
        },
        methods: {
            incrementRank(newVal, oldVal) {
                console.log(this.q.maxrank)
                if (this.qRank < this.q.maxrank)
                    this.qRank++
                console.log(this.qRank)
            },
            decrementRank(newVal, oldVal) {
                console.log(this.q.maxrank)
                if (this.qRank >= 2)
                    this.qRank--
                console.log(this.qRank)
            },
            incrementWRank(newVal, oldVal) {
                console.log(this.w.maxrank)
                if (this.wRank < this.w.maxrank)
                    this.wRank++
                console.log(this.wRank)
            },
            decrementWRank(newVal, oldVal) {
                console.log(this.w.maxrank)
                if (this.wRank >= 2)
                    this.wRank--
                console.log(this.wRank)
            },
            incrementERank(newVal, oldVal) {
                console.log(this.e.maxrank)
                if (this.eRank < this.e.maxrank)
                    this.eRank++
                console.log(this.eRank)
            },
            decrementERank(newVal, oldVal) {
                console.log(this.e.maxrank)
                if (this.eRank >= 2)
                    this.eRank--
                console.log(this.eRank)
            },
            incrementUltimateRank(newVal, oldVal) {
                console.log(this.R.maxrank)
                if (this.rRank < this.R.maxrank)
                    this.rRank++
                console.log(this.rRank)
            },
            decrementUltimateRank(newVal, oldVal) {
                console.log(this.R.maxrank)
                if (this.rRank >= 2)
                    this.rRank--
                console.log(this.rRank)
            },
        },
        computed: {
            ...mapGetters([
                "champObjGet",
                "BASE_AD",
                "BONUS_HP",
                "hp",
                "statsObject",
                "totalBaseHp",
                "cooldownReduction",
                "BASE_ARMOR",
                "BASE_MR",
                "level"
            ]),
            currentRank: function () {
                console.log(`this is CurrentRank: ${this.q.cooldown[qRank]}`)
                return this.q.cooldown[qRank];
            },
            imxgNameP: function () {
                var imgPath = "/img/champion/passive/" + this.p.image.full;
                return imgPath;
            },
            imxgNameQ: function () {
                var imgPath = "/img/champion/spell/" + this.q.image.full;
                return imgPath;
            },
            imxgNameW: function () {
                var imgPath = "/img/champion/spell/" + this.w.image.full;
                return imgPath;
            },
            imxgNameE: function () {
                var imgPath = "/img/champion/spell/" + this.e.image.full;
                return imgPath;
            },
            imxgNameR: function () {
                var imgPath = "/img/champion/spell/" + this.R.image.full;
                return imgPath;
            },
            ...mapState(["statSssss", "activeChampion", "level", "BASE_AD", "BONUS_HP"])
        },
        created() {
            var activeChampion = this.$store.state.activeChampion;
            console.log("created + called.");
            axios.get("../temp.json").then(response => {
                this.passive = response.data[`${activeChampion}`];
            });
            axios.get("../championFull.json").then(response => {
                (this.p = response.data.data[`${activeChampion}`]["passive"]),
                    (this.q = response.data.data[`${activeChampion}`]["spells"][0]),
                    (this.w = response.data.data[`${activeChampion}`]["spells"][1]),
                    (this.e = response.data.data[`${activeChampion}`]["spells"][2]),
                    (this.R = response.data.data[`${activeChampion}`]["spells"][3]);
            });
        },
        watch: {
            activeChampion: function (newVal, oldVal) {
                var activeChampion = this.$store.state.activeChampion;
                console.log(`watch triggered. New is ${newVal}`);
                axios.get("../temp.json").then(response => {
                    console.log(response);
                    this.passive = response.data[`${activeChampion}`];
                });
                axios.get("../championFull.json").then(response => {
                    (this.p = response.data.data[`${activeChampion}`]["passive"]),
                        (this.q = response.data.data[`${activeChampion}`]["spells"][0]),
                        (this.w = response.data.data[`${activeChampion}`]["spells"][1]),
                        (this.e = response.data.data[`${activeChampion}`]["spells"][2]),
                        (this.R = response.data.data[`${activeChampion}`]["spells"][3]);
                });
            },
            qRank: function (newVal, oldVal) {
                this.currentRank = this.qRank
                // console.log(`watch QRANK: this.qrank: ${this.qRank}`)
            }
        }
    };
</script>

<style scoped>
    .container {

    }

    #abilities {
        background-color: #575f8b;
        padding: 20px;
        /* max-width: 450px; */
        display: inline-block;
        border-style: solid;
        border-color: blueviolet;
    }

    .ability-name,
    .ability-desc {
        color: lightgreen;
        display: inline-flex;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        font-size: 0.9em;
        font-weight: 100;
        text-align: left;
    }

    .ability-desc {
        max-width: 800px;
    }

    .ability-header {
        /*display: inline-block;*/
    }

    .ability-img {
        float: left;
    }

    .test-ability {
        display: inline-block;
    }

    .this-left {
        float: left;
        overflow: hidden;
    }

    .this-right {
        float: right;
        overflow: hidden;
    }
</style>
