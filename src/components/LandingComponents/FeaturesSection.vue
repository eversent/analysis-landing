<script>
import { ClipboardIcon, GlobeAltIcon, ExclamationTriangleIcon, WrenchScrewdriverIcon } from '@heroicons/vue/24/outline';

export default {
  name: "FeaturesSection",
  data(){
    return {
      features: [
        {
          title: "Optimize Your Content Strategy",
          description: "Identify what works and create content that resonates with your audience.",
          icon: ClipboardIcon,
        },
        {
          title: "See the True Impact of Your Content",
          description: "See your growth and adjust your approach to stay relevant and consistently impactful.",
          icon: GlobeAltIcon,
        },
        {
          title: "Find Potential Collaborators",
          description: "Get reports from other users and determine if they are compatible for possible collaborations.",
          icon: WrenchScrewdriverIcon,
        },
        {
          title: "Avoid Content Red Flags",
          description: "Stay compliant with platform guidelines to protect your reach and maintain your audience.",
          icon: ExclamationTriangleIcon,
        },
      ]
    }
  }
}
</script>

<template>
  <div class=" px-12 md:px-24">
  <div class="bg-white/8 mb-28 rounded-3xl p-10 flex flex-col gap-10 md:flex-row justify-between items-center shadow-lg">
    <div v-for="(item, index) in features" :key="index" class="text-center flex-1">
      <component :is="item.icon" class="h-12 w-12 text-green-light mx-auto" />
      <h3 class="mt-4 text-lg font-semibold text-white">{{ item.title }}</h3>
      <p class="mt-2 text-gray-300 text-sm">{{ item.description }}</p>
    </div>
  </div>
  </div>
</template>

<style scoped>

</style>