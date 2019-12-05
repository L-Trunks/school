import { get, post } from './http'


/**
 * 学生登录
 */
export const StudentLogin = (params) => {
    return post('/user/student_login', params)
}

/**
 * 教师登录
 */
export const TeacherLogin = (params) => {
    return post('/user/teacher_login', params)
}
/**
 * 管理员登录
 */
export const AdminLogin = (params) => {
    return post('/user/admin_login', params)
}

/**
 * 学生注册
 */
export const StudentRegister = (params) => {
    return post('/user/student_register', params)
}

/**
 * 教师及管理员注册
 */
export const TeacherRegister = (params) => {
    return post('/user/teacher_register', params)
}
/**
 * 根据id查询用户信息
 */
export const SelectUserById = (params) => {
    return get('/user/select_user_by_id', params)
}

/**
 * 查询所有用户列表
 */
export const SelectAllUser = (params) => {
    return get('/user/select_all_user', params)
}

/**
 * 修改个人信息
 */
export const UpdateUserInfo = (params) => {
    return post('/user/update_user_info', params)
}
