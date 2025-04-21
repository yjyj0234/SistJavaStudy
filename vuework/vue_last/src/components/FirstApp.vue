<template>
    <div>
        <h2 class="alert alert-info">FirstApp입니다</h2>
        <h3>버튼으로 숫자 증감하기</h3>
        <h3>{{ counter }}</h3>
        <h4>{{ message }}</h4>

        <button class="btn btn-success" @click="btnplus">증가</button>
        <button class="btn btn-danger" @click="btnminus">감소</button>
    </div>
</template>

<script>
import { ref } from 'vue';

export default {
    setup () {
        // 카운터 렌더링 초기값이 0
        const counter=ref(0);
        const message=("마지막 vue 프로젝트");
        // 함수 const OO=()=>{}
        const btnplus=()=>{
            counter.value++;
        }
        const btnminus=()=>{
            counter.value--;
        }
        return {counter,message,btnplus,btnminus}
    }
}
</script>

<style lang="scss" scoped>

</style>