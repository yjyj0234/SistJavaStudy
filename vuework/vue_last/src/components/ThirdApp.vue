<template>
    <div>
        <h2 class="alert alert-info">ThirdApp입니다</h2>
        <div class="container">
        <h2>Nav데이터</h2>
        <!--  <div v-for="(item,idx) in todayHomeData.navData" :key="'item'+idx">
            {{ item.title }}
        </div> -->
        <div v-for="(item,idx) in todayHomeData.navData" :key="'item'+idx" class="home">
            <img :src="item.img" >
            <p>{{ item.title }}</p>
        </div>
        </div>
    </div>  
    <div class="container">
        <h2>카테고리 데이터</h2>
        <!-- <div v-for="(item,idx) in todayHomeData.categoryData" :key="'cate'+idx">
            {{ item.title }}
        </div> -->
        <div v-for="(item,idx) in todayHomeData.categoryData" :key="'item'+idx" class="home">
            <img :src="item.img" >
            <p>{{ item.title }}</p>
        </div>
    </div>
    
</template>

<script>
import todayHomeData from '@/assets/todayHome.js';
export default {
    setup () {
        
        return {todayHomeData}
    }
}
</script>

<style>
     .container{
        display: flex;
        justify-content: center;
        gap:20px;
        
     }
     img{

        width: 80px;
        height: 80px;
     }
     
    
</style>