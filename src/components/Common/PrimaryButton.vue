<script>
export default {
  name: "PrimaryButton",
  props: {
    text: {
      type: String,
      default: ''
    }
  }
}
</script>

<template>
  <button type="button" class="cursor-pointer rounded-md bg-primary px-3 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-primary-active focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">{{text}}</button>
</template>

<style scoped>

</style>