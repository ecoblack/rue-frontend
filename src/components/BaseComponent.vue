<template>
  <div class="base">
     
     <pre> BASE_AD {{ BASE_AD }}</pre>
     <p>Level: {{ level }}</p>
   <Stats />
      <Triggers />
   <Abilities />
   <Items />
   
  </div>
</template>

<script>
// Get access to store mappings
import { mapGetters } from 'vuex'
import Stats from '@/components/champion/Stats.vue'
import Triggers from '@/components/Triggers.vue'
import Abilities from '@/components/champion/Abilities.vue'
import Items from '@/components/champion/Items.vue'

export default {
  name: 'BaseComponent',
   components: {
    Stats,
    Triggers,
    Abilities,
    Items
  },
   computed: {
    ...mapGetters([
      'statSssss', 'BASE_AD', 'level'
    ]),
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
