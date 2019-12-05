import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './plugins/element.js'

Vue.config.productionTip = false
const whiteList = ['/']// 免登录白名单

router.beforeEach((to, from, next) => {
  console.log(store.state)
  if (store.state.loginState&&store.state.userId) {
    next()
  } else {
    /* has no token*/
    if (whiteList.indexOf(to.path) !== -1) { // 在免登录白名单，直接进入
      next()
    } else {
      next('/') // 否则全部重定向到登录页
    }
  }
})
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
