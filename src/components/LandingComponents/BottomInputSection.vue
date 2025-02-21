<script>
import PrimaryButton from "../Common/PrimaryButton.vue";
import DefaultInput from "../Common/DefaultInput.vue";

export default {
  name: "BottomInputSection" ,
  components: {DefaultInput, PrimaryButton}
}
</script>

<template>
  <div class=" py-16 sm:py-24">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <div class="relative isolate overflow-hidden  px-6 py-24  sm:rounded-3xl sm:px-24 xl:py-32">
        <h2 class="mx-auto max-w-3xl text-center text-4xl font-semibold tracking-tight text-white sm:text-5xl">What are you waiting for? <br/> Don't miss out!</h2>
        <p class="mx-auto mt-6 max-w-lg text-center text-2xl text-gray-300">Try it for free now and upgrade after seeing the results.  </p>
        <form class="mt-10 justify-center flex items-end gap-x-6">
          <DefaultInput placeholder="instagram.com/officialjanedoe27" label="Get your report for free!" />
          <PrimaryButton text="Get Report" />
        </form>
      </div>
    </div>
  </div>
</template>


<style scoped>

</style>