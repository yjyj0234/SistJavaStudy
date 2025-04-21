<template>
      <h2 class="alert alert-info">SixthApp입니다_버튼없이 바로 결과반영</h2>
    <div>
        <table class="table table-bordered" style="width: 500px;">
            <tr>
                <th width="150">이름</th>
                <td width="350">
                    <input type="text" v-model="name" class="form-control">
                </td>
            </tr>
            <tr>
                <th width="150">자바점수</th>
                <td width="350">
                    <!-- 문자열을 점수로 읽으려면:v-model.number -->
                    <input type="text" v-model.number="java" class="form-control">
                </td>
            </tr>
            <tr>
                <th width="150">Vue점수</th>
                <td width="350">
                    <input type="text" v-model.number="vue" class="form-control">
                </td>
            </tr>
            <tr>
                <th width="150">오라클점수</th>
                <td width="350">
                    <input type="text" v-model.number="oracle" class="form-control">
                </td>
            </tr>
          
            
        </table>
        <div  style="white-space: pre-wrap;">
           {{ currentResult }}
            
        </div>
    </div>
</template>

<script>
import { computed, ref } from 'vue'
export default {
    setup () {
        const name=ref('');
        const java=ref(0);
        const vue=ref(0);
        const oracle=ref(0);
        

        const currentResult=computed(()=>{
            const tot=java.value+vue.value+oracle.value
            const avg=(tot/3).toFixed(2);
            return `[결과확인]
            이름:${name.value}
            자바점수:${java.value}
            Vue점수:${vue.value}
            오라클점수:${oracle.value}
            
            총점:${tot}
            평균:${avg}`
            
        });
        return {name,java,vue,oracle,currentResult}   
        
        
    }
}
</script>

<style lang="scss" scoped>

</style>