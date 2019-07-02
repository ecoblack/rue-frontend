<template>
    <div id="stats">
        <div class="avatar">
            <img :src="imgName">
        </div>

        <h1>{{ statSssss }}</h1>
        <pre> {{ level }} </pre>
        <pre> BASE_AD FROM STATS {{ BASE_AD }}</pre>
        <pre> BONUS_HP or = STORE {{ BONUS_HP }}</pre>
        <pre>AS is {{ attackspeed }}</pre>
        <pre>CDR is {{cooldownReduction}}</pre>

        <h1 style="color:darkturquoise"> {{abilityPower}} </h1>


        <pre>


        </pre>
        <!-- <pre> BASE_ARMOR FROM STATS {{ BASE_ARMOR }}</pre>
        <pre> BASE_MR FROM STATS {{ BASE_MR }}</pre>-->
        <br>
        <button @click="increment(18)">+</button>
        <button @click="decrement(1)">-</button>
        <button @click="incrementAd(40, 250)">Add BF Sword</button>
        <button @click="incrementCDR(0.05)">Add 5% CDR</button>
        <br>


      <!-- champData from stats {{ champData }}  -->
          <ul>
<!--  <li>baseHp from stats {{ baseHp }} </li>-->
<!--  <li>baseMp from stats {{ baseMp }} </li>-->
<!--    <li>baseArmor from stats {{ baseArmor }} </li>-->
<!--  <li>baseSpellblock from stats {{ baseSpellblock }} </li>-->

<!--  <li>baseHpRegen from stats {{ baseHpRegen }} </li>-->
<!--  <li>baseMpRegen from stats {{ baseMpRegen }} </li>-->
              <li> {{statsObject}} </li>
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
                    {id: 222, name: "Annie"}


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
                "BASE_AD",
                "BONUS_HP"
            ]),
            ...mapGetters([
                "champObjGet",
                "attackspeed",
                "BASE_AD",
                "BONUS_HP",
                "statsObject",
                "totalBaseHp",
                "cooldownReduction",
                "abilityPower"
                //   // "BASE_ARMOR",
                //   // "BASE_MR",
                //   "level"
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
            baseHp: function () {
                var champData = this.champData;
                return champData.hp + champData.hpperlevel * (this.level - 1);
            },
            baseArmor: function () {
                var champData = this.champData;
                return champData.armor + champData.armorperlevel * (this.level - 1);
            },
            baseMp: function () {
                var champData = this.champData;
                return champData.mp + champData.mpperlevel * (this.level - 1);
            },
            baseSpellblock: function () {
                var champData = this.champData;
                return (
                    champData.spellblock + champData.spellblockperlevel * (this.level - 1)
                );
            },
            baseHpRegen: function () {
                var champData = this.champData;
                return champData.hpregen + champData.hpregenperlevel * (this.level - 1);
            },
            baseMpRegen: function () {
                var champData = this.champData;
                return champData.mpregen + champData.mpregenperlevel * (this.level - 1);
            },
            baseAttackSpeed: function () {
                var champData = this.champData;
                return champData.mpregen + champData.mpregenperlevel * (this.level - 1);
            }
            // champDatax: function() {
            //   var activeChampion = this.$store.state.activeChampion;
            //  console.log(activeChampion);
            //  axios
            //     .get("../champion.json")
            //     .then(
            //       response =>
            //         (this.champData = response.data.data[`${activeChampion}`]["stats"])
            //     );
            //     return this.champData;
            // }
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
            incrementAd(val, val2) {
                // console.log(val2);
                this.$store.commit("incrementBonusAttackDamage", val);
                this.$store.commit("incrementBaseHp", val2);
            },
            incrementAp(val, val1, val2) {
                // console.log(val2);
                this.$store.commit("incrementAbilityPower", val);
                this.$store.commit("incrementBaseHp", val2);
            },
            incrementCDR(val, val2) {
                // console.log(val);
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
                console.log(`watch triggered. OLD is ${oldVal}`);
                console.log(`watch triggered. OLD is ${this.champData}`);
                // incrementHp(this.champData.hp);
            },
            champData: function (newChampData, oldChampData) {
                console.log(`watch triggered. New is ${newChampData}`);
                console.log(`watch triggered. OLD is ${oldChampData}`);
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
