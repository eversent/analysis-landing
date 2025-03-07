<script>
import axios from "axios";
import { SERVER_HOST } from "../../config/config.js";
import ReportInProgressPage from "./ReportInProgressPage.vue";
import StatisticsPage from "./StatisticsPage.vue";

export default {
  name: "AnalysisPage",
  components: {
    StatisticsPage,
    ReportInProgressPage
  },
  data() {
    return {
      report: null,
      intervalId: null
    };
  },
  computed: {
    isCompleted() {
      return this.report && this.report.status === "COMPLETED";
    }
  },
  methods: {
    async fetchAnalysis() {
      const url = this.$route.query.url;
      if (!url) {
        this.$router.push("/");
        return;
      }

      try {
        const response = await axios.get(`${SERVER_HOST}/api/v2/report-demo?url=${encodeURIComponent(url)}`);
        this.report = response.data;

        if (this.isCompleted) {
          clearInterval(this.intervalId); // Stop polling once completed
        }
      } catch (error) {
        console.error("Error fetching report:", error);
      }
    }
  },
  mounted() {
    this.fetchAnalysis(); // Fetch initially

    this.intervalId = setInterval(() => {
      this.fetchAnalysis();
    }, 5000); // Poll every 3 seconds
  },
  beforeUnmount() {
    clearInterval(this.intervalId); // Cleanup when component is destroyed
  }
};
</script>

<template>
  <ReportInProgressPage v-if="!isCompleted" :stage="report?.stage || 'SCRAPING'"/>
  <StatisticsPage v-else :report-props="report"/>
</template>

<style scoped>
</style>