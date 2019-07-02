<template>
  <div class="home">
    <!-- <img alt="Vue logo" src="../assets/logo.png"> -->
    <BaseComponent />
  </div>
</template>

<script>
//import { mapState } from 'vuex'
// @ is an alias to /src
import BaseComponent from '@/components/BaseComponent.vue'

export default {
  name: 'home',
  components: {
    BaseComponent
  }
}
</script>
