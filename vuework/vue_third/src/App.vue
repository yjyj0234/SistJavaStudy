<template>
  
  <compoFoodVue></compoFoodVue>  
</template>

<script>
import compoFoodVue from './components/CompoFood.vue'

export default {
  name: 'App',
  components: {
    compoFoodVue
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
