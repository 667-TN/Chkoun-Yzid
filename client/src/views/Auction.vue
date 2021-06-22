<template>
  <div class="wrap">
<div class="template-1">
   <AuctionCard v-for="car in cars" :key="car.id" :car="car" />
</div>
  </div>
</template>







<script>
import AuctionCard from './AuctionCard.vue'
export default  {
  components : {
      AuctionCard,
  },
  computed : {

     cars() {
     return this.$store.state.cars.cars
   }
  },
  mounted() {
       this.$store.dispatch('GET_ALL_CARS')
  }
  }

</script>

<style scoped>
.template-1{
  display: grid;
  grid-template-columns: auto auto auto ;
  padding: 200px;
  
}
.wrap {
margin-right: 140px;
margin-top: 100px;
}
</style>


