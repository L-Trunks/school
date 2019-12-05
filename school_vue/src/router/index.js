import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Index from '../views/Index.vue'
import Mains from '../components/Mains.vue'
import Course from '../components/Course.vue'
import HomeWork from '../components/HomeWork.vue'
import SchoolReport from '../components/SchoolReport.vue'
import UserManagement from '../components/UserManagement.vue'
import CourseSort from '../components/CourseSort.vue'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/index',
    name: 'index',
    component: Index,
    children: [
      {
        path: '',
        component: Mains
      },
      {
        path: '/index/course',
        component: Course
      },
      {
        path: '/index/homework',
        component: HomeWork
      },
      {
        path: '/index/report',
        component: SchoolReport
      },
      {
        path: '/index/user',
        component: UserManagement
      },
      {
        path: '/index/courseSort',
        component: CourseSort
      }
    ]
  }
]

const router = new VueRouter({
  routes
})


export default router
