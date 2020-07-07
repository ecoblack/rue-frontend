import Vue from 'vue'
import Vuex from 'vuex'

import i from './modules/i'
import s from './modules/s'
import d from './modules/d'
import r from './modules/r'

Vue.use(Vuex)

const runeSet = function () {
    return 'LOL'
}

const isRanged = function (x) {
    if (x > 3)
        return true
    else
        return false
}

export default new Vuex.Store({
    modules: {
        d,
        i,
        s,
        r,
        },
    state: {
        title: 'LOL // SANDBOX 101',
        statss: 'hello from STATS',
        bonusAttackDamage: 0,
        attackdamage: 0,
        bonusHp: 0,
        totalBaseHp: 0,
        cooldownReduction: 0,
        activeChampion: 'Nami',
        startDrake: 0,
        nextDrake: 0,
        totalDrakeCounter: 0,

        drakeObj: {
            mountain: 0,
            infernal: 0,
            cloud: 0,
            ocean: 0
        },
        level: 1,
        hp: 0,
        abilityPower: 0,
        armor: 0,
        bonusArmor: 0,
        totalAd: 0,
        spellblock: 0,
        bonusSpellblock: 0,
        statsObj: {
            "hp": 0,
            "hpperlevel": 0,
            "mp": 0,
            "mpperlevel": 0,
            "movespeed": 0,
            "armor": 0,
            "armorperlevel": 0,
            "spellblock": 0,
            "spellblockperlevel": 0,
            "attackrange": 0,
            "hpregen": 0,
            "hpregenperlevel": 0,
            "mpregen": 0,
            "mpregenperlevel": 0,
            "crit": 0,
            "critperlevel": 0,
            "attackdamage": 0,
            "attackdamageperlevel": 0,
            "attackspeedperlevel": 0,
            "attackspeed": 0,
            "lethality": 0,
            "mag_pen_flat": 0,
            "arm_pen": 0,
            "mag_pen": 0,
        },
        autoAttackValue: {},
        champObj: {
            "isRanged": isRanged(),
            "runeSet": runeSet(),
            "ItemSet": []
        }

    },
    getters: {
        champObjGet: state => {
            return state.champObj
        },
        statSssss: state => {
            return 'GETTER statSssss'
        },
        BONUS_AD: state => {
            return state.bonusAttackDamage
        },
        totalAD: state => {
            return state.totalAd
        },
        BONUS_HP: state => {
            return state.bonusHp
        },
        BONUS_ARMOR: state => {
            return state.bonusArmor
        },
        Lethality: state => {
            return state.statsObj.lethality
        },
        BONUS_SPELLBLOCK: state => {
            return state.bonusSpellblock
        },
        totalBaseHp: state => {
            return state.totalBaseHp
        },
        activeChampion: state => {
            return state.activeChampion
        },
        level: state => {
            return state.level
        },
        mpregen: state => {
            var x = (state.level - 1)
            var y = state.statsObj.mpregen + (state.statsObj.mpregenperlevel * x)
            return y
        },
        hpregen: state => {
            var x = (state.level - 1)
            var y = state.statsObj.hpregen + (state.statsObj.hpregenperlevel * x)
            return y
        },
        hp: state => {
            var x = (state.level - 1)
            var y = state.statsObj.hp + (state.statsObj.hpperlevel * x)
            console.error('HP GETTER')
            return y
        },
        cooldownReduction: state => {
            return state.cooldownReduction
        },
        abilityPower: state => {
            return state.abilityPower
        },
        armor: state => {
            var x = (state.level - 1)
            var y = state.statsObj.armor + (state.statsObj.armorperlevel * x)
            return y
        },
        bonusArmor: state => {
            return state.bonusArmor
        },
        spellblock: state => {
            var x = (state.level - 1)
            var y = state.statsObj.spellblock + (state.statsObj.spellblockperlevel * x)
            return y
        },
        attackdamage: state => {
            var x = (state.level - 1)
            var y = state.statsObj.attackdamage + (state.statsObj.attackdamageperlevel * x)
            console.log(y)
            return y
        },
        attackspeed: state => {
            var x = state.statsObj.attackspeed * (state.level - 1)
            var y = (0.7025 + 0.0175) * (state.level - 1)
            var total = (x * y) / 100
            return total + state.statsObj.attackspeed
        },
        statsObject: state => {
            return state.statsObj
        }
    },
    mutations: {
        increment: (state, limit) => {
            if (state.level < limit) state.level++
        },
        decrement: (state, limit) => {
            if (state.level > limit) state.level--
        },
        setActiveChampion: (state, champion) => {
            state.activeChampion = champion
        },

        incrementBonusAd: (state, amount) => {
            state.bonusAttackDamage += amount
        },
        incrementBaseAD: (state, amount) => {
            state.attackdamage = amount
        },
        setTotalDamage: (state, amount) => {
            //console.log(`${state.bonusAttackDamage}`);
            var x = (state.level - 1)
            var y = state.statsObj.attackdamage + (state.statsObj.attackdamageperlevel * x)
            console.log('TOTAL DAMAGE GETTER')
            var total = y + amount
            state.totalAd = total
        },
        incrementTotalAd: (state, amount) => {
            state.totalAd = amount
        },
        incrementBonusArmor: (state, amount) => {
            state.bonusArmor += amount
        },
        incrementBonusSpellblock: (state, amount) => {
            state.bonusSpellblock += amount
        },
        incrementAbilityPower: (state, payload) => {
            state.abilityPower += payload.flat_ap
        },
        incrementCDR: (state, amount) => {
            if ((state.cooldownReduction + amount) <= 0.45)
                state.cooldownReduction += amount
        },
        incrementLethality: (state, amount) => {
            state.statsObj.lethality += amount
        },
        incrementBonusHp: (state, amount) => {
            state.bonusHp += amount
        },
        getBaseHp: (state, amount) => {
            state.baseHp = amount
        },
        storeStatsObject: (state, obj) => {
            state.statsObj = obj

        },
        resetStatsObject: (state, obj) => {
            state.totalBaseHp = obj.hp + (obj.hpperlevel * (state.level - 1))
        },
        SET_AUTO_ATTACK: (state, obj) => {
            state.autoAttackValue = obj
        },

    },
    actions: {
        // incrementHp(val) {
        //   this.$store.commit("getBaseHp", val);
        // }
    }
})
