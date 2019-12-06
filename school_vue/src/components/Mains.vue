<template>
  <div>
    <el-col class="img_view" :span="8">
      <div class="no_user">{{userInfo[0].name}}</div>
    </el-col>
    <el-col :span="16">
      <el-card shadow="hover">
        <div slot="header" class="clearfix">
          <span>个人信息</span>
          <el-button
            type="primary"
            style="float: right; padding: 3px 0"
            @click="showEditor"
            icon="el-icon-edit"
          >编辑个人资料</el-button>
        </div>
        <div
          class="text item"
        >学号&编号：{{userInfo[0] && userInfo[0].permission == '0'? userInfo[0].student_number:userInfo[0].teacher_number}}</div>
        <div class="text item">姓名：{{userInfo[0].name}}</div>
        <div class="text item">昵称：{{userInfo[0].user_name}}</div>
        <div class="text item">个人简介：{{userInfo[0].introduce}}</div>
        <div class="text item">邮箱：{{userInfo[0].email}}</div>
        <el-badge :value="userReportList &&userReportList.length || 0" class="button">
          <el-button type="info" size="mini" @click="showReportDialog=true">练习记录</el-button>
        </el-badge>
        <el-badge :value="userCourseList &&userCourseList.length || 0" class="button">
          <el-button type="primary" size="mini" @click="detailDialog=true">我的课程</el-button>
        </el-badge>
        <el-badge :value="userPaperList &&userPaperList.length || 0" class="button">
          <el-button type="success" size="mini" @click="homeWorkDialog=true" class>我的作业</el-button>
        </el-badge>
      </el-card>
    </el-col>
    <el-col style="margin-top:20px" :span="24">
      <el-card>
        <div slot="header" class="clearfix">
          <el-select size="mini" @change="getCourse" v-model="sortId" placeholder="请选择课程分类">
            <el-option
              v-for="item in sortOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </div>
        <el-col
          style="padding-bottom:10px"
          :span="8"
          v-for="(o, index) in courseListBySort"
          :key="index"
        >
          <el-card :body-style="{ padding: '0px' }">
            <img width="100%" height="100%" :src="o.course_url" class="image" />
            <div style="padding: 14px;">
              <span>{{o.course_name}}</span>
              <div class="bottom clearfix">
                <time class="time">主讲教师：{{ o.name }}</time>
                <el-button type="danger" size="mini" @click="stuAddCourse(o.id)" class="button">添加</el-button>
                <el-button type="success" size="mini" @click="stuSeeCourse(o)" class="button">预览</el-button>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-card>
    </el-col>
    <el-dialog title="修改个人资料" :visible.sync="dialogVisible" width="30%">
      <div>
        <el-form
          :model="userInfoForm"
          status-icon
          ref="ruleForm"
          label-width="100px"
          class="demo-ruleForm"
        >
          <el-form-item label="昵称" prop="userName">
            <el-input type="text" v-model="userInfoForm.userName"></el-input>
          </el-form-item>
          <el-form-item label="简介" prop="introduction">
            <el-input type="text" v-model="userInfoForm.introduce"></el-input>
          </el-form-item>
          <el-form-item label="邮箱" prop="email">
            <el-input type="text" v-model="userInfoForm.email"></el-input>
          </el-form-item>
        </el-form>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="updateUser">确 定</el-button>
      </span>
    </el-dialog>
    <el-dialog title="课程详情" :visible.sync="seeDialog" width="30%">
      <div>
        <el-card shadow="hover">
          <div class="text item">课程名称：{{seeForm.course_name}}</div>
          <br />
          <div class="text item">课程简介：{{seeForm.course_info}}</div>
          <br />
          <div class="text item">主讲教师：{{seeForm.name}}</div>
        </el-card>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="seeDialog = false">确 定</el-button>
      </span>
    </el-dialog>
    <el-dialog title="我的练习记录" :fullscreen="true" :visible.sync="showReportDialog">
      <div>
        <factory-table
          :list="userReportList"
          :options="reportOptions"
          :columns="reportColumns"
          :pageShow="false"
        ></factory-table>
      </div>
    </el-dialog>
    <el-dialog title="我的课程" :fullscreen="true" :visible.sync="detailDialog">
      <div>
        <el-col
          style="padding-bottom:10px;"
          :span="8"
          v-for="(o, index) in userCourseListDetail"
          :key="index"
        >
          <el-card :body-style="{ padding: '0px' }">
            <img width="100%" height="100%" :src="o.course_url" class="image" />
            <div style="padding: 14px;">
              <span>{{o.course_name}}</span>
              <div class="bottom clearfix">
                <time class="time">主讲教师：{{ o.name }}</time>
              </div>
            </div>
          </el-card>
        </el-col>
      </div>
    </el-dialog>
    <el-dialog title="我的作业" :fullscreen="true" :visible.sync="homeWorkDialog">
      <div>
        <factory-table
          :list="userPaperList"
          :options="options"
          :columns="columns"
          :operates="operates"
          :pageShow="false"
        ></factory-table>
      </div>
      <el-dialog
        :loading="paperLoading"
        :modal="false"
        :title="testTitle"
        :visible.sync="testDialogVisible"
        :fullscreen="true"
        :before-close="handleClose"
      >
        <div v-for="(item,index) in paperList" :key="index">
          <el-row>
            <el-col v-if="item.question_type==0" :offset="2" :span="20">
              <el-card shadow="hover">
                第{{index+1}}题：
                <br />
                <p style="margin:10px 0">{{item.question_article}}</p>
                <br />
                <el-radio-group
                  @change="checkAnswer(index,item,item.userAnswer)"
                  v-model="item.userAnswer"
                >
                  <el-radio
                    :label="item.questionAnswerArr[selectArr[0]]"
                  >{{item.questionAnswerArr[selectArr[0]]}}</el-radio>
                  <el-radio
                    :label="item.questionAnswerArr[selectArr[1]]"
                  >{{item.questionAnswerArr[selectArr[1]]}}</el-radio>
                  <el-radio
                    :label="item.questionAnswerArr[selectArr[2]]"
                  >{{item.questionAnswerArr[selectArr[2]]}}</el-radio>
                  <el-radio
                    :label="item.questionAnswerArr[selectArr[3]]"
                  >{{item.questionAnswerArr[selectArr[3]]}}</el-radio>
                </el-radio-group>
              </el-card>
            </el-col>
            <el-col v-if="item.question_type==1" :offset="2" :span="20">
              <el-card shadow="hover">
                第{{index+1}}题：
                <br />
                <p style="margin:10px 0">{{item.question_article}}</p>
                <br />

                <el-radio-group
                  @change="checkAnswer(index,item,item.userAnswer)"
                  v-model="item.userAnswer"
                >
                  <el-radio :label="0">错</el-radio>
                  <el-radio :label="1">对</el-radio>
                </el-radio-group>
              </el-card>
            </el-col>
            <el-col v-if="item.question_type==2" :offset="2" :span="20">
              <el-card shadow="hover">
                第{{index+1}}题：
                <br />
                <p style="margin:10px 0">{{item.question_article}}</p>
                <br />
                <el-input
                  @input="checkAnswer(index,item,item.userAnswer)"
                  v-model="item.userAnswer"
                  placeholder
                ></el-input>
              </el-card>
            </el-col>
          </el-row>
        </div>
        <el-col style="margin-top:50px 0;text-align:center" :span="24">
          <el-button type="danger" @click="addReport">提交</el-button>
        </el-col>
      </el-dialog>
    </el-dialog>
  </div>
</template>

<script>
import { mapState, mapMutations, mapActions } from "vuex";
import { UpdateUserInfo } from "../api/user_api";
import {
  SelectAllCourseBySort,
  StudentAddCourse,
  SelectCourseIdByStudent,
  SelectAllCourseById,
  SelectAllPaperByCourse,
  AddReport,
  SelectQuestionsById,
  SelectReportByStudent
} from "../api/course_api.js";
import { formatdate, formatDateTime, randomsort } from "../utils/util.js";
import FactoryTable from "./FactoryTable";
export default {
  name: "mains",
  data() {
    return {
      userReportList: [],
      failDialogVisible: false,
      homeWorkDialog: false,
      detailDialog: false,
      testDialogVisible: false,
      showReportDialog: false,
      sortId: "",
      testTitle: "",
      dialogVisible: false,
      userInfoForm: {},
      sortOptions: [],
      courseListBySort: [],
      seeDialog: false,
      seeForm: {},
      paperList: [],
      userCourseList: [],
      userCourseListDetail: [],
      userPaperList: [],
      testForm: {},
      paperLoading: false,
      totalScore: 0,
      options: {
        // table样式参数
        stripe: true, // 是否为斑马纹 table
        loading: false, // 是否添加表格loading加载动画
        highlightCurrentRow: true, // 是否支持当前行高亮显示
        mutiSelect: false // 是否支持列表项选中功能
      }, // table 的参数结束
      reportOptions: {
        // table样式参数
        stripe: true, // 是否为斑马纹 table
        loading: false, // 是否添加表格loading加载动画
        highlightCurrentRow: true, // 是否支持当前行高亮显示
        mutiSelect: false // 是否支持列表项选中功能
      }, // table 的参数结束
      reportColumns: [
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
      ], // 需要展示的列结束
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
            label: "开始考试",
            show: true,
            className: "searchAll",
            type: "danger",
            disabled: false,
            method: (index, row) => {
              this.handleEdit(index, row);
            }
          }
        ]
      }, // 列操作按钮
      selectArr: [0, 1, 2, 3]
    };
  },
  created() {
    this.setOptions();
    this.getUserCourse();
    this.getReportList();
    this.getCourseInfo();
  },
  mounted() {
    this.sortId = (this.sortOptions[0] && this.sortOptions[0].value) || "";

    this.checkUserPaperList();
  },
  methods: {
    ...mapActions(["selectUserById", "selectAllCourse", "selectAllSort"]),
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then(_ => {
          done();
        })
        .catch(_ => {});
    },
    //获取考试记录
    getReportList() {
      SelectReportByStudent({ params: { studentId: this.userId } }).then(
        res => {
          if (res && res.data) {
            this.userReportList = res.data;
          }
        }
      );
    },
    //答案检查
    checkAnswer(index, data, answer) {
      console.log(index, data, answer);
      switch (data.question_type) {
        case 0:
          if (answer == data.question_answer) {
            this.paperList[index].answerScore = this.paperList[index].score;
          } else {
            this.paperList[index].answerScore = 0;
          }
          this.setTotal();
          break;
        case 1:
          if (answer == data.is_question_answer) {
            this.paperList[index].answerScore = this.paperList[index].score;
          } else {
            this.paperList[index].answerScore = 0;
          }
          this.setTotal();
          break;
        case 2:
          if (answer == data.question_answer) {
            this.paperList[index].answerScore = this.paperList[index].score;
          } else {
            this.paperList[index].answerScore = 0;
          }
          this.setTotal();
          break;
      }
    },
    //开始考试
    handleEdit(i, row) {
      console.log(i, row);
      this.selectArr = this.selectArr.sort(randomsort);
      console.log(this.selectArr);
      this.testTitle = row.paper_name;
      this.testForm = {
        reportLevel: "",
        studentId: this.userId,
        paperId: row.id,
        scoreFinal: 0,
        teacherId: row.teacher_id
      };
      this.paperList = [];
      this.totalScore = 0;
      this.paperLoading = true;
      let idList = row.question_ids.split(",");
      idList.map(v => {
        SelectQuestionsById({ params: { questionId: v } }).then(res => {
          console.log(res);
          if (res && res.data) {
            this.paperList.push({
              ...res.data[0],
              userAnswer: "",
              answerScore: 0,
              questionAnswerArr: [
                res.data[0].question_answer,
                ...res.data[0].question_error.split(";")
              ]
            });
            this.totalScore += res.data[0].score;
            if (this.paperList.length == idList.length) {
              this.paperLoading = false;
              console.log(this.paperList);
            }
          }
        });
      });
      this.testDialogVisible = true;
    },
    setTotal() {
      this.testForm.scoreFinal = 0;
      this.paperList.map(v => {
        this.testForm.scoreFinal += v.answerScore;
      });
      console.log(this.testForm.scoreFinal);
    },
    addReport() {
      let scoreFinal = this.testForm.scoreFinal;
      let total = this.totalScore;
      if (scoreFinal >= total * 0.8) {
        this.testForm.reportLevel = "A";
      } else if (scoreFinal < total * 0.8 && scoreFinal >= total * 0.7) {
        this.testForm.reportLevel = "B";
      } else if (scoreFinal < total * 0.7 && scoreFinal >= total * 0.6) {
        this.testForm.reportLevel = "C";
      } else if (scoreFinal < total * 0.6) {
        this.testForm.reportLevel = "D";
      }
      AddReport({ params: this.testForm })
        .then(res => {
          if (res && res.data) {
            this.$message.success("提交成功");
            this.testDialogVisible = false;
            this.getReportList();
          } else {
            this.$message.error("出现错误");
          }
        })
        .catch(err => {
          this.$message.error("服务器跑丢了");
        });
    },
    getUserCourse() {
      SelectCourseIdByStudent({ params: { studentId: this.userId } }).then(
        res => {
          console.log(res);
          if (res && res.data) {
            this.userCourseList = res.data;
          }
        }
      );
    },
    getCourseInfo() {
      this.userCourseListDetail = [];
      this.userPaperList = [];
      this.userCourseList &&
        this.userCourseList.map(v => {
          SelectAllCourseById({ params: { courseId: v.course_id } }).then(
            res => {
              this.userCourseListDetail.push(res.data[0]);
            }
          );
          SelectAllPaperByCourse({ params: { courseId: v.course_id } }).then(
            res => {
              res.data.map(v => {
                if (v.is_show == 1) {
                  this.userPaperList.push(v);
                }
              });
            }
          );
        });
      this.checkUserPaperList();
    },
    checkUserPaperList() {
      this.userPaperList &&
        this.userPaperList.map((k, j) => {
          this.userReportList &&
            this.userReportList.map((v, i) => {
              if (k.id == v.paper_id) {
                this.userPaperList.splice(j, 1);
              }
            });
        });
      console.log(this.userPaperList);
    },
    setOptions() {
      this.sortOptions = [];
      this.courseSortList &&
        this.courseSortList.map(v => {
          this.sortOptions.push({ label: v.sort_name, value: v.id });
        });
    },
    stuSeeCourse(data) {
      this.seeForm = data;
      this.seeDialog = true;
    },
    stuAddCourse(id) {
      this.$confirm("确定添加该课程吗？").then(_ => {
        StudentAddCourse({ params: { courseId: id, studentId: this.userId } })
          .then(res => {
            if (res && res.data) {
              this.$message.success("添加成功");
              this.getUserCourse();
            } else {
              this.$message.error("出现错误");
            }
          })
          .catch(err => {
            this.$message.error("服务器跑丢了");
          });
      });
    },
    getCourse() {
      SelectAllCourseBySort({ params: { sortId: this.sortId } })
        .then(res => {
          if (res && res.data) {
            // this.$message.success("获取成功");
            this.courseListBySort = res.data;
            console.log(this.courseListBySort);
          } else {
            this.$message.error("出现错误");
          }
        })
        .catch(err => {
          this.$message.error("服务器跑丢了");
        });
    },
    updateUser() {
      UpdateUserInfo({ params: this.userInfoForm })
        .then(res => {
          console.log(res);
          if (res && res.data) {
            this.$message.success("修改成功");
            this.selectUserById({ userId: this.userId });
            this.dialogVisible = false;
          } else {
            this.$message.error("出现错误");
          }
        })
        .catch(err => {
          this.$message.error("服务器跑丢了");
        });
    },
    showEditor() {
      this.userInfoForm = {
        userName: this.userInfo[0].user_name,
        email: this.userInfo[0].email,
        introduce: this.userInfo[0].introduce,
        userId: this.userId
      };
      this.dialogVisible = true;
    }
  },
  watch: {
    courseSortList: function() {
      this.setOptions();
    },
    sortId: function() {
      this.getCourse();
    },
    userId: function() {
      this.getUserCourse();
    },
    userCourseList: function() {
      this.getCourseInfo();
    },
    userReportList: function() {
      this.checkUserPaperList();
    },
    userPaperList: function() {
      this.checkUserPaperList();
    }
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
.no_user {
  width: 200px;
  height: 200px;
  background: rgb(78, 78, 78);
  display: flex;
  justify-content: center;
  align-items: center;
  color: #ddd;
  font-size: 30px;
  border-radius: 50%;
}
.img_view {
  display: flex;
  justify-content: center;
  align-items: center;
}
.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  /* padding: 0; */
  float: right;
  margin: 5px;
}

.image {
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both;
}
</style>