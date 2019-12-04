import {
SelectAllCourse,
SelectAllSort
} from '../api/course_api'
import {
    SelectUserById, //获取用户信息
} from '../api/user_api'

const actions = {
    //改变用户信息actions
    selectUserById(context, params) {
        SelectUserById({ params: params }).then(res => {
            context.commit('changeUserInfo', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    },
    //获取所有课程
    selectAllCourse(context, params) {
        SelectAllCourse({ params: params }).then(res => {
            context.commit('changeCourseList', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    },
    //获取所有课程分类
    selectAllSort(context, params) {
        SelectAllSort({ params: params }).then(res => {
            context.commit('changeCourseSortList', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    }


}

export default actions;