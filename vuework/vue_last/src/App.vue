<template>
  <MyMainPage></MyMainPage>
</template>
 
<script>
import MyMainPage from './components/MyMainPage.vue';


export default {
  name: 'App',
  components: {
      MyMainPage  
  } 
}
</script>

<style>
#app {
  font-family:'Times New Roman', Times, serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
