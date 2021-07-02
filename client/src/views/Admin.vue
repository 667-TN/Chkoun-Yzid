<template>
    <v-container>
        <h1>Admin Side</h1>
       <div v-for="car in cars" :key="car.id">
           {{car.car_name}}
           </div>
    </v-container>
</template>

<script>

export default {
  name: "Admin",
  components: {},

  data() {
    return {
      cars: [],
    };
  },

  methods : {},
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