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
                  "1054": {
                    "name": "Doran's Shield",
                    "description": "<stats>+80 Health</stats><br><br><passive>Passive: </passive>Restores 6 Health every 5 seconds.<br><passive>Passive: </passive>Basic attacks deal an additional 5 physical damage to minions on hit.<br><unique>UNIQUE Passive:</unique> Regenerate up to 30 health over 10 seconds after taking damage from an enemy champion, based on percent missing health.",
                    "colloq": ";dshield",
                    "plaintext": "Good defensive starting item",
                    "image": {
                      "full": "1054.png",
                      "sprite": "item0.png",
                      "group": "item",
                      "x": 48,
                      "y": 96,
                      "w": 48,
                      "h": 48
                    },
                    "gold": {
                      "base": 450,
                      "purchasable": true,
                      "total": 450,
                      "sell": 180
                    },
                    "tags": [
                      "Health",
                      "HealthRegen",
                      "Lane"
                    ],
                    "maps": {
                      "10": true,
                      "11": true,
                      "12": true,
                      "22": false
                    },
                    "stats": {
                      "FlatHPPoolMod": 80,
                      "FlatHPRegenMod": 1.2
                    },
                    "effect": {
                      "Effect1Amount": "0",
                      "Effect2Amount": "10",
                      "Effect3Amount": "5",
                      "Effect4Amount": "30"
                    }
                  },
                  "1055": {
                    "name": "Doran's Blade",
                    "description": "<stats>+8 Attack Damage<br>+80 Health<br>+3% Life Steal</stats>",
                    "colloq": ";dblade",
                    "plaintext": "Good starting item for attackers",
                    "image": {
                      "full": "1055.png",
                      "sprite": "item0.png",
                      "group": "item",
                      "x": 96,
                      "y": 96,
                      "w": 48,
                      "h": 48
                    },
                    "gold": {
                      "base": 450,
                      "purchasable": true,
                      "total": 450,
                      "sell": 180
                    },
                    "tags": [
                      "Damage",
                      "Health",
                      "Lane",
                      "LifeSteal"
                    ],
                    "maps": {
                      "10": true,
                      "11": true,
                      "12": true,
                      "22": false
                    },
                    "stats": {
                      "FlatPhysicalDamageMod": 8,
                      "FlatHPPoolMod": 80,
                      "PercentLifeStealMod": 0.03
                    },
                    "effect": {
                      "Effect1Amount": "10"
                    }
                  },
                  "1056": {
                    "name": "Doran's Ring",
                    "description": "<stats>+60 Health<br>+15 Ability Power<br><mana>+5 Mana per 5 seconds</mana></stats><br><br><passive>Passive: </passive>Basic attacks deal an additional 5 physical damage to minions on hit.",
                    "colloq": ";dring",
                    "plaintext": "Good starting item for casters",
                    "image": {
                      "full": "1056.png",
                      "sprite": "item0.png",
                      "group": "item",
                      "x": 144,
                      "y": 96,
                      "w": 48,
                      "h": 48
                    },
                    "gold": {
                      "base": 400,
                      "purchasable": true,
                      "total": 400,
                      "sell": 160
                    },
                    "tags": [
                      "Health",
                      "Lane",
                      "ManaRegen",
                      "SpellDamage"
                    ],
                    "maps": {
                      "10": true,
                      "11": true,
                      "12": true,
                      "22": false
                    },
                    "stats": {
                      "FlatHPPoolMod": 60,
                      "FlatMagicDamageMod": 15
                    },
                    "effect": {
                      "Effect1Amount": "0",
                      "Effect2Amount": "5"
                    }
                  },
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
                  "3812": {
                    "name": "Death's Dance",
                    "description": "<stats>+80 Attack Damage<br>+10% Cooldown Reduction</stats><br><br><unique>UNIQUE Passive:</unique> Heal for 15% of damage dealt. This is 33% as effective for Area of Effect damage.<br><unique>UNIQUE Passive:</unique> 30% of damage taken is dealt as a Bleed effect over 3 seconds instead.",
                    "colloq": ";Bloodbag",
                    "plaintext": "Trades incoming damage now for incoming damage later",
                    "stacks": 0,
                    "from": [
                      "1053",
                      "1037",
                      "3133"
                    ],
                    "image": {
                      "full": "3812.png",
                      "sprite": "item2.png",
                      "group": "item",
                      "x": 192,
                      "y": 432,
                      "w": 48,
                      "h": 48
                    },
                    "gold": {
                      "base": 625,
                      "purchasable": true,
                      "total": 3500,
                      "sell": 2450
                    },
                    "tags": [
                      "Damage",
                      "LifeSteal",
                      "CooldownReduction"
                    ],
                    "maps": {
                      "10": true,
                      "11": true,
                      "12": true,
                      "22": false
                    },
                    "stats": {
                      "FlatPhysicalDamageMod": 80
                    },
                    "effect": {
                      "Effect1Amount": "0.15",
                      "Effect2Amount": "0.3",
                      "Effect3Amount": "3"
                    },
                    "depth": 3
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
              // console.log(Object.values(itemss));
              // itemss.forEach(function(item, index, array) {
              //   console.log(item, index)
              // })
              var headers = Object.keys(itemss); // get the header row

              var rows = []; // this will be collection of data

// get the values and iterate over them
              Object.values(itemss).forEach((item) => {
                // iterate over every value in the object and push it in array
                Object.values(item).forEach((val, index) => {
                  rows[index] = rows[index] || [];
                  rows[index].push(val);
                });
              });

              console.log(headers);
              console.log(rows);
              return rows[0];
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
