<template>
 <div>
   <div v-for="(car, index) in cars" :key="car.id" class="cars">
    {{index}}. 
  <b-card
    :title="car.car_name"
    img-src="https://picsum.photos/600/300/?image=25"
    img-alt="Image"
    img-top
    tag="article"
    style="max-width: 20rem;"
    class="mb-2"
  >
    <b-card-text>
    {{car.car_name}}
    </b-card-text>

    <b-button href="#" variant="primary">Go somewhere</b-button>
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
}
</style>


