import { get, post } from './http'


/**
 * 获取所有课程列表
 */
export const SelectAllCourse = () => {
    return get('/course/select_all_course')
}
/**
 * 根据分类查询课程列表
 */
export const SelectAllCourseBySort = (params) => {
    return get('/course/select_all_course_by_sort', params)
}
/**
 * 根据id查询课程信息
 */
export const SelectAllCourseById = (params) => {
    return get('/course/select_all_course_by_id', params)
}
/**
 * 根据老师查询课程列表
 */
export const SelectAllCourseByTea = (params) => {
    return get('/course/select_all_course_by_tea', params)
}
/**
 * 根据课程查询该门课程学生列表
 */
export const SelectAllStudentByCource = (params) => {
    return get('/course/select_all_student_by_cource', params)
}
/**
 * 删除课程
 */
export const DeleteCourse = (params) => {
    return post('/course/delete_course', params)
}

/**
 * 编辑课程
 */
export const UpdateCourse = (params) => {
    return post('/course/update_course', params)
}

/**
 * 添加课程
 */
export const AddCourse = (params) => {
    return post('/course/add_course', params)
}

/**
 * 学生添加课程
 */
export const StudentAddCourse = (params) => {
    return post('/course/student_add_course', params)
}

/**
 * 根据学生查询课程id
 */
export const SelectCourseIdByStudent = (params) => {
    return post('/course/select_course_id_by_student', params)
}
/**
 * 查询所有题库
 */
export const SelectQllQuestion = (params) => {
    return post('/course/select_all_question', params)
}

/**
 * 根据课程查询题库
 */
export const SelectAllQuestionByCourse = (params) => {
    return post('/course/select_all_question_by_course', params)
}

/**
 * 根据id查询题目信息
 */
export const SelectQuestionsById = (params) => {
    return post('/course/select_questions_by_id', params)
}

/**
 * 添加题目
 */
export const AddQuestion = (params) => {
    return post('/course/add_question', params)
}

/**
 * 删除题目
 */
export const DeleteQuestion = (params) => {
    return post('/course/delete_question', params)
}

/**
 * 修改题目
 */
export const UpdateQuestion = (params) => {
    return post('/course/update_question', params)
}

/**
 * 查询所有课程分类
 */
export const SelectAllSort = (params) => {
    return post('/course/select_all_sort', params)
}

/**
 * 根据id查询分类信息
 */
export const SelectSortById = (params) => {
    return post('/course/select_sort_by_id', params)
}
/**
 * 删除分类
 */
export const DeleteSort = (params) => {
    return post('/course/delete_sort', params)
}
/**
 * 编辑分类
 */
export const UpdateSort = (params) => {
    return post('/course/update_sort', params)
}
/**
 * 添加分类
 */
export const AddSort = (params) => {
    return post('/course/add_sort', params)
}
/**
 * 根据老师查询试卷列表
 */
export const SelectAllPaperByTea = (params) => {
    return post('/course/select_all_paper_by_tea', params)
}
/**
 * 获取所有试卷列表
 */
export const SelectAllPaper = (params) => {
    return post('/course/select_all_paper', params)
}
/**
 * 根据课程查询试卷
 */
export const SelectAllPaperByCourse = (params) => {
    return post('/course/select_all_paper_by_course', params)
}
/**
 * 根据id查询试卷信息
 */
export const SelectPaperById = (params) => {
    return post('/course/select_paper_by_id', params)
}
/**
 * 新增试卷
 */
export const AddPaper = (params) => {
    return post('/course/add_paper', params)
}
/**
 * 编辑试卷
 */
export const UpdatePaper = (params) => {
    return post('/course/update_paper', params)
}

/**
 * 删除试卷
 */
export const DeletePaper = (params) => {
    return post('/course/delete_paper', params)
}
/**
 * 添加考试记录
 */
export const AddReport = (params) => {
    return post('/course/add_report', params)
}
/**
 * 查询所有考试记录
 */
export const SelectAllReport = (params) => {
    return post('/course/select_all_report', params)
}
/**
 * 根据学生id查询考试记录
 */
export const SelectReportByStudent = (params) => {
    return post('/course/select_report_by_student', params)
}

/**
 * 根据试卷查询考试记录
 */
export const SelectReportByPaper = (params) => {
    return get('/course/select_report_by_paper', params)
}
