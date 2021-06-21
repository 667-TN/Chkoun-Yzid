<template>
  <div class="home">
  
    <h1>Chkoun yzid</h1>
    <b-button variant="success" @click="ToAuction()">Auctions</b-button>
  
  </div>
</template>

<script>
export default {
  name: "Home",
  components: {
    
  },
  methods:{
    ToAuction() {
      this.$router.push({ name: "Auction" });
    },
  }
};
</script>

<style scoped>
.home{
  background-image:url("https://www.larevueautomobile.com/images/fiche-technique/2018/Rolls-Royce/Phantom/Rolls_Royce_Phantom_003.jpg") ;
  height:1000px; 
 background-position: center; /* Center the image */
  background-repeat: no-repeat; /* Do not repeat the image */
  background-size: cover; 
  
}
h1 {
  color: white;
  align-items: center;
}
</style>