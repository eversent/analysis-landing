<script>
import DefaultInput from "../Common/DefaultInput.vue";
import PrimaryButton from "../Common/PrimaryButton.vue";

export default {
  name: "HeroSection",
  components: {PrimaryButton, DefaultInput},
  data(){
    return {
      urlToAnalyse: '',
      errorMessage: ''
    }
  },
  methods: {
    analyseUrl(){
      this.errorMessage = "";
      const regexToCheck = /^https:\/\/(www\.)?instagram\.com\/([A-Za-z0-9_.]{1,30})\/?$/;
      console.log(this.urlToAnalyse);
      if(this.urlToAnalyse.match(regexToCheck)){
        this.$router.push('/analysis?url='+this.urlToAnalyse);
      } else {
        this.errorMessage = 'Invalid URL';
      }
    }
  }
}
</script>

<template>
  <div class="relative isolate overflow-hidden ">

    <div class="absolute left-[calc(50%-4rem)] top-10 -z-10 transform-gpu blur-3xl sm:left-[calc(50%-18rem)] lg:left-48 lg:top-[calc(50%-30rem)] xl:left-[calc(50%-24rem)]" aria-hidden="true">
      <div class="aspect-[1108/632] w-[69.25rem] bg-gradient-to-r from-[#80caff] to-[#4f46e5] opacity-20" style="clip-path: polygon(73.6% 51.7%, 91.7% 11.8%, 100% 46.4%, 97.4% 82.2%, 92.5% 84.9%, 75.7% 64%, 55.3% 47.5%, 46.5% 49.4%, 45% 62.9%, 50.3% 87.2%, 21.3% 64.1%, 0.1% 100%, 5.4% 51.1%, 21.4% 63.9%, 58.9% 0.2%, 73.6% 51.7%)" />
    </div>
    <div class="mx-auto max-w-7xl px-6 pb-24 pt-10 sm:pb-32 lg:flex lg:px-8 lg:py-40">
      <div class="mx-auto max-w-2xl shrink-0 lg:mx-0 lg:pt-8 ">
        <img class="h-11" src="../../assets/landing/logo.png" alt="YOUPOST ANALYSIS" />

        <h1 class="mt-10 text-pretty text-5xl font-semibold tracking-tight text-white sm:text-7xl">
          Get Free Insights for Any Instagram Profile
        </h1>
        <p class="mt-8 text-pretty text-lg font-medium text-gray-200 sm:text-xl">
          Access powerful analytics instantly to help you craft your content strategy.
        </p>
        <div class="mt-10 flex items-end gap-x-6">
          <DefaultInput
              placeholder="https://instagram.com/officialjanedoe27"
              :model-value="urlToAnalyse"
              label="Get your report for free!"
              @update:model-value="(value) => urlToAnalyse = value"
          />
          <PrimaryButton @click="analyseUrl()" text="Get Report" />
        </div>
        <div class="mt-2">
          <p class="text-red-500">{{errorMessage}}</p>
        </div>
      </div>

      <div class="mx-auto mt-16 flex max-w-2xl sm:mt-24 lg:mr-0 lg:mt-0 lg:flex-none xl:ml-4">
        <div class="max-w-[21rem] sm:max-w-3xl w-full">
          <img src="../../assets/landing/open_profile_phone.png"
               alt="App screenshot"
               class="w-full h-auto object-cover" />
        </div>
      </div>
    </div>

  </div>
</template>

<style scoped>

</style>