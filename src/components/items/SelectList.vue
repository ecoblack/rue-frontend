<template>
    <div class="select-list-wrapper">
        <header class="select-list-actions is-clearfix">
            <p class="control" v-if="selectedOptions.length > 0">
                <button type="button" class="btn btn-link">{{ this.selected.length }} selected</button>
            </p>
            <p class="control">
                <input class="form-control input" v-model="filterText" type="text" placeholder="Filter list">
            </p>
        </header>
        <div class="select-list" v-if="filteredOptions.length > 0">
            <toggle-button
                    v-for="(option, index) in filteredOptions"
                    :text="option.label"
                    :value="option.value"
                    :selected="option.selected"
                    class="select-item"
                    :key="index"
                    @toggle="onToggle($event)"
            ></toggle-button>
        </div>
        <div v-else>No items to display</div>
    </div>
</template>

<script>
    import ToggleButton from '@/components/items/ToggleButton'

    export default {
        name: 'SelectList',
        data () {
            return {
                filterText: '',
                selectedOptions: this.selected
            }
        },
        props: ['options', 'selected'],
        methods: {
            onToggle (option) {
                if (option.selected) {
                    this.selectedOptions.push(option.value)
                } else {
                    this.selectedOptions.splice(this.selectedOptions.indexOf(option.value), 1)
                }
                this.$emit('change', {
                    changed: option,
                    selected: this.selectedOptions
                })
            },
            clear () {
                this.selectedOptions = []
                this.$emit('change', {
                    changed: {
                        selected: null,
                        value: null
                    },
                    selected: []
                })
            }
        },
        computed: {
            filteredOptions () {
                let visibleOptions = []
                let filterText = this.filterText.trim().length > 0 ? this.filterText.toLowerCase() : null
                if (filterText) {
                    visibleOptions = this.options.filter((option) => {
                        let optWords = option.name.split(' ')
                        return optWords.some((word) => {
                            return word.toLowerCase().indexOf(filterText) === 0
                        })
                    })
                } else {
                    visibleOptions = this.options
                }
                return visibleOptions.map((option) => {
                    console.log(option)
                    let label = ''
                    if (filterText) {
                        let searchStartIndex = option.name.toLowerCase().indexOf(filterText)
                        let filterPart = option.name.substring(searchStartIndex, searchStartIndex + filterText.length)
                        label = option.name.replace(filterPart, `<b>${filterPart}</b>`)
                    } else {
                        label = option.name
                    }
                    return {
                        value: option.id,
                        label: label.name,
                        selected: this.selectedOptions.includes(option.id)
                    }
                })
            }
        },
        components: {
            ToggleButton
        }
    }
</script>

<style scoped lang="scss">
    .select-dropdown {

        $ver-padding: 10px;
        $hor-padding: 10px;
        position: relative;
    .select-dropdown-panel {
        $width: 760px;
        width: $width !important;
        max-width: $width;
        position: absolute;
        top: calc(100% + 5px);
        left: calc(50%);
        transform: translateX(-50%);
    }
    .select-list-wrapper {
        padding: $ver-padding $hor-padding;
        border: 5px solid red;
    }
    .select-list-actions {
        padding: 0 $hor-padding $ver-padding;
        margin-bottom: $ver-padding;
        border-bottom: 1px solid rgba(0, 0, 0, .1);
        display: flex;
        justify-content: flex-end;
    .button.is-link {
        color: #7a7a7a;
        text-decoration: none;
    }
    }
    .select-list {
        margin-top: $ver-padding;
        display: flex;
        flex-wrap: wrap;
    }
    .select-item {
        flex-basis: 20%;
        margin-bottom: 1%;
        justify-content: flex-start;
    }

       .toggle-button {
           background: none;
           color: #7a7a7a;
           border: none;
           padding-left: 25px;
           position: relative;
           margin-left: 0 !important;
           transition: font-weight .1s ease-in;
    &:hover {}
    &:focus {
         box-shadow: none;
     }
    &.is-selected {
         color: #00D1B2;
    .fa {
        opacity: 1;
    }
    }
    .fa {
        position: absolute;
        left: 7px;
        font-size: 12px;
        opacity: 0;
        transition: opacity .1s ease-in;
    }
    }

    .arrow-box:after,
    .arrow-box:before {
        bottom: 100%;
        left: 50%;
        border: solid transparent;
        content: " ";
        height: 0;
        width: 0;
        position: absolute;
        pointer-events: none;
    }
    .arrow-box:after {
        border-color: rgba(255, 255, 255, 0);
        border-bottom-color: #fff;
        border-width: 7px;
        margin-left: -7px;
    }
    .arrow-box:before {
        border-color: rgba(234, 234, 234, 0);
        border-bottom-color: #cecece;
        border-width: 8px;
        margin-left: -8px;
    }
    }

    .slide-fade-enter-active {
        transition: all .3s ease;
    }

    .slide-fade-leave-active {
        transition: all .1s ease;
    }

    .slide-fade-enter, .slide-fade-leave-active {
        transform: translateY(20px);
        opacity: 0;
    }
</style>
