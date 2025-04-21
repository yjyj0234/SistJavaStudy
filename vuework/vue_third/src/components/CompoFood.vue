<template>
    <div class="container">
        <!-- v-for:반복문 -->
        <!-- food'+idx 처럼 대부분 이름에다 idx를 붙이면 중복될일 없음 -->
        <div v-for="(food,idx) in foods" :key="'food'+idx" class="photo">
            <!-- img 뒤에 세미콜론(:) -->
            <img :src="food.imgsrc">
            <h5>{{ food.foodname }}</h5>
            <p>{{ food.foodprice }}</p>
            <i class="bi bi-heart-pulse-fill" style="color:red" @click="onLikeChu(idx)"></i>
            &nbsp;<span>{{ food.chu }}</span>
            


        </div>
    </div>
</template>

<script>
import { reactive } from 'vue';
export default {
    setup () {
        const foods = reactive([
            { foodname:'에그샌드위치',foodprice:'20000원',imgsrc:require('@/assets/Food/1.jpg'),chu:0},
            { foodname:'꼬치구이',foodprice:'25000원',imgsrc:require('@/assets/Food/2.jpg'),chu:0},
            { foodname:'망고빙수',foodprice:'15000원',imgsrc:require('@/assets/Food/11.jpg'),chu:0},
            { foodname:'햄에그덮밥',foodprice:'12000원',imgsrc:require('@/assets/Food/10.jpg'),chu:0},


        ]);

        // 추천증가
        const onLikeChu=(idx)=>{
            foods[idx].chu++;
        }
        return {foods,onLikeChu}
        
    }
}

</script>

<style >
    .photo img{
        width: 80px;
        height: 80px;
        border-radius: 20px;
        
    }
    /* flex: */
    .container{
        display: flex;
        justify-content: center;
        gap:20px;
    }
</style>