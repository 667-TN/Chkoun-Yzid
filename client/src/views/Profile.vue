<template>
  <div class="wrapper">
    <parallax
      class="section page-header header-filter"
      :style="headerStyle"
      to="/"
    ></parallax>
    <div class="main main-raised">
      <div class="md-layout">
        <div class="md-layout-item md-size-66 mx-auto md-small-size-100">
          <md-card>
            <el-carousel trigger="click" :interval="5000">
              <el-carousel-item >
                <h4 class="carousel-caption">
                  <i class="fas fa-car"></i>
                  {{ car.location }}
                </h4>
                <img :src="car.url" alt="" />
              </el-carousel-item>
            </el-carousel>
          </md-card>
          <div
            class="md-layout-item md-medium-size-100 md-xsmall-size-100 md-size-100"
          ></div>
        </div>
      </div>
      <div>
        <md-toolbar >
          <Countdown :deadline="car.end_date"></Countdown>
          <h3 class="md-title">nb of bids#{{ car.nb_bids }}</h3>
          <h3 class="md-title">highest bid({{car.car_price}})</h3> 
          <md-button class="md-raised md-primary" @click="addBid()">Place Bid</md-button>
        </md-toolbar>
      </div>

      <div>
        <md-table>
          <md-table-row>
            <md-table-head md-numeric>Make</md-table-head>
            <md-table-head>Model</md-table-head>
            <md-table-head>VIN</md-table-head>
            <md-table-head>Description</md-table-head>
            <md-table-head>Transimission</md-table-head>
            <md-table-head>Mileage</md-table-head>
          </md-table-row>

          <md-table-row >
            <md-table-cell>{{ car.make }}</md-table-cell>
            <md-table-cell>{{ car.model }}</md-table-cell>
            <md-table-cell>{{ car.VIN }}</md-table-cell>
            <md-table-cell>{{ car.description }}</md-table-cell>
            <md-table-cell>{{ car.transimission }}</md-table-cell>
            <md-table-cell>{{ car.mileage }}</md-table-cell>
          </md-table-row>
        </md-table>
      </div>
    </div>
  </div>
</template>

<script>
import Countdown from 'vuejs-countdown'

export default {
  data() {
    return {
      car: [],
      carousel: [
        {
          image: require("@/assets/img/nature-2.jpg"),
          title: "Somewhere Beyond, United States",
        },
      ],
    };
  },
  props: {
    header: {
      type: String,
      default: require("@/assets/img/vue-mk-header.jpg"),
    },
    img: {
      type: String,
      default: require("@/assets/img/faces/christian.jpg"),
    },
    
  },
  components: {Countdown},
  methods: {
    addBid: function() {
      this.$prompt("Place your bid !!").then((text) => {
        let price=this.$store.state.cars.currentCar[0].car_price
        let bid=Number(text)
        if(price<bid){
          this.$store.dispatch("UPDATE_A_CAR",{
            // this.$store.state.cars.currentCar[0].car_price=bid,
            id:this.$store.state.cars.currentCar[0].id,
            car_price:bid,
            nb_bids:this.$store.state.cars.currentCar[0].nb_bids+1
          }).then((result)=>{
            console.log("car",this.car)
            this.car.car_price=bid;
            this.car.nb_bids+=1
            console.log(result)
          }).catch ((error)=> {
            console.log(error)
          })
        }
        else{
          this.$alert("Please insert a bid bigger than the last price!! (example: 50000)");
        }
      });
    },
  },
  computed: {
    headerStyle() {
      return {
        backgroundImage: `url(${this.header})`,
      };
    },
  },
  async mounted() {
    try {
      const id = this.$route.params.id;
      const data = await this.$store.dispatch("GET_A_CAR", id);
      this.car = data[0];
      // console.log("this is the car that you clicked on --------", this.car);
    } catch (error) {
      console.log(error);
    }
  },
};
</script>

<style lang="scss" scoped>
.section {
  padding: 0;
}

.profile-tabs::v-deep {
  .md-card-tabs .md-list {
    justify-content: center;
  }

  [class*="tab-pane-"] {
    margin-top: 3.213rem;
    padding-bottom: 50px;

    img {
      margin-bottom: 2.142rem;
    }
  }
}

.addBidButton {
  background-color: black;
}
</style>
