import {

} from '../api/course_api'
import {
    // IsHasPhone, //判断手机号是否存在
    // UserLogin, //登录
    // UserRegister, //注册
    GetUserInfo, //获取用户信息
    // GetUserList, //获取用户列表
} from '../api/user_api'

const actions = {
    //改变用户信息actions
    getUserInfo(context, params) {
        GetUserInfo({ params: params }).then(res => {
            context.commit('changeUserInfo', res.data);
        }).catch(err => {
            this.$message.error(err.message && err.message || '服务器跑丢了')
        })
    }


}

export default actions;