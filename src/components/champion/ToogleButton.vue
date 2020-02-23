<template>
  <a
    href="#"
    role="checkbox"
    class="button toggle-button"
    :class="{'is-selected': isSelected}"
    @click="toggle($event)"
  >
    <span v-html="text"></span>
  </a>
</template>

<script>
export default {
  data() {
    return {
      isSelected: this.selected ? this.selected : false
    };
  },
  props: ["text", "selected", "value"],
  methods: {
    toggle($event) {
      this.isSelected = !this.isSelected;

      this.$emit("toggle", {
        selected: this.isSelected,
        value: this.value
      });

      $event.preventDefault();
    }
  },
  watch: {
    selected: function(newVal) {
      this.isSelected = newVal;
    }
  }
};
</script>
<style scoped>
.toggle-button {
  background: none;
  color: #7a7a7a;
  border: none;
  padding-left: 25px;
  position: relative;
  margin-left: 0 !important;
}
.toggle-button:focus {
  box-shadow: none;
}
.toggle-button .is-selected {
  color: #00d1b2;
}
</style>