<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link>
    </div>
    <router-view/>
  </div>
</template>

<style lang="scss">
#app {
  background-color: #212021;
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #71889e;
}
#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}

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
  // toggle button
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
