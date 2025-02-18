<script>
export default {
  name: "DefaultInput",
  props: {
    label: {
      type: String,
      default: ''
    },
    placeholder: {
      type: String,
      default: ''
    }
  }
}
</script>

<template>
  <div>
    <label class="text-white text-lg" for="default-input">{{label}}</label>
    <input :placeholder="placeholder" class="w-full mt-4 h-10 bg-dark-def rounded border border-white text-white text-lg px-4" type="text">
  </div>
</template>

<style scoped>

</style>