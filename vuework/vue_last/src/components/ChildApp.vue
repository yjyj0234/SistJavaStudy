<template>
    <div>
        <h2>자식 컴포넌트</h2>
        <!-- modelValue(text 안에 있는 값)로 받기 -->
        <input type="text" v-model="message"/>

        <button @click="sendToParent">부모한테 이벤트 보내기</button>
    </div>
</template>

<script setup>
import { ref } from 'vue';

// 부모⇒자식 : props로 전달  defineProps로 받기
// 자식=>부모 : emit으로 이벤트 전달  defineEmit으로 이벤트 정의

/* eslint-disable */
// props 는 defineProps, emit은 defineEmit으로 전달
    // const props=defineProps({
    //     modelValue:String
    // })
// emit정의 (대괄호)
// 부모한테 보낼 트리거
// send라는 key를 보냄
const emit=defineEmits(['update:modelValue','send']);
const message=ref('');
// 이벤트값
const updateValue=(e)=>{
    // emit('update:modelValue', e.target.value);
}
// 버튼 클릭시 부모한테 이벤트 전송
const sendToParent=()=>{
    // console.log('message', message.value)
    emit('send',message.value);
}
</script>

<style lang="scss" scoped>

</style>