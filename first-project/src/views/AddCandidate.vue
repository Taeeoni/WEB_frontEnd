<template>
  <div>
    <h3>후보등록하기</h3>

    <table>
      <tr v-for="alias in items" :key="alias.name">
        <td width="150">기호번호 : {{ alias.num }}</td>
        <td width="300" colspan="2">후보명 : {{ alias.name }}</td>
        <td>
          <input id="submit" class="select2" type="submit" value="삭제" />
        </td>
      </tr>

      <tr>
        <td width="150">
          기호번호 :
          <input
            style="width: 50px"
            type="text"
            name="id"
            value=" 6 "
            readonly
          />
        </td>
        <td width="300" colspan="2">
          후보명 :
          <input type="search" name="hubo_name" />
        </td>
        <td>
          <input id="submit" class="select2" type="submit" value="추가" />
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
        { name: "john", num: 1 },
        { name: "tom", num: 2 },
        { name: "danny", num: 3 },
        { name: "july", num: 4 },
        { name: "annie", num: 5 },
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
