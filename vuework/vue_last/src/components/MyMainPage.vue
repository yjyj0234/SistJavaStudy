<template>
    <div>
        <label>
            <input type="radio" value="first" v-model="selected">first App&nbsp;
        </label>
        <label>
            <input type="radio" value="second" v-model="selected">Second App&nbsp;
        </label>
        <label>
            <input type="radio" value="third" v-model="selected">Third App&nbsp;
        </label>
        <label>
            <input type="radio" value="fourth" v-model="selected">Fourth App&nbsp;
        </label>
        <label>
            <input type="radio" value="fifth" v-model="selected">Fifth App&nbsp;
        </label>
        <label>
            <input type="radio" value="sixth" v-model="selected">Sixth App&nbsp;
        </label>
        <label>
            <input type="radio" value="parent" v-model="selected">부모&nbsp;
        </label>
    </div>
    <!-- 선택된 컴포넌트로 랜더링 -->
     <!-- computed:자동계산 -->
      <component :is="currentComponent"></component>
</template>

<script>


import FirstAppPage from './FirstApp.vue';
import SecondAppPage from './SecondApp.vue';
import ThirdAppPage from './ThirdApp.vue';
import FourthAppPage from './FourthApp.vue';
import FifthAppPage from './FifthApp.vue';
import SixthAppPage from './SixthApp.vue';
import ParentAppPage from './ParentApp.vue';


import { computed,ref } from 'vue';




export default {
    setup () {
        
        const selected=ref('first');

        // 현재컴포넌트를 고르기
        const currentComponent=computed(()=>
            selected.value=='first'?FirstAppPage:
            selected.value=='second'?SecondAppPage:
            selected.value=='third'?ThirdAppPage:
            selected.value=='fourth'?FourthAppPage:
            selected.value=='fifth'?FifthAppPage:
            selected.value=='sixth'?SixthAppPage:ParentAppPage
            

        )

        return {selected,currentComponent}
    }
}
</script>

<style lang="scss" scoped>

</style>