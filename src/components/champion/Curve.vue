<template>
    <div id="nav" class="container">
        <h1 class="title is-1 has-text-centered titre">Choose item</h1>

        <div class="control pad-top">


        </div>

    </div>
</template>
<script>

    import SelectDropdown from "@/components/champion/SelectDropdown.vue";

    export default {
        data() {
            return {
                brands: ["Yamaha", "Honda", "Suzuki", "Kawasaki", "Piaggio", "Aprilia", "BMW", "Peugeot", "KTM", "Ducati", "Cagiva", "Harley Davidson", "Polaris", "Vespa", "Hyosung", "Husaberg", "Husqvarna", "Daelim", "Moto Guzzi", "Triumph"],
                selectedBrands: [],
            };
        },
        components: {SelectDropdown},
        methods: {
            onChange(changed) {
            }
        },
    };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    #nav {
        border: 5px solid limegreen;
    }

    .titre {
        padding-top: 25px;
        padding-bottom: 10px;
    }

    .pad-top {
        padding-top: 20px;
    }

    .pad-left-right {
        padding-left: 25px;
        padding-right: 25px;
    }
</style>
