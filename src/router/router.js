import {createRouter, createWebHistory} from 'vue-router'
import LandingPage from "../views/LandingPage/LandingPage.vue";
import StatisticsPage from "../views/LandingPage/StatisticsPage.vue";



const routes = [
    { path: '/', component: LandingPage },
    { path: '/statistics', component: StatisticsPage },
]

export const router = createRouter({
    history: createWebHistory(),
    routes,
})