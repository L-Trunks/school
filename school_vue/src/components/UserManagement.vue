<template>
  <div>
    <factory-table :list="userList" :options="options" :columns="columns" :pageShow="false"></factory-table>
  </div>
</template>

<script>
import { mapState, mapMutations, mapActions } from "vuex";
import FactoryTable from "./FactoryTable";
import { SelectAllUser } from "../api/user_api";
import { formatdate, formatDateTime, randomsort } from "../utils/util.js";
export default {
  name: "usermanagement",
  data() {
    return {
      userList: [],
      options: {
        // table样式参数
        stripe: true, // 是否为斑马纹 table
        loading: false, // 是否添加表格loading加载动画
        highlightCurrentRow: true, // 是否支持当前行高亮显示
        mutiSelect: false // 是否支持列表项选中功能
      }, // table 的参数结束
      columns: [
        {
          prop: "name",
          label: "真实姓名",
          align: "center",
          isShow: true
        },
        {
          prop: "user_name",
          label: "昵称",
          align: "center",
          isShow: true
        },
        {
          prop: "student_number",
          label: "学号",
          align: "center",
          isShow: true
        },
        {
          prop: "teacher_number",
          label: "编号",
          align: "center",
          isShow: true
        },
        {
          prop: "email",
          label: "邮箱",
          align: "center",
          isShow: true
        },
        {
          prop: "introduce",
          label: "个人简介",
          align: "center",
          isShow: true
        },
        {
          prop: "permission",
          label: "身份",
          align: "center",
          isShow: true,
          formatter: function(row) {
            let perMap = {
              0: "学生",
              1: "教师",
              2: "管理员"
            };
            return perMap[row.permission];
          }
        }
      ] // 需要展示的列结束
    };
  },
  created() {
  },
  mounted() {
    this.getUser();
  },
  methods: {
    getUser() {
      SelectAllUser().then(res => {
        if (res && res.data) {
          this.userList = res.data;
        }
      });
    }
  },
  components: {
    FactoryTable
  },
  watch: {},
  computed: {
    ...mapState({
      loginState: state => state.loginState,
      userId: state => state.userId,
      userInfo: state => state.userInfo,
      courseList: state => state.courseList,
      courseSortList: state => state.courseSortList
    })
  }
};
</script>

<style scoped>
</style>