<script>
import { CloudArrowUpIcon, LockClosedIcon, ServerIcon } from '@heroicons/vue/20/solid'
export default {
  name: "ToolsSection",
  data(){
    return{
      features: [
        {
          name: 'Analytics.',
          description: 'A detailed evaluation of key metrics, including engagement rates and performance highlights.',
          icon: CloudArrowUpIcon,
        },
        {
          name: 'SSL certificates.',
          description: 'Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure qui lorem cupidatat commodo.',
          icon: LockClosedIcon,
        },
        {
          name: 'Database backups.',
          description: 'Ac tincidunt sapien vehicula erat auctor pellentesque rhoncus. Et magna sit morbi lobortis.',
          icon: ServerIcon,
        },
      ]
    }
  }
}
</script>

<template>
  <div class="overflow-hidden py-24 sm:py-32">
    <div class="mx-auto max-w-7xl px-6 lg:px-8">
      <div class="mx-auto grid max-w-2xl grid-cols-1 gap-x-8 gap-y-16 sm:gap-y-20 lg:mx-0 lg:max-w-none lg:grid-cols-2">
        <div class="lg:pt-4 lg:pr-8">
          <div class="lg:max-w-lg">
            <p class="mt-2 text-4xl font-semibold tracking-tight text-pretty text-white sm:text-5xl">Maximize Your Potential with the Right Tools</p>
<!--            <p class="mt-6 text-lg/8 text-gray-300">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque, iste dolor cupiditate blanditiis ratione.</p>-->
            <dl class="mt-10 max-w-xl space-y-8 text-base/7 text-gray-300 lg:max-w-none">
              <div v-for="feature in features" :key="feature.name" class="relative pl-9">
                <dt class="inline font-semibold text-white">
                  <component :is="feature.icon" class="absolute top-1 left-1 size-5 text-indigo-500" aria-hidden="true" />
                  {{ feature.name }}
                </dt>
                {{ ' ' }}
                <dd class="inline">{{ feature.description }}</dd>
              </div>
            </dl>
          </div>
        </div>
        <img src="../../assets/landing/app_screenshots.png" alt="Product screenshot" class="w-full h-auto max-w-full rounded-xl object-contain"  />
      </div>
    </div>
  </div>
</template>

<style scoped>

</style>