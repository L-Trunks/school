<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: "app",
  components: {}
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
  font-family: "Helvetica Neue",Helvetica,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","微软雅黑",Arial,sans-serif;
}
#app{
  overflow-x: hidden;
  
}
html{
  background: rgb(252, 252, 252);
  padding-bottom: 20px;
}
.login .el-form-item {
  margin-bottom: 0px;
}
.router-link {
  text-decoration: none;
}
.router-link-active {
  text-decoration: none;
}
a {
  text-decoration: none;
}

</style>
