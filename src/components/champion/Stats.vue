<template>
    <div id="stats">
        <div class="avatar">
            <img :src="imgName">
        </div>

        <h1>{{ statSssss }}</h1>
        <pre> {{ level }} </pre>

        <h2> AD <span style="color:darkorange"> {{ attackdamage }}  </span> / <span style="color:purple"> {{ BONUS_AD  }}  </span>
            <br>
            <p>TOTAL AD:  {{ Math.ceil(attackdamage + BONUS_AD) }}</p>
        </h2>
        <h2>BASE AS is {{ attackspeed.toFixed(3) }}</h2>
        <h2>CDR is {{(cooldownReduction.toFixed(2)) * 100}} %</h2>
        <h2> HP <span style="color:darkorange"> {{ hp }}  </span> / <span style="color:purple"> {{ BONUS_HP  }}  </span>
            <br>
            <p>TOTAL HP:  {{ Math.ceil(hp + BONUS_HP) }}</p>
        </h2>
        <h2> RESISTS <span style="color:darkorange"> {{ armor }}  </span> / <span
                style="color:purple"> {{ spellblock }}  </span>
        </h2>
        <h2>BASE MS  {{statsObject.movespeed}} </h2>
        <h1 style="color:darkturquoise"> {{abilityPower}} </h1>


        <pre>

        <button @click="incrementAp(payload = {'flat_ap': 15, 'coeff_ap': '0', isCoeff: false})">Add infernal</button>
        </pre>
        <br>
        <button @click="increment(18)">+</button>
        <button @click="decrement(1)">-</button>
        <button @click="incrementBonusAttackDamage(40, 250)">Add BF Sword</button>
        <button @click="incrementCDR(0.05)">Add 5% CDR</button>
        <br>
        <ul>

            <li> </li>
        </ul>

        <select v-model="$store.state.activeChampion">
            <option disabled value>Select a champion</option>
            <option v-for="champion in champions" :value="champion.name">{{ champion.name }}</option>
        </select>

        <pre>Active Champion from Stats: {{ this.$store.state.activeChampion }}</pre>
    </div>
</template>

<script>
    import {mapState, mapGetters} from "vuex";
    import axios from "axios";

    export default {
        name: "Stats",
        data() {
            return {
                champions: [
                    {id: 12, name: "JarvanIV"},
                    {id: 13, name: "Nocturne"},
                    {id: 14, name: "Nami"},
                    {id: 15, name: "Tristana"},
                    {id: 343, name: "Vayne"},
                    {id: 232, name: "Lux"},
                    {id: 222, name: "Annie"},
                    {id: 2412, name: "Neeko"}
                ],
                response: "",
                champData: ""
            };
        },
        computed: {
            ...mapState([
                "statSssss",
                "activeChampion",
                "level",
            ]),
            ...mapGetters([
                "champObjGet",
                "attackspeed",
                "attackdamage",
                "BONUS_AD",
                "BONUS_HP",
                "statsObject",
                "totalBaseHp",
                "cooldownReduction",
                "abilityPower",
                "hp",
                "armor",
                "spellblock"
            ]),
            imgName: function () {
                var activeChampion = this.$store.state.activeChampion;
                if (this.$store.state.activeChampion === "") {
                    return "";
                } else {
                    var imgPath = "/img/champion/tiles/" + activeChampion + "_0.jpg";
                    return imgPath;
                }
            },
        },
        methods: {
            calcAspd(level, offset, attackspeedperlevel, attackspeed) {
                aspd = aspd || 0;
                // var i = (1 / (1.6 * (1 + offset))) * (1 + aspd + (aspdper * (level - 1)) / 100);
                var i = 2.3 * (level - 1) * (0.7025 + 0.0175 * (level - 1))
                //       Statistic=b+g×(n−1)×(0.7025+0.0175×(n−1))
                // b = base
                // g = growth statistic
                // n = champion level
                // (n - 1) = total amount of level ups
                //At level he has gained 3.22%×(level−1)×(0.7025+0.0175×(level−1))=24.9228% as bonus AS%.
                return Math.round(i * 1000) / 1000;
            },
            increment(limit) {
                this.$store.commit("increment", limit);
            },
            decrement(limit) {
                this.$store.commit("decrement", limit);
            },
            setActiveChampion(val) {
                this.$store.commit("setActiveChampion", val);
            },
            incrementBonusHp(val, val2) {
                this.$store.commit("incrementBonusHp", val2);
            },
            incrementBonusAttackDamage(val, val2) {
                this.$store.commit("incrementBonusAd", val2);
            },
            incrementAp(payload) {
                console.log(`${payload} is a PAYLOAD`)
                this.$store.commit("incrementAbilityPower", payload);
            },
            incrementCDR(val, val2) {
                this.$store.commit("incrementCDR", val);
            }
        },
        created() {
            var activeChampion = this.$store.state.activeChampion;
            // console.log("created called.");
            axios
                .get("../champion.json")
                .then(
                    response =>
                        (this.champData = response.data.data[`${activeChampion}`]["stats"])
                );
        },
        watch: {
            activeChampion: function (newVal, oldVal) {
                console.log(`watch triggered. New is ${newVal}`);
                axios
                    .get("../champion.json")
                    .then(
                        response =>
                            (this.champData = response.data.data[`${newVal}`]["stats"])
                    );
            },
            champData: function (newChampData, oldChampData) {
                this.$store.commit("resetStatsObject", newChampData);
                this.$store.commit("storeStatsObject", newChampData);
            }
        }
    };
</script>

<style scoped>
    img {
        max-height: 150px;
    }
</style>
