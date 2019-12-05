import { _mysql } from "./mysql"
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const fs = require('fs');
const formidable = require('formidable');
var multer = require('multer');
//生成的图片放入uploads文件夹下
var upload = multer({ dest: 'upload/' })
const path = require('path');
app.use('/public', express.static('public'));
app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded
//设置跨域
app.all('*', function (req, res, next) {
   res.header("Access-Control-Allow-Origin", "*");
   res.header("Access-Control-Allow-Headers", "Accept,Accept-Encoding,Accept-Language,Connection,Content-Length,Content-Type, Cookie,Host,Origin,Referer,User-Agent, Authorization,X-Requested-With");
   res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
   res.header("X-Powered-By", ' 3.2.1');
   res.header("Content-Type", "application/json;charset=utf-8");
   res.header("Access-Control-Allow-Credentials", "true")
   next();
});

//学生登录
app.post('/api/school/user/student_login', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.studentLogin(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '登录失败,请检查输入格式' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "登录成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '登录成功', data: data })
      }
      mysql.close()
   })
})

//教师登录
app.post('/api/school/user/teacher_login', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.teacherLogin(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '登录失败,请检查输入格式' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "登录成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '登录成功', data: data })
      }
      mysql.close()
   })
})

//管理员登录
app.post('/api/school/user/admin_login', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.adminLogin(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '登录失败,请检查输入格式' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "登录成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '登录成功', data: data })
      }
      mysql.close()
   })
})
//学生注册
app.post('/api/school/user/student_register', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.studentRegister(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '注册失败,请检查输入格式' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "注册成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '注册成功', data: data })
      }
      mysql.close()
   })
})
//教师及管理员注册
app.post('/api/school/user/teacher_register', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.teacherRegister(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '注册失败,请检查输入格式' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "注册成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '注册成功', data: data })
      }
      mysql.close()
   })
})

//根据id查询用户信息
app.get('/api/school/user/select_user_by_id', function (req, res, next) {
   let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql(getdata)
   mysql.selectUserById(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '服务器跑丢了' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取成功', data: data })
      }
      mysql.close()
   })
})

//查询所有用户列表
app.get('/api/school/user/select_all_user', function (req, res, next) {
   // let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql()
   mysql.selectAllUser(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '服务器跑丢了' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取成功', data: data })
      }
      mysql.close()
   })
})

//修改个人信息
app.post('/api/school/user/update_user_info', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.updateUserInfo(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//获取所有课程列表
app.get('/api/school/course/select_all_course', function (req, res, next) {
   // let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql()
   mysql.selectAllCourse(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '服务器跑丢了' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取成功', data: data })
      }
      mysql.close()
   })
})
//根据分类查询课程列表
app.get('/api/school/course/select_all_course_by_sort', function (req, res, next) {
   let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql(getdata)
   mysql.selectAllCourseBySort(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '服务器跑丢了' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取成功', data: data })
      }
      mysql.close()
   })
})
//根据id查询课程信息
app.get('/api/school/course/select_all_course_by_id', function (req, res, next) {
   let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql(getdata)
   mysql.selectAllCourseById(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '服务器跑丢了' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取成功', data: data })
      }
      mysql.close()
   })
})
//根据老师查询课程列表
app.get('/api/school/course/select_all_course_by_tea', function (req, res, next) {
   let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql(getdata)
   mysql.selectAllCourseByTea(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '服务器跑丢了' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取成功', data: data })
      }
      mysql.close()
   })
})

//根据课程查询该门课程学生列表
app.get('/api/school/course/select_all_student_by_cource', function (req, res, next) {
   let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql(getdata)
   mysql.selectAllStudentByCource(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '服务器跑丢了' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取成功', data: data })
      }
      mysql.close()
   })
})

//删除课程
app.post('/api/school/course/delete_course', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.deleteCourse(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//编辑课程
app.post('/api/school/course/update_course', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.updateCourse(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//添加课程
app.post('/api/school/course/add_course', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.addCourse(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//学生添加课程
app.post('/api/school/course/student_add_course', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.studentAddCourse(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//查询所有题库
app.post('/api/school/course/select_all_question', function (req, res, next) {
   // let getdata = req.body.params
   let mysql = new _mysql()
   mysql.selectAllQuestion(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})
//根据学生查询课程id

app.post('/api/school/course/select_course_id_by_student', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.selectCourseIdByStudent(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})
//根据课程查询题库
app.post('/api/school/course/select_all_question_by_course', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.selectAllQuestionByCourse(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//根据id查询题目信息
app.post('/api/school/course/select_questions_by_id', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.selectQuestionsById(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//添加题目
app.post('/api/school/course/add_question', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.addQuestion(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//删除题目
app.post('/api/school/course/delete_question', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.deleteQuestion(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//修改题目
app.post('/api/school/course/update_question', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.updateQuestion(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//查询所有课程分类
app.post('/api/school/course/select_all_sort', function (req, res, next) {
   // let getdata = req.body.params
   let mysql = new _mysql()
   mysql.selectAllSort(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//根据id查询分类信息
app.post('/api/school/course/select_sort_by_id', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.selectSortById(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//删除分类
app.post('/api/school/course/delete_sort', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.deleteSort(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//编辑分类
app.post('/api/school/course/update_sort', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.updateSort(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//添加分类
app.post('/api/school/course/add_sort', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.addSort(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//根据老师查询试卷列表
app.post('/api/school/course/select_all_paper_by_tea', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.selectAllPaperByTea(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//获取所有试卷列表
app.post('/api/school/course/select_all_paper', function (req, res, next) {
   // let getdata = req.body.params
   let mysql = new _mysql()
   mysql.selectAllPaper(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//根据课程查询试卷
app.post('/api/school/course/select_all_paper_by_course', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.selectAllPaperByCourse(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//根据id查询试卷信息
app.post('/api/school/course/select_paper_by_id', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.selectPaperById(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//新增试卷
app.post('/api/school/course/add_paper', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.addPaper(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//编辑试卷
app.post('/api/school/course/update_paper', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.updatePaper(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//删除试卷
app.post('/api/school/course/delete_paper', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.deletePaper(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})
//添加考试记录

app.post('/api/school/course/add_report', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.addReport(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})
//查询所有考试记录
app.post('/api/school/course/select_all_report', function (req, res, next) {
   // let getdata = req.body.params
   let mysql = new _mysql()
   mysql.selectAllReport(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//根据学生id查询考试记录
app.post('/api/school/course/select_report_by_student', function (req, res, next) {
   let getdata = req.body.params
   let mysql = new _mysql(getdata)
   mysql.selectReportByStudent(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '请求成功' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "请求成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '请求成功', data: data })
      }
      mysql.close()
   })
})

//根据试卷查询考试记录
app.get('/api/school/course/select_report_by_paper', function (req, res, next) {
   let getdata = JSON.parse(req.query.params)
   let mysql = new _mysql(getdata)
   mysql.selectReportByPaper(function (error, data, fields) {
      if (error) {
         res.json({ res: 1, message: '服务器跑丢了' })
         next(error);
      } else {
         let date = new Date()
         console.log("log:" + "获取成功------" + date + '\n');
         res.status(200)
         res.json({ res: 0, message: '获取成功', data: data })
      }
      mysql.close()
   })
})

//图片上传
app.post('/api/school/upload', upload.any(), (req, res) => {
   //读取文件路径
   console.log(req)
   fs.readFile(req.files[0].path, (err, data) => {
      //如果读取失败
      if (err) { return res.send('上传失败') }
      //如果读取成功
      //声明名字为时间戳和随机数拼接成的，尽量确保唯一性
      let time = Date.now() + parseInt(Math.random() * 999) + parseInt(Math.random() * 2222);
      //拓展名
      let extname = req.files[0].mimetype.split('/')[1]
      //拼接成名字
      let keepname = time + '.' + extname
      //三个参数
      //1.绝对路径
      //2.写入的内容
      //3.回调函数
      fs.writeFile(path.join(__dirname, './public/source/' + keepname), data, (err) => {
         if (err) { return res.send('写入失败') }
         res.send({ err: 0, msg: '上传ok', data: { name: keepname, url: 'http://localhost:7788/public/source/' + keepname } })
      });
   });
})


//配置服务端口
const server = app.listen(7788, function () {

   const host = server.address().address;

   const port = server.address().port;

   console.log('Example app listening at http://%s:%s', host, port);
})