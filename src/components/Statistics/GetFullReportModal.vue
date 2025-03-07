<script>
import { Dialog, DialogPanel, DialogTitle, TransitionChild, TransitionRoot } from '@headlessui/vue'
import { PaperAirplaneIcon } from "@heroicons/vue/24/outline";
import DefaultInput from "../Common/DefaultInput.vue";
import PrimaryButton from "../Common/PrimaryButton.vue";
import axios from "axios";

export default {
  name: 'GetFullReportModal',
  props: {
    open: Boolean,
  },
  data(){
    return {
      emailToSubscribe: '',
      errorMessage: '',
      successSubmit: false,  // Initially false until a successful submission
      isLoading: false,
    }
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
    PaperAirplaneIcon,
  },
  methods: {
    async submitWaitlist() {
      this.errorMessage = '';
      // Basic email validation
      if (!this.emailToSubscribe) {
        this.errorMessage = 'Email is required.';
        return;
      }

      const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailPattern.test(this.emailToSubscribe)) {
        this.errorMessage = 'Please enter a valid email address.';
        return;
      }

      try {
        this.isLoading = true;
        await axios.post(`https://m6t8wx1c2h.execute-api.us-east-1.amazonaws.com/prod/api/v1/project/youpost-analysis/waitlist/sign-up`, {
          email: this.emailToSubscribe,
          earlyAccess: true,
        });

        // Optional: Clear email and show success message
        this.emailToSubscribe = '';
        this.successSubmit = true;
      } catch (error) {
        console.error('Error submitting waitlist:', error);
        if (error.response) {
          this.errorMessage = error.response.data.message || 'An error occurred. Please try again.';
        } else {
          this.errorMessage = 'Network error. Please check your connection and try again.';
        }
      }
      this.isLoading = false;
    },
    switchOpenModal(value){
      this.$emit("changeModalState", value);
    }
  },
};
</script>

<template>
  <TransitionRoot :show="open">
    <Dialog as="div" class="relative z-10" @close="open = false">
      <!-- Backdrop transition -->
      <TransitionChild
          as="div"
          enter="ease-out duration-300"
          enter-from="opacity-0"
          enter-to="opacity-100"
          leave="ease-in duration-200"
          leave-from="opacity-100"
          leave-to="opacity-0"
      >
        <div class="fixed inset-0 bg-black/70 transition-opacity" />
      </TransitionChild>

      <!-- Centered panel container -->
      <div class="fixed inset-0 z-10 w-screen overflow-y-auto">
        <div class="flex min-h-full items-center justify-center p-4 text-center sm:items-center sm:p-0">
          <!-- Panel transition -->
          <TransitionChild
              as="div"
              enter="ease-out duration-300"
              enter-from="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
              enter-to="opacity-100 translate-y-0 sm:scale-100"
              leave="ease-in duration-200"
              leave-from="opacity-100 translate-y-0 sm:scale-100"
              leave-to="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
          >
            <DialogPanel
                class="relative transform overflow-hidden rounded-lg p-[1px] border border-gray-800 text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-md"
            >
              <div class="rounded-md bg-gray-900 px-6 py-6 text-white">
                <!-- Close button -->
                <button
                    type="button"
                    class="absolute cursor-pointer top-3 right-3 text-gray-400 hover:text-white focus:outline-none"
                    @click="switchOpenModal(false)"
                >
                  <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="h-5 w-5"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                  >
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>

                <!-- Title -->
                <DialogTitle as="h3" class="text-xl flex items-center gap-3 font-bold">
                  <PaperAirplaneIcon class="w-6 h-6" />
                  Stay Tuned!
                </DialogTitle>

                <!-- Description -->
                <p class="mt-2 text-sm text-gray-300">
                  Right now full reports are in early access. Leave your email to participate.
                </p>

                <!-- Conditional Rendering: Form vs. Success Message -->
                <div v-if="!successSubmit" class="mt-6">
                  <!-- Email input -->
                  <label for="email" class="sr-only">Email</label>
                  <input
                      type="email"
                      name="email"
                      id="email"
                      :disabled="isLoading"
                      v-model="emailToSubscribe"
                      placeholder="Enter Email"
                      required
                      class="w-full rounded-md border border-gray-700 bg-gray-800 px-3 py-2 text-sm placeholder-gray-500 focus:ring-1 focus:outline-none"
                  />

                  <!-- Subscribe button -->
                  <div class="mt-4">
                    <button
                        type="button"
                        :disabled="isLoading"
                        class="w-full rounded-md bg-emerald-600 px-3 py-2 text-sm font-semibold text-white hover:bg-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-offset-2 focus:ring-offset-gray-900"
                        @click="submitWaitlist"
                    >
                      <span v-if="isLoading">
                        <!-- Spinner SVG -->
                        <svg class="animate-spin h-5 w-5 mr-2 inline-block" viewBox="0 0 24 24">
                          <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                          <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8H4z"></path>
                        </svg>
                        Submitting...
                      </span>
                      <span v-else>
                        Subscribe
                      </span>
                    </button>
                  </div>
                  <!-- Error Message -->
                  <p class="mt-3 text-red-500 text-center">{{ errorMessage }}</p>
                </div>

                <div v-else class="mt-6">
                  <!-- Success Message -->
                  <p class="text-green-500 text-center">
                    Thank you for subscribing! Check your email for further updates.
                  </p>
                </div>

              </div>
            </DialogPanel>
          </TransitionChild>
        </div>
      </div>
    </Dialog>
  </TransitionRoot>
</template>