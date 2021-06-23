<template>
  <div class="wrapper">
    <parallax class="section page-header header-filter" :style="headerStyle" to='/' ></parallax>
    <div class="main main-raised">
    <div class="md-layout">
  <div class="md-layout-item md-size-66 mx-auto md-small-size-100">
    <md-card>
      <el-carousel
        trigger="click"
        :interval="5000">
        <el-carousel-item v-for="item in carousel" :key="item.image">
          <h4 class="carousel-caption">
          <i class="fas fa-car"></i>
            {{item.title}}
          </h4>
          <img :src="item.image" alt="">
        </el-carousel-item>
      </el-carousel>
    </md-card>
     <div class="content">
    <div class="md-layout">
      <div class="md-layout-item md-medium-size-100 md-xsmall-size-100 md-size-100">
        <md-card>
          <md-card-header class="md-card-header-icon md-card-header-black">
            <div class="card-icon">
              <md-icon>assignment</md-icon>
            </div>
            <h4 class="title">Car Details</h4>
          </md-card-header>
          <md-card-content>
            <md-table v-model="tableData" table-header-color="green">
              <md-table-row >
                <md-table-cell md-label="ID">1</md-table-cell>
                <md-table-cell md-label="Name">BMW</md-table-cell>
                <md-table-cell md-label="Country">Tunisia</md-table-cell>
                <md-table-cell md-label="City">L'aouina</md-table-cell>
                <md-table-cell md-label="Salary">1000</md-table-cell>
              </md-table-row>
            </md-table>
          </md-card-content>
        </md-card>
      </div>
    </div>
  </div>
  </div>
</div>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
     return {
       carousel: [
         {image: require("@/assets/img/nature-2.jpg"), title: 'Somewhere Beyond, United States'}
       ]
      }
    },
  props: {
    header: {
      type: String,
      default: require("@/assets/img/vue-mk-header.jpg")
    },
    img: {
      type: String,
      default: require("@/assets/img/faces/christian.jpg")
    }
  },
  computed: {
    headerStyle() {
      return {
        backgroundImage: `url(${this.header})`
      };
    }
  }
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
</style>
