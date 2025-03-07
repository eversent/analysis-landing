<template>
  <TransitionRoot as="template" :show="open">
    <Dialog as="div" class="relative z-10" @close="switchOpenModal(false)">
      <!-- Backdrop -->
      <TransitionChild
          as="template"
          enter="ease-out duration-300"
          enter-from="opacity-0"
          enter-to="opacity-100"
          leave="ease-in duration-200"
          leave-from="opacity-100"
          leave-to="opacity-0"
      >
        <div class="fixed inset-0 bg-gray-900/75 transition-opacity" />
      </TransitionChild>

      <div class="fixed inset-0 z-10 w-screen overflow-y-auto">
        <div class="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0">
          <TransitionChild
              as="template"
              enter="ease-out duration-300"
              enter-from="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
              enter-to="opacity-100 translate-y-0 sm:scale-100"
              leave="ease-in duration-200"
              leave-from="opacity-100 translate-y-0 sm:scale-100"
              leave-to="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
          >
            <DialogPanel class="relative transform overflow-hidden rounded-lg bg-gray-800 px-4 pb-4 pt-5 text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-sm sm:p-6">
              <div>
                <DialogTitle as="h3" class="text-lg font-medium leading-6 text-gray-100">
                  Join the Waitlist
                </DialogTitle>
                <div class="mt-2">
                  <p class="text-sm text-gray-400">
                    Enter your email to join our waitlist and receive early access updates.
                  </p>
                </div>
              </div>
              <form @submit.prevent="submitWaitlist" class="mt-4">
                <DefaultInput label="Email" placeholder="Enter your email" />
                <div class="mt-4 flex items-center">
                  <input
                      id="earlyAccess"
                      name="earlyAccess"
                      type="checkbox"
                      class="h-4 w-4 rounded border-gray-600 bg-gray-700 text-indigo-600 focus:ring-indigo-500"
                  />
                  <label for="earlyAccess" class="ml-2 block text-sm text-gray-300">
                    I want to participate in early access
                  </label>
                </div>
                <div class="mt-6">
                  <PrimaryButton text="Submit" class="w-full"/>
                </div>
              </form>
              <div class="mt-3 sm:mt-4">
                <button
                    type="button"
                    class="mt-2 inline-flex w-full justify-center rounded-md border border-gray-500 px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                    @click="switchOpenModal(false)">
                  Cancel
                </button>
              </div>
            </DialogPanel>
          </TransitionChild>
        </div>
      </div>
    </Dialog>
  </TransitionRoot>
</template>

<script>
import { Dialog, DialogPanel, DialogTitle, TransitionChild, TransitionRoot } from '@headlessui/vue'
import DefaultInput from "../Common/DefaultInput.vue";
import PrimaryButton from "../Common/PrimaryButton.vue";

export default {
  name: 'GetFullReportModal',
  props: {
    open: Boolean,
  },
  emits: ['changeModalState'],
  components:{
    PrimaryButton,
    DefaultInput,
    Dialog,
    DialogPanel,
    DialogTitle,
    TransitionChild,
    TransitionRoot,
  },
  methods: {
    submitWaitlist() {
      // Handle the form submission logic here (e.g., API call)
      console.log("Waitlist submitted");
      // Optionally close the modal after submission:
      this.open = false;
    },
    switchOpenModal(value){
      this.$emit("changeModalState", value);
    }
  },
};
</script>
