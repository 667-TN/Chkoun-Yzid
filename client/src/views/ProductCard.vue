<template>
  <div class="cars">
    <div class="card" v-for="car in cars" :key="car.id">
      <img :src="car.url" style="width: 100%" />
      <Countdown :deadline="car.end_date"></Countdown>
      <h3 class="title">{{ car.car_name }}</h3>
      <p class="price">{{ car.car_price }}</p>
      <p class="description">{{ car.description }}</p>
      <p><router-link :to="'' + car.id">Bid Now</router-link></p>
    </div>
  </div>
</template>

<script>
import Countdown from "vuejs-countdown";
export default {
  name: "ProductCard",
  components: { Countdown },

  data() {
    return {
      cars: [],
    };
  },

  methods: {},
  // methods: {
  //      ToProfile(id){
  //        console.log(id)
  //  this.$router.push({name:`profile/${id}`})
  //   },
  async mounted() {
    try {
      const data = await this.$store.dispatch("GET_ALL_CARS");
      this.cars = data;
      console.log("this is the cars--------", this.cars);
    } catch (error) {
      console.log(error);
    }
  },
};
</script>

<style scoped>
.cars {
  display: grid;
  grid-template-columns: auto auto auto;
  padding: 70px;
  margin: 100px;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
  border-radius: 12px;
}

.price {
  color: grey;
  font-size: 22px;
}
.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: green;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
  border-radius: 12px;
}

.card button:hover {
  opacity: 0.7;
}

#btn {
  background-color: #006400;
}
</style>
