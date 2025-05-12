<template>
    <div>
        <h2>부모컴포넌트</h2>
        <p>자식이 입력한 메세지: {{ message }}</p>

        <!-- v-model과 @send 이벤트 연동 -->
         <!-- send를 받으면 "sendHandle이 동작한다다" -->
        <ChildApp @send="sendHandle"/>
        <News />
        <Weather />
    </div>
</template>

<script setup>
import { ref } from 'vue';
import ChildApp from './ChildApp.vue';

    const message=ref('안녕~~~');

    const sendHandle=(msg)=>{
        // msg : 자식한테서 날아온 값
        // alert(`자식이 보낸 메시지: ${msg}`);
        // console.log('msg', msg)
        message.value=msg
    }
</script>

<style lang="scss" scoped>

</style>