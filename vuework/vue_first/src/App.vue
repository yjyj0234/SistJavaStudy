<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <div>
    <img alt="Vue logo" src="./assets/logo.png">
    <h2>{{message}}</h2>
    <h2 v-html="message2"></h2> <!-- 선언적 렌더링으로는 스타일 설정 안됨-->
    <h2 v-bind:class="{active:isActive}">클래스 바인딩테스트</h2>
    <h2 :class="{active:isActive}">클래스 바인딩테스트</h2>

    <!-- style binding -->
    <h3 :style="{color:fontColor,fontSize:fontSize+'px'}">스타일 바인딩테스트</h3>
    <button type="button" @click="change">버튼</button>
  </div>  
  
</template>

<script>


export default {
  name: 'App',
  data(){
    return{
      message:"Hello Vue.js!!",
      message2:'<span style="color:red">kkk</span>',
      isActive:false,
      fontColor:'#ff00ff',
      fontSize:40,

    }
  },
  methods: {
      change(){
        // 보였다 안보였다하는 기능
        this.isActive=!this.isActive
      }
  },
  components: {
    
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
  
}
h2.active{
  color: blue;
}
</style>
