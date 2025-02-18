<script>
import HeroSection from "../../components/LandingComponents/HeroSection.vue";
import ProcessSection from "../../components/LandingComponents/ProcessSection.vue";
import ToolsSection from "../../components/LandingComponents/ToolsSection.vue";

export default {
  name: "LandingPage",
  components: {
    ToolsSection,
    ProcessSection,
    HeroSection,
  }
}
</script>

<template>
  <div class="bg-dark-def w-full h-full">
    <HeroSection></HeroSection>
    <ProcessSection />
    <ToolsSection />
  </div>
</template>

<style scoped>

</style>