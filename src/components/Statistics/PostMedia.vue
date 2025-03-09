<template>
  <div class="relative md:col-span-2 col-span-12 flex flex-col items-center">
    <!-- Media display: video or image based on mediaType -->
    <div class="relative w-full">
      <template v-if="currentMedia.mediaType === 'video'">
        <video
            class="w-full h-auto z-50 max-h-60 object-cover rounded-xl"
            :src="currentMedia.url"
            controls
        />
      </template>
      <template v-else-if="currentMedia.mediaType === 'image'">
        <img
            :src="currentMedia.url"
            alt="Post"
            class="w-full h-auto max-h-60 object-cover rounded-xl"
        />
      </template>

      <!-- Carousel Arrows -->
      <div
          v-if="post.media.length > 1"
          class="absolute inset-0 z-10 flex items-center justify-between px-4 pointer-events-none"
      >
        <!-- Left arrow -->
        <div>
          <button
              v-if="currentIndex > 0"
              @click="prevMedia"
              class="bg-black bg-opacity-50 text-white p-2 rounded-full focus:outline-none pointer-events-auto"
          >
            <ChevronLeftIcon class="h-6 w-6" />
          </button>
        </div>
        <!-- Right arrow -->
        <div>
          <button
              v-if="currentIndex < post.media.length - 1"
              @click="nextMedia"
              class="bg-black bg-opacity-50 text-white p-2 rounded-full focus:outline-none pointer-events-auto"
          >
            <ChevronRightIcon class="h-6 w-6" />
          </button>
        </div>
      </div>
    </div>

    <!-- Media indicator dots -->
    <div v-if="post.media.length > 1" class="flex gap-1 mt-3 justify-center">
      <span
          v-for="(index) in post.media"
          :key="index"
          class="w-2 h-2 rounded-full"
          :class="{
          'bg-white': index === currentIndex,
          'bg-gray-400': index !== currentIndex
        }"
      ></span>
    </div>

    <!-- Post metrics (likes and comments) -->
    <div class="flex lg:gap-12 gap-6 mt-3 justify-center">
      <div class="flex flex-col items-center gap-2">
        <HeartIcon class="h-7 w-7 text-white rounded-full"/>
        <span class="text-white text-xs font-semibold">
          {{ post.metrics.likes }}
        </span>
      </div>
      <div class="flex flex-col items-center gap-2">
        <ChatBubbleBottomCenterTextIcon class="h-7 w-7 text-white rounded-full"/>
        <span class="text-white text-xs font-semibold">
          {{ post.metrics.comments }}
        </span>
      </div>
    </div>

    <!-- Post caption with "Show More / Show Less" -->
    <div v-if="post.caption" class="mt-2 text-sm text-white inline px-4">
      <!-- The caption text container is inline-block so the toggle can appear right after -->
      <div>
      <span
          ref="captionRef"
          class="inline-block align-bottom overflow-hidden transition-all duration-300 ease-in-out"
          :style="{ maxHeight: isExpanded ? fullHeight + 'px' : collapsedHeight + 'px' }"
      >
        {{ post.caption }}
      </span>
        <button
            v-if="showToggleButton"
            @click="toggleExpanded"
            class="inline text-blue-400 focus:outline-none ml-1"
        >
          {{ isExpanded ? 'Show less' : '...more' }}
        </button>
      </div>

      <!-- Toggle button appears inline -->

    </div>
  </div>
</template>

<script>
import {ref, computed, onMounted, nextTick} from 'vue'
// Import arrow icons from Heroicons (adjust import based on your project setup)
import {ChevronLeftIcon, ChevronRightIcon, HeartIcon, ChatBubbleBottomCenterTextIcon} from '@heroicons/vue/24/outline'
// Make sure HeartIcon and ChatBubbleBottomCenterTextIcon are imported as well

export default {
  name: 'PostMedia',
  props: {
    post: {
      type: Object,
      required: true,
    },
  },
  components: {
    ChevronLeftIcon,
    ChevronRightIcon,
    HeartIcon,
    ChatBubbleBottomCenterTextIcon,
    // Include HeartIcon and ChatBubbleBottomCenterTextIcon in your project as needed
  },
  setup(props) {
    // -- Carousel / Media index --
    const currentIndex = ref(0)
    const currentMedia = computed(() => props.post.media[currentIndex.value])

    const nextMedia = () => {
      if (currentIndex.value < props.post.media.length - 1) {
        currentIndex.value++
      }
    }

    const prevMedia = () => {
      if (currentIndex.value > 0) {
        currentIndex.value--
      }
    }

    // -- Show More / Show Less for Caption --
    const isExpanded = ref(false)
    const showToggleButton = ref(false)
    const collapsedHeight = 60 // px (the initial "collapsed" height)
    const fullHeight = ref(collapsedHeight) // will be measured dynamically
    const captionRef = ref(null)

    // After the component mounts, measure the caption's full height
    onMounted(() => {
      nextTick(() => {
        if (captionRef.value) {
          fullHeight.value = captionRef.value.scrollHeight
          // If the caption is taller than collapsedHeight, show the toggle
          if (fullHeight.value > collapsedHeight) {
            showToggleButton.value = true
          }
        }
      })
    })

    const toggleExpanded = () => {
      isExpanded.value = !isExpanded.value
    }

    return {
      currentIndex,
      currentMedia,
      nextMedia,
      prevMedia,
      isExpanded,
      showToggleButton,
      collapsedHeight,
      fullHeight,
      captionRef,
      toggleExpanded,
    }
  },
}
</script>