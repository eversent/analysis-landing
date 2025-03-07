<script>
export default {
  name: "ReportInProgressPage",
  props: {
    stage: {
      type: String,
    },
    status: {
      type: String,
    }
  },
  data() {
    return {
      dotsCount: 0,
      intervalId: null,
      widthContainer: 33
    };
  },
  computed: {
    statusLabel() {
      let statusLowered = this.stage.toLowerCase();
      let formattedStatus = statusLowered.charAt(0).toUpperCase() + statusLowered.slice(1);
      return formattedStatus + ".".repeat(this.dotsCount);
    },
    calculateWidth() {
      switch (this.stage) {
        case "SCRAPING":
          this.widthContainer = 33;
          break;
        case "UPLOADING":
          this.widthContainer = 66;
          break;
        case "ANALYSIS":
          this.widthContainer = 99;
          break;
      }
      return `${this.widthContainer}%`;
    }
  },
  mounted() {
    this.intervalId = setInterval(() => {
      this.dotsCount = (this.dotsCount + 1) % 4; // Cycle through 0 to 3 dots
    }, 400);
  },
  beforeUnmount() {
    clearInterval(this.intervalId);
  },
};
</script>

<template>
  <div class="flex flex-col gap-10 justify-center items-center w-full h-full">
    <img class="h-11" src="../../assets/landing/logo.png" alt="YOUPOST ANALYSIS" />
    <div class="lg:min-w-4xl md:min-w-2xl min-w-96 mb-10" v-if="status !== 'FAILED'">
      <div class="mb-1 text-lg font-medium dark:text-white">{{ statusLabel }}</div>
      <div class="w-full h-6 bg-gray-200 rounded-full dark:bg-gray-700">
        <div class="h-6 bg-blue-600 rounded-full dark:bg-primary"
             :style="{width: calculateWidth}"></div>
      </div>
    </div>
    <div class="mb-10" v-else>
      <p class="text-red-500">Something went wrong. Please, <router-link to="/" class="text-blue-500">try different account</router-link> </p>
    </div>
  </div>
</template>

<style scoped>
</style>