<template>
  <div class="wrapper">
    <parallax class="page-header header-filter" :style="headerStyle">
      <div class="md-layout">
        <div class="md-layout-item">
          <div class="image-wrapper">
            <div class="brand">
              <h1>See All Auctions Here</h1>
              <h3>Bid on the car that you want</h3>
                 <br />
            <md-button
              @click="ToForm()"
              class="md-success md-lg"
              ><i class="fas fa-clipboard"></i>Post Your Car Here</md-button
            >           
            </div>
          </div>
        </div>
      </div>
    </parallax>
    <div>
      <ProductCard  />
    </div>
  </div>
</template>

<script>
import ProductCard from "./ProductCard.vue";
// import Modal from '../components/Modal.vue';
export default {
  components: {
    ProductCard,
    // Modal,
  },
  name: "index",
  bodyClass: "index-page",
  props: {
    image: {
      type: String,
      default: require("@/assets/img/vue-mk-header.jpg"),
    },
    signup: {
      type: String,
      default: require("@/assets/img/city.jpg"),
    },
    landing: {
      type: String,
      default: require("@/assets/img/landing.jpg"),
    },
    profile: {
      type: String,
      default: require("@/assets/img/profile.jpg"),
    },
  },
  data() {
    return {
    
    };
  },
  methods: {
    ToForm() {
      this.$router.push({ name: "form" });
    },
    leafActive() {
      if (window.innerWidth < 768) {
        this.leafShow = false;
      } else {
        this.leafShow = true;
      }
    },
  },
  computed: {
    headerStyle() {
      return {
        backgroundImage: `url(${this.image})`,
      };
    },
    signupImage() {
      return {
        backgroundImage: `url(${this.signup})`,
      };
    },
  },

};
</script>



<style lang="scss">
.section-download {
  .md-button + .md-button {
    margin-left: 5px;
  }
}

@media all and (min-width: 991px) {
  .btn-container {
    display: flex;
  }
}


</style>
