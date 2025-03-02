<script>
import {
  UserIcon,
  SparklesIcon,
  HeartIcon,
  ChatBubbleBottomCenterTextIcon,
  PaperAirplaneIcon,
  ClipboardIcon,
  PresentationChartBarIcon,
  ArrowTrendingUpIcon,
  ExclamationTriangleIcon,
    HashtagIcon
} from "@heroicons/vue/24/outline";
import PrimaryButton from "../../components/Common/PrimaryButton.vue";

export default {
  name: "StatisticsPage",
  components: {
    PrimaryButton,
    UserIcon,
    SparklesIcon,
    HeartIcon,
    ChatBubbleBottomCenterTextIcon,
    PaperAirplaneIcon,
    ClipboardIcon,
    PresentationChartBarIcon,
    ArrowTrendingUpIcon,
    ExclamationTriangleIcon,
    HashtagIcon
  }
}
</script>

<template>
  <div class="mx-4 md:mx-24 my-6">
    <img class="h-11" src="../../assets/landing/logo.png" alt="YOUPOST ANALYSIS"/>
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 mt-12">
      <!-- Left Column -->
      <div class="lg:col-span-3 col-span-12 flex flex-col gap-8">
        <div class="bg-white/10 rounded-3xl border border-white/20 border-2 p-3 flex flex-col justify-center items-center gap-4 w-full">
          <span class="text-green-light font-semibold text-3xl">Analysis is ready!</span>
          <p class="text-white text-center">These results are based on the three latest posts</p>
        </div>
        <div class="bg-white/10 rounded-3xl border border-white/20 border-2 p-4 py-6 flex flex-col items-center gap-4 w-full">
          <div class="flex gap-3 items-center w-full">
            <img class="inline-block size-14 rounded-full"
                 src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                 alt=""/>
            <span class="text-white overflow-hidden truncate">@officialjanedoe27</span>
          </div>
          <div class="flex gap-10 items-center justify-center">
            <div class="flex text-white flex-col">
              <span class="text-center">378M</span>
              <span class="text-xs">Followers</span>
            </div>
            <div class="flex text-white flex-col">
              <span class="text-center">2142</span>
              <span class="text-xs">Following</span>
            </div>
          </div>
          <div class="flex flex-col w-full px-4 gap-2 text-sm">
            <div class="flex gap-2">
              <UserIcon class="h-7 w-7 text-white rounded-full"/>
              <span class="text-white text-xl font-semibold">About this profile</span>
            </div>
            <p class="text-white">
              This fitness-focused account provides workout routines, nutrition tips, and motivational content. With an
              emphasis on strength training, healthy habits, and mindset coaching, it appeals to individuals looking to
              improve their fitness, build consistency, and achieve long-term wellness.
            </p>
            <hr class="text-white font-bold"/>
            <div class="flex gap-2">
              <SparklesIcon class="h-7 w-7 text-white rounded-full"/>
              <span class="text-white text-xl font-semibold">Style</span>
            </div>
            <div class="mt-1 text-xs">
              <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Personal Brand</span>
              <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Health</span>
              <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Niche Interest</span>
              <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Business</span>
            </div>
          </div>
        </div>
        <div class="bg-white/10 rounded-3xl border border-white/20 border-2 p-3 flex flex-col justify-center items-center gap-4 w-full">
          <span class="text-green-light font-semibold text-3xl text-center">Take it to the next level!</span>
          <p class="text-white text-center">Get report for the previous posts.</p>
          <PrimaryButton text="Get Full Report"/>
        </div>
      </div>
      <!-- Right Column -->
      <div class="lg:col-span-9 col-span-12 flex flex-col gap-8">
        <div class="bg-white/10 object-contain rounded-3xl border border-white/20 border-2 p-4 py-6 grid grid-cols-1 md:grid-cols-8 gap-4 w-full">
          <!-- Post Image and Stats -->
          <div class="md:col-span-2 col-span-12 flex flex-col items-center">
            <img src="https://placehold.co/400x500" alt="Post"
                 class="w-full h-auto max-h-60 object-cover rounded-xl"/>
            <div class="flex lg:gap-12 gap-6 mt-3 justify-center">
              <div class="flex flex-col items-center gap-2">
                <HeartIcon class="h-7 w-7 text-white rounded-full"/>
                <span class="text-white text-xs font-semibold">2142</span>
              </div>
              <div class="flex flex-col items-center gap-2">
                <ChatBubbleBottomCenterTextIcon class="h-7 w-7 text-white rounded-full"/>
                <span class="text-white text-xs font-semibold">2,3M</span>
              </div>
              <div class="flex flex-col items-center gap-2">
                <PaperAirplaneIcon class="h-7 w-7 text-white rounded-full"/>
                <span class="text-white text-xs font-semibold">12</span>
              </div>
            </div>
          </div>
          <!-- Description and Impressions -->
          <div class="md:col-span-4 col-span-12 ml-0 md:ml-5">
            <div class="flex gap-2">
              <ClipboardIcon class="h-7 w-7 text-white rounded-full"/>
              <span class="text-white text-xl font-semibold">Description</span>
            </div>
            <p class="text-white mt-4">
              This post provides an in-depth review of a face cream, analyzing its texture, ingredients, and
              effectiveness. It evaluates hydration, absorption, and performance while considering suitability for
              different skin types. The review also highlights key benefits, potential drawbacks, and ideal usage.
            </p>
            <div class="flex gap-2 mt-10">
              <PresentationChartBarIcon class="h-7 w-7 text-white rounded-full"/>
              <span class="text-white text-xl font-semibold">Impressions</span>
            </div>
            <div class="flex justify-between md:justify-start mt-3">
              <div class="flex flex-col">
                <div class="rounded-full border flex items-center gap-3 px-3 border-primary-active">
                  <ArrowTrendingUpIcon class="h-7 w-7 text-primary-active"/>
                  <span class="text-primary-active text-xs font-semibold">23%</span>
                </div>
                <span class="text-white text-center">Rate</span>
              </div>
              <div class="border-l xl:mx-8 md:mx-2 mx-4 border-l-white md:block"></div>
              <div class="flex flex-col">
                <span class="text-white text-lg">92.8K</span>
                <span class="text-white text-center">Reach</span>
              </div>
              <div class="border-l xl:mx-8 md:mx-2 mx-4 border-l-white md:block"></div>
              <div class="flex flex-col">
                <span class="text-white text-lg">92.8K</span>
                <span class="text-white text-center">Total</span>
              </div>
            </div>
          </div>
          <!-- Compliance and Hashtags -->
          <div class="md:col-span-2 col-span-12 md:border-l md:border-l-white mt-4 md:mt-0">
            <div class="lg:ml-5">
              <div class="flex gap-2">
                <ExclamationTriangleIcon class="h-7 w-7 text-white rounded-full"/>
                <span class="text-white text-xl font-semibold">Compliance</span>
              </div>
              <span class="text-white flex my-2">x Violations Categories</span>
              <div class="text-xs">
                <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Crime</span>
                <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Clickbait</span>
              </div>
              <div class="flex gap-2 mt-5">
                <HashtagIcon class="h-7 w-7 text-white rounded-full"/>
                <span class="text-white text-xl font-semibold">Hashtags Used</span>
              </div>
              <div class="text-xs mt-3">
                <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">SkinCare</span>
                <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Dermatologist</span>
                <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Dermatologist</span>
                <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">SkinCare</span>
                <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Clickbait</span>
                <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Clickbait</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


<style scoped>

</style>