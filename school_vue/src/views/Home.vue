<template>
  <div class="home">
    <el-form
      :model="loginData"
      ref="loginData"
      :rules="loginRules"
      v-if="!isRegister"
      label-position="left"
      label-width="0px"
      class="demo-ruleForm login-container"
    >
      <h3 class="title">登录</h3>
      <el-select
        style="margin:5px 0;width:120px"
        size="mini"
        @change="initForm"
        v-model="loginValue"
        placeholder="请选择"
      >
        <el-option
          v-for="item in loginOptions"
          :key="item.value"
          :label="item.label"
          :value="item.value"
        ></el-option>
      </el-select>
      <el-form-item v-if="loginValue == '0'" prop="studentNumber">
        <el-input
          type="text"
          maxlength="11"
          v-model="loginData.studentNumber"
          auto-complete="off"
          placeholder="请输入学号"
        ></el-input>
      </el-form-item>
      <el-form-item v-else prop="teacherNumber">
        <el-input
          type="text"
          v-model="loginData.teacherNumber"
          maxlength="11"
          auto-complete="off"
          placeholder="请输入编号"
        ></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          type="password"
          v-model="loginData.passWord"
          auto-complete="off"
          placeholder="请输入密码"
        ></el-input>
      </el-form-item>
      <el-checkbox v-model="checked" checked class="remember">记住密码</el-checkbox>
      <el-form-item style="width:100%;">
        <el-button type="success" style="width:100%;" @click="login" :loading="logining">登录</el-button>
      </el-form-item>
      <el-button size="mini" type="info" @click="isRegister = true" class="remember">立即注册</el-button>
      <div class="background">
        <img src="../assets/lgbg.png" alt />
      </div>
    </el-form>
    <el-form
      v-if="isRegister"
      :model="registerData"
      ref="registerData"
      :rules="registerRules"
      label-position="left"
      label-width="0px"
      class="demo-ruleForm register-container"
    >
      <h3 class="title">在此注册</h3>
      <el-select
        style="margin:5px 0;width:100px"
        @change="initForm"
        size="mini"
        v-model="registerValue"
        placeholder="请选择"
      >
        <el-option
          v-for="item in registerOptions"
          :key="item.value"
          :label="item.label"
          :value="item.value"
        ></el-option>
      </el-select>
      <el-form-item v-if="registerValue == '0'" prop="studentNumber">
        <el-input
          type="text"
          maxlength="11"
          v-model="registerData.studentNumber"
          auto-complete="off"
          placeholder="请输入学号"
        ></el-input>
      </el-form-item>
      <el-form-item v-else prop="teacherNumber">
        <el-input
          type="text"
          v-model="registerData.teacherNumber"
          maxlength="11"
          auto-complete="off"
          placeholder="请输入编号"
        ></el-input>
      </el-form-item>
      <el-form-item prop="name">
        <el-input type="text" v-model="registerData.name" auto-complete="off" placeholder="请输入真实姓名"></el-input>
      </el-form-item>
      <el-form-item prop="userName">
        <el-input
          type="text"
          v-model="registerData.userName"
          auto-complete="off"
          placeholder="请输入昵称"
        ></el-input>
      </el-form-item>

      <el-form-item prop="passWord">
        <el-input
          type="password"
          v-model="registerData.passWord"
          auto-complete="off"
          placeholder="请设置密码"
        ></el-input>
      </el-form-item>
      <el-form-item prop="passWord2">
        <el-input
          type="password"
          v-model="registerData.passWord2"
          auto-complete="off"
          placeholder="请再次输入密码"
        ></el-input>
      </el-form-item>
      <el-form-item prop="email">
        <el-input type="email" v-model="registerData.email" auto-complete="off" placeholder="请输入邮箱"></el-input>
      </el-form-item>
      <el-checkbox v-model="checked" checked class="remember">记住密码</el-checkbox>
      <el-form-item style="width:100%;">
        <el-button type="success" style="width:100%;" @click="register" :loading="logining">注册</el-button>
      </el-form-item>
      <el-button size="mini" type="info" @click="isRegister = false" class="remember">立即登录</el-button>
      <div class="background">
        <img src="../assets/lgbg.png" alt />
      </div>
    </el-form>
  </div>
</template>

<script>
import {
  StudentLogin, //学生登录
  TeacherLogin, //教师
  AdminLogin, //管理员
  StudentRegister, //学生注册
  TeacherRegister //教师，管理员
} from "../api/user_api";
import { mapState, mapMutations, mapActions } from "vuex";
export default {
  name: "home",
  data() {
    let checkpassWord = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        if (this.registerData.passWord2 !== "") {
          this.$refs.registerData.validateField("checkconfirmPassWord");
        }
        callback();
      }
    };
    let checkconfirmPassWord = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.registerData.passWord) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    function checkEmail(text) {
      if (!text) {
        return false;
      }
      if (text.match(/qq\.com$/)) {
        return -1;
      }
      if (!text.match(/^\w+([._-]\w+)*@(\w+\.)+\w+$/)) {
        return false;
      }
      return true;
    }
    let emailCheck = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入邮箱"));
      } else {
        let check = checkEmail(value);
        if (check) {
          callback();
        } else {
          callback(new Error("请输入正确的邮箱格式!"));
        }
      }
    };
    return {
      logining: false,
      checked: true,
      loginValue: "0",
      registerValue: "0",
      loginOptions: [
        {
          value: "0",
          label: "学生登录"
        },
        {
          value: "1",
          label: "教师登录"
        },
        {
          value: "2",
          label: "管理员登录"
        }
      ],
      registerOptions: [
        {
          value: "0",
          label: "学生注册"
        },
        {
          value: "1",
          label: "教师注册"
        },
        {
          value: "2",
          label: "管理员注册"
        }
      ],
      loginData: {
        studentNumber: null,
        passWord: null,
        teacherNumber: null
      },
      registerData: {
        userName: null,
        name: null,
        introduce: null,
        studentNumber: null,
        teacherNumber: null,
        passWord: null,
        email: null,
        permission: null,
        passWord2: null
      },
      loginRules: {
        studentNumber: [
          { required: true, message: "请输入学号", trigger: "blur" },
          { min: 11, max: 11, message: "请输入正确的学号", trigger: "blur" }
        ],
        teacherNumber: [
          { required: true, message: "请输入编号", trigger: "blur" },
          { min: 11, max: 11, message: "请输入正确的编号", trigger: "blur" }
        ],
        passWord: [{ required: true, message: "请输入密码", trigger: "blur" }]
      },
      registerRules: {
        studentNumber: [
          { required: true, message: "请输入学号", trigger: "blur" },
          {
            min: 11,
            max: 11,
            message: "请输入正确的学号",
            trigger: "blur"
          }
        ],
        teacherNumber: [
          { required: true, message: "请输入编号", trigger: "blur" },
          {
            min: 11,
            max: 11,
            message: "请输入正确的编号",
            trigger: "blur"
          }
        ],
        userName: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        passWord: [{ validator: checkpassWord, trigger: "blur" }],
        passWord2: [{ validator: checkconfirmPassWord, trigger: "blur" }],
        email: [{ validator: emailCheck, trigger: "blur" }]
      },
      isRegister: false
    };
  },
  methods: {
    ...mapMutations(["changeUserId", "changeLoginState", "changeUserInfo"]),
    ...mapActions(["selectUserById"]),
    //初始化表单数据
    initForm() {
      this.loginData = {
        studentNumber: null,
        passWord: null,
        teacherNumber: null
      };
      this.registerData = {
        userName: null,
        name: null,
        introduce: null,
        studentNumber: null,
        teacherNumber: null,
        passWord: null,
        email: null,
        passWord2: null,
        permission: null
      };
    },
    //登录
    login() {
      switch (this.loginValue) {
        case "0":
          StudentLogin({ params: this.loginData })
            .then(res => {
              console.log(res);
              if (res && res.data.length > 0) {
                this.changeUserInfo(res.data);
                this.changeUserId(res.data[0].user_id);
                this.changeLoginState(true);
                this.$message.success("登录成功");
                this.$router.push('/index')
              } else {
                this.$message.error("登录失败");
                return;
              }
            })
            .catch(err => {
              console.log(err);
              this.$message.error("服务器跑丢了");
            });
          break;
        case "1":
          TeacherLogin({ params: this.loginData })
            .then(res => {
              console.log(res);
              if (res && res.data.length > 0) {
                this.changeUserInfo(res.data);
                this.changeUserId(res.data[0].user_id);
                this.changeLoginState(true);
                this.$message.success("登录成功");
                this.$router.push('/index')
              } else {
                this.$message.error("登录失败");
                return;
              }
            })
            .catch(err => {
              console.log(err);
            });
          break;
        case "2":
          AdminLogin({ params: this.loginData })
            .then(res => {
              console.log(res);
              if (res && res.data.length > 0) {
                this.changeUserInfo(res.data);
                this.changeUserId(res.data[0].user_id);
                this.changeLoginState(true);
                this.$message.success("登录成功");
                this.$router.push('/index')
              } else {
                this.$message.error("登录失败");
                return;
              }
            })
            .catch(err => {
              console.log(err);
              this.$message.error("服务器跑丢了");
            });
          break;
      }
    },
    //注册
    register() {
      switch (this.loginValue) {
        case "0":
          StudentRegister({ params: this.registerData })
            .then(res => {
              console.log(res);
              if (res.data && res.data.insertId) {
                this.selectUserById(res.data.insertId);
                this.changeUserId(res.data.insertId);
                this.changeLoginState(true);
                this.$message.success('注册成功,已自动登录')
                this.$router.push('/index')
              } else {
                this.$message.error("注册失败，请检查输入格式");
                return;
              }
            })
            .catch(err => {
              console.log(err);
              this.$message.error("服务器跑丢了");
            });
          break;
        case "1":
          TeacherRegister({ params: { ...this.registerData, permission: "1" } })
            .then(res => {
              console.log(res);
              if (res.data && res.data.insertId) {
                this.selectUserById(res.data.insertId);
                this.changeUserId(res.data.insertId);
                this.changeLoginState(true);
                this.$message.success('注册成功,已自动登录')
                this.$router.push('/index')
              } else {
                this.$message.error("注册失败，请检查输入格式");
                return;
              }
            })
            .catch(err => {
              console.log(err);
              this.$message.error("服务器跑丢了");
            });
          break;
        case "2":
          TeacherRegister({ params: { ...this.registerData, permission: "2" } })
            .then(res => {
              console.log(res);
              if (res.data && res.data.insertId) {
                this.selectUserById(res.data.insertId);
                this.changeUserId(res.data.insertId);
                this.changeLoginState(true);
                this.$message.success('注册成功,已自动登录')
                this.$router.push('/index')
              } else {
                this.$message.error("注册失败，请检查输入格式");
                return;
              }
            })
            .catch(err => {
              console.log(err);
              this.$message.error("服务器跑丢了");
            });
          break;
      }
    }
  },
  computed: {
    ...mapState({
      loginState: state => state.loginState,
      userId: state => state.userId,
      userInfo: state => state.userInfo
    })
  },
  components: {}
};
</script>
<style scoped>
.home {
  overflow: hidden;
}
.background {
  position: absolute;
  z-index: -9999;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
}
.login-container,
.register-container {
  -webkit-border-radius: 5px;
  border-radius: 5px;
  -moz-border-radius: 5px;
  background-clip: padding-box;
  margin: 100px auto;
  width: 30%;
  padding: 35px 35px 15px 35px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
  /* height: 500px; */
}
.title {
  margin: 0px auto 40px auto;
  text-align: center;
  color: #505458;
}
.remember {
  margin: 0px 0px 35px 0px;
}
</style>
