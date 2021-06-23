<template>
  <div class="cars">
    <div class="card" v-for="(car) in cars" :key="car.id">
      <img :src="car.url" alt="Denim Jeans" style="width: 100%" />
      <h3 class="title">{{car.car_name}}</h3>
      <p class="price">{{car.car_price}}</p>
      <p class="description">{{car.description}}</p>
      <p><button>Bide Now</button></p>
    </div>
  </div>
</template>


  <script>
export default {
  name: "ProductCard",
  components: {},
  data() {
    return {
      password: null,
      firstname: null,
      email: null,
      cars: [],
    };
  },
  async mounted() {
    try {
      const data = await this.$store.dispatch("GET_ALL_CARS");
      console.log('this is data ----------------',data)
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
  padding: 100px;
  margin: 200px;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
  border-radius: 12px
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
  border-radius: 12px
}

.card button:hover {
  opacity: 0.7;
}
</style>