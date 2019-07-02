import Vue from 'vue'
import Vuex from 'vuex'

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
  
  state: {
    title: 'LOL // SANDBOX 101',
    statss: 'hello from STATS',
    bonusAttackDamage: 0,
    bonusHp: 0,
    totalBaseHp: 0,
    cooldownReduction: 0,
    activeChampion: 'Nami',
    level: 1,
    abilityPower: 0,
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
      "attackspeed": 0
    },
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
    BASE_AD: state => {
      return state.bonusAttackDamage
    },
    BONUS_HP: state => {
      return state.bonusHp
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
    cooldownReduction: state => {
      return state.cooldownReduction
    },
    abilityPower: state => {
      return state.abilityPower
    },
    attackspeed: state => {
      var x = state.statsObj.attackspeed * (state.level - 1)
      var y = (0.7025 + 0.0175) * (state.level - 1)
      var total =  (x * y) / 100
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
    incrementBonusAttackDamage: (state, amount) => {
      state.bonusAttackDamage += amount
    },
    incrementAbilityPower: (state, amount, isCoeff) => {
      isCoeff ? state.abilityPower = state.abilityPower * math.floor(1 + amount) : state.abilityPower += amount
    },
    incrementCDR: (state, amount) => {
      if ((state.cooldownReduction + amount) <= 0.45)
      state.cooldownReduction += amount
    },
    incrementBaseHp: (state, amount) => {
      state.baseHp += amount
    },
    getBaseHp: (state, amount) => {
      state.baseHp = amount
    },
    storeStatsObject: (state, obj) => {
      state.statsObj = obj

    },
    resetStatsObject: (state, obj) => {
      state.totalBaseHp = obj.hp + (obj.hpperlevel * (state.level - 1))
    }

  },
  actions: {
    // incrementHp(val) {
    //   this.$store.commit("getBaseHp", val);
    // }
  }
})
