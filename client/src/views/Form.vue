<template>
  <div class="wrapper">
    <parallax class="page-header header-filter" :style="headerStyle">
      <div class="md-layout">
        <div class="md-layout-item">
          <div class="image-wrapper">
            <div class="brand">
              <h1>Post Your Car Here</h1>
            </div>
          </div>
        </div>
      </div>
    </parallax>
    <div class="container">
    <form class="contact">
        <fieldset>
          <label>Car Name</label>
          <input
            placeholder="Car Name"
            type="text"
            tabindex="1"
            required
            v-model="car_name"
          />
        </fieldset>
        <fieldset>
          <label>Starter Price</label>
          <input
            placeholder="$1,000"
            type="number"
            tabindex="2"
            required
            v-model="car_price"
          />
        </fieldset>
        <fieldset>
          <label>Location</label>
          <input
            placeholder="Location"
            type="Text"
            tabindex="3"
            required
            v-model="location"
          />
        </fieldset>
        <fieldset>
          <label>Brand</label>
          <input
            placeholder="Brand"
            type="text"
            tabindex="5"
            required
            v-model="make"
          />
        </fieldset>
        <fieldset>
          <label>Model</label>
          <input
            placeholder="Model"
            type="text"
            tabindex="6"
            required
            v-model="model"
          />
        </fieldset>
        <fieldset>
          <label>Mileage</label>
          <input
            placeholder="Mileage"
            type="number"
            tabindex="7"
            required
            v-model="mileage"
          />
        </fieldset>
        <fieldset>
          <label>Transmision</label>
          <input
            placeholder="AUTO OR MANUAL"
            type="text"
            tabindex="8"
            required
            v-model="transimission"
          />
        </fieldset>
        <fieldset>
          <label>VIN</label>
          <input
            placeholder="VIN"
            type="text"
            tabindex="9"
            required
            v-model="VIN"
          />
        </fieldset>
        <fieldset>
          <label>Image</label>
          <input type="file" tabindex="10" required />
        </fieldset>
        <fieldset>
          <label>Description</label>
          <textarea
            placeholder="Description..."
            v-model="description"
          ></textarea>
        </fieldset>
        <fieldset>
          <button
            @click="addCar()"
          >
            Submit
          </button>
        </fieldset>
    </form>
    </div>
  </div>
</template>

<script>
export default {
  components: {},
  name: "form",
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
      car_name: "",
      car_price: null,
      location: "",
      user_id: null,
      url: "",
      make: "",
      model: "",
      VIN: "",
      description: "",
      mileage: null,
      transimission: "",
    };
  },
  methods: {
    
    async addCar() {
      const res = await this.$store.dispatch("VERIFY_AUTH")
      console.log(this.$store);
     console.log(this.car_price)
      await this.$store.dispatch("ADD_A_CAR", {
        car_name: this.car_name,
        car_price: this.car_price,
        location: this.location,
        user_id: res.user.id,
        url: this.url,
        make: this.make,
        model: this.model,
        VIN: this.VIN,
        description: this.description,
        mileage: this.mileage,
        transimission: this.transimission
      });
      this.ToAuction();
    },
    ToAuction() {
      this.$router.push({ name: "index" });
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

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
  -moz-font-smoothing: antialiased;
  -o-font-smoothing: antialiased;
  -font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}

body {
  font-family: "Roboto", Helvetica, Arial, sans-serif;
  font-weight: 100;
  font-size: 12px;
  line-height: 30px;
  color: #777;
}

.container {
  max-width: 400px;
  width: 100%;
  margin: 0 auto;
  position: relative;
}

.contact input[type="text"],
.contact input[type="email"],
.contact input[type="tel"],
.contact input[type="url"],
.contact textarea,
.contact button[type="submit"] {
  font: 400 12px/16px "Roboto", Helvetica, Arial, sans-serif;
}

.contact {
  background: #f9f9f9;
  padding: 25px;
  margin: 150px 0;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}

.contact h3 {
  display: block;
  font-size: 30px;
  font-weight: 300;
  margin-bottom: 10px;
}

.contact h4 {
  margin: 5px 0 15px;
  display: block;
  font-size: 13px;
  font-weight: 400;
}

fieldset {
  border: medium none !important;
  margin: 0 0 10px;
  min-width: 100%;
  padding: 0;
  width: 100%;
}

.contact input[type="text"],
.contact input[type="email"],
.contact input[type="tel"],
.contact input[type="url"],
.contact textarea {
  width: 100%;
  border: 1px solid #ccc;
  background: #fff;
  margin: 0 0 5px;
  padding: 10px;
}

.contact input[type="text"]:hover,
.contact input[type="email"]:hover,
.contact input[type="tel"]:hover,
.contact input[type="url"]:hover,
.contact textarea:hover {
  -webkit-transition: border-color 0.3s ease-in-out;
  -moz-transition: border-color 0.3s ease-in-out;
  transition: border-color 0.3s ease-in-out;
  border: 1px solid #aaa;
}

.contact textarea {
  height: 100px;
  max-width: 100%;
  resize: none;
}

.contact button[type="submit"] {
  cursor: pointer;
  width: 100%;
  border: none;
  background: #4caf50;
  color: rgb(160, 133, 133);
  margin: 0 0 5px;
  padding: 10px;
  font-size: 15px;
}

.contact button[type="submit"]:hover {
  background: #43a047;
  -webkit-transition: background 0.3s ease-in-out;
  -moz-transition: background 0.3s ease-in-out;
  transition: background-color 0.3s ease-in-out;
}

.contact button[type="submit"]:active {
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5);
}

.copyright {
  text-align: center;
}

.contact input:focus,
.contact textarea:focus {
  outline: 0;
  border: 1px solid #aaa;
}

::-webkit-input-placeholder {
  color: #888;
}

:-moz-placeholder {
  color: #888;
}

::-moz-placeholder {
  color: #888;
}

:-ms-input-placeholder {
  color: #888;
}

.md-checkbox {
  display: flex;
}
</style>
