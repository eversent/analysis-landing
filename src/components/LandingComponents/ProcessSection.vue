<script>
import {
  ShareIcon,
  CloudArrowUpIcon,
  LightBulbIcon,
  PresentationChartLineIcon
} from '@heroicons/vue/24/outline'

export default {
  name: "ProcessSection",
  data(){
    return{
      features: [
        {
          name: 'Share a link to your Instagram profile',
          icon: ShareIcon,
        },
        {
          name: 'Get a free analysis based on your three latest posts',
          icon: PresentationChartLineIcon,
        },
        {
          name: 'Obtain insights and continue your growth more effectively',
          icon: LightBulbIcon,
        },
      ]
    }
  }
}
</script>

<template>
  <div class="py-24 sm:py-32">
    <div class="mx-auto max-w-7xl px-6 lg:px-8">
      <div class="mx-auto max-w-2xl lg:text-center">
        <h2 class="mt-2 text-pretty text-4xl font-semibold tracking-tight text-white sm:text-5xl lg:text-balance">Here's how it works:</h2>
      </div>
      <div class="mx-auto mt-16 max-w-2xl sm:mt-20 lg:mt-24 lg:max-w-none">
        <dl class="grid max-w-xl grid-cols-1 gap-x-8 gap-y-16 lg:max-w-none lg:grid-cols-3">
          <div v-for="(feature, index) in features" :key="feature.name" class="flex flex-col items-center">
            <div class="flex justify-center">
            <dt class="flex flex-col justify-center items-center gap-y-3 text-base/7 font-semibold rounded-2xl text-white bg-white/10 h-64 w-64">
              <div class="flex flex-col items-center justify-center bg-green-light w-32 h-32 p-5 rounded-full">
                <component :is="feature.icon" class="size-12 flex-none text-black" aria-hidden="true" />
                <span class="text-black text-2xl">{{ index + 1 }}</span>
              </div>
              <span class="text-center max-w-54">
              {{ feature.name }}
                </span>
            </dt>
            </div>
          </div>
        </dl>
      </div>
    </div>
  </div>
</template>

<style scoped>

</style>