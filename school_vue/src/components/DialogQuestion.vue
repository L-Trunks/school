<template>
  <div>
    <el-dialog title="课程题库" :show-close="false" fullscreen :visible.sync="dialog">
      <el-button type="success" size="mini" icon="el-icon-plus" @click="addDialog">新增</el-button>
      <factory-table
        :list="list"
        :options="options"
        :columns="columns"
        :operates="operates"
        :pageShow="false"
      ></factory-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="close">关闭</el-button>
      </div>
    </el-dialog>
    <el-dialog title="添加题目" :visible.sync="addShowDialog">
      <el-form :model="addQuestionForm">
        <el-form-item label="题目描述">
          <el-input v-model="addQuestionForm.questionArticle" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="题目类型">
          <el-select v-model="addQuestionForm.questionType" placeholder="请选择">
            <el-option
              v-for="item in typeOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="正确答案">
          <el-tooltip
            v-if="addQuestionForm.questionType =='1'"
            :content="'选择正确答案，0为错，1为对 '"
            placement="top"
          >
            <el-switch
              v-model="addQuestionForm.isQuestionAnswer"
              active-color="#13ce66"
              inactive-color="#ff4949"
              active-value="1"
              inactive-value="0"
            ></el-switch>
          </el-tooltip>
          <el-input v-else v-model="addQuestionForm.questionAnswer" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item v-if="addQuestionForm.questionType =='0'" label="错误答案">
          <el-input
            v-model="addQuestionForm.questionError"
            placeholder="请输入三个错误答案,以英文分号隔开"
            autocomplete="off"
          ></el-input>
        </el-form-item>
        <el-form-item label="分值">
          <el-input disabled v-model="addQuestionForm.score" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="addShowDialog = false">取 消</el-button>
        <el-button type="primary" @click="addQuestion">确 定</el-button>
      </div>
    </el-dialog>
    <el-dialog title="编辑题目" :visible.sync="updateShowDialog">
      <el-form :model="updateQuestionForm">
        <el-form-item label="题目描述">
          <el-input v-model="updateQuestionForm.questionArticle" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="题目类型">
          <el-select v-model="updateQuestionForm.questionType" placeholder="请选择">
            <el-option
              v-for="item in typeOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="正确答案">
          <el-tooltip
            v-if="updateQuestionForm.questionType =='1'"
            :content="'选择正确答案，0为错，1为对 '"
            placement="top"
          >
            <el-switch
              v-model="updateQuestionForm.isQuestionAnswer"
              active-color="#13ce66"
              inactive-color="#ff4949"
              active-value="1"
              inactive-value="0"
            ></el-switch>
          </el-tooltip>
          <el-input v-else v-model="updateQuestionForm.questionAnswer" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item v-if="updateQuestionForm.questionType =='0'" label="错误答案">
          <el-input
            v-model="updateQuestionForm.questionError"
            placeholder="请输入三个错误答案,以英文分号隔开"
            autocomplete="off"
          ></el-input>
        </el-form-item>
        <el-form-item label="分值">
          <el-input disabled v-model="updateQuestionForm.score" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="updateShowDialog = false">取 消</el-button>
        <el-button type="primary" @click="updateQuestion">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import FactoryTable from "./FactoryTable";
import { mapState, mapMutations, mapActions } from "vuex";
import {
  SelectAllQuestionByCourse,
  AddQuestion,
  UpdateQuestion,
  DeleteQuestion
} from "../api/course_api";
export default {
  name: "dialogQuesion",
  props: {
    showDialog: {
      type: Boolean,
      default: false
    },
    courseId: {
      type: Number,
      default: null
    }
  },
  created() {},
  data() {
    return {
      typeOptions: [
        {
          label: "选择题",
          value: 0
        },
        {
          label: "判断题",
          value: 1
        },
        {
          label: "填空题",
          value: 2
        }
      ],
      updateShowDialog: false,
      addShowDialog: false,
      dialog: this.showDialog,
      list: [], // table数据
      addQuestionForm: {},
      updateQuestionForm: {},
      options: {
        // table样式参数
        stripe: true, // 是否为斑马纹 table
        loading: false, // 是否添加表格loading加载动画
        highlightCurrentRow: true, // 是否支持当前行高亮显示
        mutiSelect: false // 是否支持列表项选中功能
      }, // table 的参数结束
      columns: [
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
      operates: {
        //操作栏
        width: 400,
        fixed: "right",
        list: [
          {
            id: "0",
            label: "查看",
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
            label: "编辑",
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
      } // 列操作按钮
    };
  },
  mounted() {
    this.getList();
  },
  methods: {
    ...mapActions(["selectAllCourse"]),
    close() {
      this.$emit("changeDia", false);
    },
    addQuestion() {
      console.log(this.addQuestionForm);
      AddQuestion({ params: this.addQuestionForm })
        .then(res => {
          if (res && res.data) {
            this.getList();
            this.$message.success("添加成功");
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
    updateQuestion() {
      console.log(this.updateQuestionForm);
      if (this.updateQuestionForm.questionType != 1) {
        this.updateQuestionForm.isQuestionAnswer = 9;
      }
      UpdateQuestion({ params: this.updateQuestionForm })
        .then(res => {
          if (res && res.data) {
            this.getList();
            this.$message.success("修改成功");
            this.updateShowDialog = false;
          } else {
            this.$message.error("出现错误");
          }
        })
        .catch(err => {
          console.log(err);
          this.$message.error("出现错误");
        });
    },
    getList() {
      SelectAllQuestionByCourse({ params: { courseId: this.courseId } }).then(
        res => {
          if (res && res.data) {
            this.list = res.data;
          }
        }
      );
    },
    addDialog() {
      this.addQuestionForm = {
        questionArticle: "",
        questionType: "",
        questionAnswer: "",
        isQuestionAnswer: 9,
        questionError: "",
        courseId: this.courseId,
        score: 10
      };
      this.addShowDialog = true;
    },
    handleshow(index, row) {},
    handleEdit(index, row) {
      //操作栏编辑按钮
      this.updateQuestionForm = {
        questionArticle: row.question_article,
        questionType: row.question_type,
        questionAnswer: row.question_answer,
        isQuestionAnswer: row.is_question_answer,
        questionError: row.question_error,
        score: 10,
        questionId: row.id
      };
      this.updateShowDialog = true;
      console.log(" index:", index);
      console.log(" row:", row);
    },
    handledel(index, row) {
      //操作栏删除按钮
      console.log(" index:", index);
      console.log(" row:", row);
      this.$confirm("确定删除该题目吗？？")
        .then(_ => {
          DeleteQuestion({ params: { questionId: row.id } }).then(res => {
            console.log(res);
            this.$message.success("删除成功");
            this.getList();
          });
        })
        .catch(_ => {});
    }
  },
  watch: {
    courseId: function(val) {
      this.getList();
    },
    showDialog: function(val) {
      this.dialog = val;
    }
  },
  components: {
    FactoryTable
  }
};
</script>

<style scoped>
</style>