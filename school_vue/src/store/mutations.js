
const mutations = {
    changeUserId(state, params) {
        state.userId = params;
    },
    changeUserInfo(state, params) {
        state.userInfo = params;
    },
    changeCourseList(state, params) {
        state.courseList = params;
    },
    changeCourseSortList(state, params) {
        state.courseSortList = params;
    },
    changeLoginState(state, params) {
        state.loginState = params;
    },
}

export default mutations