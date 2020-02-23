<template>
  <div class="select-dropdown">
      <a href="#" role="button" class="button is-primary select-button" @click="toggle($event)">{{buttonText}}</a>
    <div class="select-dropdown-panel card arrow-box">
      <SelectList
        ref="selectList"
        :options="options"
        :selected="selected"
        @change="onChange($event)"
      ></SelectList>
    </div>
  </div>
</template>

<script>
import SelectList from "@/components/champion/SelectList.vue";
export default {
  data() {
    return {
      panelOpen: true,
      buttonText: this.label + " " + this.placeholder
    };
  },
  components: { SelectList },
  props: ["options", "selected", "label", "placeholder"],
  methods: {
    toggle() {
      this.panelOpen = !this.panelOpen;
    },
    onChange(event) {

      this.setButtonText(event.selected);
      this.$emit(event);
    },
    setButtonText(selectedOptions) {

      if (selectedOptions.length === 0) {

        this.buttonText = this.label + ' ' + this.placeholder;
      } else {
        let text = this.placeholder.charAt(0).toUpperCase() + this.placeholder.slice(1) + ': ' + selectedOptions[0];

        if (selectedOptions.length > 1) {
          text += ' & ' + (selectedOptions.length - 1) + ' more'
        }

        this.buttonText = text;
      }
    }
  }
};
</script>
<style scoped>
.select-dropdown {
  position: relative;
  display: flex;
  justify-content: center;
}
.select-dropdown-panel {
  position: absolute;
  top: calc(100% + 5px);
  left: calc(50%);
  transform: translateX(-50%);
}
.select-list-actions {
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  display: flex;
  justify-content: flex-end;
}
.button.is-link {
  color: #7a7a7a;
  text-decoration: none;
}
.select-list {
  display: flex;
  flex-wrap: wrap;
}
.select-item {
  flex-basis: 20%;
  margin-bottom: 1%;
  justify-content: flex-start;
}
</style>
