<script>
import {
  UserIcon,
  SparklesIcon,
  HeartIcon,
  ChatBubbleBottomCenterTextIcon,
  PaperAirplaneIcon,
  ClipboardIcon,
  PresentationChartBarIcon,
  ArrowTrendingUpIcon,
  ExclamationTriangleIcon,
  HashtagIcon,
  PlusIcon,
  MinusIcon,
  ArrowPathIcon,
  DocumentDuplicateIcon,
  BookOpenIcon,
    InboxIcon,
} from "@heroicons/vue/24/outline";
import PrimaryButton from "../../components/Common/PrimaryButton.vue";
import PostMedia from "../../components/Statistics/PostMedia.vue";
import GetFullReportModal from "../../components/Statistics/GetFullReportModal.vue";

export default {
  name: "StatisticsPage",
  components: {
    GetFullReportModal,
    PostMedia,
    PrimaryButton,
    UserIcon,
    SparklesIcon,
    HeartIcon,
    ChatBubbleBottomCenterTextIcon,
    PaperAirplaneIcon,
    ClipboardIcon,
    PresentationChartBarIcon,
    ArrowTrendingUpIcon,
    ExclamationTriangleIcon,
    HashtagIcon,
    PlusIcon,
    MinusIcon,
    ArrowPathIcon,
    DocumentDuplicateIcon,
    BookOpenIcon,
    InboxIcon,
  },
  props: {
    reportProps: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      isGetFullReportModalOpen: false,
      report: {
        "profile": {
          "social_id": "66965471210",
          "social_handle": "postingcarsvideos",
          "url": "https://www.instagram.com/postingcarsvideos",
          "followers": 38,
          "following": 0,
          "posts": 38,
          "bio": "DM for credit/removal",
          "latest_posts": [
            {
              "url": "https://www.instagram.com/p/DFX77xnPw2_/",
              "type": "Video",
              "caption": "HAPPY HALLOWEEN!!! 🎃\n\nLet’s get BMW to repost this!!! Please be so kind and tag @bmw and @bmwm in the comments. Together we can make it happen. I really appreciate you guys! 🫶🏻\n\n Credit @zedsly",
              "media": [
                "https://youpost-prod-tmp-files-20241030185319000900000001.s3.us-east-1.amazonaws.com/dfd88899bba9b12f5c4e981a53cd168b781bf55725aeaee83f5673977c79948a"
              ],
              "hashtags": []
            },
            {
              "url": "https://www.instagram.com/p/DFWATfMKVqv/",
              "type": "Video",
              "caption": "See me on the slopes \n#BMWRepost #BMWi5 #BMWlove #carsoftiktok #fyp \n\n Credit bmw from Tiktok",
              "media": [
                "https://youpost-prod-tmp-files-20241030185319000900000001.s3.us-east-1.amazonaws.com/5523b292fa011e43631b389ad0e60beb78b75d4e12f81f7c26c354bd30ec36a6"
              ],
              "hashtags": [
                "BMWRepost",
                "BMWi5",
                "BMWlove",
                "carsoftiktok",
                "fyp"
              ]
            },
            {
              "url": "https://www.instagram.com/p/DFVXGVvC7yk/",
              "type": "Video",
              "caption": "Credit @spotsbyjack",
              "media": [
                "https://youpost-prod-tmp-files-20241030185319000900000001.s3.us-east-1.amazonaws.com/dcc2870e16502be7deb12cf95f15b86affda72c7ce2f72ca79e56b1899a28fc4"
              ]
            }
          ]
        },
        "report": [
          {
            "summary": "A black BMW M3 is shown driving on a road. The car is first covered with a white sheet, which is then removed to reveal the car in its entirety. The video is shot from a low angle, giving the viewer a good view of the car's design. The video ends with the car driving off into the distance, showing the sky in the background.",
            "sentiment": "positive",
            "age_rating": "PG",
            "content_categories": [
              "VEHICLES",
              "BTS"
            ],
            "content_topics": [
              "EXTREME_SPORTS",
              "COMEDY",
              "MOVIES_TV"
            ],
            "languages": [
              {
                "code": "en",
                "rate": "major"
              }
            ],
            "media": [
              {
                "id": 0,
                "media_type": "video",
                "safety_violations": []
              }
            ],
            "text": {
              "safety_violations": []
            }
          },
          {
            "summary": "The video showcases a car driving in a snowy mountainous region, capturing scenic views and showcasing the car's performance capabilities in challenging winter conditions. The car's sleek design, powerful engine, and advanced all-wheel drive system are emphasized, creating an impression of luxury, performance, and adventure.",
            "sentiment": "positive",
            "age_rating": "PG",
            "content_categories": [
              "REVIEWS",
              "VLOG",
              "BTS"
            ],
            "content_topics": [
              "VEHICLES",
              "TRAVEL",
              "EXTREME_SPORTS"
            ],
            "languages": [
              {
                "code": "de",
                "rate": "major"
              }
            ],
            "media": [
              {
                "id": 0,
                "media_type": "video",
                "safety_violations": []
              }
            ],
            "text": {
              "safety_violations": []
            }
          },
          {
            "summary": "Two black BMW cars are shown, one a sedan and the other a coupe. The cars are parked near a harbor with a large ship visible in the background. The video focuses on the front and rear of the cars, showcasing their sleek design and detailing. The cars are stationary throughout the video and the scene appears to be taken in a harbor or port setting.",
            "sentiment": "neutral",
            "age_rating": "PG",
            "content_categories": [
              "VEHICLES"
            ],
            "content_topics": [
              "VEHICLES"
            ],
            "languages": [
              {
                "code": "en",
                "rate": "major"
              }
            ],
            "media": [
              {
                "id": 0,
                "media_type": "video",
                "safety_violations": []
              }
            ],
            "text": {
              "safety_violations": []
            }
          }
        ]
      }
    }
  },
  methods: {
    // Formats numbers: e.g., 32881 becomes "32k"
    formatNumber(value) {
      if (value < 1000) return value;
      if (value < 1000000) return Math.floor(value / 1000) + "k";
      return Math.floor(value / 1000000) + "M";
    },
    formatLanguages(languages) {
      console.log(languages);
      if (!languages || languages.length === 0) return ""; // Handle empty array case
      if (languages.length === 1) return languages[0].code.toUpperCase(); // Handle single language case

      return languages
          .slice() // Copy to avoid mutating original array
          .sort((a, b) => (b.rate === "major") - (a.rate === "major"))
          .map(lang => lang.code.toUpperCase())
          .join(", ");
    },
    getUniqueViolations(mediaItems) {
      console.log(mediaItems);
      // Flatten all violations arrays into one array
      const allViolations = mediaItems.flatMap(item => item.violations);
      // Create a set to remove duplicates and convert it back to an array

      return [...new Set(allViolations)];
    },
    changeGetFullReportModalState(value){
      this.isGetFullReportModalOpen = value;
    }

  },
  created() {
    console.log(this.reportProps)
    this.report = this.reportProps
  },
};
</script>

<template>
  <div class="mx-4 md:mx-24 my-6">
    <img class="h-11" src="../../assets/landing/logo.png" alt="YOUPOST ANALYSIS"/>
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 mt-12">
      <!-- Left Column -->
      <div class="lg:col-span-3 col-span-12 flex flex-col gap-8">
        <div
            class="bg-white/10 rounded-3xl border border-white/20 border-2 p-3 flex flex-col justify-center items-center gap-4 w-full">
          <span class="text-primary-active text-center font-semibold text-3xl">Analysis is ready!</span>
          <p class="text-white text-center">These results are based on the three latest posts</p>
        </div>
        <div
            class="bg-white/10 rounded-3xl border border-white/20 border-2 p-4 py-6 flex flex-col items-center gap-4 w-full">
          <div class="flex gap-3 items-center w-full">
            <img
                class="inline-block size-14 rounded-full"
                :src="report.profile.pic"
                alt=""
            />
            <span class="text-white overflow-hidden truncate">@{{ report.profile.social_handle }}</span>
          </div>
          <div class="flex gap-10 items-center justify-center">
            <div class="flex text-white flex-col">
              <span class="text-center">{{ formatNumber(report.profile.followerCount) }}</span>
              <span class="text-xs">Followers</span>
            </div>
            <div class="flex text-white flex-col">
              <span class="text-center">{{ formatNumber(report.profile.followingCount) }}</span>
              <span class="text-xs">Following</span>
            </div>
            <div class="flex text-white flex-col">
              <span class="text-center">{{ formatNumber(report.profile.postCount) }}</span>
              <span class="text-xs">Posts</span>
            </div>
          </div>
          <div class="flex flex-col w-full px-4 gap-2 text-sm">
            <div class="flex gap-2">
              <UserIcon class="h-7 w-7 text-white rounded-full"/>
              <span class="text-white text-xl font-semibold">About this profile</span>
            </div>
            <p class="text-white">
              {{ report.profile.bio }}
            </p>
            <!--            <hr class="text-white font-bold"/>-->
            <!--            <div class="flex gap-2">-->
            <!--              <SparklesIcon class="h-7 w-7 text-white rounded-full"/>-->
            <!--              <span class="text-white text-xl font-semibold">Style</span>-->
            <!--            </div>-->
            <!--            <div class="mt-1 text-xs">-->
            <!--              <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Personal Brand</span>-->
            <!--              <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Health</span>-->
            <!--              <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Niche Interest</span>-->
            <!--              <span class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">Business</span>-->
            <!--            </div>-->
          </div>
        </div>
        <div
            class="bg-white/10 rounded-3xl border border-white/20 border-2 p-3 flex flex-col justify-center items-center gap-4 w-full">
          <span class="text-primary-active font-semibold text-3xl text-center">Take it to the next level!</span>
          <p class="text-white text-center">Get report for the previous posts.</p>
          <PrimaryButton @click="changeGetFullReportModalState(true)" text="Get Full Report"/>
        </div>
      </div>
      <!-- Right Column -->
      <div class="lg:col-span-9 col-span-12 flex flex-col gap-8">
        <div
            class="bg-white/10 object-contain rounded-3xl border border-white/20 border-2 p-4 py-6 grid grid-cols-1 md:grid-cols-8 gap-4 w-full"
            v-for="(post, index) in report.profile.posts"
        >
          <!-- Post Image and Stats -->
          <!--          <div class="md:col-span-2 col-span-12 flex flex-col items-center">-->
          <!--            <video class="w-full h-auto max-h-60 object-cover rounded-xl" v-if="post.type === 'Video'" :src="post.media[0].url"/>-->
          <!--            <img-->
          <!--                v-if="post.type === 'Image' || post.type === 'Sidecar'"-->
          <!--                :src="post.media[0].url"-->
          <!--                alt="Post"-->
          <!--                class="w-full h-auto max-h-60 object-cover rounded-xl"-->
          <!--            />-->
          <!--            <div class="flex lg:gap-12 gap-6 mt-3 justify-center">-->
          <!--              <div class="flex flex-col items-center gap-2">-->
          <!--                <HeartIcon class="h-7 w-7 text-white rounded-full" />-->
          <!--                <span class="text-white text-xs font-semibold">{{post.metrics.likes}}</span>-->
          <!--              </div>-->
          <!--              <div class="flex flex-col items-center gap-2">-->
          <!--                <ChatBubbleBottomCenterTextIcon class="h-7 w-7 text-white rounded-full" />-->
          <!--                <span class="text-white text-xs font-semibold">{{post.metrics.comments}}</span>-->
          <!--              </div>-->
          <!--&lt;!&ndash;              <div class="flex flex-col items-center gap-2">&ndash;&gt;-->
          <!--&lt;!&ndash;                <PaperAirplaneIcon class="h-7 w-7 text-white rounded-full" />&ndash;&gt;-->
          <!--&lt;!&ndash;                <span class="text-white text-xs font-semibold">12</span>&ndash;&gt;-->
          <!--&lt;!&ndash;              </div>&ndash;&gt;-->
          <!--            </div>-->
          <!--          </div>-->
          <PostMedia :post="post"/>
          <!-- Description and Impressions -->
          <div class="md:col-span-4 col-span-12 ml-0 md:ml-5">
<!--            <div>-->
<!--              <div class="flex gap-2">-->
<!--                <InboxIcon class="h-7 w-7 text-white rounded-full"/>-->
<!--                <span class="text-white text-xl font-semibold">Caption</span>-->
<!--              </div>-->
<!--              <p class="text-white mt-4">-->
<!--                {{ post.caption }}-->
<!--              </p>-->
<!--            </div>-->
            <div class="flex gap-2 mt-5">
              <ClipboardIcon class="h-7 w-7 text-white rounded-full"/>
              <span class="text-white text-xl font-semibold">Summary</span>
            </div>
            <p class="text-white mt-4">
              {{ reportProps.analysis[index].summary }}
            </p>
            <div  v-if="post.hashtags && post.hashtags.length > 0">
              <div class="flex gap-2 mt-5">
                <HashtagIcon class="h-7 w-7 text-white rounded-full"/>
                <span class="text-white text-xl font-semibold">Hashtags Used</span>
              </div>
              <div class="text-xs mt-3">
                <span
                    v-for="(tag, index) in post.hashtags"
                    :key="index"
                    class="inline-flex rounded-full text-white border px-3 py-1.5 m-1"
                >
                  {{ tag }}
                </span>
              </div>
            </div>
            <div class="flex gap-2 mt-10">
              <PresentationChartBarIcon class="h-7 w-7 text-white rounded-full"/>
              <span class="text-white text-xl font-semibold">Impressions</span>
            </div>
            <div class="flex justify-between md:justify-start mt-3">
              <div class="flex flex-col ">
                <div class="rounded-full h-7 border flex items-center gap-3 px-3 "
                     :class="{'border-primary-active': reportProps.analysis[index].sentiment === 'positive',
                      'border-red-800': reportProps.analysis[index].sentiment === 'negative',
                      'border-white': reportProps.analysis[index].sentiment === 'neutral'}">
                  <!--                  <ArrowTrendingUpIcon class="h-7 w-7 text-primary-active" />-->
                  <PlusIcon v-if="reportProps.analysis[index].sentiment === 'positive'"
                            class="h-6 w-6 text-primary-active"></PlusIcon>
                  <MinusIcon v-else-if="reportProps.analysis[index].sentiment === 'negative'"
                             class="h-6 w-6 text-red-800"></MinusIcon>
                  <ArrowPathIcon v-else class="h-6 w-6 text-white"></ArrowPathIcon>
                  <span
                      class="text-primary-active text font-semibold">{{
                      reportProps.analysis[index].sentiment.charAt(0).toUpperCase() + reportProps.analysis[index].sentiment.slice(1)
                    }}</span>
                </div>
                <span class="text-white text-center">Sentiment</span>
              </div>
              <div class="border-l xl:mx-8 md:mx-2 mx-4 border-l-white md:block"></div>
              <div class="flex flex-col">
                <span class="text-white text-lg text-center h-7">{{ reportProps.analysis[index].age_rating }}</span>
                <span class="text-white text-center">Age Rating</span>
              </div>
              <div class="border-l xl:mx-8 md:mx-2 mx-4 border-l-white md:block"></div>
              <div class="flex flex-col">
                <span
                    class="text-white text-lg text-center h-7">{{ formatLanguages(reportProps.analysis[index].languages) }}</span>
                <span class="text-white text-center">Language</span>
              </div>
            </div>
          </div>
          <!-- Compliance and Hashtags -->
          <div class="md:col-span-2 col-span-12 md:border-l md:border-l-white mt-4 md:mt-0">
            <div class="lg:ml-5">
              <div class="flex gap-2">
                <ExclamationTriangleIcon class="h-7 w-7 text-white rounded-full"/>
                <span class="text-white text-xl font-semibold">Compliance</span>
              </div>
              <span class="text-white flex my-2">
                <span v-if="getUniqueViolations(report.analysis[index].media).length > 0">{{
                    getUniqueViolations(report.analysis[index].media).length
                  }} Violations
                Categories</span>
                <span v-else>No Violations Found</span></span>
              <div class="text-xs">

                <span v-for="violation in getUniqueViolations(report.analysis[index].media)"
                      class="inline-flex rounded-full text-white border px-3 py-1.5 m-1">{{ violation }}</span>
              </div>
              <div>
                <div class="flex gap-2 mt-5">
                  <DocumentDuplicateIcon class="h-7 w-7 text-white rounded-full"/>
                  <span class="text-white text-xl font-semibold">Content Categories</span>
                </div>
                <div class="text-xs mt-3">
                <span
                    v-for="(category) in report.analysis[index].content_categories"
                    :key="index"
                    class="inline-flex rounded-full text-white border px-3 py-1.5 m-1"
                >
                  {{ category.charAt(0).toUpperCase() + category.slice(1).toLowerCase().replace(/_/g, " ") }}
                </span>
                </div>
              </div>
              <div>
                <div class="flex gap-2 mt-5">
                  <BookOpenIcon class="h-7 w-7 text-white rounded-full"/>
                  <span class="text-white text-xl font-semibold">Content Topics</span>
                </div>
                <div class="text-xs mt-3">
                <span
                    v-for="(category) in report.analysis[index].content_topics"
                    class="inline-flex rounded-full text-white border px-3 py-1.5 m-1"
                >
                  {{ category.charAt(0).toUpperCase() + category.slice(1).toLowerCase().replace(/_/g, " ") }}
                </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End Right Column -->
    </div>
    <GetFullReportModal :open="isGetFullReportModalOpen" @change-modal-state="(value) => changeGetFullReportModalState(value)"/>
  </div>
</template>

<style scoped>
/* Add your component styles here */
</style>d