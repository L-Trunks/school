<template>
  <div>
    <el-button type="success" size="mini" icon="el-icon-plus" @click="addDialog">新增</el-button>
    <factory-table
      :list="list"
      @handleSelectionChange="handleSelectionChange"
      @sizeChange="getSizeChange"
      @currentPage="getCurrentPage"
      :options="options"
      :columns="columns"
      :operates="operates"
      :pageShow="false"
    >
    </factory-table>
    <el-dialog title="课程分类" :visible.sync="addShowDialog">
      <el-form :model="addSortForm">
        <el-form-item label="分类名">
          <el-input v-model="addSortForm.sortName" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="addShowDialog = false">取 消</el-button>
        <el-button type="primary" @click="addCourseSort">确 定</el-button>
      </div>
    </el-dialog>
    <el-dialog title="课程分类" :visible.sync="updateShowDialog">
      <el-form :model="updateSortForm">
        <el-form-item label="分类名">
          <el-input v-model="updateSortForm.sortName" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="updateShowDialog = false">取 消</el-button>
        <el-button type="primary" @click="updateCourseSort">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { mapState, mapMutations, mapActions } from "vuex";
import FactoryTable from "./FactoryTable";
import { AddSort, DeleteSort, UpdateSort } from "../api/course_api";
export default {
  name: "coursesort",
  data() {
    return {
        updateShowDialog:false,
      addShowDialog: false,
      handleSelection: [], //checkbox选中行
      list: [], // table数据
      addSortForm: {
        sortName: "",
        userId: null
      },
      updateSortForm:{},
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
          prop: "sort_name",
          label: "分类名",
          align: "center",
          isShow: true
        },
        {
          prop: "user_name",
          label: "添加用户",
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
    }; //return ending
  },
  created() {
    this.list = this.courseSortList;
  },
  methods: {
    ...mapActions(["selectAllSort"]),
    addDialog() {
      this.addSortForm = {
        userId: this.userId,
        sortName: ""
      };
      this.addShowDialog = true;
    },
    addCourseSort() {
      AddSort({ params: this.addSortForm })
        .then(res => {
          console.log(res);
          if (res.data) {
            this.$message.success("添加成功");
            this.selectAllSort();
            this.addShowDialog = false;
          } else {
            this.$message.error("服务器跑丢了");
          }
        })
        .catch(err => {
          console.log(err);
          this.$message.error("服务器跑丢了");
        });
    },
    updateCourseSort(){
        UpdateSort({ params: this.updateSortForm })
        .then(res => {
          console.log(res);
          if (res.data) {
            this.$message.success("编辑成功");
            this.selectAllSort();
            this.updateShowDialog = false;
          } else {
            this.$message.error("服务器跑丢了");
          }
        })
        .catch(err => {
          console.log(err);
          this.$message.error("服务器跑丢了");
        });

    },
    handleSelectionChange(val) {
      //checkbox选中的数据val 是选中行的所有数组
      this.handleSelection = val;
    },
    getSizeChange(val) {
      //table组件发射的方法 用于改变每页数据量
      this.page.pageSize = val;
      //这下面需要重新调用 获取列表页的函数
    },
    getCurrentPage(val) {
      //table组件发射的方法  用于改变当前所在页码
      this.page.pageNo = val;
      //这下面需要重新调用 获取列表页的函数
    },
    handleEdit(index, row) {
      //操作栏编辑按钮
      this.updateSortForm = {
          userId:this.userId,
          sortId:row.id,
          sortName:row.sort_name
      }
      this.updateShowDialog = true
      console.log(" index:", index);
      console.log(" row:", row);
    },
    handledel(index, row) {
      //操作栏删除按钮
      console.log(" index:", index);
      console.log(" row:", row);
      this.$confirm("确认删除吗？")
        .then(_ => {
            DeleteSort({params:{sortId:row.id}}).then(res=>{
                console.log(res)
                this.$message.success('删除成功')
                this.selectAllSort()
            })
        })
        .catch(_ => {
          done();
        });
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
    courseSortList: function(val) {
      this.list = val;
    }
  },
  components: {
    FactoryTable
  }
};
</script>

<style scoped>
</style>