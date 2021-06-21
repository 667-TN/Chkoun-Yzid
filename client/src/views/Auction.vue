<template>
 <div class="cars">
   <div v-for="(car) in cars" :key="car.id" >
  <b-card
    :title="car.car_name"
    img-src="https://mediapool.bmwgroup.com/cache/P9/201703/P90251019/P90251019-the-new-bmw-m4-cs-04-2017-600px.jpg"
    img-alt="Image"
    img-top
    tag="article"
    style="max-width: 20rem;"
    class="mb-2"
  >
    <b-card-text>
    {{car.car_name}}
    </b-card-text>

    <b-button href="#"  @click="ToCar()">Car Details</b-button>
  </b-card>
</div>
 </div>
</template>


<script>

export default  ({
  data() { 
    return {
      cars : null 
    }
  },
  methods: {
    ToCar() {
      this.$router.push({ name: "Car" });
    },
  },
  async mounted() {
    // console.log(this.$store.getters.getCars)
    // console.log(this.$store.state.cars.cars)
    try {
      const data = await this.$store.dispatch('GET_ALL_CARS')
      // console.log('this is data ----------------',data)
      this.cars = data
      console.log('this is the cars--------',this.cars[0].car_name)
    

    }
    catch (error) {
      console.log(error)
    }
  } 
})
</script>

<style scoped>
.cars{
  display: grid;
  grid-template-columns: auto auto auto ;
  padding: 100px;
}
</style>


