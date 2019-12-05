<template>
  <div>
    <el-select size='mini' v-model="showCourseId" placeholder="请选择课程分类">
      <el-option
        v-for="item in sortOptions"
        :key="item.value"
        :label="item.label"
        :value="item.value"
        @change="getCourseList"
      ></el-option>
    </el-select>
    <el-button style="margin-left:20px" type="success" size="mini" icon="el-icon-plus" @click="addDialog">新增</el-button>
    <factory-table
      :list="list"
      :options="options"
      :columns="columns"
      :operates="operates"
      :pageShow="false"
    ></factory-table>
    <el-dialog title="添加课程" :visible.sync="addShowDialog">
      <el-form :model="addCourseForm">
        <el-form-item label="课程名">
          <el-input v-model="addCourseForm.courseName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="课程介绍">
          <el-input v-model="addCourseForm.courseInfo" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="所属分类">
          <el-select v-model="addCourseForm.sortId" placeholder="请选择">
            <el-option
              v-for="item in sortOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="课程封面">
          <el-upload
            class="upload-demo"
            ref="upload"
            action="/api/upload"
            :show-file-list="true"
            :on-success="handleUploadSuccess"
            :limit="1"
            :on-change="imgChange"
            list-type="picture"
            name="image"
          >
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>
        </el-form-item>
        <el-form-item label="课程资源">
          <el-upload
            ref="uploads"
            class="upload-demo"
            action="/api/upload"
            :show-file-list="true"
            :on-success="handleUploadListSuccess"
            :on-change="imgChange"
            list-type="picture"
          >
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="addShowDialog = false">取 消</el-button>
        <el-button type="primary" @click="addCourse">确 定</el-button>
      </div>
    </el-dialog>
    <el-dialog title="编辑课程" :visible.sync="updateShowDialog">
      <el-form :model="updateCourseForm">
        <el-form-item label="课程名">
          <el-input v-model="updateCourseForm.courseName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="课程介绍">
          <el-input v-model="updateCourseForm.courseInfo" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="updateShowDialog = false">取 消</el-button>
        <el-button type="primary" @click="updateCourse">确 定</el-button>
      </div>
    </el-dialog>
    <dialog-question :courseId="courseId" :showDialog="showDialog" @changeDia="changeDialog"></dialog-question>
  </div>
</template>

<script>
import DialogQuestion from "./DialogQuestion";
import { mapState, mapMutations, mapActions } from "vuex";
import FactoryTable from "./FactoryTable";
import {
  AddCourse,
  UpdateCourse,
  DeleteCourse,
  SelectAllCourseBySort
} from "../api/course_api";
export default {
  name: "course",
  data() {
    return {
      sortOptions: [],
      showDialog: false,
      updateShowDialog: false,
      addShowDialog: false,
      courseId: null,
      showCourseId: null,
      list: [], // table数据
      addCourseForm: {},
      updateCourseForm: {},
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
          prop: "course_name",
          label: "课程名称",
          align: "center",
          isShow: true
        },
        {
          prop: "name",
          label: "任课教师",
          align: "center",
          isShow: true
        },
        {
          prop: "sort_name",
          label: "所属分类",
          align: "center",
          isShow: true
        },
        {
          prop: "course_info",
          label: "课程介绍",
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
            label: "查看题库",
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
      }, // 列操作按钮
      sourceList: []
    };
  },
  created() {
    this.setOptions();
    this.list = this.courseList;
  },
  methods: {
    ...mapActions(["selectAllCourse"]),
    getCourseList() {
      SelectAllCourseBySort({ params: { sortId: this.showCourseId } }).then(
        res => {
          console.log(res);
          if (res && res.data) {
            this.list = res.data;
          }
        }
      );
    },
    //图片列表改变事件
    imgChange(f, fl) {
      console.log(fl);
      this.sourceList = fl;
    },
    handleUploadSuccess(res, file, fileList) {
      console.log(res, file, fileList);
      this.addCourseForm.courseUrl = res.data.url;
    },
    handleUploadListSuccess(res, file, fileList) {
      console.log(res, file, fileList);
      this.sourceList = fileList;
      let name = [];
      let url = [];
      this.sourceList.map(v => {
        name.push(v.response.data.name);
        url.push(v.response.data.url);
      });
      console.log(name, url);
      this.addCourseForm.courseSourceUrl = url.join(",");
      this.addCourseForm.courseSourceName = name.join(",");
    },
    setOptions() {
      this.sortOptions = [];
      this.courseSortList.map(v => {
        this.sortOptions.push({ label: v.sort_name, value: v.id });
      });
    },
    handleshow(i, row) {
      console.log(row);
      if (row.teacher_id != this.userId) {
        this.$message.error("非本人发布课程不可编辑");
        return;
      }
      this.courseId = row.id;
      this.changeDialog(true);
    },
    changeDialog(i) {
      this.showDialog = i;
    },
    addDialog() {
      this.addCourseForm = {
        courseName: "",
        courseInfo: "",
        courseUrl: "",
        courseSourceUrl: "",
        courseSourceName: "",
        teacherId: this.userId,
        sortId: ""
      };
      this.addShowDialog = true;
    },
    addCourse() {
      console.log(this.addCourseForm);
      AddCourse({ params: this.addCourseForm })
        .then(res => {
          if (res && res.data) {
            this.selectAllCourse();
            this.$message.success("添加成功");
            this.addShowDialog = false;
            this.$refs["upload"].clearFiles();
            this.$refs["uploads"].clearFiles();
          } else {
            this.$message.error("出现错误");
          }
        })
        .catch(err => {
          console.log(err);
          this.$message.error("出现错误");
        });
    },
    updateCourse() {
      console.log(this.updateCourseForm);
      UpdateCourse({ params: this.updateCourseForm })
        .then(res => {
          if (res && res.data) {
            this.selectAllCourse();
            this.$message.success("编辑成功");
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
    handleEdit(index, row) {
      if (row.teacher_id != this.userId) {
        this.$message.error("非本人发布课程不可编辑");
        return;
      }
      //操作栏编辑按钮
      this.updateCourseForm = {
        courseName: row.course_name,
        courseInfo: row.course_info,
        courseUrl: row.course_url,
        courseSourceUrl: row.course_source_url,
        courseSourceName: row.course_source_name,
        courseId: row.id
      };
      this.updateShowDialog = true;
      console.log(" index:", index);
      console.log(" row:", row);
    },
    handledel(index, row) {
      //操作栏删除按钮
      console.log(" index:", index);
      console.log(" row:", row);
      if (row.teacher_id != this.userId) {
        this.$message.error("非本人发布课程不可编辑");
        return;
      }
      this.$confirm("删除后，该课程下所有的试卷，资源以及考试记录都会被删除？")
        .then(_ => {
          DeleteCourse({ params: { courseId: row.id } }).then(res => {
            console.log(res);
            this.$message.success("删除成功");
            this.selectAllCourse();
          });
        })
        .catch(_ => {});
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
  watch: {
    courseList: function(val) {
      this.list = val;
    },
    courseSortList: function() {
      this.setOptions();
    },
    showCourseId:function(){
      this.getCourseList()
    }
  },
  components: {
    FactoryTable,
    DialogQuestion
  }
};
</script>

<style scoped>
</style>