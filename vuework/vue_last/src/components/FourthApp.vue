<template>
     <div style="margin-left: 100px;">
        <h2 class="alert alert-info">FourthApp입니다_배열로 테이블 객체출력</h2>
        <table class="table table-bordered" style="width: 800px;">
            <caption align="top"><b>배열객체 출력</b></caption>
            <thead class="table-success">
            <tr >
                <th width="80">번호</th>
                <th width="150">사진</th>
                <th width="400">제목</th>
                <th width="150">작성자</th>
            </tr>
            </thead>
            <tbody>
                <tr v-for="(item,idx) in boards" :key="'item'+idx" >
                    <td>{{ item.no }}</td>
                    <td><img :src="`/image/연예인사진/${item.photo}.jpg`" style="width: 50px; height: 50px;"></td>
                    <td>{{ item.subject }}</td>
                    <td>{{ item.writer }}</td>
                </tr>
                
            </tbody>
        </table>
    </div>
</template>

<script>
import {ref} from 'vue';

export default {
    setup () {

        const boards=ref(
        [{no:1,writer:'홍길동',subject:'오늘 여름날씨다',photo:'1'},
        {no:2,writer:'고길동',subject:'vue 2일차',photo:'3'},
        {no:3,writer:'이길동',subject:'vue 테이블',photo:'2'},
        {no:4,writer:'김용만',subject:'vue 이미지',photo:'4'},
        {no:5,writer:'이주헌',subject:'내일은 jsp',photo:'5'},
        {no:6,writer:'황덕연',subject:'다시 이클립스에요',photo:'6'}
        ]
        );

        return {boards}
    }
}
</script>

<style >

</style>