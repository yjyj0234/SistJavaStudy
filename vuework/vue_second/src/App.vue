<template>
<div>
  <img alt="Vue logo" src="./assets/logo.png">
  <div class="menu">
    <a v-for="(menu,i) in menuArr" :key="i">{{menu}}</a>
  </div>

  <div v-for="(product,key) in products" :key="key">
    <img :src="product.imgSrc" style="width: 200px; height: 250px; border-radius: 20px;
     border: 2px solid gray; margin-top: 10px;">
    <h4>{{product.name}}</h4>
    <h4>{{product.company}}</h4>
    <button type="button" @click="product.likes++">좋아요</button>
    <span>좋아요 수: {{product.likes}}</span>
  </div>  
  <!-- <h3>{{message}}</h3>
  <button type="button" @click="funcplus">증가</button>
  <button type="button" v-on:click="func">감소</button>   -->

</div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      // message:'10'
      menuArr:["Home","Shop","Board","About"],
      
      products:[{name:'김태희',company:'하이브',likes:0,imgSrc:require('./assets/연예인사진/10.jpg')},
            {name:'수지',company:'JYP',likes:0,imgSrc:require('./assets/연예인사진/19.jpg')},
            {name:'유아인',company:'하이브',likes:0,imgSrc:require('./assets/연예인사진/20.jpg')},
            {name:'신세경',company:'하이브',likes:0,imgSrc:require('./assets/연예인사진/18.jpg')},
      ]
    }
  },methods: {
    //  funcplus(){
    //       this.message++;
    //  },
    //  funcminus(){
    //       this.message--;
    //  }
      
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
  margin-top: 60px;
}
.menu{
  background-color: rgb(132, 131, 212);
}
.menu a{
  color: white;
  margin-right: 20px;
  padding: 10px;
}
body{
  background-color: #c0e4bb;
}
</style>
