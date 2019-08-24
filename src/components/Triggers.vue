<template>

        <div id="triggers">
           T R I G G E R S
            <div class="trigger-container">
                <button @click="incrementAp(payload = {'flat_ap': 15, 'coeff_ap': '0', isCoeff: false})">AA</button>
                <br>
<!--                <button @click="rue(123)">POST STORE TO BACKEND</button>-->
<!--                <button @click="increment(18)">+</button>-->
<!--                <button @click="decrement(1)">-</button>-->
                <button @click="incrementBonusAttackDamage(40, 250)">Cast Q</button>
                <button @click="incrementBonusAttackDamage(40, 250)">Cast W</button>
                <button @click="incrementBonusAttackDamage(40, 250)">Cast E</button>
                <button @click="incrementBonusAttackDamage(40, 250)">Cast R</button>
                <button @click="incrementCDR(0.05)">Add 5% CDR</button>
            </div>


            <pre>
                print length([2+1, 3*2, 1/0, 5-4])print length([2+1, 3*2, 1/0, 5-4])
                print length([2+1, 3*2, 1/0, 5-4])
                print length([2+1, 3*2, 1/0, 5-4])print length([2+1, 3*2, 1/0, 5-4])
                print length([2+1, 3*2, 1/0, 5-4])print length([2+1, 3*2, 1/0, 5-4])
                print length([2+1, 3*2, 1/0, 5-4])print length([2+1, 3*2, 1/0, 5-4])

                print length([2+1, 3*2, 1/0, 5-4])
                ____

                Damage send



            </pre>

            <p>DAMAGE TOTAL: 3434</p>
            <br>
            <p>PHYSICAL</p><p>MAGIC</p><p>TRUE</p>

        </div>

</template>

<script>
    import {mapState, mapGetters} from "vuex";
    import axios from "axios";

    export default {
        name: "Triggers",
        data() {
        },
        methods: {
        },
        computed: {

   },
     created() {
        },
        watch: {

        }
    };
</script>

<style scoped>
   #triggers {
       border: dashed 1px red ;
   }
</style>
