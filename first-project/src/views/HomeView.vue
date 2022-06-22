<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <div v-for="alias in items" :key="alias.name">
      <span>{{ alias.name }}</span> : <span>{{ alias.age }}</span>
    </div>
    <button @click="btnClick">click me!</button>
    <HelloWorld msg="Welcome to Your Vue.js App" name="김태언" />
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";

export default {
  name: "HomeView",
  components: {
    HelloWorld,
  },
  created() {
    console.log("create");
  },
  mounted() {
    console.log("mounted");
  },

  data() {
    return {
      items: [
        { name: "john", age: 31 },
        { name: "tom", age: 30 },
        { name: "danny", age: 25 },
        { name: "july", age: 40 },
        { name: "annie", age: 32 },
      ],
    };
  },
};
</script>
