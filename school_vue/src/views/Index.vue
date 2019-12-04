<template>
  <div>
    <el-row>
      <el-col class="index_header" :span="24">高校课程管理系统</el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col style="margin-top:-20px" :span="4">
        <span class="el-icon-menu menu" @click="isCollapse ? isCollapse = false:isCollapse = true"></span>
        <el-menu :collapse="isCollapse" default-active="0" class="el-menu-vertical-demo">
          <router-link to="/index">
            <el-menu-item index="0">
              <i class="el-icon-bell"></i>
              <span slot="title">主页</span>
            </el-menu-item>
          </router-link>
          <router-link to="/index/course">
            <el-menu-item index="2">
              <i class="el-icon-mobile"></i>
              <span slot="title">课程管理</span>
            </el-menu-item>
          </router-link>
          <router-link to="/index/homework">
            <el-menu-item index="3">
              <i class="el-icon-document"></i>
              <span slot="title">作业＆考试管理</span>
            </el-menu-item>
          </router-link>
          <router-link to="/index/report">
            <el-menu-item index="4">
              <i class="el-icon-star-off"></i>
              <span slot="title">评分管理</span>
            </el-menu-item>
          </router-link>
          <router-link to="/index/user">
            <el-menu-item index="5">
              <i class="el-icon-user"></i>
              <span slot="title">用户管理</span>
            </el-menu-item>
          </router-link>
          <router-link to="/index/courseSort">
            <el-menu-item index="6">
              <i class="el-icon-s-operation"></i>
              <span slot="title">分类管理</span>
            </el-menu-item>
          </router-link>
        </el-menu>
      </el-col>
      <el-col class="index_article" :span="18">
        <router-view></router-view>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { mapState, mapMutations, mapActions } from "vuex";
export default {
  name: "index",
  data() {
    return {
      isCollapse: false
    };
  },
  computed: {
    ...mapState({
      loginState: state => state.loginState,
      userId: state => state.userId,
      userInfo: state => state.userInfo,
      courseList: state => state.courseList,
      courseSortList: state => state.courseSortList
    })
  },

};
</script>

<style scoped>
.index_header {
  /* width: 100%; */
  padding: 50px 0 20px 10%;
  background: url("../assets/lgbg.png") no-repeat;
  color: black;
  font-size: 32px;
  margin-bottom: 10px;
}
.menu {
  font-size: 24px;
  padding: 5px 0 5px 20px;
  color: #333;
}
.el-menu {
  padding-bottom: 300px;
}
.index_article {
  margin-top: 20px;
  padding: 20px;
  border-radius: 5px;
  background: #fff;
}
</style>