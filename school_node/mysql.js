//数据库类
export class _mysql {
    constructor(getdata) {
        this.mysql = require('mysql');
        this.getData = getdata;
        this.connection = this.mysql.createConnection({
            host: 'localhost',
            user: 'root',  //用户名
            password: '',   //密码
            database: 'school',
            port: '3306'     //端口号
        });


    }
    connect() {
        this.connection.connect(function (err) {
            if (err) {
                console.log('---:' + err);
                return;
            }
            console.log('连接succeed');
        });
    }
    //学生登录
    studentLogin(callback) {
        this.connection.query('select * from s_user where student_number = ? and pass_word = ? and permission = 0',
            [this.getData.studentNumber, this.getData.passWord], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //教师登录
    teacherLogin(callback) {
        this.connection.query('select * from s_user where teacher_number = ? and pass_word = ? and permission = 1',
            [this.getData.teacherNumber, this.getData.passWord], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //管理员登录
    adminLogin(callback) {
        this.connection.query('select * from s_user where teacher_number = ? and pass_word = ? and permission = 2',
            [this.getData.teacherNumber, this.getData.passWord], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //学生注册
    studentRegister(callback) {
        this.connection.query('insert into s_user (user_name,pass_word,name,email,introduce,student_number,permission) value (?,?,?,?,?,?,0)',
            [this.getData.userName, this.getData.passWord, this.getData.name, this.getData.email, this.getData.introduce,
            this.getData.studentNumber], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //教师注册
    teacherRegister(callback) {
        this.connection.query('insert into s_user (user_name,pass_word,name,email,introduce,teacher_number,permission) value (?,?,?,?,?,?,?)',
            [this.getData.userName, this.getData.passWord, this.getData.name, this.getData.email, this.getData.introduce,
            this.getData.teacherNumber, this.getData.permission], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据id查询用户信息
    selectUserById(callback) {
        this.connection.query('select * from s_user where id  =?',
            [this.getData.userId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //查询所有用户列表
    selectAllUser(callback) {
        this.connection.query('select * from s_user', function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //修改个人信息
    updateUserInfo(callback) {
        this.connection.query('update s_user set user_name=?,email=?,introduce = ? where id = ?', [this.getData.userName,
        this.getData.email, this.getData.introduce, this.getData.userId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //获取所有课程列表
    selectAllCourse(callback) {
        this.connection.query('select c.*,u.name,s.sort_name from s_course c,s_user u,s_course_sort s where c.teacher_id = u.id and c.sort_id = s.id',
            [], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据分类查询课程列表
    selectAllCourseBySort(callback) {
        this.connection.query('select c.*,u.user_name from s_course c,s_user u,s_course_sort s where c.teacher_id = u.id and c.sort_id = ?',
            [this.getData.sortId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据id查询课程信息
    selectAllCourseById(callback) {
        this.connection.query('select c.*,u.user_name,s.sort_name from s_course c,s_user u,s_course_sort s where c.teacher_id = u.id and c.sort_id = s.id and c.id = ?',
            [this.getData.courseId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据老师查询课程列表
    selectAllCourseByTea(callback) {
        this.connection.query('select c.*,u.user_name,s.sort_name from s_course c,s_user u,s_course_sort s where c.teacher_id = ? and c.sort_id = s.id and c.id = ? and c.teacher_id = u.id',
            [this.getData.teacherId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据课程查询该门课程学生列表
    selectAllStudentByCource(callback) {
        this.connection.query('select c.*,u.user_name from s_students_course_map c,s_user u where c.student_id = u.id and c.course_id = ?',
            [this.getData.courseId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //删除课程
    deleteCourse(callback) {
        this.connection.query('delete from s_course where id = ?',
            [this.getData.courseId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //编辑课程
    updateCourse(callback) {
        this.connection.query('update s_course set course_name = ?,course_info = ?,course_url = ?,course_source_url = ?,course_source_name = ? where id = ?',
            [this.getData.courseName, this.getData.courseInfo, this.getData.courseUrl, this.getData.courseSourceUrl, this.getData.courseSourceName,this.getData.courseId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //添加课程
    addCourse(callback) {
        this.connection.query('insert into s_course (course_name,course_info,teacher_id,sort_id,course_url,course_source_url,course_source_name) value (?,?,?,?,?,?,?)',
            [this.getData.courseName, this.getData.courseInfo, this.getData.teacherId, this.getData.sortId, this.getData.courseUrl, this.getData.courseSourceUrl, this.getData.courseSourceName], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //学生添加课程
    studentAddCourse(callback) {
        this.connection.query('insert into s_students_course_map (course_id,student_id) value (?,?)',
            [this.getData.courseId, this.getData.studentId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //查询所有题库
    selectAllQuestion(callback) {
        this.connection.query('select * from s_question',
            function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据课程查询题库
    selectAllQuestionByCourse(callback) {
        this.connection.query('select * from s_question where course_id = ?', [this.getData.courseId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //根据id查询题目信息
    selectQuestionsById(callback) {
        this.connection.query('select * from s_question where id = ?', [this.getData.questionId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //添加题目
    addQuestion(callback) {
        this.connection.query('insert into s_question (question_article,question_type,question_answer,is_question_answer,question_error,course_id,score) value (?,?,?,?,?,?,?)',
            [this.getData.questionArticle, this.getData.questionType, this.getData.questionAnswer, this.getData.isQuestionAnswer, this.getData.questionError,
            this.getData.courseId, this.getData.score], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //删除题目
    deleteQuestion(callback) {
        this.connection.query('delete from s_question where id = ?', [this.getData.questionId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //修改题目
    updateQuestion(callback) {
        this.connection.query('update s_question set question_article = ?,question_type = ?,question_answer = ?,is_question_answer = ?,question_error = ?,score = ? where id = ?',
            [this.getData.questionArticle, this.getData.questionType, this.getData.questionAnswer, this.getData.isQuestionAnswer, this.getData.questionError, this.getData.score,this.getData.questionId],
            function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //查询所有课程分类
    selectAllSort(callback) {
        this.connection.query('select s.*,u.user_name from s_course_sort s,s_user u where s.user_id=u.id', function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //根据id查询分类信息
    selectSortById(callback) {
        this.connection.query('select * from s_course_sort where id = ?', [this.getData.sortId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //删除分类
    deleteSort(callback) {
        this.connection.query('delete from s_course_sort where id = ?', [this.getData.sortId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //编辑分类
    updateSort(callback) {
        this.connection.query('update s_course_sort set sort_name = ?,user_id = ? where id = ?',
            [this.getData.sortName, this.getData.userId, this.getData.sortId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //添加分类
    addSort(callback) {
        this.connection.query('insert into s_course_sort (sort_name,user_id) value (?,?)', [this.getData.sortName, this.getData.userId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //根据老师查询试卷列表
    selectAllPaperByTea(callback) {
        this.connection.query('select c.course_name,p.* from s_course c,s_paper p where p.course_id = c.id and p.teacher_id = ?',
            [this.getData.teacherId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //获取所有试卷列表
    selectAllPaper(callback) {
        this.connection.query('select c.course_name,p.* from s_course c,s_paper p where p.course_id = c.id',
            [this.getData.teacherId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据课程查询试卷
    selectAllPaperByCourse(callback) {
        this.connection.query('select c.course_name,p.* from s_course c,s_paper p where p.course_id = c.id and p.course_id = ?',
            [this.getData.teacherId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据id查询试卷信息
    selectPaperById(callback) {
        this.connection.query('select c.course_name,p.* from s_course c,s_paper p where p.course_id = c.id and p.id = ?',
            [this.getData.paperId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //新增试卷
    addPaper(callback) {
        this.connection.query('insert into s_paper (course_id,question_id,teacher_id,is_show,paper_type,end_time,paper_name) value (?,?,?,?,?,?,?)',
            [this.getData.courseId, this.getData.questionIds, this.getData.teacherId, this.getData.isShow, this.getData.paperType, this.getData.endTime, this.getData.paperName],
            function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //编辑试卷
    updatePaper(callback) {
        this.connection.query('update s_paper question_id =?,is_show=?,paper_type=?,end_time=?,paper_name=? where id = ?',
            [this.getData.questionId, this.getData.isShow, this.getData.paperType, this.getData.endTime, this.getData.paperName, this.getData.paperId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //删除试卷
    deletePaper(callback) {
        this.connection.query('delete from s_paper where id = ?',
            [this.getData.paperId], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //查询所有考试记录
    selectAllReport(callback) {
        this.connection.query('select ｕ.*,p.*,r.* from s_user u,s_paper p, s_school_report r where r.student_id = u.id and r.paper_id = p.id', function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //根据学生id查询考试记录
    selectReportByStudent(callback) {
        this.connection.query('select p.*,r.* from s_paper p, s_school_report r where r.paper_id = p.id and r.student_id = ?', [this.getData.studentId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //根据试卷查询考试记录
    selectReportByPaper(callback) {
        this.connection.query('select u.*,r.* from s_user u, s_school_report r where r.student_id = u.id and r.paper_id = ?', [this.getData.paperId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //关闭数据库
    close() {
        this.connection.end(function (err) {
            if (err) {
                console.log('---:' + err);
                return;
            }
            console.log('关闭succeed');
        });
    }
}