<template>
    <div class="container">
        <div id="items">
            I T E M S
            <div class="item-container">

            </div>
        </div>
    </div>
</template>

<script>
    import {mapState, mapGetters} from "vuex";
    import axios from "axios";

    export default {
        name: "Items",
        data() {
            return {
                itemArray: []
            };
        },
        methods: {
            addItem(id) {
                console.log(id);
            },

            // incrementRank(newVal, oldVal) {
            //   console.log(this.q.maxrank)
            //   if (this.qRank  < this.q.maxrank)
            //   this.qRank++
            //   console.log(this.qRank)
            // },
            // decrementRank(newVal, oldVal) {
            //   console.log(this.q.maxrank)
            //   if (this.qRank  >= 2)
            //   this.qRank--
            //   console.log(this.qRank)
            // },
        },
        computed: {
//     x: function() {
//       console.log(this.q);
//     },
//     currentRank: function() {
//       console.log(`this is CurrentRank: ${this.q.cooldown[qRank]}`)
//       return this.q.cooldown[qRank];
//     },
//     imxgNameP: function() {
//       var imgPath = "/img/champion/passive/" + this.p.image.full;
//       return imgPath;
//     },
//     imxgNameQ: function() {
//       var imgPath = "/img/champion/spell/" + this.q.image.full;
//       return imgPath;
//     },
//     imxgNameW: function() {
//       var imgPath = "/img/champion/spell/" + this.w.image.full;
//       return imgPath;
//     },
//     imxgNameE: function() {
//       var imgPath = "/img/champion/spell/" + this.e.image.full;
//       return imgPath;
//     },
//     imxgNameR: function() {
//       var imgPath = "/img/champion/spell/" + this.R.image.full;
//       return imgPath;
//     },
//     ...mapState(["statSssss", "activeChampion", "level", "BASE_AD", "BONUS_HP"])
//   },
//   created() {
//     var activeChampion = this.$store.state.activeChampion;
//     console.log("created called.");
//     axios.get("../championFull.json").then(response => {
//       (this.p = response.data.data[`${activeChampion}`]["passive"]),
//         (this.q = response.data.data[`${activeChampion}`]["spells"][0]),
//         (this.w = response.data.data[`${activeChampion}`]["spells"][1]),
//         (this.e = response.data.data[`${activeChampion}`]["spells"][2]),
//         (this.R = response.data.data[`${activeChampion}`]["spells"][3]);
//     });
        },
        watch: {
            // activeChampion: function(newVal, oldVal) {
            //   var activeChampion = this.$store.state.activeChampion;
            //   console.log(`watch triggered. New is ${newVal}`);
            //   axios.get("../championFull.json").then(response => {
            //     (this.p = response.data.data[`${activeChampion}`]["passive"]),
            //       (this.q = response.data.data[`${activeChampion}`]["spells"][0]),
            //       (this.w = response.data.data[`${activeChampion}`]["spells"][1]),
            //       (this.e = response.data.data[`${activeChampion}`]["spells"][2]),
            //       (this.R = response.data.data[`${activeChampion}`]["spells"][3]);
            //   });
            //   console.log(`xxx OLD SPELL xis ${this.q.name}`);
            //   //   console.log(`watch triggered. OLD is ${this.champData}`);
            //   // incrementHp(this.champData.hp);
            // },
            // qRank: function(newVal, oldVal) {
            //   this.currentRank = this.qRank
            //   // console.log(`watch QRANK: this.qrank: ${this.qRank}`)
            // }
        }
    };
</script>

<style scoped>
    .container {
        max-width: 900px;
        margin-left: 20%;
    }

    #abilities {
        background-color: rgb(168, 27, 93);
        padding: 20px;
        /* max-width: 450px; */
        left: 50%;
        border-style: solid;
        border-color: blueviolet;
    }

    .ability-name,
    .ability-desc {
        color: lightgreen;
        margin-left: 20px;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        font-size: 0.9em;
        font-weight: 100;
        text-align: left;
    }
</style>
