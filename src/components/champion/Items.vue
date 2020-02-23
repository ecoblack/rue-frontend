<template>
    <div class="container">
        <div id="items">
            <Navbar/>
        </div>
    </div>
</template>

<script>
    import {mapState, mapGetters} from "vuex";

    import Navbar from "@/components/champion/Navbar.vue";
    import axios from "axios";

    export default {
        name: "Items",
        components: {
            Navbar
        },
        data() {
            return {
                items: [],

            };
        },

        methods: {
            addItem(id) {
                console.log(id);
            }
        },
        computed: {
            ...mapState([
                "statSssss",
                "activeChampion",
                "level",
            ]),
        }
    };
</script>

<style scoped>
    /*.container {*/
    /*    height: 500px;*/
    /*    background-color: white;*/
    /*}*/


</style>
