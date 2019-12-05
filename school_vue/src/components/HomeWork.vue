<template>
  <div>
    选择课程：
    <el-select size="mini" @change="getPaper" v-model="courseId" placeholder="请选择">
      <el-option
        v-for="item in courseOptions"
        :key="item.value"
        filterable
        :label="item.label"
        :value="item.value"
      ></el-option>
    </el-select>
    <el-button
      style="margin-left:20px"
      type="success"
      size="mini"
      icon="el-icon-plus"
      @click="addDialog"
    >新增</el-button>
    <factory-table
      :list="list"
      :options="options"
      :columns="columns"
      :operates="operates"
      :pageShow="false"
    ></factory-table>
    <el-dialog title="添加作业＆考试" :visible.sync="addShowDialog">
      <el-form :model="addPaperForm">
        <el-form-item label="作业＆考试名称">
          <el-input v-model="addPaperForm.paperName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="选择课程">
          <el-select size="mini" v-model="addPaperForm.courseId" placeholder="请选择">
            <el-option
              v-for="item in courseByOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="考试内容">
          <el-button type="primary" size="mini" @click="addQuestion(addPaperForm.courseId)">新增</el-button>
          <el-input
            v-for="(item,index) in handleSelection"
            v-model="item.question_article"
            :key="index"
            disabled
            autocomplete="off"
          ></el-input>
        </el-form-item>
        <el-form-item label="考试时间">
          <el-select size="mini" v-model="addPaperForm.paperTime" placeholder="请选择">
            <el-option
              v-for="item in timeOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否发布">
          <el-tooltip :content="'关闭为否，开启为是'" placement="top">
            <el-switch
              v-model="addPaperForm.isShow"
              active-color="#13ce66"
              inactive-color="#ff4949"
              active-value="1"
              inactive-value="0"
            ></el-switch>
          </el-tooltip>
        </el-form-item>
        <el-form-item label="截止时间">
          <el-date-picker
            v-model="addPaperForm.endTime"
            value-format="yyyy-MM-dd HH:mm:ss"
            type="datetime"
            placeholder="选择日期时间"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="作业类型">
          <el-radio v-model="addPaperForm.paperType" label="0" border>作业</el-radio>
          <el-radio v-model="addPaperForm.paperType" label="1" border>考试</el-radio>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="addShowDialog = false">取 消</el-button>
        <el-button type="primary" @click="addPaper">确 定</el-button>
      </div>
    </el-dialog>
    <el-dialog :loading="questionLoading" title="题库" :visible.sync="questionShowDialog">
      <factory-table
        :list="questionList"
        :options="questionOptions"
        :columns="questionColumns"
        :pageShow="false"
        :height="'50%'"
        @handleSelectionChange="handleSelectionChange"
      ></factory-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="questionShowDialog = false">取 消</el-button>
        <el-button type="primary" @click="addQuestionList">确 定</el-button>
      </div>
    </el-dialog>
    <el-dialog :fullscreen='true' :loading="paperLoading" title="试卷预览" :visible.sync="paperShowDialog">
      <div v-for="(item,index) in paperList" :key="index">
        <el-col v-if="item.question_type==0" :span="20">
          <el-card shadow="hover">
            第{{index+1}}题：
            <br />
            选择题&nbsp;&nbsp;&nbsp;&nbsp;{{item.question_article}}
            <br />
            正确答案:{{item.question_answer}} 错误答案:{{item.question_error}}
          </el-card>
        </el-col>
        <el-col v-if="item.question_type==1" :span="20">
          <el-card shadow="hover">
            第{{index+1}}题：
            <br />
            判断题&nbsp;&nbsp;&nbsp;&nbsp;{{item.question_article}}
            <br />
            正确答案:{{answerMap[item.is_question_answer]}}
          </el-card>
        </el-col>
        <el-col v-if="item.question_type==2" :span="20">
          <el-card shadow="hover">
            第{{index+1}}题：
            <br />
            填空题&nbsp;&nbsp;&nbsp;&nbsp;{{item.question_article}}
            <br />
            正确答案:{{item.question_answer}}
          </el-card>
        </el-col>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { mapState, mapMutations, mapActions } from "vuex";
import { formatdate, formatDateTime } from "../utils/util.js";
import FactoryTable from "./FactoryTable";
import {
  SelectAllPaperByCourse,
  AddPaper,
  UpdatePaper,
  DeletePaper,
  SelectAllQuestionByCourse,
  SelectAllCourseByTea,
  SelectQuestionsById
} from "../api/course_api";
export default {
  name: "homework",
  data() {
    return {
      questionShowDialog: false,
      answerMap: {
        1: "对",
        0: "错"
      },
      timeOptions: [
        {
          value: "30",
          label: "半小时"
        },
        {
          value: "60",
          label: "1小时"
        },
        {
          value: "90",
          label: "1.5小时"
        },
        {
          value: "120",
          label: "2小时"
        }
      ],
      courseByOptions: [],
      courseOptions: [],
      addShowDialog: false,
      list: [], // table数据
      questionList: [], // table数据
      addPaperForm: {},
      courseId: null,
      options: {
        // table样式参数
        stripe: true, // 是否为斑马纹 table
        loading: false, // 是否添加表格loading加载动画
        highlightCurrentRow: true, // 是否支持当前行高亮显示
        mutiSelect: false // 是否支持列表项选中功能
      }, // table 的参数结束
      questionOptions: {
        // table样式参数
        stripe: true, // 是否为斑马纹 table
        loading: false, // 是否添加表格loading加载动画
        highlightCurrentRow: true, // 是否支持当前行高亮显示
        mutiSelect: true // 是否支持列表项选中功能
      },
      questionColumns: [
        {
          // 需要展示的列开始
          prop: "question_article",
          label: "题目描述",
          align: "center",
          isShow: true
        },
        {
          prop: "question_type",
          label: "题目类型",
          align: "center",
          isShow: true,
          formatter: function(row) {
            let arrMap = {
              0: "选择题",
              1: "判断题",
              2: "填空题"
            };
            return arrMap[row.question_type];
          }
        },
        {
          prop: "question_answer",
          label: "选择＆填空题答案",
          align: "center",
          isShow: true
        },
        {
          prop: "is_question_answer",
          label: "判断题答案",
          align: "center",
          isShow: true,
          formatter: function(row) {
            let arrMap = {
              0: "错",
              1: "对"
            };
            return arrMap[row.is_question_answer];
          }
        },
        {
          prop: "score",
          label: "分值",
          align: "center",
          isShow: true
        }
      ], // 需要展示的列结束
      handleSelection: [],
      questionArr: [],
      columns: [
        {
          prop: "paper_name",
          label: "作业＆考试名称",
          align: "center",
          isShow: true
        },
        {
          prop: "course_name",
          label: "课程名称",
          align: "center",
          isShow: true
        },
        {
          prop: "is_show",
          label: "状态",
          align: "center",
          isShow: true,
          formatter: function(row) {
            let arrMap = {
              0: "未发布",
              1: "已发布"
            };
            return arrMap[row.is_show];
          }
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
        }
      ], // 需要展示的列结束
      operates: {
        //操作栏
        width: 400,
        fixed: "right",
        list: [
          {
            id: "0",
            label: "预览",
            show: true,
            className: "searchAll",
            type: "success",
            disabled: false,
            method: (index, row) => {
              this.handleshow(index, row);
            }
          },
          {
            id: "1",
            label: "发布＆取消发布",
            show: true, //是否显示按钮
            className: "primary", //样式类名
            type: "primary",
            disabled: false, //是否禁用按钮 默认是danger的禁用样式
            method: (index, row) => {
              this.handleEdit(index, row);
            }
          },
          {
            id: "2",
            label: "删除",
            show: true,
            className: "searchAll",
            type: "danger",
            disabled: false,
            method: (index, row) => {
              this.handledel(index, row);
            }
          }
        ]
      }, // 列操作按钮
      sourceList: [],
      questionLoading: false,
      paperLoading: false,
      paperList: [],
      paperShowDialog: false
    };
  },
  created() {
    this.courseId = this.courseList && this.courseList[0].id && "";
    this.setcourseOptions();
    this.getPaper();
  },
  methods: {
    handleSelectionChange(val) {
      //checkbox选中的数据val 是选中行的所有数组
      this.handleSelection = val;
    },
    addQuestion(id) {
      this.questionLoading = true;
      this.questionShowDialog = true;
      SelectAllQuestionByCourse({ params: { courseId: id } })
        .then(res => {
          if (res && res.data) {
            this.questionList = res.data;
            this.questionLoading = false;
            console.log(this.questionList);
          } else {
            this.$message.error("出现错误");
          }
        })
        .catch(err => {
          console.log(err);
          this.$message.error("出现错误");
        });
    },
    addQuestionList() {
      this.questionArr = [];
      this.handleSelection.map(v => {
        this.questionArr.push(v.id);
      });
      this.questionShowDialog = false;
    },
    getCourseOptions() {
      SelectAllCourseByTea({ params: { teacherId: this.userId } })
        .then(res => {
          if (res && res.data) {
            this.courseByOptions = [];
            res.data.map(v => {
              this.courseByOptions.push({ label: v.course_name, value: v.id });
            });
          } else {
            this.$message.error("出现错误");
          }
        })
        .catch(err => {
          console.log(err);
          this.$message.error("出现错误");
        });
    },
    getPaper() {
      SelectAllPaperByCourse({ params: { courseId: this.courseId } })
        .then(res => {
          if (res && res.data) {
            this.list = res.data;
          } else {
            this.$message.error("出现错误");
          }
        })
        .catch(err => {
          console.log(err);
          this.$message.error("出现错误");
        });
    },
    setcourseOptions() {
      this.courseOptions = [];
      this.courseList.map(v => {
        this.courseOptions.push({ label: v.course_name, value: v.id });
      });
    },
    addDialog() {
      this.addPaperForm = {
        courseId: "",
        questionIds: "",
        teacherId: this.userId,
        isShow: "",
        paperType: "",
        endTime: "",
        paperName: "",
        paperTime: ""
      };
      this.getCourseOptions();
      this.addShowDialog = true;
    },
    addPaper() {
      console.log(this.addPaperForm);
      console.log(this.questionArr);
      let date = new Date(this.addPaperForm.endTime);
      this.addPaperForm = {
        ...this.addPaperForm,
        questionIds: this.questionArr.join(",")
      };
      AddPaper({ params: this.addPaperForm })
        .then(res => {
          if (res && res.data) {
            this.$message.success("添加成功");
            this.courseId = this.addPaperForm.courseId;
            this.getPaper();
            this.addShowDialog = false;
          } else {
            this.$message.error("出现错误");
          }
        })
        .catch(err => {
          console.log(err);
          this.$message.error("出现错误");
        });
    },
    handleshow(i, row) {
      this.paperLoading = true;
      this.paperShowDialog = true;
      this.paperList = [];
      let idList = row.question_ids.split(",");
      idList.map(v => {
        SelectQuestionsById({ params: { questionId: v } }).then(res => {
          console.log(res);
          if (res && res.data) {
            this.paperList.push(res.data[0]);
            if (this.paperList.length == idList.length) {
              this.paperLoading = false;
            }
          }
        });
      });
    },
    handleEdit(i, row) {
      if (row.teacher_id != this.userId) {
        this.$message.error("非本人发布试卷不可编辑");
        return;
      }
      let form = {
        questionIds: row.question_ids,
        isShow: row.is_show,
        paperType: row.paper_type,
        endTime: formatDateTime(row.end_time),
        paperName: row.paper_name,
        paperId: row.id
      };
      if (row.is_show == "0") {
        UpdatePaper({ params: { ...form, isShow: "1" } }).then(res => {
          if (res && res.data) {
            this.$message.success("发布成功");
            this.getPaper();
            this.addShowDialog = false;
          } else {
            this.$message.error("出现错误");
          }
        });
      } else {
        UpdatePaper({ params: { ...form, isShow: "0" } }).then(res => {
          if (res && res.data) {
            this.$message.success("取消发布成功");
            this.getPaper();
            this.addShowDialog = false;
          } else {
            this.$message.error("出现错误");
          }
        });
      }
    },
    handledel(index, row) {
      //操作栏删除按钮
      console.log(" index:", index);
      console.log(" row:", row);
      if (row.teacher_id != this.userId) {
        this.$message.error("非本人发布试卷不可编辑");
        return;
      }
      this.$confirm("确定删除该试卷吗？")
        .then(_ => {
          DeletePaper({ params: { paperId: row.id } }).then(res => {
            console.log(res);
            this.$message.success("删除成功");
            this.getPaper();
          });
        })
        .catch(_ => {});
    }
  },
  watch: {
    courseList: {
      handler(val) {
        this.courseId = val[0].id;
        this.setcourseOptions();
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
.el-card {
  margin-top: 20px
}
</style>