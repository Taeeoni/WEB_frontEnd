<template>
  <div>
    <h3>투표</h3>
    <table>
      <tr>
        <td>
          <select name="name">
            <option
              v-for="alias in items"
              :key="alias.name"
              v-bind:value="alias.name"
            >
              {{ alias.name }}
            </option>
          </select>
        </td>
        <td>
          <select name="age">
            <option value="1">10대</option>
            <option value="2">20대</option>
            <option value="3">30대</option>
            <option value="4">40대</option>
            <option value="5">50대</option>
            <option value="6">60대</option>
            <option value="7">70대</option>
            <option value="8">80대</option>
            <option value="9">90대</option>
          </select>
        </td>
        <td>
          <input type="submit" value="투표하기" />
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
  width: 500px;
  margin-left: auto;
  margin-right: auto;
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
  width: 500px;
  border: 3px solid pink;
  border-radius: 8px;
  padding: 10px;
  text-align: center;
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
</style>
