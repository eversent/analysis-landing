<script>
import DefaultInput from "../Common/DefaultInput.vue";
import PrimaryButton from "../Common/PrimaryButton.vue";

export default {
  name: "DemoReportComponent",
  components: {PrimaryButton, DefaultInput},
  data() {
    return {
      urlToAnalyse: '',
      errorMessage: ''
    }
  },
  methods: {
    analyseUrl() {
      this.errorMessage = "";
      const regexToCheck = /^https:\/\/(www\.)?instagram\.com\/([A-Za-z0-9_.]{1,30})\/?$/;
      console.log(this.urlToAnalyse);
      if (this.urlToAnalyse.match(regexToCheck)) {
        this.$router.push('/analysis?url=' + this.urlToAnalyse);
      } else {
        this.errorMessage = 'Invalid URL';
      }
    }
  }
}
</script>

<template>
  <div>
    <div class="flex  gap-x-6 items-end">
      <DefaultInput
          placeholder="https://instagram.com/officialjanedoe27"
          :model-value="urlToAnalyse"
          label="Get your report for free!"
          @update:model-value="(value) => urlToAnalyse = value"
      />
      <PrimaryButton @click="analyseUrl()" text="Get Report"/>
    </div>
    <div class="mt-2">
      <p class="text-red-500">{{ errorMessage }}</p>
    </div>
  </div>
</template>

<style scoped>

</style>