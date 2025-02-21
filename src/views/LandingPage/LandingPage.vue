<script>
import HeroSection from "../../components/LandingComponents/HeroSection.vue";
import ProcessSection from "../../components/LandingComponents/ProcessSection.vue";
import ToolsSection from "../../components/LandingComponents/ToolsSection.vue";
import FeaturesSection from "../../components/LandingComponents/FeaturesSection.vue";
import BottomInputSection from "../../components/LandingComponents/BottomInputSection.vue";

export default {
  name: "LandingPage",
  components: {
    BottomInputSection,
    FeaturesSection,
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
    <FeaturesSection />
    <BottomInputSection />
  </div>
</template>

<style scoped>

</style>