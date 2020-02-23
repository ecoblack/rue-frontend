<template>

    <nav class="nav">

        <div class="nav-center">
            <SelectDropdown
                    :options="getItems()"
                    :selected="selectedBrands"
                    @change="onChange($event)"
                    label="Select"
                    placeholder="your items"
                    class="nav-item"
            ></SelectDropdown>
        </div>
    </nav>
</template>

<script>
    import SelectDropdown from "@/components/champion/SelectDropdown.vue";

    export default {
        name: "Navbar",
        data() {
            return {
                brands: ["Dorans blade", "Honda", "Suzuki", "Kawasaki", "Piaggio", "Aprilia", "BMW", "Peugeot", "KTM", "Ducati", "Cagiva", "Harley Davidson", "Polaris", "Vespa", "Hyosung", "Husaberg", "Husqvarna", "Daelim", "Moto Guzzi", "Triumph"],
                selectedBrands: [],
                itemsMock: {
                    "1038": {
                        "name": "B. F. Sword",
                        "description": "<stats>+40 Attack Damage</stats>",
                        "colloq": ";bf",
                        "plaintext": "Greatly increases Attack Damage",
                        "into": [
                            "3172",
                            "3080",
                            "3095",
                            "3026",
                            "3031",
                            "3072",
                            "3161",
                            "3508",
                            "4403"
                        ],
                        "image": {
                            "full": "1038.png",
                            "sprite": "item0.png",
                            "group": "item",
                            "x": 144,
                            "y": 48,
                            "w": 48,
                            "h": 48
                        },
                        "gold": {
                            "base": 1300,
                            "purchasable": true,
                            "total": 1300,
                            "sell": 910
                        },
                        "tags": [
                            "Damage"
                        ],
                        "maps": {
                            "10": true,
                            "11": true,
                            "12": true,
                            "22": false
                        },
                        "stats": {
                            "FlatPhysicalDamageMod": 40
                        }
                    },
                    "1018": {
                        "name": "Cloak of Agility",
                        "description": "<stats>+20% Critical Strike Chance</stats>",
                        "colloq": ";",
                        "plaintext": "Increases critical strike chance",
                        "into": [
                            "3031",
                            "3185",
                            "3508"
                        ],
                        "image": {
                            "full": "1018.png",
                            "sprite": "item0.png",
                            "group": "item",
                            "x": 192,
                            "y": 0,
                            "w": 48,
                            "h": 48
                        },
                        "gold": {
                            "base": 800,
                            "purchasable": true,
                            "total": 800,
                            "sell": 560
                        },
                        "tags": [
                            "CriticalStrike"
                        ],
                        "maps": {
                            "10": true,
                            "11": true,
                            "12": true,
                            "22": false
                        },
                        "stats": {
                            "FlatCritChanceMod": 0.2
                        }
                    }
                }
            };
        },
        components: {SelectDropdown},
        methods: {
            onChange(changed) {
            },
            getItems() {
              console.log(this.itemsMock);
              var itemsArray = [];
              console.log(itemsArray);
              var itemss = this.itemsMock;
              console.log(Object.values(itemss));
              // itemss.forEach(function(item, index, array) {
              //   console.log(item, index)
              // })
              console.log('getItems()');
            }
        },
    };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

    .navbar {
        border: 5px solid red;
        background-color: #6441a5;
    }

    .navbar-item {
        color: white;
    }

    a.navbar-item:hover {
        color: black;
    }
</style>
