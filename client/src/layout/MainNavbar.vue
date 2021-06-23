<template>
  <md-toolbar
    id="toolbar"
    md-elevation="0"
    class="md-transparent md-absolute"
    :class="extraNavClasses"
    :color-on-scroll="colorOnScroll"
  >
    <div class="md-toolbar-row md-collapse-lateral">

      <div class="md-list-item">

        <md-list-item to="/">
          <p>Chkoun Yzid</p>
        </md-list-item>
      </div>
      <div class="md-toolbar-section-end">
        <div class="md-collapse">
          <div class="md-collapse-wrapper">
            <mobile-menu nav-mobile-section-start="false">
              <!-- Here you can add your items from the section-start of your toolbar -->
            </mobile-menu>
            <md-list>

              <!-- <li class="md-list-item">
                <md-list-item to="/landing">
                  <p>Auctions</p>
                </md-list-item>
              </li> -->
              <li>
                 <div class="md-layout-item md-size-50 md-small-size-100">
      <div class="md-list">
        <li class="md-list-item">
          <a href="javascript:void(0)" class="md-list-item-router md-list-item-container md-button-clean dropdown">
            <div class="md-list-item-content">
              <drop-down direction="down">
                
                <md-list-item slot="title" class="md-button md-button-link md-simple dropdown-toggle" data-toggle="dropdown">
                 <i class="far fa-user-circle"></i>
                  <p>Account</p>
                </md-list-item>
                <ul class="dropdown-menu dropdown-with-icons">
                  <div v-if="!isLoggedIn">
                  <li>
                    <md-button to="/signup">
                  <p>SignUp</p>
                </md-button>
                  </li>
                  <li>
                    <md-button to="/login">
                  <p>Login</p>
                </md-button>
                  </li>
                   </div>
                   <div v-else @click="logout()">
                      <li>
                    <md-button to="/" >
                  <p>Logout</p>
                </md-button>
                  </li>
                     </div>
                </ul>
              </drop-down>
            </div>
          </a>
        </li>
      </div>
    </div>
              </li>
         

            </md-list>
          </div>
        </div>
      </div>
    </div>
  </md-toolbar>
</template>

<script>
let resizeTimeout;
function resizeThrottler(actualResizeHandler) {
  // ignore resize events as long as an actualResizeHandler execution is in the queue
  if (!resizeTimeout) {
    resizeTimeout = setTimeout(() => {
      resizeTimeout = null;
      actualResizeHandler();

      // The actualResizeHandler will execute at a rate of 15fps
    }, 66);
  }
}

import MobileMenu from "@/layout/MobileMenu";
export default {
  components: {
    MobileMenu,
  },
  props: {
    type: {
      type: String,
      default: "white",
      validator(value) {
        return [
          "white",
          "default",
          "primary",
          "danger",
          "success",
          "warning",
          "info",
        ].includes(value);
      },
    },
    colorOnScroll: {
      type: Number,
      default: 0,
    },
  },
  data() {
    return {
      query:"",
      extraNavClasses: "",
      toggledClass: false,
    };
  },
  computed: {
    showDownload() {
      const excludedRoutes = ["login", "landing", "profile"];
      return excludedRoutes.every((r) => r !== this.$route.name);
    },
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    },
  },
  methods: {
    bodyClick() {
      let bodyClick = document.getElementById("bodyClick");

      if (bodyClick === null) {
        let body = document.querySelector("body");
        let elem = document.createElement("div");
        elem.setAttribute("id", "bodyClick");
        body.appendChild(elem);

        let bodyClick = document.getElementById("bodyClick");
        bodyClick.addEventListener("click", this.toggleNavbarMobile);
      } else {
        bodyClick.remove();
      }
    },
    toggleNavbarMobile() {
      this.NavbarStore.showNavbar = !this.NavbarStore.showNavbar;
      this.toggledClass = !this.toggledClass;
      this.bodyClick();
    },
    handleScroll() {
      let scrollValue =
        document.body.scrollTop || document.documentElement.scrollTop;
      let navbarColor = document.getElementById("toolbar");
      this.currentScrollValue = scrollValue;
      if (this.colorOnScroll > 0 && scrollValue > this.colorOnScroll) {
        this.extraNavClasses = `md-${this.type}`;
        navbarColor.classList.remove("md-transparent");
      } else {
        if (this.extraNavClasses) {
          this.extraNavClasses = "";
          navbarColor.classList.add("md-transparent");
        }
      }
    },
    scrollListener() {
      resizeThrottler(this.handleScroll);
    },
    scrollToElement() {
      let element_id = document.getElementById("downloadSection");
      if (element_id) {
        element_id.scrollIntoView({ block: "end", behavior: "smooth" });
      }
    },
      async logout() {
      await this.$store.dispatch("LOGOUT");
      this.ToLanding()
    },
    login() {
      if (this.isLoggedIn === false) {
        this.ToLogin();
      } else this.ToSellACar();
    },
    ToLogin() {
      this.$router.push({ name: "Login" });
    },
    ToSellACar() {
      this.$router.push({ name: "SellACar" });
    },
    ToLanding() {
      this.$router.push({ name: "landing" });
    },
    async beforeMount() {
    try {
       await this.$store.dispatch('GET_ALL_CARS')
       await this.$store.dispatch("VERIFY_AUTH");
    } catch (error) {
      console.log(error);
    }
  }
  },
  mounted() {
    document.addEventListener("scroll", this.scrollListener);
  },
  beforeDestroy() {
    document.removeEventListener("scroll", this.scrollListener);
  },

};
</script>

<style scoped>
.grey{
  background-color:		#909090;
  border-radius: 12px;
}
.green{
  background-color:green ;
  border-radius: 12px
}
</style>
