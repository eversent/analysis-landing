import {createRouter, createWebHistory} from 'vue-router'
import LandingPage from "../views/LandingPage/LandingPage.vue";
import AnalysisPage from "../views/LandingPage/AnalysisPage.vue";


const routes = [
    { path: '/', component: LandingPage },
    { path: '/analysis', component: AnalysisPage }, // Allow full URL as a parameter
];

export const router = createRouter({
    history: createWebHistory(),
    routes,
})