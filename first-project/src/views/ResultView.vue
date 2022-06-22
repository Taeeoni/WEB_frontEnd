<template>
  <div>
    <h3>후보 별 득표율</h3>
    <table>
      <tr v-for="alias in items" :key="alias.name">
        <td width="100">후보 : {{ alias.num }}. {{ alias.name }}</td>
        <td width="500">
          <img
            v-bind:style="{
              width: (alias.voted * allVoted(alias.voted)) / 10 + 'px',
            }"
            src="./blu-bar.jpg"
            height="20"
          />
          {{ alias.voted }} ( {{ allVoted(alias.voted) }} %)
        </td>
      </tr>
    </table>
  </div>
</template>
<script>
export default {
  data() {
    return {
      items: [
        { name: "john", num: 1, voted: 10 },
        { name: "tom", num: 2, voted: 20 },
        { name: "danny", num: 3, voted: 30 },
        { name: "july", num: 4, voted: 5 },
        { name: "annie", num: 5, voted: 10 },
      ],
    };
  },
  methods: {
    allVoted(now) {
      let a = 0;
      for (let i = 0; i < this.items.length; i++) {
        a += this.items[i].voted;
      }
      return ((now / a) * 100).toFixed(2);
    },
  },
};
</script>
<style lang="scss" scoped>
table,
th,
td {
  border: 2px solid gray;
  border-radius: 8px;
}

table {
  border-collapse: collapse;
  width: 600px;
  font-size: 14px;
}

.blue {
  border: solid 2px lightblue;
  border-radius: 8px;
  height: 40px;
}

.gray {
  border: 2px solid gray;
}

div {
  width: 600px;
  border: 3px solid pink;
  border-radius: 8px;
  padding: 10px;
  margin: auto;
}

.select {
  border: solid 2px lightblue;
  border-radius: 8px;
  height: 40px;
  background-color: aquamarine;
}

.select2 {
  border: solid 2px lightblue;
  border-radius: 8px;
  height: 25px;
  background-color: aquamarine;
}

td {
  text-align: left;
}
</style>
