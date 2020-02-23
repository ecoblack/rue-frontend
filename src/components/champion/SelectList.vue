<template>
  <div class="select-list-wrapper">
    <header class="select-list-actions is-clearfix">
      <p class="control" v-if="selectedOptions.length > 0">
        <a role="button" class="button is-link" @click="clear">Clear selected</a>
      </p>
      <p class="control">
        <input class="input" v-model="filterText" type="text" placeholder="Filter list" />
      </p>
    </header>
    <div class="select-list" v-if="filteredOptions.length > 0">
      <ToogleButton
        v-for="(option, index) in filteredOptions"
        :text="option.label"
        :value="option.value"
        :selected="option.selected"
        :key="index"
        class="select-item"
        @toggle="onToggle($event)"
      ></ToogleButton>
    </div>
    <div v-else>No items to display</div>
  </div>
</template>
<script>
import ToogleButton from "@/components/champion/ToogleButton.vue";
export default {
  data() {
    return {
      filterText: "",
      selectedOptions: this.selected
    };
  },
  components: { ToogleButton },
  props: ["options", "selected"],
  methods: {
    onToggle(option) {
      console.log(option)
      if (option.selected) {
        this.selectedOptions.push(option.value);
      } else {
        this.selectedOptions.splice(
          this.selectedOptions.indexOf(option.value),
          1
        );
      }
      this.$emit("change", {
        changed: option,
        selected: this.selectedOptions
      });
    },
    clear() {
      this.selectedOptions = [];
      this.$emit("change", {
        changed: null,
        selected: []
      });
    }
  },
  computed: {
    filteredOptions() {
      var visibleOptions = [],
        filterText =
          this.filterText.trim().length > 0
            ? this.filterText.toLowerCase()
            : null;

      if (filterText) {
        visibleOptions = this.options.filter(option => {
          let optWords = option.split(" ");

          return optWords.some(word => {
            return word.toLowerCase().indexOf(filterText) === 0;
          });
        });
      } else {
        visibleOptions = this.options;
      }

      return visibleOptions.map(option => {
        let label = "";

        if (filterText) {
          let searchStartIndex = option.toLowerCase().indexOf(filterText),
            filterPart = option.substring(
              searchStartIndex,
              searchStartIndex + filterText.length
            );

          label = option.replace(filterPart, `<b>${filterPart}</b>`);
        } else {
          label = option;
        }

        return {
          value: option,
          label,
          selected: this.selectedOptions.includes(option)
        };
      });
    }
  }
};
</script>

<style scoped>
  .select-list-wrapper {
    border: 5px solid greenyellow;
  }
  </style>
