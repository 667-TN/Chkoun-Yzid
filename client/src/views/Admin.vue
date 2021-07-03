<template>
  <v-container>
    <h1>Admin Side</h1>
    <button text to="/form">Post Car</button>

    <div class="flex-table">
      <div>Name</div>
      <div>Description</div>

    </div>
    <div v-for="car in cars" :key="car.id" class="flex-table">
      <div>{{ car.car_name }}</div>
      <div>{{ car.description }}</div>
      <div class="actions">
        <router-link :to="{ name: 'car-watch', params: {id: car.id }}">Show</router-link> 
        <router-link :to="{ name: 'admin-video-edit', params: {id: car.id}}">Edit</router-link>
        <v-btn x-small @click="deleteCar(car)">Delete</v-btn>
      </div>
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

  methods : {
      deleteCar(car) {
        let response = confirm(`Are you sure you want to delete ${car.car_name}`)
        if(response){
          this.$store.dispatch('DELETE_CAR', car);
        }
      }
  },
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


<style lang="scss" scoped>
  .flex-table {
    display: grid;
    grid-template-columns: repeat(auto-fill, 33%);
    padding: 10px;
    border-bottom: 1px black solid;
    &:nth-of-type(2n) {
      background-color: #dedede;
    }
    .actions {
      * {
        padding-right: 15px
      }
    }
  }
</style> 