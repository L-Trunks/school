<template>
  <div>
    选择试卷：
    <el-select size="mini" @change="getReport" v-model="paperId" placeholder="请选择">
      <el-option
        v-for="item in paperOptions"
        :key="item.value"
        :label="item.label"
        :value="item.value"
      ></el-option>
    </el-select>
    <factory-table
      :list="reportList"
      :options="reportOptions"
      :columns="reportColumns"
      :pageShow="false"
    ></factory-table>
  </div>
</template>

<script>
import { mapState, mapMutations, mapActions } from "vuex";
import FactoryTable from "./FactoryTable";
import { formatdate, formatDateTime, randomsort } from "../utils/util.js";
import { SelectAllPaperByTea, SelectReportByPaper } from "../api/course_api";
export default {
  name: "schoolreport",
  data() {
    return {
      paperId: "",
      reportList: [],
      paperOptions: [],
      reportOptions: {
        // table样式参数
        stripe: true, // 是否为斑马纹 table
        loading: false, // 是否添加表格loading加载动画
        highlightCurrentRow: true, // 是否支持当前行高亮显示
        mutiSelect: false // 是否支持列表项选中功能
      }, // table 的参数结束
      reportColumns: [
        {
          prop: "name",
          label: "学生姓名",
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
          prop: "paper_name",
          label: "作业＆考试名称",
          align: "center",
          isShow: true
        },
        {
          prop: "paper_type",
          label: "作业类型",
          align: "center",
          isShow: true,
          formatter: function(row) {
            let arrMap = {
              0: "作业",
              1: "考试"
            };
            return arrMap[row.paper_type];
          }
        },
        {
          prop: "end_time",
          label: "截止时间",
          align: "center",
          isShow: true,
          formatter: function(row) {
            return formatDateTime(row.end_time);
          }
        },
        {
          prop: "create_time",
          label: "提交时间",
          align: "center",
          isShow: true,
          formatter: function(row) {
            return formatDateTime(row.create_time);
          }
        },
        {
          prop: "report_level",
          label: "评级",
          align: "center",
          isShow: true
        },
        {
          prop: "score_final",
          label: "得分",
          align: "center",
          isShow: true
        }
      ] // 需要展示的列结束
    };
  },
  created() {
    this.setOptions();
  },
  mounted() {
    this.getReport();
  },
  methods: {
    getReport() {
      SelectReportByPaper({ params: { paperId: this.paperId } }).then(res => {
        if (res && res.data) {
          this.reportList = res.data;
        }
      });
    },
    setOptions() {
      SelectAllPaperByTea({ params: { teacherId: this.userId } }).then(res => {
        if (res && res.data) {
          this.paperOptions = [];
          res.data.map(v => {
            this.paperOptions.push({ label: v.paper_name, value: v.id });
          });
          this.paperId =　this.paperOptions[0]&& this.paperOptions[0].value;
        }
      });
    }
  },
  watch: {
    paperId: {
      handler(val) {
        this.getReport();
      },
      deep: true
    },
    paperList: function(val) {}
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
  components: {
    FactoryTable
  }
};
</script>

<style scoped>
</style>