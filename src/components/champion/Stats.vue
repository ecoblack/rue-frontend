<template>
    <div id="stats">
        <div class="avatar">
            <img :src="imgName">
        </div>
        <button @click="increment(18)">+</button>
        <button @click="decrement(1)">-</button>
        <h1>{{ statSssss }}</h1>
        <pre> {{ level }} </pre>
        <button v-on:click="isHidden = !isHidden">Toggle hide and show</button>

        <div v-if="!isHidden" class="wrapper">
            <div>
                <h2> HP <span style="color:red"> {{ hp }}  </span> / <span
                        style="color:darkred"> (+{{ BONUS_HP  }}) </span>
                    <br>
                    <p>MAX HP: {{ Math.ceil(hp + BONUS_HP) }}</p>
                </h2>
            </div>
            <div>
                <h2> AD <span style="color:darkorange"> {{ attackdamage }}  </span> / <span style="color:purple"> {{ BONUS_AD  }}  </span>
                    <br>
                    <p>TOTAL AD: {{ totalAD }}</p>
                </h2>
            </div>
            <div>Ability Power:<h1 style="color:darkturquoise"> {{abilityPower}} </h1>
                /
                <h2>CDR is {{(cooldownReduction.toFixed(2)) * 100}} %</h2></div>
            <div><h2> RESISTS <span style="color:darkorange"> {{ armor }}  </span> / <span
                    style="color:purple"> {{ spellblock }}  </span>
            </h2></div>
            <div>Mag Penetration / Lethality</div>
            <div> Base movespeed<h2> {{statsObject.movespeed}} </h2></div>
            <div>
                <!--                <h2> HPREGEN <span style="color:darkorange"> {{ hpregen }}  </span> / <span-->
                <!--                        style="color:purple"> {{ BONUS_HP  }}  </span>-->
                <!--                    <br>-->
                <!--                    <p>TOTAL HP: {{ Math.ceil(hp + BONUS_HP) }}</p>-->
                <!--                </h2>-->
            </div>
            <div><h2>BASE AS is {{ attackspeed.toFixed(3) }}</h2></div>
        </div>

        <pre>
        <button @click="incrementAp(payload = {'flat_ap': 15, 'coeff_ap': '0', isCoeff: false})">Add 15 AP</button>
        </pre>

        <br>
        <button @click="rue(123)">POST STORE TO BACKEND</button>
        <button @click="autoAttack(123)">Auto attack</button>


        <button @click="incrementBonusHp(32, 123)">+ 123 HP</button>
        <button @click="incrementBonusAttackDamage(40, 40)">Add BF Sword</button>


        <button @click="incrementCDR(0.05)">Add 5% CDR</button>

        <br>
        <h1> <p> _________________________ </p>
            <p> {{ this.$store.state.autoAttackValue }} </p>
        </h1>

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
                autoAttackValue: this.$store.state.autoAttackValue,
                response: '',
                champData: '',
                isHidden: false
            };
        },
        computed: {
            ...mapState([
                "statSssss",
                "activeChampion",
                "level",
                "totalAD",
                "attackdamage",
                "SET_AUTO_ATTACK"
            ]),
            ...mapGetters([
                "champObjGet",
                "attackspeed",
                "attackdamage",
                "total_hp",
                "totalAD",
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
            count: function () {
                // var total = Math.ceil(this.$store.state.attackdamage + this.$store.state.BONUS_AD);
                var total = this.$store.state.bonusAttackDamage + this.$store.state.attackdamage;
                console.log(`WATCH TOTALAD: ${this.$store.state.totalAd}`);

                this.$store.commit("setTotalDamage", total);

                // Or return basket.getters.fruitsCount
                // (depends on your design decisions).
            }
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
            // sumTotal(total) {
            //     this.$store.commit("setTotalDamage", total);
            // },
            rue(val) {
                axios({
                    method: 'POST',
                    url: 'http://localhost:1488/auto',
                    crossdomain: true,
                    data: {
                        ok: this.$store.state,
                        b: 1,
                        maxHp: Math.ceil(this.$store.state.hp + this.$store.state.BONUS_HP),
                        c: this.$store.state.hp
                    }
                });
            },
            autoAttack(val) {
                axios({
                    method: 'POST',
                    url: 'http://localhost:1488/auto',
                    crossdomain: true,
                    data: {
                        caster: {
                            totalAd: this.$store.state.totalAd,
                            armpen: 0.15,
                            lethality: this.$store.state.statsObj.lethality
                        },
                        target: {
                            armor: 222,
                            mr: 33,
                            totalhp: 3333
                        }
                    }
                }).then( (response) => {
                    var autoData = response.data;
                    console.log(autoData);
                    console.log(`${autoData} AUTO DATA`);
                    // console.log(autoData.data);
                    console.log(`${this.$store.state.autoAttackValue}`);
                    this.$store.commit('SET_AUTO_ATTACK', autoData);


                })
                    .catch(function (error) {
                        console.log(error);
                    });
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
                //store.totalAd = store.attackdamage
            },

            // graspOfTheUndying(range, sender, receiver) {
            //     //PASSIVE: Dealing or receiving damage within 2 seconds generates one stack every second.
            //     // At 4 stacks, your next basic attack within 6 seconds against an enemy champion
            //     // deals 4% of your maximum health bonus magic damage, restores 2% of your maximum health,
            //     // and permanently grants 5 bonus health.
            //     // The empowered attack duration refreshes whenever dealing or receiving damage.
            //     // On Ranged role ranged champions, the effects are reduced by 40%,
            //     // down to 2.4% of your maximum health,
            //     // 1.2% of your maximum health, and 3 bonus health respectively.
            //     //maxHP = hp + BONUS_HP;
            //     console.log(`watch triggered. Range is ${range}, sender = ${sender}, receiver = ${receiver}`);
            //     console.log(maxHP);
            // },
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
            this.$store.subscribe((mutation, state) => {
                if (mutation.type === 'incrementBonusHp') {
                    console.log(`Updating to ${state.hp}`);

                    // Do whatever makes sense now

                    if (state.hp === 'success') {
                        return "positive";
                    } else {
                        console.log(`${state.hp}`);
                    }
                }
            });
            axios
                .get("../champion.json")
                .then(
                    response =>
                        (this.champData = response.data.data[`${activeChampion}`]["stats"])
                );

            function rand(items) {
                return items[~~(items.length * Math.random())];
            }
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
            },

            count(newCount, oldCount) {
                // Our fancy notification (2).
                console.log(`We have ${newCount} fruits now, yaay!`)
            }
            // '$store.state.attackdamage': function () {
            //     var total = this.$store.state.bonusAttackDamage + this.$store.state.attackdamage;
            //     // console.log(`WATCH TOTALAD: ${this.$store.state.totalAd}`);
            //
            //     //this.$store.commit("setTotalDamage", total);
            //
            //     console.log(`ATTACK DAMAGE WATCH: ${this.$store.state.attackdamage}`);
            // }

            // count(newCount, oldCount) {
            //     // Our fancy notification (2).
            //     console.log(`We have ${newCount} TOTAL AD now, yaay!`)
            // }
        }
    };
</script>

<style scoped>

    img {
        max-height: 150px;
    }

    .wrapper {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        border: 2px solid #f76707;
    }

    .wrapper > div {
        border: 2px solid mediumaquamarine;
        border-radius: 5px;

        padding: 1em;

    }
</style>
